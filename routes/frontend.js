// routes/frontend.js
const express = require("express");
const router = express.Router();
const db = require("../config/db");
const { body, validationResult } = require("express-validator");
const sanitizeHtml = require("sanitize-html");
const axios = require("axios");
// --------- Frontend Pages ---------

const he = require("he");
const multer = require('multer'); // Add at top if not imported

// Create Multer instance (memory storage for no files)
const upload = multer({ storage: multer.memoryStorage() });

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

router.use(async (req, res, next) => {
  try {
    const stripHtml = (html) => html.replace(/<[^>]*>/g, '').trim();

    const [rows] = await db.query(
      "SELECT id, heading FROM services ORDER BY id ASC"
    );

    const servicesClean = rows.map(s => ({
      id: s.id,
      heading: stripHtml(s.heading)
    }));

    res.locals.allServices = servicesClean;

    next();
  } catch (err) {
    console.error("Footer services error:", err);
    res.locals.allServices = [];
    next();
  }
});

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

    const [servicesRows] = await db.query("SELECT * FROM services_content WHERE id = 1");
    const services = servicesRows[0] || { heading: "", description: "" };

    const [testimonialRows] = await db.query("SELECT * FROM testimonials ORDER BY id ASC");
    const testimonials = testimonialRows || []; // fetch all, default empty array

    const [faqSectionRows] = await db.query("SELECT * FROM faq_section WHERE id = 1");
    const faqSection = faqSectionRows[0] || {};

    const [faqRows] = await db.query("SELECT * FROM faqs ORDER BY id ASC");
    const faqs = faqRows || []; // fetch all, default empty array

    const [allServicesRows] = await db.query("SELECT * FROM services ORDER BY id ASC");
    const allServices = allServicesRows || [];


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
      services,
      allServices,
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
// Services Page
router.get("/services", async (req, res) => {
  try {
    // Keep current content query
    const [rows] = await db.query("SELECT heading, description FROM services_content LIMIT 1");
    const content = rows[0] || { heading: "", description: "" };

    // New: fetch all services for display (icon, heading, short_description)
    const [services] = await db.query(
      "SELECT id, icon_image, heading, short_description FROM services ORDER BY id ASC"
    );

    res.render("frontend/services", {
      title: "Services",
      heading: content.heading,
      description: content.description,
      services, // added new services data
    });
  } catch (err) {
    console.error("Database error:", err);
    res.status(500).send("Server Error");
  }
});

