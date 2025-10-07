// routes/frontend.js
const express = require("express");
const router = express.Router();
const db = require("../config/db");
const { body, validationResult } = require("express-validator");
const sanitizeHtml = require("sanitize-html");
const axios = require("axios");
// --------- Frontend Pages ---------

const he = require("he");

// Helper: check for dangerous patterns after decoding entities
function containsDangerousPattern(str) {
  if (!str) return false;
  const decoded = he.decode(String(str)); // decode entities like &lt;script&gt;
  // patterns: script tags, javascript: data: vbscript:, inline event handlers like onerror=
  const dangerousRe = /<\s*script\b|javascript\s*:|data\s*:|vbscript\s*:|on\w+\s*=|<\s*iframe\b/i;
  return dangerousRe.test(decoded);
}

// Helper: sanitize final string (no tags, no attributes), trim & limit length
function sanitizeAndLimit(str, maxLen = 2000) {
  if (!str) return "";
  // First decode entities to catch encoded attacks, then remove tags & attributes
  const decoded = he.decode(String(str));
  const cleaned = sanitizeHtml(decoded, {
    allowedTags: [], // no tags allowed
    allowedAttributes: {}
  });
  const trimmed = cleaned.trim();
  return trimmed.slice(0, maxLen);
}
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
    const testimonials = testimonialRows || []; // fetch all, default empty array

    const [faqSectionRows] = await db.query("SELECT * FROM faq_section WHERE id = 1");
    const faqSection = faqSectionRows[0] || {};

    const [faqRows] = await db.query("SELECT * FROM faqs ORDER BY id ASC");
    const faqs = faqRows || []; // fetch all, default empty array

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
// GET Contact Page
router.get("/contact", (req, res) => {
  res.render("frontend/contact", { 
    title: "Contact Us",
    msg: null // define it so template won't throw error
  });
});


// POST Contact Form
// POST /contact route
router.post("/contact",
  [
    body("name").trim().notEmpty().withMessage("Name is required").isLength({ max: 200 }).withMessage("Name too long"),
    body("email").trim().isEmail().withMessage("Valid email is required").normalizeEmail(),
    body("phone").trim().notEmpty().withMessage("Phone is required").isLength({ max: 50 }).withMessage("Phone too long"),
    body("subject").trim().notEmpty().withMessage("Subject is required").isLength({ max: 255 }).withMessage("Subject too long"),
    body("message").trim().notEmpty().withMessage("Message is required").isLength({ max: 4000 }).withMessage("Message too long"),
    body("g-recaptcha-response").notEmpty().withMessage("reCAPTCHA verification failed")
  ],
  async (req, res) => {
    // Basic express-validator checks
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      return res.render("frontend/contact", {
        title: "Contact Us",
        msg: { type: "error", text: errors.array()[0].msg }
      });
    }

    const { name, email, phone, subject, message, "g-recaptcha-response": recaptcha } = req.body;

    try {
      // --- Verify reCAPTCHA ---
      const secretKey = process.env.RECAPTCHA_SECRET_KEY || "6Ld7auErAAAAAC1-Z0iQ10CQgpbUwWE0DRFajl7A";
      const verifyRes = await axios.post(
        `https://www.google.com/recaptcha/api/siteverify?secret=${secretKey}&response=${recaptcha}`
      );
      if (!verifyRes.data || !verifyRes.data.success) {
        return res.render("frontend/contact", {
          title: "Contact Us",
          msg: { type: "error", text: "Captcha verification failed. Please try again." }
        });
      }

      // --- Defensive checks (reject on dangerous patterns) ---
      // Check *decoded* inputs for suspicious/encoded attack shapes
      if (
        containsDangerousPattern(name) ||
        containsDangerousPattern(email) ||
        containsDangerousPattern(phone) ||
        containsDangerousPattern(subject) ||
        containsDangerousPattern(message)
      ) {
        // Log the attempt server-side (you can add more detail)
        console.warn("Blocked contact submission due to dangerous input patterns from IP:", req.ip);
        return res.render("frontend/contact", {
          title: "Contact Us",
          msg: { type: "error", text: "Your message contains disallowed content and cannot be submitted." }
        });
      }

      // --- Sanitize & limit lengths ---
      const cleanName = sanitizeAndLimit(name, 200);
      const cleanEmail = sanitizeAndLimit(email, 255);
      const cleanPhone = sanitizeAndLimit(phone, 50);
      const cleanSubject = sanitizeAndLimit(subject, 255);
      const cleanMessage = sanitizeAndLimit(message, 4000);

      // Final defensive safety: ensure no javascript: or data: remains in cleaned values
      const suspiciousLeftoverRe = /javascript\s*:|data\s*:|vbscript\s*:/i;
      if (
        suspiciousLeftoverRe.test(cleanName) ||
        suspiciousLeftoverRe.test(cleanEmail) ||
        suspiciousLeftoverRe.test(cleanPhone) ||
        suspiciousLeftoverRe.test(cleanSubject) ||
        suspiciousLeftoverRe.test(cleanMessage)
      ) {
        console.warn("Blocked contact submission due to leftover dangerous scheme after cleaning. IP:", req.ip);
        return res.render("frontend/contact", {
          title: "Contact Us",
          msg: { type: "error", text: "Your message contains disallowed content and cannot be submitted." }
        });
      }

      // --- Insert into database using parameterized query ---
      await db.query(
        "INSERT INTO contact_submissions (name, email, phone, subject, message) VALUES (?, ?, ?, ?, ?)",
        [cleanName, cleanEmail, cleanPhone, cleanSubject, cleanMessage]
      );

      // Success response
      return res.render("frontend/contact", {
        title: "Contact Us",
        msg: { type: "success", text: "Your message has been sent successfully!" }
      });
    } catch (err) {
      console.error("Contact form error:", err);
      return res.render("frontend/contact", {
        title: "Contact Us",
        msg: { type: "error", text: "Something went wrong. Please try again later." }
      });
    }
  }
);

module.exports = router;
