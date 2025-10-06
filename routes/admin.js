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
     const [countsRows] = await db.query("SELECT * FROM home_counts WHERE id = 1");
    const homeCounts = countsRows[0] || {};
    res.render("admin/admin_home", { user: req.user, data,homeCounts, message: null });
  } catch (err) {
    console.error("Error fetching home data:", err);
    res.status(500).send("Server error");
  }
});

// Update Home Page Data with optional image upload
// router.post("/home", upload.single("hero_image"), async (req, res) => {
//   try {
//     const {
//       hero_header,
//       hero_description,
//       services_heading,
//       services_description,
//       current_image,
//     } = req.body;

//     let hero_image = current_image; // keep old image if no new one

//     if (req.file && req.file.buffer) {
//       // Delete old image
//       if (current_image) {
//         await deleteFromCloudinary(current_image);
//       }
//       // Upload new image
//       const result = await uploadToCloudinary(req.file.buffer);
//       hero_image = result.secure_url; // Save this URL in DB
//     }

//     await db.query(
//       `UPDATE hero_services
//        SET hero_header=?, hero_description=?, hero_image=?, services_heading=?, services_description=?
//        WHERE id=1`,
//       [hero_header, hero_description, hero_image, services_heading, services_description]
//     );

//     const [rows] = await db.query("SELECT * FROM hero_services WHERE id = 1");
//     const data = rows[0];

//     res.render("admin/admin_home", {
//       user: req.user,
//       data,
//       message: "Home page updated successfully!",
//     });
//   } catch (err) {
//     console.error("Error updating home data:", err);
//     res.status(500).send("Server error");
//   }
// });

// Update Home Page Data (Hero + Home Counts) with optional image upload
router.post("/home", upload.fields([
  { name: "hero_image", maxCount: 1 },
  { name: "total_services_image", maxCount: 1 },
  { name: "customer_satisfaction_image", maxCount: 1 },
  { name: "compare_loan_image", maxCount: 1 },
  { name: "awards_won_image", maxCount: 1 }
]), async (req, res) => {
  try {
    const {
      hero_header,
      hero_description,
      services_heading,
      services_description,
      current_image,

      total_services_heading,
      total_services_number,
      customer_satisfaction_heading,
      customer_satisfaction_number,
      compare_loan_heading,
      compare_loan_number,
      awards_won_heading,
      awards_won_number
    } = req.body;

    // --- Hero Image ---
    let hero_image = current_image;
    if (req.files['hero_image'] && req.files['hero_image'][0]) {
      if (current_image) await deleteFromCloudinary(current_image);
      const result = await uploadToCloudinary(req.files['hero_image'][0].buffer);
      hero_image = result.secure_url;
    }

    // Fetch current home_counts row
    const [countsRows] = await db.query("SELECT * FROM home_counts WHERE id = 1");
    const existingCounts = countsRows[0] || {};

    // --- Home Counts Images ---
    const countsImages = {
      total_services_image: existingCounts.total_services_image,
      customer_satisfaction_image: existingCounts.customer_satisfaction_image,
      compare_loan_image: existingCounts.compare_loan_image,
      awards_won_image: existingCounts.awards_won_image
    };

    if (req.files['total_services_image']) {
      if (existingCounts.total_services_image) await deleteFromCloudinary(existingCounts.total_services_image);
      const result = await uploadToCloudinary(req.files['total_services_image'][0].buffer);
      countsImages.total_services_image = result.secure_url;
    }
    if (req.files['customer_satisfaction_image']) {
      if (existingCounts.customer_satisfaction_image) await deleteFromCloudinary(existingCounts.customer_satisfaction_image);
      const result = await uploadToCloudinary(req.files['customer_satisfaction_image'][0].buffer);
      countsImages.customer_satisfaction_image = result.secure_url;
    }
    if (req.files['compare_loan_image']) {
      if (existingCounts.compare_loan_image) await deleteFromCloudinary(existingCounts.compare_loan_image);
      const result = await uploadToCloudinary(req.files['compare_loan_image'][0].buffer);
      countsImages.compare_loan_image = result.secure_url;
    }
    if (req.files['awards_won_image']) {
      if (existingCounts.awards_won_image) await deleteFromCloudinary(existingCounts.awards_won_image);
      const result = await uploadToCloudinary(req.files['awards_won_image'][0].buffer);
      countsImages.awards_won_image = result.secure_url;
    }

    // --- Update hero_services table ---
    await db.query(
      `UPDATE hero_services
       SET hero_header=?, hero_description=?, hero_image=?, services_heading=?, services_description=?
       WHERE id=1`,
      [hero_header, hero_description, hero_image, services_heading, services_description]
    );

    // --- Update home_counts table ---
    await db.query(
      `UPDATE home_counts SET
        total_services_heading=?, total_services_number=?, total_services_image=?,
        customer_satisfaction_heading=?, customer_satisfaction_number=?, customer_satisfaction_image=?,
        compare_loan_heading=?, compare_loan_number=?, compare_loan_image=?,
        awards_won_heading=?, awards_won_number=?, awards_won_image=? 
        WHERE id=1`,
      [
        total_services_heading,
        total_services_number,
        countsImages.total_services_image,

        customer_satisfaction_heading,
        customer_satisfaction_number,
        countsImages.customer_satisfaction_image,

        compare_loan_heading,
        compare_loan_number,
        countsImages.compare_loan_image,

        awards_won_heading,
        awards_won_number,
        countsImages.awards_won_image
      ]
    );

    // Fetch updated data
    const [heroRows] = await db.query("SELECT * FROM hero_services WHERE id = 1");
    const heroData = heroRows[0];
    const [updatedCountsRows] = await db.query("SELECT * FROM home_counts WHERE id = 1");
    const homeCounts = updatedCountsRows[0];

    res.render("admin/admin_home", {
      user: req.user,
      data: heroData,
      homeCounts,
      message: "Home page updated successfully!"
    });

  } catch (err) {
    console.error("Error updating home data:", err);
    res.status(500).send("Server error");
  }
});



