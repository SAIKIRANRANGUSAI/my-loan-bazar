// app.js
const express = require("express");
const path = require("path");
const cookieParser = require("cookie-parser");
require("dotenv").config(); // load .env variables

const app = express();
const PORT = process.env.PORT || 3000;

// Routes
const frontendRoutes = require("./routes/frontend");
const adminRoutes = require("./routes/admin");

// View engine setup
app.set("view engine", "ejs");
app.set("views", path.join(__dirname, "views"));

// Middleware
app.use(express.static(path.join(__dirname, "public"))); // Static files
app.use(express.urlencoded({ extended: true })); // Form data
app.use(express.json()); // JSON body
app.use(cookieParser()); // Cookie parsing for JWT


app.use(cookieParser());
// Public & Admin routes
app.use("/", frontendRoutes);       // Public pages
app.use("/admin", adminRoutes);     // Admin panel

// Start server
app.listen(PORT, () => {
  console.log(`Server running at http://localhost:${PORT}`);
});
