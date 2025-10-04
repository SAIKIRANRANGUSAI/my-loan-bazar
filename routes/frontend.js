// routes/frontend.js
const express = require("express");
const router = express.Router();
const db = require("../config/db");
// --------- Frontend Pages ---------

// Home
router.get("/", async (req, res) => {
  try {
    // Fetch hero & services data (single row)
    const [rows] = await db.query("SELECT * FROM hero_services WHERE id = 1");
    const hero = rows[0] || {}; // ensure hero is always defined

    res.render("frontend/index", {
      title: "Home",
      hero, // pass hero to template
    });
  } catch (err) {
    console.error("Error fetching frontend home data:", err);
    res.status(500).send("Server error");
  }
});


// About
router.get("/about", (req, res) => {
  res.render("frontend/about", { title: "About Us" });
});

// Services
router.get("/services", (req, res) => {
  res.render("frontend/services", { title: "Services" });
});

// Personal Loan
router.get("/personal-loan", (req, res) => {
  res.render("frontend/personal-loan", { title: "Personal Loan" });
});

// Contact
router.get("/contact", (req, res) => {
  res.render("frontend/contact", { title: "Contact Us" });
});

module.exports = router;
