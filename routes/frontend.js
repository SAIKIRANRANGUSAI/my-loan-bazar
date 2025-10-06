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

    const [aboutRows] = await db.query("SELECT * FROM about_us WHERE id = 1");
    const about = aboutRows[0] || {}; // ensure about is always defined

    const [countsRows] = await db.query("SELECT * FROM home_counts WHERE id = 1");
    const homeCounts = countsRows[0] || {}; // ensure homeCounts is always defined

    const [whyRows] = await db.query("SELECT * FROM why_choose_us WHERE id = 1");
    const whyChooseUs = whyRows[0] || {};

    // Fetch testimonials section and entries
    const [sectionRows] = await db.query("SELECT * FROM testimonials_section WHERE id = 1");
    const testimonialsSection = sectionRows[0] || {};

    const [testimonialRows] = await db.query("SELECT * FROM testimonials ORDER BY id ASC");
    const testimonials = testimonialRows;

    const [faqSectionRows] = await db.query("SELECT * FROM faq_section WHERE id = 1");
    const faqSection = faqSectionRows[0] || {};

    const [faqRows] = await db.query("SELECT * FROM faqs ORDER BY id ASC");
    const faqs = faqRows;


    res.render("frontend/index", {
      title: "Home",
      hero, // pass hero to template
      about,
      homeCounts,
      whyChooseUs,
      testimonialsSection,
      testimonials,
      faqSection,
      faqs,

    });
  } catch (err) {
    console.error("Error fetching frontend home data:", err);
    res.status(500).send("Server error");
  }
});


// About
router.get("/about", async (req, res) => {
    try {
        // Fetch the first record from about_us table
        const [rows] = await db.query("SELECT * FROM about_us ORDER BY id LIMIT 1");

        const about = rows[0] || {}; // ensure 'about' is at least an empty object

        res.render("frontend/about", {
            title: "About Us",
            about
        });
    } catch (err) {
        console.error(err);
        res.status(500).send("Server Error");
    }
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