// -------- Admin About Us Page Settings --------
// -------- About Us Page --------
router.get("/about-us", async (req, res) => {
  try {
    const [rows] = await db.query("SELECT * FROM about_us LIMIT 1");
    const data = rows.length ? rows[0] : {}; // send empty object if no record
    res.render("admin/admin_about-us", { data, message: null });
  } catch (err) {
    console.error(err);
    res.render("admin/admin_about-us", { data: {}, message: "Error fetching About Us data" });
  }
});

// -------- Update About Us --------
router.post("/about-us", upload.fields([
    { name: 'home_image' },
    { name: 'comparison_image' },
    { name: 'reviews_image' },
    { name: 'loan_image' },
    { name: 'expertise_image' },
    { name: 'about_image' }
  ]), async (req, res) => {
  try {
    const {
      home_heading, home_description,
      comparison_heading, comparison_description,
      reviews_heading, reviews_description,
      loan_heading, loan_description,
      expertise_heading, expertise_description,
      about_heading, about_description
    } = req.body;

    let data = { ...req.body };

    // Image handling with Cloudinary
    const imageFields = ['home_image','comparison_image','reviews_image','loan_image','expertise_image','about_image'];
    for (let field of imageFields) {
      if (req.files[field]) {
        // delete old image if exists
        if (data[`old_${field}`]) await deleteFromCloudinary(data[`old_${field}`]);
        // upload new image
        const result = await uploadToCloudinary(req.files[field][0].buffer);
        data[field] = result.secure_url;
      } else {
        data[field] = data[`old_${field}`] || null;
      }
    }

    // Check if record exists
    const [rows] = await db.query("SELECT * FROM about_us LIMIT 1");
    if (rows.length) {
      await db.query(
        `UPDATE about_us SET
          home_heading=?, home_description=?, home_image=?,
          comparison_heading=?, comparison_description=?, comparison_image=?,
          reviews_heading=?, reviews_description=?, reviews_image=?,
          loan_heading=?, loan_description=?, loan_image=?,
          expertise_heading=?, expertise_description=?, expertise_image=?,
          about_heading=?, about_description=?, about_image=?
        WHERE id=?`,
        [
          home_heading, home_description, data.home_image,
          comparison_heading, comparison_description, data.comparison_image,
          reviews_heading, reviews_description, data.reviews_image,
          loan_heading, loan_description, data.loan_image,
          expertise_heading, expertise_description, data.expertise_image,
          about_heading, about_description, data.about_image,
          rows[0].id
        ]
      );
    } else {
      await db.query(
        `INSERT INTO about_us (
          home_heading, home_description, home_image,
          comparison_heading, comparison_description, comparison_image,
          reviews_heading, reviews_description, reviews_image,
          loan_heading, loan_description, loan_image,
          expertise_heading, expertise_description, expertise_image,
          about_heading, about_description, about_image
        ) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)`,
        [
          home_heading, home_description, data.home_image,
          comparison_heading, comparison_description, data.comparison_image,
          reviews_heading, reviews_description, data.reviews_image,
          loan_heading, loan_description, data.loan_image,
          expertise_heading, expertise_description, data.expertise_image,
          about_heading, about_description, data.about_image
        ]
      );
    }

    // Send back updated data + success message
    res.render("admin/admin_about-us", {
      data,
      message: "✅ About Us updated successfully!"
    });
  } catch (err) {
    console.error(err);
    res.render("admin/admin_about-us", { data: req.body, message: "❌ Error updating About Us!" });
  }
});

