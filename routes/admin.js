const express = require("express");
const router = express.Router();
const authController = require("../controllers/controllers");
const db = require("../config/db");
const { uploadToCloudinary, deleteFromCloudinary } = require("../helpers/cloudinaryUpload");
const bcrypt = require('bcryptjs');
const multer = require("multer");

// ------------------
// Reusable Multer setup for all routes
// ------------------
const storage = multer.memoryStorage();
const upload = multer({ 
    storage,
    fileFilter: (req, file, cb) => {
        if (file.mimetype.startsWith("image/")) {
            cb(null, true);
        } else {
            cb(new Error("Only image files are allowed!"), false);
        }
    }
});

// -------- Login & Logout Routes --------
router.get("/login", (req, res) => {
  res.render("admin/login", { error: null });
});

router.post("/login", authController.postLogin);
router.get("/logout", authController.logout);

// -------- Protect all admin routes --------
router.use(authController.isAuthenticated);

// -------- Admin Dashboard --------
router.get("/dashboard", (req, res) => {
  res.render("admin/admin_dashboard", { user: req.user });
});

// -------- Admin Home Page Settings --------
router.get("/home", async (req, res) => {
  try {
    const [rows] = await db.query("SELECT * FROM hero_services WHERE id = 1");
    const data = rows[0] || {};
    res.render("admin/admin_home", { user: req.user, data, message: null });
  } catch (err) {
    console.error("Error fetching home data:", err);
    res.status(500).send("Server error");
  }
});

// Update Home Page Data with optional image upload
router.post("/home", upload.single("hero_image"), async (req, res) => {
  try {
    const {
      hero_header,
      hero_description,
      services_heading,
      services_description,
      current_image,
    } = req.body;

    let hero_image = current_image; // keep old image if no new one

    if (req.file && req.file.buffer) {
      // Delete old image
      if (current_image) {
        await deleteFromCloudinary(current_image);
      }
      // Upload new image
      const result = await uploadToCloudinary(req.file.buffer);
      hero_image = result.secure_url; // Save this URL in DB
    }

    await db.query(
      `UPDATE hero_services
       SET hero_header=?, hero_description=?, hero_image=?, services_heading=?, services_description=?
       WHERE id=1`,
      [hero_header, hero_description, hero_image, services_heading, services_description]
    );

    const [rows] = await db.query("SELECT * FROM hero_services WHERE id = 1");
    const data = rows[0];

    res.render("admin/admin_home", {
      user: req.user,
      data,
      message: "Home page updated successfully!",
    });
  } catch (err) {
    console.error("Error updating home data:", err);
    res.status(500).send("Server error");
  }
});


module.exports = router;
module.exports.upload = upload; // Export multer to reuse in other admin routes