// Personal Loan Page
// Personal Loan Page
router.get("/personal-loan/:id", async (req, res) => {
  try {
    const serviceId = req.params.id || 1;

    // Fetch main service content (include id here!)
    const [serviceRows] = await db.query(
      "SELECT id, heading, description, short_description, icon_image, image_1, image_2 FROM services WHERE id = ?",
      [serviceId]
    );

    const service = serviceRows[0] || {
      id: 0,
      heading: "Personal Loan",
      description: "",
      short_description: "",
      icon_image: "/images/personal-loan.jpg",
      image_1: "/images/default1.jpg",
      image_2: "/images/default2.jpg",
    };

    // Fetch FAQs
    const [faqRows] = await db.query(
      "SELECT question, answer FROM services_faq WHERE service_id = ?",
      [serviceId]
    );

    res.render("frontend/personal-loan", {
      title: service.heading,
      service,
      faqs: faqRows,
    });
  } catch (err) {
    console.error("Database error:", err);
    res.status(500).send("Server Error");
  }
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
router.post("/contact",
  upload.none(),  // Parses multipart/form-data fields (add this first)
  [
    body("name").trim().notEmpty().withMessage("Name is required").isLength({ min: 2, max: 200 }).withMessage("Name must be 2-200 characters"),
    body("email").trim().isEmail().withMessage("Valid email is required").normalizeEmail(),
    body("phone").trim().notEmpty().withMessage("Phone is required").matches(/^\d{10}$/).withMessage("Phone must be exactly 10 digits").isLength({ max: 50 }).withMessage("Phone too long"),
    body("subject").trim().notEmpty().withMessage("Subject is required").isLength({ min: 3, max: 255 }).withMessage("Subject must be 3-255 characters"),
    body("message").trim().notEmpty().withMessage("Message is required").isLength({ min: 10, max: 4000 }).withMessage("Message must be 10-4000 characters"),
    body("g-recaptcha-response").notEmpty().withMessage("reCAPTCHA verification failed")
  ],
  async (req, res) => {
    // DEBUG: Log req.body to confirm parsing (remove in production)
    console.log('Parsed req.body:', req.body);

    // Check if it's an AJAX request
    const isAjax = req.headers['x-requested-with'] === 'XMLHttpRequest' || req.xhr;

    // Basic express-validator checks
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      // DEBUG: Log the first error for troubleshooting
      console.log('Validation error:', errors.array()[0].msg, 'for field:', errors.array()[0].param, 'value:', req.body[errors.array()[0].param]);
      
      if (isAjax) {
        return res.status(400).json({
          success: false,
          type: "error",
          text: errors.array()[0].msg
        });
      }
      return res.render("frontend/contact", {
        title: "Contact Us",
        msg: { type: "error", text: errors.array()[0].msg },
        ...req.body  // Repopulate form fields on error
      });
    }

    const { name, email, phone, subject, message, "g-recaptcha-response": recaptcha } = req.body;

    // DEBUG: Log received values for troubleshooting (remove in production)
    console.log('Received form data:', { name: name?.trim(), email, phone, subject: subject?.trim(), message: message?.trim() });

    try {
      // --- Verify reCAPTCHA ---
      const secretKey = process.env.RECAPTCHA_SECRET_KEY || "6Ld7auErAAAAAC1-Z0iQ10CQgpbUwWE0DRFajl7A";
      const verifyRes = await axios.post(
        `https://www.google.com/recaptcha/api/siteverify?secret=${secretKey}&response=${recaptcha}`
      );
      if (!verifyRes.data || !verifyRes.data.success) {
        if (isAjax) {
          return res.status(400).json({
            success: false,
            type: "error",
            text: "Captcha verification failed. Please try again."
          });
        }
        return res.render("frontend/contact", {
          title: "Contact Us",
          msg: { type: "error", text: "Captcha verification failed. Please try again." }
        });
      }
      // --- Defensive checks (reject on dangerous patterns) ---
      if (
        containsDangerousPattern(name) ||
        containsDangerousPattern(email) ||
        containsDangerousPattern(phone) ||
        containsDangerousPattern(subject) ||
        containsDangerousPattern(message)
      ) {
        console.warn("Blocked contact submission due to dangerous input patterns from IP:", req.ip);
        if (isAjax) {
          return res.status(400).json({
            success: false,
            type: "error",
            text: "Your message contains disallowed content and cannot be submitted."
          });
        }
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
        if (isAjax) {
          return res.status(400).json({
            success: false,
            type: "error",
            text: "Your message contains disallowed content and cannot be submitted."
          });
        }
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
      if (isAjax) {
        return res.json({
          success: true,
          type: "success",
          text: "Your message has been sent successfully!"
        });
      }
      return res.render("frontend/contact", {
        title: "Contact Us",
        msg: { type: "success", text: "Your message has been sent successfully!" }
      });
    } catch (err) {
      console.error("Contact form error:", err);
      if (isAjax) {
        return res.status(500).json({
          success: false,
          type: "error",
          text: "Something went wrong. Please try again later."
        });
      }
      return res.render("frontend/contact", {
        title: "Contact Us",
        msg: { type: "error", text: "Something went wrong. Please try again later." }
      });
    }
  }
);
// ------------------------------
// GET: Enquiry form without serviceId (menu)
// ------------------------------
router.get("/enquiry", async (req, res) => {
  try {
    const [serviceRows] = await db.query(
      "SELECT id, heading, enquiry_icon_image FROM services ORDER BY id ASC LIMIT 1"
    );
    const firstService = serviceRows[0];
    const service = {
      id: 0,
      heading: "General Enquiry",
      enquiry_icon_image: firstService ? firstService.enquiry_icon_image : "/images/fallback-service.png",
    };

    const [states] = await db.query("SELECT id, name FROM states ORDER BY name");
    const [institutions] = await db.query(
      "SELECT id, type, name, logo, details FROM institutions ORDER BY type, name"
    );

    res.render("frontend/enquiry", {
      title: `${service.heading} - Enquiry`,
      service,
      states,
      institutions,
    });
  } catch (err) {
    console.error("Error fetching enquiry form:", err);
    res.status(500).send("Server Error");
  }
});

// ------------------------------
// GET: Enquiry form for specific service
// ------------------------------
router.get("/enquiry/:serviceId", async (req, res) => {
  try {
    const serviceId = req.params.serviceId;
    const [serviceRows] = await db.query(
      "SELECT id, heading, enquiry_icon_image FROM services WHERE id = ?",
      [serviceId]
    );

    if (!serviceRows.length) return res.status(404).send("Service not found");

    const service = serviceRows[0];
    const [states] = await db.query("SELECT id, name FROM states ORDER BY name");
    const [institutions] = await db.query(
      "SELECT id, type, name, logo, details FROM institutions ORDER BY type, name"
    );

    res.render("frontend/enquiry", {
      title: `${service.heading} - Enquiry`,
      service,
      states,
      institutions,
    });
  } catch (err) {
    console.error("Error fetching enquiry form:", err);
    res.status(500).send("Server Error");
  }
});

// ------------------------------
// GET: Districts by state ID (AJAX)
// ------------------------------
router.get("/districts/:stateId", async (req, res) => {
  try {
    const stateId = req.params.stateId;
    if (!stateId || isNaN(stateId)) return res.status(400).json({ error: "Invalid state ID" });

    const [districts] = await db.query(
      "SELECT id, name FROM districts WHERE state_id = ? ORDER BY name",
      [stateId]
    );
    res.json(districts);
  } catch (err) {
    console.error("Error fetching districts:", err);
    res.status(500).json({ error: "Failed to fetch districts" });
  }
});

// ------------------------------
// POST: Enquiry without serviceId (menu)
// ------------------------------
router.post("/enquiry", async (req, res) => {
  try {
    await saveEnquiry(req.body, 0, "General Enquiry");
    res.json({ success: true, message: "Enquiry submitted successfully!" });
  } catch (err) {
    console.error("Enquiry submission error:", err);
    res.status(500).json({ success: false, message: err.message || "Server error" });
  }
});

// ------------------------------
// POST: Enquiry with serviceId
// ------------------------------
router.post("/enquiry/:serviceId", async (req, res) => {
  try {
    const serviceId = req.params.serviceId;
    const [serviceRows] = await db.query("SELECT heading FROM services WHERE id = ?", [serviceId]);
    const service_name = serviceRows[0]?.heading || "General Enquiry";

    await saveEnquiry(req.body, serviceId, service_name);
    res.json({ success: true, message: "Enquiry submitted successfully!" });
  } catch (err) {
    console.error("Enquiry submission error:", err);
    res.status(500).json({ success: false, message: err.message || "Server error" });
  }
});

// ------------------------------
// SAVE ENQUIRY (Unified Function)
// ------------------------------
async function saveEnquiry(body, serviceId, service_name) {
  const {
    name, mobile, firm_name, pincode, gender,
    company_name, loan_amount, monthly_salary, emis,
    preferred_type, preferred_institution, otp,
    state_id, district_id, employment_type,
    city // 🆕 added city from the form
  } = body;

  const type_of_employment = employment_type || body.type_of_employment;

  // ✅ Log what is received
  console.log('Received data:', body);

  // Determine if firm_name is required
  const service_name_lower = service_name.toLowerCase();
  const needsFirm = serviceId > 0 && 
                    (service_name_lower.includes('business') || service_name_lower.includes('doctor') || 
                     service_name_lower.includes('ca') || service_name_lower.includes('aqua') || 
                     service_name_lower.includes('agri'));

  // ✅ Validation
  if (
    !name || !mobile || !pincode ||
    !gender || !company_name || !loan_amount ||
    !monthly_salary || !emis || !preferred_type || !otp || !type_of_employment
  ) {
    throw new Error("All fields are required");
  }

  if (needsFirm && (!firm_name || firm_name.trim().length < 2 || firm_name.trim().length > 150)) {
    throw new Error("Firm name is required and must be 2-150 characters");
  }

  if (preferred_type !== 'Other' && !preferred_institution) {
    throw new Error("Institution required for Bank or NBFC");
  }

  if (!/^[6-9][0-9]{9}$/.test(mobile)) throw new Error("Invalid mobile number");
  if (!/^[1-9][0-9]{5}$/.test(pincode)) throw new Error("Invalid pincode");
  if (!/^\d{6}$/.test(otp)) throw new Error("Invalid OTP");

  // ✅ Fetch state & district names if IDs exist
  let state_name = null;
  let district_name = null;

  if (state_id) {
    const [stateRows] = await db.query("SELECT name FROM states WHERE id = ?", [state_id]);
    state_name = stateRows[0]?.name || null;
  }

  if (district_id) {
    const [districtRows] = await db.query("SELECT name FROM districts WHERE id = ?", [district_id]);
    district_name = districtRows[0]?.name || null;
  }

  // Handle preferred_type for enum constraint
  const insert_preferred_type = preferred_type === 'Other' ? null : preferred_type;

  // ✅ Insert record (added firm_name after mobile)
  const sql = `
    INSERT INTO enquirie_s
    (service_id, service_name, type_of_employment, name, mobile, firm_name, pincode, gender,
     company_name, loan_amount, monthly_salary, emis, preferred_type, preferred_institution,
     institution_name, state, district, address, otp_verified)
    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
  `;

  const insertValues = [
    serviceId,
    service_name,
    type_of_employment,
    name,
    mobile,
    firm_name || null,
    pincode,
    gender,
    company_name,
    parseFloat(loan_amount),
    parseFloat(monthly_salary),
    parseFloat(emis),
    insert_preferred_type,
    preferred_institution,
    preferred_institution, // institution_name
    state_name,
    district_name,
    city || null, // 🆕 store city name in address column
    1 // otp_verified
  ];

  await db.query(sql, insertValues);
}

// ✅ Dynamic route for Terms & Privacy based on DB IDs
router.get("/:page", async (req, res) => {
  try {
    const { page } = req.params;

    // ✅ Page mapping (URL → ID + Template)
    const pageMap = {
      "terms-and-conditions": {
        id: 1,
        title: "Terms and Conditions",
        view: "frontend/terms",
      },
      "privacy-policy": {
        id: 2,
        title: "Privacy Policy",
        view: "frontend/privecy",
      },
    };

    // ✅ Validate
    const currentPage = pageMap[page];
    if (!currentPage) {
      return res.status(404).render("frontend/404", { title: "Page Not Found" });
    }

    // ✅ Fetch record from DB
    const [rows] = await db.query(
      "SELECT content FROM terms_policies WHERE id = ? LIMIT 1",
      [currentPage.id]
    );

    const content =
      rows.length > 0
        ? rows[0].content
        : `<p>No content found for <strong>${currentPage.title}</strong>. Please update it in the admin panel.</p>`;

    // ✅ Render with dynamic data
    res.render(currentPage.view, {
      title: currentPage.title,
      content,
    });
  } catch (error) {
    console.error("❌ Error loading policy page:", error);
    res.status(500).send("Internal Server Error");
  }
});




module.exports = router;