// ---------- Why Choose Us Section ----------

// GET route
router.get("/why_choose_us", async (req, res) => {
  try {
    const [rows] = await db.query("SELECT * FROM why_choose_us LIMIT 1");
    const whyChooseUs = rows.length > 0 ? rows[0] : {};
    res.render("admin/admin_why_choose_us", { user: req.user, whyChooseUs, message: null });

  } catch (error) {
    console.error("Error fetching Why Choose Us data:", error);
    res.status(500).send("Error loading data");
  }
});

// POST route (Update/Insert)
router.post(
  "/why_choose_us",
  upload.single("section_image"),
  async (req, res) => {
    try {
      const {
        section_heading,
        section_description,
        point_1,
        point_2,
        point_3,
        point_4,
        current_image
      } = req.body;

      let section_image = current_image;

      // Handle image upload
      if (req.file && req.file.buffer) {
        if (current_image) {
          await deleteFromCloudinary(current_image);
        }
        const result = await uploadToCloudinary(req.file.buffer);
        section_image = result.secure_url;
      }

      // Update DB
      await db.query(
        `UPDATE why_choose_us SET
          section_heading = ?,
          section_description = ?,
          point_1 = ?,
          point_2 = ?,
          point_3 = ?,
          point_4 = ?,
          section_image = ?
        WHERE id = 1`,
        [
          section_heading,
          section_description,
          point_1,
          point_2,
          point_3,
          point_4,
          section_image
        ]
      );

      const [rows] = await db.query("SELECT * FROM why_choose_us WHERE id = 1");
      const whyChooseUs = rows[0];

      res.render("admin/admin_why_choose_us", {
        user: req.user,
        whyChooseUs,
        message: "Why Choose Us section updated successfully!"
      });
    } catch (err) {
      console.error("Error updating Why Choose Us data:", err);
      res.status(500).send("Server error");
    }
  }
);


// ---------- Testimonials Admin Routes ----------

router.get("/testimonials", async (req, res) => {
  try {
    const [sectionRows] = await db.query("SELECT * FROM testimonials_section WHERE id = 1");
    const section = sectionRows[0] || {};

    const [testimonialRows] = await db.query("SELECT * FROM testimonials ORDER BY id ASC");

    const message = req.query.message || null;

    res.render("admin/admin_testimonial", {
      user: req.user,
      section,
      testimonials: testimonialRows,
      editTestimonial: null,  // <-- add this line
      message
    });
  } catch (err) {
    console.error("Error fetching testimonials:", err);
    res.status(500).send("Server error");
  }
});


// Update testimonial section
router.post("/testimonials/section", async (req, res) => {
  try {
    const { section_subtitle, section_title, section_description } = req.body;

    await db.query(
      `UPDATE testimonials_section SET section_subtitle=?, section_title=?, section_description=? WHERE id=1`,
      [section_subtitle, section_title, section_description]
    );

    res.redirect("/admin/testimonials?message=Section updated successfully!");
  } catch (err) {
    console.error("Error updating testimonial section:", err);
    res.status(500).send("Server error");
  }
});

// Add new testimonial
router.post("/testimonial/add", upload.single("image"), async (req, res) => {
  try {
    const { name, designation, content } = req.body;
    let image = null;

    if (req.file && req.file.buffer) {
      const result = await uploadToCloudinary(req.file.buffer);
      image = result.secure_url;
    }

    await db.query(
      `INSERT INTO testimonials (name, designation, content, image) VALUES (?, ?, ?, ?)`,
      [name, designation, content, image]
    );

    res.redirect("/admin/testimonials?message=Testimonial added successfully!");
  } catch (err) {
    console.error("Error adding testimonial:", err);
    res.status(500).send("Server error");
  }
});

// Edit testimonial (load edit form)
router.get("/testimonial/:id/edit", async (req, res) => {
  try {
    const [testimonialRows] = await db.query("SELECT * FROM testimonials ORDER BY id ASC");
    const [rows] = await db.query("SELECT * FROM testimonials WHERE id=?", [req.params.id]);
    const editTestimonial = rows[0] || null;
    const [sectionRows] = await db.query("SELECT * FROM testimonials_section WHERE id = 1");
    const section = sectionRows[0] || {};

    res.render("admin/admin_testimonial", {
      user: req.user || null,
      section,
      testimonials: testimonialRows,
      editTestimonial,
      message: null
    });
  } catch (err) {
    console.error(err);
    res.status(500).send("Server error");
  }
});



// Update testimonial
router.post("/testimonial/:id/edit", upload.single("image"), async (req, res) => {
  try {
    const { name, designation, content, current_image } = req.body;
    let image = current_image || null;

    if (req.file && req.file.buffer) {
      if (current_image) await deleteFromCloudinary(current_image);
      const result = await uploadToCloudinary(req.file.buffer);
      image = result.secure_url;
    }

    await db.query(
      `UPDATE testimonials SET name=?, designation=?, content=?, image=? WHERE id=?`,
      [name, designation, content, image, req.params.id]
    );

    res.redirect("/admin/testimonials?message=Testimonial updated successfully!");
  } catch (err) {
    console.error("Error updating testimonial:", err);
    res.status(500).send("Server error");
  }
});

// Delete testimonial
router.get("/testimonial/:id/delete", async (req, res) => {
  try {
    const [rows] = await db.query("SELECT image FROM testimonials WHERE id=?", [req.params.id]);
    if (rows[0]?.image) await deleteFromCloudinary(rows[0].image);

    await db.query("DELETE FROM testimonials WHERE id=?", [req.params.id]);
    res.redirect("/admin/testimonials?message=Testimonial deleted successfully!");
  } catch (err) {
    console.error("Error deleting testimonial:", err);
    res.status(500).send("Server error");
  }
});


// FAQ Section Routes

// Load FAQ Section & All FAQs
router.get("/faq_section", async (req, res) => {
    try {
        // Get section info
        const [sectionRows] = await db.query("SELECT * FROM faq_section WHERE id = 1");
        const section = sectionRows[0] || {};

        // Get all FAQs
        const [faqRows] = await db.query("SELECT * FROM faqs ORDER BY id ASC");

        // Message (optional)
        const message = req.query.message || null;

        res.render("admin/admin_faq_section", {
            user: req.user || null,
            section,
            faqs: faqRows,
            editFaq: null,
            message
        });
    } catch (err) {
        console.error("Error fetching FAQ section:", err);
        res.status(500).send("Server error");
    }
});

// Update FAQ Section
router.post("/faq_section/update", async (req, res) => {
    try {
        const { section_subtitle, section_title, section_description } = req.body;

        await db.query(
            `UPDATE faq_section SET section_subtitle=?, section_title=?, section_description=? WHERE id=1`,
            [section_subtitle, section_title, section_description]
        );

        res.redirect("/admin/faq_section?message=FAQ Section updated successfully!");
    } catch (err) {
        console.error("Error updating FAQ section:", err);
        res.status(500).send("Server error");
    }
});

// Add new FAQ
router.post("/faq/add", async (req, res) => {
    try {
        const { question, answer } = req.body;

        await db.query(
            `INSERT INTO faqs (question, answer) VALUES (?, ?)`,
            [question, answer]
        );

        res.redirect("/admin/faq_section?message=FAQ added successfully!");
    } catch (err) {
        console.error("Error adding FAQ:", err);
        res.status(500).send("Server error");
    }
});

// Edit FAQ (load edit form)
router.get("/faq/:id/edit", async (req, res) => {
    try {
        const [faqRows] = await db.query("SELECT * FROM faqs ORDER BY id ASC");
        const [rows] = await db.query("SELECT * FROM faqs WHERE id=?", [req.params.id]);
        const editFaq = rows[0] || null;

        const [sectionRows] = await db.query("SELECT * FROM faq_section WHERE id = 1");
        const section = sectionRows[0] || {};

        res.render("admin/admin_faq_section", {
            user: req.user || null,
            section,
            faqs: faqRows,
            editFaq,
            message: null
        });
    } catch (err) {
        console.error("Error loading FAQ for edit:", err);
        res.status(500).send("Server error");
    }
});

// Update FAQ
router.post("/faq/:id/edit", async (req, res) => {
    try {
        const { question, answer } = req.body;

        await db.query(
            `UPDATE faqs SET question=?, answer=? WHERE id=?`,
            [question, answer, req.params.id]
        );

        res.redirect("/admin/faq_section?message=FAQ updated successfully!");
    } catch (err) {
        console.error("Error updating FAQ:", err);
        res.status(500).send("Server error");
    }
});

// Delete FAQ
router.get("/faq/:id/delete", async (req, res) => {
    try {
        await db.query("DELETE FROM faqs WHERE id=?", [req.params.id]);
        res.redirect("/admin/faq_section?message=FAQ deleted successfully!");
    } catch (err) {
        console.error("Error deleting FAQ:", err);
        res.status(500).send("Server error");
    }
});


module.exports = router;
module.exports.upload = upload; // Export multer to reuse in other admin routes
