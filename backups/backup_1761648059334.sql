/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: about_us
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `about_us` (
  `id` int NOT NULL AUTO_INCREMENT,
  `home_heading` varchar(255) DEFAULT NULL,
  `home_description` text,
  `home_image` varchar(255) DEFAULT NULL,
  `comparison_heading` varchar(255) DEFAULT NULL,
  `comparison_description` text,
  `comparison_image` varchar(255) DEFAULT NULL,
  `reviews_heading` varchar(255) DEFAULT NULL,
  `reviews_description` text,
  `reviews_image` varchar(255) DEFAULT NULL,
  `loan_heading` varchar(255) DEFAULT NULL,
  `loan_description` text,
  `loan_image` varchar(255) DEFAULT NULL,
  `expertise_heading` varchar(255) DEFAULT NULL,
  `expertise_description` text,
  `expertise_image` varchar(255) DEFAULT NULL,
  `about_heading` varchar(255) DEFAULT NULL,
  `about_description` longtext,
  `about_image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: admin
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `admin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: admin_logins
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `admin_logins` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `login_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 86 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: contact_submissions
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `contact_submissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_read` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 60 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: districts
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `districts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `state_id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 68 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: enquirie_s
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `enquirie_s` (
  `id` int NOT NULL AUTO_INCREMENT,
  `service_id` int DEFAULT NULL,
  `service_name` varchar(255) DEFAULT NULL,
  `type_of_employment` varchar(100) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `address` text NOT NULL,
  `pincode` varchar(10) DEFAULT NULL,
  `gender` enum('Male', 'Female') DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `loan_amount` decimal(12, 2) DEFAULT NULL,
  `monthly_salary` decimal(12, 2) DEFAULT NULL,
  `emis` decimal(12, 2) DEFAULT NULL,
  `preferred_type` enum('Bank', 'NBFC') DEFAULT NULL,
  `preferred_institution` varchar(255) DEFAULT NULL,
  `institution_name` varchar(255) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `district` varchar(100) DEFAULT NULL,
  `otp_verified` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 46 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: enquiries
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `enquiries` (
  `id` int NOT NULL AUTO_INCREMENT,
  `service_id` int DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `address` text NOT NULL,
  `state_id` int DEFAULT NULL,
  `district_id` int DEFAULT NULL,
  `pincode` varchar(10) DEFAULT NULL,
  `gender` enum('Male', 'Female') DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `loan_amount` decimal(12, 2) DEFAULT NULL,
  `monthly_salary` decimal(12, 2) DEFAULT NULL,
  `emis` decimal(12, 2) DEFAULT NULL,
  `company_address` text,
  `preferred_type` enum('Bank', 'NBFC') DEFAULT NULL,
  `preferred_institution` varchar(100) DEFAULT NULL,
  `service_name` varchar(255) DEFAULT NULL,
  `institution_name` varchar(255) DEFAULT NULL,
  `otp_verified` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `state` varchar(100) DEFAULT NULL,
  `district` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 28 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: faq_section
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `faq_section` (
  `id` int NOT NULL AUTO_INCREMENT,
  `section_subtitle` varchar(255) DEFAULT NULL,
  `section_title` varchar(255) DEFAULT NULL,
  `section_description` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: faqs
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `faqs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `question` varchar(255) NOT NULL,
  `answer` text NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 13 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: hero_services
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `hero_services` (
  `id` int NOT NULL DEFAULT '1',
  `hero_header` varchar(255) NOT NULL,
  `hero_description` text NOT NULL,
  `hero_image` varchar(255) DEFAULT NULL,
  `services_heading` varchar(255) NOT NULL,
  `services_description` text NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: home_counts
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `home_counts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `total_services_heading` varchar(255) DEFAULT NULL,
  `total_services_number` int DEFAULT NULL,
  `total_services_image` varchar(255) DEFAULT NULL,
  `customer_satisfaction_heading` varchar(255) DEFAULT NULL,
  `customer_satisfaction_number` int DEFAULT NULL,
  `customer_satisfaction_image` varchar(255) DEFAULT NULL,
  `compare_loan_heading` varchar(255) DEFAULT NULL,
  `compare_loan_number` int DEFAULT NULL,
  `compare_loan_image` varchar(255) DEFAULT NULL,
  `awards_won_heading` varchar(255) DEFAULT NULL,
  `awards_won_number` int DEFAULT NULL,
  `awards_won_image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: institutions
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `institutions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` enum('Bank', 'NBFC') NOT NULL,
  `name` varchar(100) NOT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `details` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 24 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: seo_settings
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `seo_settings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `page_name` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `keywords` text,
  `author` varchar(255) DEFAULT NULL,
  `og_title` varchar(255) DEFAULT NULL,
  `og_description` text,
  `og_image` varchar(255) DEFAULT NULL,
  `og_url` varchar(255) DEFAULT NULL,
  `og_type` varchar(50) DEFAULT 'website',
  `twitter_card` varchar(50) DEFAULT 'summary_large_image',
  `twitter_title` varchar(255) DEFAULT NULL,
  `twitter_description` text,
  `twitter_image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `page_name` (`page_name`)
) ENGINE = InnoDB AUTO_INCREMENT = 5 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: services
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `services` (
  `id` int NOT NULL AUTO_INCREMENT,
  `icon_image` varchar(255) NOT NULL,
  `heading` varchar(255) NOT NULL,
  `short_description` text,
  `sub_heading` varchar(255) DEFAULT NULL,
  `description` text,
  `image_1` varchar(255) DEFAULT NULL,
  `image_2` varchar(255) DEFAULT NULL,
  `enquiry_icon_image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 12 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: services_content
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `services_content` (
  `id` int NOT NULL AUTO_INCREMENT,
  `heading` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: services_faq
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `services_faq` (
  `id` int NOT NULL AUTO_INCREMENT,
  `service_id` int NOT NULL,
  `question` text NOT NULL,
  `answer` text NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 76 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: settings
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `site_name` varchar(191) DEFAULT NULL,
  `logo_url` varchar(1024) DEFAULT NULL,
  `favicon_url` varchar(1024) DEFAULT NULL,
  `facebook_url` varchar(1024) DEFAULT NULL,
  `instagram_url` varchar(1024) DEFAULT NULL,
  `whatsapp_url` varchar(1024) DEFAULT NULL,
  `twitter_url` varchar(1024) DEFAULT NULL,
  `youtube_url` varchar(1024) DEFAULT NULL,
  `emails` text,
  `address` text,
  `phone_numbers` text,
  `meta` json DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: states
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `states` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 12 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: testimonials
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `testimonials` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `content` text NOT NULL,
  `image` varchar(500) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 8 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: testimonials_section
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `testimonials_section` (
  `id` int NOT NULL AUTO_INCREMENT,
  `section_subtitle` varchar(255) DEFAULT NULL,
  `section_title` varchar(255) DEFAULT NULL,
  `section_description` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: why_choose_us
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `why_choose_us` (
  `id` int NOT NULL AUTO_INCREMENT,
  `section_heading` varchar(255) DEFAULT NULL,
  `section_description` text,
  `section_image` varchar(500) DEFAULT NULL,
  `point_1` varchar(255) DEFAULT NULL,
  `point_2` varchar(255) DEFAULT NULL,
  `point_3` varchar(255) DEFAULT NULL,
  `point_4` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: about_us
# ------------------------------------------------------------

INSERT INTO
  `about_us` (
    `id`,
    `home_heading`,
    `home_description`,
    `home_image`,
    `comparison_heading`,
    `comparison_description`,
    `comparison_image`,
    `reviews_heading`,
    `reviews_description`,
    `reviews_image`,
    `loan_heading`,
    `loan_description`,
    `loan_image`,
    `expertise_heading`,
    `expertise_description`,
    `expertise_image`,
    `about_heading`,
    `about_description`,
    `about_image`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    1,
    'Your Trusted Source for Loan Reviews and  Comparison  ',
    '<p>We are dedicated to providing you with a reliable and user-friendly platform for loan reviews and comparison. With a mission to simplify the loan selection&nbsp;</p>\r\n<p>&nbsp;</p>',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1759740656/hero_images/q5kgg3e9bmpczwr1hopg.png',
    'Transparent Comparison',
    '<p>Our user-friendly loan comparison tools allow you to effortlessly</p>',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1759741851/hero_images/xf8a278gzn3xdcme2itj.svg',
    'Reviews and Ratings',
    '<p>We pride ourselves on providing unbiased loan reviews&nbsp;</p>',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1759741853/hero_images/zo1qc7bm3n4fh9k2jezf.svg',
    'Loan Database',
    '<p>We have curated a comprehensive database of loan products</p>',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1759741855/hero_images/uwweedl1bwy1nre8qowj.svg',
    'Expertise & Objectivity',
    '<p>With years of experience in the financial industry</p>',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1759741655/hero_images/qgk6dh9w06lowojc9azc.svg',
    'Your Trusted Source for Loan Reviews and Comparisons.',
    '<p>At My Loan <strong>Bazaar</strong>, we simplify the complex world of borrowing by offering a reliable, transparent, and user-friendly platform for loan reviews and comparisons. Our mission is to empower individuals and businesses with the right knowledge, tools, and insights to make informed financial decisions.<br><br></p>\r\n<p>With years of expertise in the financial industry, our team is committed to bringing you comprehensive loan databases, unbiased reviews, and side-by-side comparisons of loan products across categories&mdash;from personal loans, home loans, and business loans to education loans, mortgages, car loans, LAP loans, credit cards, and more.<br><br></p>\r\n<p>We believe in expertise, objectivity, and transparency. That&rsquo;s why our platform is built on thorough research and data-driven insights, ensuring that you get accurate, up-to-date, and easy-to-understand information.<br><br></p>\r\n<p>At My Loan Bazaar, we don&rsquo;t just list loan options&mdash;we help you find the perfect loan for your needs by combining expert guidance, real customer reviews, and interactive comparison tools.</p>',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1759729272/hero_images/lmr331hefq9leaktnfd8.avif',
    '2025-10-06 11:04:53',
    '2025-10-06 14:40:56'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: admin
# ------------------------------------------------------------

INSERT INTO
  `admin` (`id`, `username`, `password`, `created_at`)
VALUES
  (
    1,
    'admin1',
    '$2b$10$2/dy1usTwEUQzjkotq17bO5Tdco3rb28GXsCFas77CD5755r0seHu',
    '2025-10-07 13:03:19'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: admin_logins
# ------------------------------------------------------------

INSERT INTO
  `admin_logins` (
    `id`,
    `username`,
    `ip_address`,
    `user_agent`,
    `login_at`
  )
VALUES
  (
    1,
    'admin',
    '127.0.0.1',
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 Chrome/141.0.0.0 Safari/537.36',
    '2025-10-07 11:41:35'
  );
INSERT INTO
  `admin_logins` (
    `id`,
    `username`,
    `ip_address`,
    `user_agent`,
    `login_at`
  )
VALUES
  (
    2,
    'admin',
    '::1',
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36',
    '2025-10-07 11:44:29'
  );
INSERT INTO
  `admin_logins` (
    `id`,
    `username`,
    `ip_address`,
    `user_agent`,
    `login_at`
  )
VALUES
  (
    3,
    'admin',
    '::1',
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36',
    '2025-10-07 12:52:41'
  );
INSERT INTO
  `admin_logins` (
    `id`,
    `username`,
    `ip_address`,
    `user_agent`,
    `login_at`
  )
VALUES
  (
    4,
    'admin',
    '::1',
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36',
    '2025-10-07 13:02:57'
  );
INSERT INTO
  `admin_logins` (
    `id`,
    `username`,
    `ip_address`,
    `user_agent`,
    `login_at`
  )
VALUES
  (
    5,
    'admin1',
    '::1',
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36',
    '2025-10-07 13:03:32'
  );
INSERT INTO
  `admin_logins` (
    `id`,
    `username`,
    `ip_address`,
    `user_agent`,
    `login_at`
  )
VALUES
  (
    6,
    'admin1',
    '::1',
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36',
    '2025-10-07 14:07:11'
  );
INSERT INTO
  `admin_logins` (
    `id`,
    `username`,
    `ip_address`,
    `user_agent`,
    `login_at`
  )
VALUES
  (
    7,
    'admin1',
    '::1',
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36',
    '2025-10-07 15:44:36'
  );
INSERT INTO
  `admin_logins` (
    `id`,
    `username`,
    `ip_address`,
    `user_agent`,
    `login_at`
  )
VALUES
  (
    8,
    'admin1',
    '::1',
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36',
    '2025-10-17 10:14:35'
  );
INSERT INTO
  `admin_logins` (
    `id`,
    `username`,
    `ip_address`,
    `user_agent`,
    `login_at`
  )
VALUES
  (
    9,
    'admin1',
    '106.51.52.183',
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36',
    '2025-10-17 11:19:19'
  );
INSERT INTO
  `admin_logins` (
    `id`,
    `username`,
    `ip_address`,
    `user_agent`,
    `login_at`
  )
VALUES
  (
    10,
    'admin1',
    '106.51.52.183',
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36',
    '2025-10-17 11:47:58'
  );
INSERT INTO
  `admin_logins` (
    `id`,
    `username`,
    `ip_address`,
    `user_agent`,
    `login_at`
  )
VALUES
  (
    11,
    'admin1',
    '::1',
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36',
    '2025-10-17 11:58:48'
  );
INSERT INTO
  `admin_logins` (
    `id`,
    `username`,
    `ip_address`,
    `user_agent`,
    `login_at`
  )
VALUES
  (
    12,
    'admin1',
    '106.51.52.183',
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36',
    '2025-10-17 12:01:48'
  );
INSERT INTO
  `admin_logins` (
    `id`,
    `username`,
    `ip_address`,
    `user_agent`,
    `login_at`
  )
VALUES
  (
    13,
    'admin1',
    '106.51.52.183',
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36',
    '2025-10-17 12:24:33'
  );
INSERT INTO
  `admin_logins` (
    `id`,
    `username`,
    `ip_address`,
    `user_agent`,
    `login_at`
  )
VALUES
  (
    14,
    'admin1',
    '106.51.52.183',
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36',
    '2025-10-17 14:02:58'
  );
INSERT INTO
  `admin_logins` (
    `id`,
    `username`,
    `ip_address`,
    `user_agent`,
    `login_at`
  )
VALUES
  (
    15,
    'admin1',
    '106.51.52.183',
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36',
    '2025-10-17 14:22:21'
  );
INSERT INTO
  `admin_logins` (
    `id`,
    `username`,
    `ip_address`,
    `user_agent`,
    `login_at`
  )
VALUES
  (
    16,
    'admin1',
    '106.51.52.183',
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36',
    '2025-10-17 14:32:12'
  );
INSERT INTO
  `admin_logins` (
    `id`,
    `username`,
    `ip_address`,
    `user_agent`,
    `login_at`
  )
VALUES
  (
    17,
    'admin1',
    '106.51.52.183',
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36',
    '2025-10-17 14:59:04'
  );
INSERT INTO
  `admin_logins` (
    `id`,
    `username`,
    `ip_address`,
    `user_agent`,
    `login_at`
  )
VALUES
  (
    18,
    'admin1',
    '::1',
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36',
    '2025-10-17 15:11:40'
  );
INSERT INTO
  `admin_logins` (
    `id`,
    `username`,
    `ip_address`,
    `user_agent`,
    `login_at`
  )
VALUES
  (
    19,
    'admin1',
    '::1',
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36',
    '2025-10-17 16:14:24'
  );
INSERT INTO
  `admin_logins` (
    `id`,
    `username`,
    `ip_address`,
    `user_agent`,
    `login_at`
  )
VALUES
  (
    20,
    'admin1',
    '106.51.52.183',
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36',
    '2025-10-17 16:41:35'
  );
INSERT INTO
  `admin_logins` (
    `id`,
    `username`,
    `ip_address`,
    `user_agent`,
    `login_at`
  )
VALUES
  (
    21,
    'admin1',
    '::1',
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36',
    '2025-10-17 17:14:37'
  );
INSERT INTO
  `admin_logins` (
    `id`,
    `username`,
    `ip_address`,
    `user_agent`,
    `login_at`
  )
VALUES
  (
    22,
    'admin1',
    '106.51.52.183',
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36',
    '2025-10-17 17:54:36'
  );
INSERT INTO
  `admin_logins` (
    `id`,
    `username`,
    `ip_address`,
    `user_agent`,
    `login_at`
  )
VALUES
  (
    23,
    'admin1',
    '::1',
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36',
    '2025-10-17 18:39:23'
  );
INSERT INTO
  `admin_logins` (
    `id`,
    `username`,
    `ip_address`,
    `user_agent`,
    `login_at`
  )
VALUES
  (
    24,
    'admin1',
    '106.51.52.183',
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36',
    '2025-10-17 18:40:06'
  );
INSERT INTO
  `admin_logins` (
    `id`,
    `username`,
    `ip_address`,
    `user_agent`,
    `login_at`
  )
VALUES
  (
    25,
    'admin1',
    '::1',
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36',
    '2025-10-17 22:06:22'
  );
INSERT INTO
  `admin_logins` (
    `id`,
    `username`,
    `ip_address`,
    `user_agent`,
    `login_at`
  )
VALUES
  (
    26,
    'admin1',
    '::1',
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36',
    '2025-10-17 23:08:14'
  );
INSERT INTO
  `admin_logins` (
    `id`,
    `username`,
    `ip_address`,
    `user_agent`,
    `login_at`
  )
VALUES
  (
    27,
    'admin1',
    '::1',
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36',
    '2025-10-18 10:18:24'
  );
INSERT INTO
  `admin_logins` (
    `id`,
    `username`,
    `ip_address`,
    `user_agent`,
    `login_at`
  )
VALUES
  (
    28,
    'admin1',
    '::1',
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36',
    '2025-10-18 11:26:20'
  );
INSERT INTO
  `admin_logins` (
    `id`,
    `username`,
    `ip_address`,
    `user_agent`,
    `login_at`
  )
VALUES
  (
    29,
    'admin1',
    '106.51.52.183',
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36',
    '2025-10-18 11:55:16'
  );
INSERT INTO
  `admin_logins` (
    `id`,
    `username`,
    `ip_address`,
    `user_agent`,
    `login_at`
  )
VALUES
  (
    30,
    'admin1',
    '::1',
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36',
    '2025-10-18 12:26:48'
  );
INSERT INTO
  `admin_logins` (
    `id`,
    `username`,
    `ip_address`,
    `user_agent`,
    `login_at`
  )
VALUES
  (
    31,
    'admin1',
    '::1',
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36',
    '2025-10-18 13:30:23'
  );
INSERT INTO
  `admin_logins` (
    `id`,
    `username`,
    `ip_address`,
    `user_agent`,
    `login_at`
  )
VALUES
  (
    32,
    'admin1',
    '::1',
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36',
    '2025-10-21 11:57:58'
  );
INSERT INTO
  `admin_logins` (
    `id`,
    `username`,
    `ip_address`,
    `user_agent`,
    `login_at`
  )
VALUES
  (
    33,
    'admin1',
    '106.51.52.183',
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36',
    '2025-10-23 11:12:36'
  );
INSERT INTO
  `admin_logins` (
    `id`,
    `username`,
    `ip_address`,
    `user_agent`,
    `login_at`
  )
VALUES
  (
    34,
    'admin1',
    '::1',
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36',
    '2025-10-23 15:40:23'
  );
INSERT INTO
  `admin_logins` (
    `id`,
    `username`,
    `ip_address`,
    `user_agent`,
    `login_at`
  )
VALUES
  (
    35,
    'admin1',
    '::1',
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36',
    '2025-10-23 16:41:34'
  );
INSERT INTO
  `admin_logins` (
    `id`,
    `username`,
    `ip_address`,
    `user_agent`,
    `login_at`
  )
VALUES
  (
    36,
    'admin1',
    '::1',
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36',
    '2025-10-23 17:47:49'
  );
INSERT INTO
  `admin_logins` (
    `id`,
    `username`,
    `ip_address`,
    `user_agent`,
    `login_at`
  )
VALUES
  (
    37,
    'admin1',
    '49.37.128.132',
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36',
    '2025-10-23 18:49:28'
  );
INSERT INTO
  `admin_logins` (
    `id`,
    `username`,
    `ip_address`,
    `user_agent`,
    `login_at`
  )
VALUES
  (
    38,
    'admin1',
    '::1',
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36',
    '2025-10-24 10:18:37'
  );
INSERT INTO
  `admin_logins` (
    `id`,
    `username`,
    `ip_address`,
    `user_agent`,
    `login_at`
  )
VALUES
  (
    39,
    'admin1',
    '106.51.52.183',
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36',
    '2025-10-24 10:54:37'
  );
INSERT INTO
  `admin_logins` (
    `id`,
    `username`,
    `ip_address`,
    `user_agent`,
    `login_at`
  )
VALUES
  (
    40,
    'admin1',
    '::1',
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36',
    '2025-10-24 11:19:39'
  );
INSERT INTO
  `admin_logins` (
    `id`,
    `username`,
    `ip_address`,
    `user_agent`,
    `login_at`
  )
VALUES
  (
    41,
    'admin1',
    '106.51.52.183',
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36',
    '2025-10-24 11:55:16'
  );
INSERT INTO
  `admin_logins` (
    `id`,
    `username`,
    `ip_address`,
    `user_agent`,
    `login_at`
  )
VALUES
  (
    42,
    'admin1',
    '::1',
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36',
    '2025-10-24 12:33:56'
  );
INSERT INTO
  `admin_logins` (
    `id`,
    `username`,
    `ip_address`,
    `user_agent`,
    `login_at`
  )
VALUES
  (
    43,
    'admin1',
    '49.37.128.132',
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0',
    '2025-10-24 12:38:28'
  );
INSERT INTO
  `admin_logins` (
    `id`,
    `username`,
    `ip_address`,
    `user_agent`,
    `login_at`
  )
VALUES
  (
    44,
    'admin1',
    '49.37.128.132',
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0',
    '2025-10-24 12:40:56'
  );
INSERT INTO
  `admin_logins` (
    `id`,
    `username`,
    `ip_address`,
    `user_agent`,
    `login_at`
  )
VALUES
  (
    45,
    'admin1',
    '49.37.128.132',
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0',
    '2025-10-24 12:49:14'
  );
INSERT INTO
  `admin_logins` (
    `id`,
    `username`,
    `ip_address`,
    `user_agent`,
    `login_at`
  )
VALUES
  (
    46,
    'admin1',
    '106.51.52.183',
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36',
    '2025-10-24 14:23:08'
  );
INSERT INTO
  `admin_logins` (
    `id`,
    `username`,
    `ip_address`,
    `user_agent`,
    `login_at`
  )
VALUES
  (
    47,
    'admin1',
    '49.37.128.132',
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36',
    '2025-10-24 14:57:35'
  );
INSERT INTO
  `admin_logins` (
    `id`,
    `username`,
    `ip_address`,
    `user_agent`,
    `login_at`
  )
VALUES
  (
    48,
    'admin1',
    '106.51.52.183',
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36',
    '2025-10-24 15:27:28'
  );
INSERT INTO
  `admin_logins` (
    `id`,
    `username`,
    `ip_address`,
    `user_agent`,
    `login_at`
  )
VALUES
  (
    49,
    'admin1',
    '49.37.128.132',
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36',
    '2025-10-24 15:44:13'
  );
INSERT INTO
  `admin_logins` (
    `id`,
    `username`,
    `ip_address`,
    `user_agent`,
    `login_at`
  )
VALUES
  (
    50,
    'admin1',
    '49.37.128.132',
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36',
    '2025-10-24 16:03:42'
  );
INSERT INTO
  `admin_logins` (
    `id`,
    `username`,
    `ip_address`,
    `user_agent`,
    `login_at`
  )
VALUES
  (
    51,
    'admin1',
    '106.51.52.183',
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36',
    '2025-10-24 16:58:57'
  );
INSERT INTO
  `admin_logins` (
    `id`,
    `username`,
    `ip_address`,
    `user_agent`,
    `login_at`
  )
VALUES
  (
    52,
    'admin1',
    '106.51.52.183',
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36',
    '2025-10-24 18:00:08'
  );
INSERT INTO
  `admin_logins` (
    `id`,
    `username`,
    `ip_address`,
    `user_agent`,
    `login_at`
  )
VALUES
  (
    53,
    'admin1',
    '106.51.52.183',
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36',
    '2025-10-25 10:26:19'
  );
INSERT INTO
  `admin_logins` (
    `id`,
    `username`,
    `ip_address`,
    `user_agent`,
    `login_at`
  )
VALUES
  (
    54,
    'admin1',
    '106.51.52.183',
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36',
    '2025-10-25 12:02:32'
  );
INSERT INTO
  `admin_logins` (
    `id`,
    `username`,
    `ip_address`,
    `user_agent`,
    `login_at`
  )
VALUES
  (
    55,
    'admin1',
    '106.51.52.183',
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36',
    '2025-10-25 13:08:35'
  );
INSERT INTO
  `admin_logins` (
    `id`,
    `username`,
    `ip_address`,
    `user_agent`,
    `login_at`
  )
VALUES
  (
    56,
    'admin1',
    '106.51.52.183',
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36',
    '2025-10-25 13:57:37'
  );
INSERT INTO
  `admin_logins` (
    `id`,
    `username`,
    `ip_address`,
    `user_agent`,
    `login_at`
  )
VALUES
  (
    57,
    'admin1',
    '106.51.52.183',
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36',
    '2025-10-27 10:09:17'
  );
INSERT INTO
  `admin_logins` (
    `id`,
    `username`,
    `ip_address`,
    `user_agent`,
    `login_at`
  )
VALUES
  (
    58,
    'admin1',
    '49.37.128.132',
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36',
    '2025-10-27 10:19:50'
  );
INSERT INTO
  `admin_logins` (
    `id`,
    `username`,
    `ip_address`,
    `user_agent`,
    `login_at`
  )
VALUES
  (
    59,
    'admin1',
    '::1',
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36',
    '2025-10-27 10:30:42'
  );
INSERT INTO
  `admin_logins` (
    `id`,
    `username`,
    `ip_address`,
    `user_agent`,
    `login_at`
  )
VALUES
  (
    60,
    'admin1',
    '106.51.52.183',
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36',
    '2025-10-27 10:39:38'
  );
INSERT INTO
  `admin_logins` (
    `id`,
    `username`,
    `ip_address`,
    `user_agent`,
    `login_at`
  )
VALUES
  (
    61,
    'admin1',
    '49.37.128.132',
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36',
    '2025-10-27 10:42:44'
  );
INSERT INTO
  `admin_logins` (
    `id`,
    `username`,
    `ip_address`,
    `user_agent`,
    `login_at`
  )
VALUES
  (
    62,
    'admin1',
    '106.51.52.183',
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36',
    '2025-10-27 11:14:19'
  );
INSERT INTO
  `admin_logins` (
    `id`,
    `username`,
    `ip_address`,
    `user_agent`,
    `login_at`
  )
VALUES
  (
    63,
    'admin1',
    '::1',
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36',
    '2025-10-27 11:32:56'
  );
INSERT INTO
  `admin_logins` (
    `id`,
    `username`,
    `ip_address`,
    `user_agent`,
    `login_at`
  )
VALUES
  (
    64,
    'admin1',
    '49.37.128.132',
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36',
    '2025-10-27 11:47:05'
  );
INSERT INTO
  `admin_logins` (
    `id`,
    `username`,
    `ip_address`,
    `user_agent`,
    `login_at`
  )
VALUES
  (
    65,
    'admin1',
    '106.51.52.183',
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36',
    '2025-10-27 12:15:28'
  );
INSERT INTO
  `admin_logins` (
    `id`,
    `username`,
    `ip_address`,
    `user_agent`,
    `login_at`
  )
VALUES
  (
    66,
    'admin1',
    '106.51.52.183',
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36',
    '2025-10-27 12:30:25'
  );
INSERT INTO
  `admin_logins` (
    `id`,
    `username`,
    `ip_address`,
    `user_agent`,
    `login_at`
  )
VALUES
  (
    67,
    'admin1',
    '106.51.52.183',
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36',
    '2025-10-27 14:06:48'
  );
INSERT INTO
  `admin_logins` (
    `id`,
    `username`,
    `ip_address`,
    `user_agent`,
    `login_at`
  )
VALUES
  (
    68,
    'admin1',
    '::1',
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36',
    '2025-10-27 14:24:13'
  );
INSERT INTO
  `admin_logins` (
    `id`,
    `username`,
    `ip_address`,
    `user_agent`,
    `login_at`
  )
VALUES
  (
    69,
    'admin1',
    '106.51.52.183',
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36',
    '2025-10-27 16:25:19'
  );
INSERT INTO
  `admin_logins` (
    `id`,
    `username`,
    `ip_address`,
    `user_agent`,
    `login_at`
  )
VALUES
  (
    70,
    'admin1',
    '49.37.128.132',
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36',
    '2025-10-27 16:29:04'
  );
INSERT INTO
  `admin_logins` (
    `id`,
    `username`,
    `ip_address`,
    `user_agent`,
    `login_at`
  )
VALUES
  (
    71,
    'admin1',
    '106.51.52.183',
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36',
    '2025-10-27 17:40:05'
  );
INSERT INTO
  `admin_logins` (
    `id`,
    `username`,
    `ip_address`,
    `user_agent`,
    `login_at`
  )
VALUES
  (
    72,
    'admin1',
    '106.51.52.183',
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36',
    '2025-10-27 18:42:40'
  );
INSERT INTO
  `admin_logins` (
    `id`,
    `username`,
    `ip_address`,
    `user_agent`,
    `login_at`
  )
VALUES
  (
    73,
    'admin1',
    '106.51.52.183',
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36',
    '2025-10-27 18:54:27'
  );
INSERT INTO
  `admin_logins` (
    `id`,
    `username`,
    `ip_address`,
    `user_agent`,
    `login_at`
  )
VALUES
  (
    74,
    'admin1',
    '123.201.208.176',
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36',
    '2025-10-28 10:29:44'
  );
INSERT INTO
  `admin_logins` (
    `id`,
    `username`,
    `ip_address`,
    `user_agent`,
    `login_at`
  )
VALUES
  (
    75,
    'admin1',
    '49.37.128.132',
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36',
    '2025-10-28 10:42:28'
  );
INSERT INTO
  `admin_logins` (
    `id`,
    `username`,
    `ip_address`,
    `user_agent`,
    `login_at`
  )
VALUES
  (
    76,
    'admin1',
    '::1',
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36',
    '2025-10-28 11:10:13'
  );
INSERT INTO
  `admin_logins` (
    `id`,
    `username`,
    `ip_address`,
    `user_agent`,
    `login_at`
  )
VALUES
  (
    77,
    'admin1',
    '123.201.208.176',
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36',
    '2025-10-28 12:07:04'
  );
INSERT INTO
  `admin_logins` (
    `id`,
    `username`,
    `ip_address`,
    `user_agent`,
    `login_at`
  )
VALUES
  (
    78,
    'admin1',
    '::1',
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36',
    '2025-10-28 12:11:49'
  );
INSERT INTO
  `admin_logins` (
    `id`,
    `username`,
    `ip_address`,
    `user_agent`,
    `login_at`
  )
VALUES
  (
    79,
    'admin1',
    '::1',
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36',
    '2025-10-28 14:01:43'
  );
INSERT INTO
  `admin_logins` (
    `id`,
    `username`,
    `ip_address`,
    `user_agent`,
    `login_at`
  )
VALUES
  (
    80,
    'admin1',
    '123.201.208.176',
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36',
    '2025-10-28 14:21:00'
  );
INSERT INTO
  `admin_logins` (
    `id`,
    `username`,
    `ip_address`,
    `user_agent`,
    `login_at`
  )
VALUES
  (
    81,
    'admin1',
    '::1',
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36',
    '2025-10-28 15:02:16'
  );
INSERT INTO
  `admin_logins` (
    `id`,
    `username`,
    `ip_address`,
    `user_agent`,
    `login_at`
  )
VALUES
  (
    82,
    'admin1',
    '123.201.208.176',
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36',
    '2025-10-28 16:00:56'
  );
INSERT INTO
  `admin_logins` (
    `id`,
    `username`,
    `ip_address`,
    `user_agent`,
    `login_at`
  )
VALUES
  (
    83,
    'admin1',
    '49.37.128.132',
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0',
    '2025-10-28 16:05:48'
  );
INSERT INTO
  `admin_logins` (
    `id`,
    `username`,
    `ip_address`,
    `user_agent`,
    `login_at`
  )
VALUES
  (
    84,
    'admin1',
    '49.37.128.132',
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36',
    '2025-10-28 16:09:33'
  );
INSERT INTO
  `admin_logins` (
    `id`,
    `username`,
    `ip_address`,
    `user_agent`,
    `login_at`
  )
VALUES
  (
    85,
    'admin1',
    '::1',
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36',
    '2025-10-28 16:10:52'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: contact_submissions
# ------------------------------------------------------------

INSERT INTO
  `contact_submissions` (
    `id`,
    `name`,
    `email`,
    `phone`,
    `subject`,
    `message`,
    `created_at`,
    `is_read`
  )
VALUES
  (
    3,
    'Jane Smith',
    'jane.smith@example.com',
    '(234) 567-8901',
    'Support needed',
    'I am facing an issue with my account. Please help.',
    '2025-10-07 12:10:12',
    1
  );
INSERT INTO
  `contact_submissions` (
    `id`,
    `name`,
    `email`,
    `phone`,
    `subject`,
    `message`,
    `created_at`,
    `is_read`
  )
VALUES
  (
    4,
    'Alice Johnson',
    'alice.j@example.com',
    '(345) 678-9012',
    'Partnership',
    'I am interested in partnering with your company.',
    '2025-10-07 12:10:12',
    1
  );
INSERT INTO
  `contact_submissions` (
    `id`,
    `name`,
    `email`,
    `phone`,
    `subject`,
    `message`,
    `created_at`,
    `is_read`
  )
VALUES
  (
    5,
    'Bob Williams',
    'bob.williams@example.com',
    '(456) 789-0123',
    'Feedback',
    'Your website is very user-friendly. Great job!',
    '2025-10-07 12:10:12',
    1
  );
INSERT INTO
  `contact_submissions` (
    `id`,
    `name`,
    `email`,
    `phone`,
    `subject`,
    `message`,
    `created_at`,
    `is_read`
  )
VALUES
  (
    6,
    'Charlie Brown',
    'charlie.brown@example.com',
    '(567) 890-1234',
    'Complaint',
    'I have an issue with my recent application.',
    '2025-10-07 12:10:12',
    1
  );
INSERT INTO
  `contact_submissions` (
    `id`,
    `name`,
    `email`,
    `phone`,
    `subject`,
    `message`,
    `created_at`,
    `is_read`
  )
VALUES
  (
    7,
    'Diana Prince',
    'diana.prince@example.com',
    '(678) 901-2345',
    'Loan inquiry',
    'Can I get a loan with flexible repayment options?',
    '2025-10-07 12:10:12',
    1
  );
INSERT INTO
  `contact_submissions` (
    `id`,
    `name`,
    `email`,
    `phone`,
    `subject`,
    `message`,
    `created_at`,
    `is_read`
  )
VALUES
  (
    8,
    'Ethan Hunt',
    'ethan.hunt@example.com',
    '(789) 012-3456',
    'Request info',
    'Please send me the details of your services.',
    '2025-10-07 12:10:12',
    1
  );
INSERT INTO
  `contact_submissions` (
    `id`,
    `name`,
    `email`,
    `phone`,
    `subject`,
    `message`,
    `created_at`,
    `is_read`
  )
VALUES
  (
    9,
    'Fiona Gallagher',
    'fiona.g@example.com',
    '(890) 123-4567',
    'Technical question',
    'How do I reset my account password?',
    '2025-10-07 12:10:12',
    1
  );
INSERT INTO
  `contact_submissions` (
    `id`,
    `name`,
    `email`,
    `phone`,
    `subject`,
    `message`,
    `created_at`,
    `is_read`
  )
VALUES
  (
    10,
    'George Martin',
    'george.martin@example.com',
    '(901) 234-5678',
    'General inquiry',
    'I have some questions regarding your policies.',
    '2025-10-07 12:10:12',
    1
  );
INSERT INTO
  `contact_submissions` (
    `id`,
    `name`,
    `email`,
    `phone`,
    `subject`,
    `message`,
    `created_at`,
    `is_read`
  )
VALUES
  (
    11,
    'Hannah Baker',
    'hannah.baker@example.com',
    '(012) 345-6789',
    'Service feedback',
    'The customer support was very helpful. Thank you!',
    '2025-10-07 12:10:12',
    1
  );
INSERT INTO
  `contact_submissions` (
    `id`,
    `name`,
    `email`,
    `phone`,
    `subject`,
    `message`,
    `created_at`,
    `is_read`
  )
VALUES
  (
    14,
    'Alice Johnson',
    'alice.j@example.com',
    '(345) 678-9012',
    'Partnership',
    'I am interested in partnering with your company.',
    '2025-10-07 12:10:28',
    1
  );
INSERT INTO
  `contact_submissions` (
    `id`,
    `name`,
    `email`,
    `phone`,
    `subject`,
    `message`,
    `created_at`,
    `is_read`
  )
VALUES
  (
    15,
    'Bob Williams',
    'bob.williams@example.com',
    '(456) 789-0123',
    'Feedback',
    'Your website is very user-friendly. Great job!',
    '2025-10-07 12:10:28',
    1
  );
INSERT INTO
  `contact_submissions` (
    `id`,
    `name`,
    `email`,
    `phone`,
    `subject`,
    `message`,
    `created_at`,
    `is_read`
  )
VALUES
  (
    17,
    'Diana Prince',
    'diana.prince@example.com',
    '(678) 901-2345',
    'Loan inquiry',
    'Can I get a loan with flexible repayment options?',
    '2025-10-07 12:10:28',
    1
  );
INSERT INTO
  `contact_submissions` (
    `id`,
    `name`,
    `email`,
    `phone`,
    `subject`,
    `message`,
    `created_at`,
    `is_read`
  )
VALUES
  (
    19,
    'Fiona Gallagher',
    'fiona.g@example.com',
    '(890) 123-4567',
    'Technical question',
    'How do I reset my account password?',
    '2025-10-07 12:10:28',
    1
  );
INSERT INTO
  `contact_submissions` (
    `id`,
    `name`,
    `email`,
    `phone`,
    `subject`,
    `message`,
    `created_at`,
    `is_read`
  )
VALUES
  (
    20,
    'George Martin',
    'george.martin@example.com',
    '(901) 234-5678',
    'General inquiry',
    'I have some questions regarding your policies.',
    '2025-10-07 12:10:28',
    1
  );
INSERT INTO
  `contact_submissions` (
    `id`,
    `name`,
    `email`,
    `phone`,
    `subject`,
    `message`,
    `created_at`,
    `is_read`
  )
VALUES
  (
    21,
    'Hannah Baker',
    'hannah.baker@example.com',
    '(012) 345-6789',
    'Service feedback',
    'The customer support was very helpful. Thank you!',
    '2025-10-07 12:10:28',
    1
  );
INSERT INTO
  `contact_submissions` (
    `id`,
    `name`,
    `email`,
    `phone`,
    `subject`,
    `message`,
    `created_at`,
    `is_read`
  )
VALUES
  (
    25,
    'sai kiran',
    'saikirancmoon@gmail.com',
    '08978553778',
    'etst',
    'test',
    '2025-10-17 12:17:28',
    1
  );
INSERT INTO
  `contact_submissions` (
    `id`,
    `name`,
    `email`,
    `phone`,
    `subject`,
    `message`,
    `created_at`,
    `is_read`
  )
VALUES
  (
    26,
    'sai kiran',
    'saikirancmoon@gmail.com',
    '08978553778',
    '2',
    'test2',
    '2025-10-17 12:18:12',
    1
  );
INSERT INTO
  `contact_submissions` (
    `id`,
    `name`,
    `email`,
    `phone`,
    `subject`,
    `message`,
    `created_at`,
    `is_read`
  )
VALUES
  (
    27,
    'sai kiran',
    'saikirancmoon@gmail.com',
    '08978553778',
    '3',
    'test 3',
    '2025-10-17 12:18:27',
    1
  );
INSERT INTO
  `contact_submissions` (
    `id`,
    `name`,
    `email`,
    `phone`,
    `subject`,
    `message`,
    `created_at`,
    `is_read`
  )
VALUES
  (
    28,
    'sai kiran',
    'saikirancmoon@gmail.com',
    '08978553778',
    'test4',
    '4test',
    '2025-10-17 12:22:41',
    0
  );
INSERT INTO
  `contact_submissions` (
    `id`,
    `name`,
    `email`,
    `phone`,
    `subject`,
    `message`,
    `created_at`,
    `is_read`
  )
VALUES
  (
    29,
    'sai kiran',
    'saikirancmoon@gmail.com',
    '08978553778',
    'test5',
    'test5',
    '2025-10-17 12:25:03',
    0
  );
INSERT INTO
  `contact_submissions` (
    `id`,
    `name`,
    `email`,
    `phone`,
    `subject`,
    `message`,
    `created_at`,
    `is_read`
  )
VALUES
  (
    31,
    'a',
    'a@gmail.com',
    '80000000000000000000000000000000',
    'a',
    'a',
    '2025-10-23 11:55:21',
    0
  );
INSERT INTO
  `contact_submissions` (
    `id`,
    `name`,
    `email`,
    `phone`,
    `subject`,
    `message`,
    `created_at`,
    `is_read`
  )
VALUES
  (
    32,
    'a',
    'a@gmail.com',
    'a',
    'a',
    'a',
    '2025-10-23 12:13:21',
    0
  );
INSERT INTO
  `contact_submissions` (
    `id`,
    `name`,
    `email`,
    `phone`,
    `subject`,
    `message`,
    `created_at`,
    `is_read`
  )
VALUES
  (
    33,
    'w',
    'hh@gmail.com',
    'sdasfdgh',
    'sdsfgb',
    'sfdgb',
    '2025-10-23 12:13:48',
    0
  );
INSERT INTO
  `contact_submissions` (
    `id`,
    `name`,
    `email`,
    `phone`,
    `subject`,
    `message`,
    `created_at`,
    `is_read`
  )
VALUES
  (
    34,
    'Amit Patel',
    'amitpatel71@gmail.com',
    '9123456789',
    'General inquiry',
    'I would like more details.',
    '2025-10-23 14:17:31',
    0
  );
INSERT INTO
  `contact_submissions` (
    `id`,
    `name`,
    `email`,
    `phone`,
    `subject`,
    `message`,
    `created_at`,
    `is_read`
  )
VALUES
  (
    35,
    'Amit Patel',
    'amitpatel71@gmail.com',
    '9123456789',
    'General inquiry',
    'I would like more details.',
    '2025-10-23 14:22:30',
    0
  );
INSERT INTO
  `contact_submissions` (
    `id`,
    `name`,
    `email`,
    `phone`,
    `subject`,
    `message`,
    `created_at`,
    `is_read`
  )
VALUES
  (
    36,
    'Priya Singh',
    'priya.singh21@yahoo.com',
    '9834576821',
    'Service feedback',
    'Service was good.',
    '2025-10-23 14:22:36',
    0
  );
INSERT INTO
  `contact_submissions` (
    `id`,
    `name`,
    `email`,
    `phone`,
    `subject`,
    `message`,
    `created_at`,
    `is_read`
  )
VALUES
  (
    37,
    'Ramesh Rao',
    'ramesh.rao36@mail.com',
    '9876543210',
    'Feedback',
    'Application status?',
    '2025-10-23 14:22:45',
    0
  );
INSERT INTO
  `contact_submissions` (
    `id`,
    `name`,
    `email`,
    `phone`,
    `subject`,
    `message`,
    `created_at`,
    `is_read`
  )
VALUES
  (
    38,
    'Meera Kapoor',
    'meera.kapoor42@rediffmail.com',
    '9012345678',
    'Account Issue',
    'Can I speak with an agent?',
    '2025-10-23 14:22:55',
    0
  );
INSERT INTO
  `contact_submissions` (
    `id`,
    `name`,
    `email`,
    `phone`,
    `subject`,
    `message`,
    `created_at`,
    `is_read`
  )
VALUES
  (
    39,
    'Vikram Jain',
    'vikram.jain19@hotmail.com',
    '9908765432',
    'Loan Application',
    'Please contact me soon.',
    '2025-10-23 14:23:06',
    0
  );
INSERT INTO
  `contact_submissions` (
    `id`,
    `name`,
    `email`,
    `phone`,
    `subject`,
    `message`,
    `created_at`,
    `is_read`
  )
VALUES
  (
    40,
    'Kiran Nair',
    'kirannair81@gmail.com',
    '9912345670',
    'Request info',
    'Thanks for your support.',
    '2025-10-23 14:23:16',
    0
  );
INSERT INTO
  `contact_submissions` (
    `id`,
    `name`,
    `email`,
    `phone`,
    `subject`,
    `message`,
    `created_at`,
    `is_read`
  )
VALUES
  (
    41,
    'Suman Sharma',
    'suman.sharma45@mail.com',
    '9887654321',
    'Support',
    'Policy details needed.',
    '2025-10-23 14:23:28',
    0
  );
INSERT INTO
  `contact_submissions` (
    `id`,
    `name`,
    `email`,
    `phone`,
    `subject`,
    `message`,
    `created_at`,
    `is_read`
  )
VALUES
  (
    42,
    'Neha Gupta',
    'neha.gupta23@yahoo.com',
    '9902123456',
    'Other',
    'Follow up requested.',
    '2025-10-23 14:23:36',
    0
  );
INSERT INTO
  `contact_submissions` (
    `id`,
    `name`,
    `email`,
    `phone`,
    `subject`,
    `message`,
    `created_at`,
    `is_read`
  )
VALUES
  (
    43,
    'Surya Menon',
    'suryamenon13@gmail.com',
    '9786543210',
    'General inquiry',
    'I have a concern.',
    '2025-10-23 14:23:45',
    0
  );
INSERT INTO
  `contact_submissions` (
    `id`,
    `name`,
    `email`,
    `phone`,
    `subject`,
    `message`,
    `created_at`,
    `is_read`
  )
VALUES
  (
    44,
    'Keerthi Das',
    'keerthi.das24@hotmail.com',
    '9123409876',
    'Service feedback',
    'Service was good.',
    '2025-10-23 14:23:55',
    0
  );
INSERT INTO
  `contact_submissions` (
    `id`,
    `name`,
    `email`,
    `phone`,
    `subject`,
    `message`,
    `created_at`,
    `is_read`
  )
VALUES
  (
    45,
    'Manoj Chowdhury',
    'manoj.chowdhury67@rediffmail.com',
    '9934567812',
    'Feedback',
    'This is a test message.',
    '2025-10-23 14:24:06',
    0
  );
INSERT INTO
  `contact_submissions` (
    `id`,
    `name`,
    `email`,
    `phone`,
    `subject`,
    `message`,
    `created_at`,
    `is_read`
  )
VALUES
  (
    47,
    'Varun Kapoor',
    'pooja.ghosh46@yahoo.cvarun',
    '9109876543',
    'Feedback',
    'I have a concern.',
    '2025-10-23 14:25:33',
    0
  );
INSERT INTO
  `contact_submissions` (
    `id`,
    `name`,
    `email`,
    `phone`,
    `subject`,
    `message`,
    `created_at`,
    `is_read`
  )
VALUES
  (
    52,
    'Venkata Ramana',
    'venkata.ramana@email.com',
    '9876543210',
    'Personal Loan Inquiry',
    'I am interested in applying for a personal loan. Please provide information about interest rates and eligibility.',
    '2025-10-24 14:38:13',
    0
  );
INSERT INTO
  `contact_submissions` (
    `id`,
    `name`,
    `email`,
    `phone`,
    `subject`,
    `message`,
    `created_at`,
    `is_read`
  )
VALUES
  (
    53,
    'Lakshmi Devi',
    'lakshmi.devi@email.com',
    '9123456789',
    'Home Loan Inquiry',
    'I need information about home loan options and EMI calculators. Please contact me soon.',
    '2025-10-24 14:39:35',
    0
  );
INSERT INTO
  `contact_submissions` (
    `id`,
    `name`,
    `email`,
    `phone`,
    `subject`,
    `message`,
    `created_at`,
    `is_read`
  )
VALUES
  (
    54,
    'Srinivasa Rao',
    'srinivasa.rao@email.com',
    '9234567890',
    'Business Loan Inquiry',
    'I am looking to expand my business and need a business loan. Please provide details on loan amounts and repayment terms.',
    '2025-10-24 14:41:30',
    0
  );
INSERT INTO
  `contact_submissions` (
    `id`,
    `name`,
    `email`,
    `phone`,
    `subject`,
    `message`,
    `created_at`,
    `is_read`
  )
VALUES
  (
    55,
    'Krishna Murthy',
    'krishna.murthy@email.com',
    '9345678901',
    'Car Loan Inquiry',
    'I want to purchase a new car and need financing. Please share car loan interest rates and tenure options.',
    '2025-10-24 14:42:46',
    0
  );
INSERT INTO
  `contact_submissions` (
    `id`,
    `name`,
    `email`,
    `phone`,
    `subject`,
    `message`,
    `created_at`,
    `is_read`
  )
VALUES
  (
    56,
    'Prasanna Kumari',
    'prasanna.kumari@email.com',
    '9456789012',
    'Education Loan Inquiry',
    'I need financial assistance for my daughter\'s higher education. Please provide details about education loan schemes and interest rates.',
    '2025-10-24 14:44:51',
    0
  );
INSERT INTO
  `contact_submissions` (
    `id`,
    `name`,
    `email`,
    `phone`,
    `subject`,
    `message`,
    `created_at`,
    `is_read`
  )
VALUES
  (
    58,
    'sai kiran',
    'saikirancmoon@gmail.com',
    '08978553778',
    'test',
    'test',
    '2025-10-27 11:38:43',
    0
  );
INSERT INTO
  `contact_submissions` (
    `id`,
    `name`,
    `email`,
    `phone`,
    `subject`,
    `message`,
    `created_at`,
    `is_read`
  )
VALUES
  (
    59,
    'sai kiran',
    'saikirancmoon@gmail.com',
    '08978553778',
    'test1',
    'test',
    '2025-10-27 11:39:11',
    0
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: districts
# ------------------------------------------------------------

INSERT INTO
  `districts` (`id`, `state_id`, `name`)
VALUES
  (1, 1, 'Adilabad');
INSERT INTO
  `districts` (`id`, `state_id`, `name`)
VALUES
  (2, 1, 'Bhadradri Kothagudem');
INSERT INTO
  `districts` (`id`, `state_id`, `name`)
VALUES
  (3, 1, 'Hanumakonda');
INSERT INTO
  `districts` (`id`, `state_id`, `name`)
VALUES
  (4, 1, 'Hyderabad');
INSERT INTO
  `districts` (`id`, `state_id`, `name`)
VALUES
  (5, 1, 'Jagtial');
INSERT INTO
  `districts` (`id`, `state_id`, `name`)
VALUES
  (6, 1, 'Karimnagar');
INSERT INTO
  `districts` (`id`, `state_id`, `name`)
VALUES
  (7, 1, 'Khammam');
INSERT INTO
  `districts` (`id`, `state_id`, `name`)
VALUES
  (8, 1, 'Mahabubnagar');
INSERT INTO
  `districts` (`id`, `state_id`, `name`)
VALUES
  (9, 1, 'Medchal–Malkajgiri');
INSERT INTO
  `districts` (`id`, `state_id`, `name`)
VALUES
  (10, 1, 'Nizamabad');
INSERT INTO
  `districts` (`id`, `state_id`, `name`)
VALUES
  (11, 1, 'Sangareddy');
INSERT INTO
  `districts` (`id`, `state_id`, `name`)
VALUES
  (12, 1, 'Warangal');
INSERT INTO
  `districts` (`id`, `state_id`, `name`)
VALUES
  (13, 2, 'Anantapur');
INSERT INTO
  `districts` (`id`, `state_id`, `name`)
VALUES
  (14, 2, 'Chittoor');
INSERT INTO
  `districts` (`id`, `state_id`, `name`)
VALUES
  (15, 2, 'East Godavari');
INSERT INTO
  `districts` (`id`, `state_id`, `name`)
VALUES
  (16, 2, 'Guntur');
INSERT INTO
  `districts` (`id`, `state_id`, `name`)
VALUES
  (17, 2, 'Kadapa');
INSERT INTO
  `districts` (`id`, `state_id`, `name`)
VALUES
  (18, 2, 'Krishna');
INSERT INTO
  `districts` (`id`, `state_id`, `name`)
VALUES
  (19, 2, 'Kurnool');
INSERT INTO
  `districts` (`id`, `state_id`, `name`)
VALUES
  (20, 2, 'Nellore');
INSERT INTO
  `districts` (`id`, `state_id`, `name`)
VALUES
  (21, 2, 'Prakasam');
INSERT INTO
  `districts` (`id`, `state_id`, `name`)
VALUES
  (22, 2, 'Srikakulam');
INSERT INTO
  `districts` (`id`, `state_id`, `name`)
VALUES
  (23, 2, 'Visakhapatnam');
INSERT INTO
  `districts` (`id`, `state_id`, `name`)
VALUES
  (24, 2, 'Vizianagaram');
INSERT INTO
  `districts` (`id`, `state_id`, `name`)
VALUES
  (25, 2, 'West Godavari');
INSERT INTO
  `districts` (`id`, `state_id`, `name`)
VALUES
  (26, 3, 'Bagalkot');
INSERT INTO
  `districts` (`id`, `state_id`, `name`)
VALUES
  (27, 3, 'Ballari');
INSERT INTO
  `districts` (`id`, `state_id`, `name`)
VALUES
  (28, 3, 'Belagavi');
INSERT INTO
  `districts` (`id`, `state_id`, `name`)
VALUES
  (29, 3, 'Bengaluru Urban');
INSERT INTO
  `districts` (`id`, `state_id`, `name`)
VALUES
  (30, 3, 'Bengaluru Rural');
INSERT INTO
  `districts` (`id`, `state_id`, `name`)
VALUES
  (31, 3, 'Chamarajanagar');
INSERT INTO
  `districts` (`id`, `state_id`, `name`)
VALUES
  (32, 3, 'Chikkamagaluru');
INSERT INTO
  `districts` (`id`, `state_id`, `name`)
VALUES
  (33, 3, 'Dakshina Kannada');
INSERT INTO
  `districts` (`id`, `state_id`, `name`)
VALUES
  (34, 3, 'Davanagere');
INSERT INTO
  `districts` (`id`, `state_id`, `name`)
VALUES
  (35, 3, 'Dharwad');
INSERT INTO
  `districts` (`id`, `state_id`, `name`)
VALUES
  (36, 3, 'Hassan');
INSERT INTO
  `districts` (`id`, `state_id`, `name`)
VALUES
  (37, 3, 'Kalaburagi');
INSERT INTO
  `districts` (`id`, `state_id`, `name`)
VALUES
  (38, 3, 'Mandya');
INSERT INTO
  `districts` (`id`, `state_id`, `name`)
VALUES
  (39, 3, 'Mysuru');
INSERT INTO
  `districts` (`id`, `state_id`, `name`)
VALUES
  (40, 3, 'Raichur');
INSERT INTO
  `districts` (`id`, `state_id`, `name`)
VALUES
  (41, 3, 'Shivamogga');
INSERT INTO
  `districts` (`id`, `state_id`, `name`)
VALUES
  (42, 3, 'Tumakuru');
INSERT INTO
  `districts` (`id`, `state_id`, `name`)
VALUES
  (43, 3, 'Udupi');
INSERT INTO
  `districts` (`id`, `state_id`, `name`)
VALUES
  (44, 3, 'Vijayapura');
INSERT INTO
  `districts` (`id`, `state_id`, `name`)
VALUES
  (45, 4, 'Chennai');
INSERT INTO
  `districts` (`id`, `state_id`, `name`)
VALUES
  (46, 4, 'Coimbatore');
INSERT INTO
  `districts` (`id`, `state_id`, `name`)
VALUES
  (47, 4, 'Cuddalore');
INSERT INTO
  `districts` (`id`, `state_id`, `name`)
VALUES
  (48, 4, 'Dharmapuri');
INSERT INTO
  `districts` (`id`, `state_id`, `name`)
VALUES
  (49, 4, 'Dindigul');
INSERT INTO
  `districts` (`id`, `state_id`, `name`)
VALUES
  (50, 4, 'Erode');
INSERT INTO
  `districts` (`id`, `state_id`, `name`)
VALUES
  (51, 4, 'Kanchipuram');
INSERT INTO
  `districts` (`id`, `state_id`, `name`)
VALUES
  (52, 4, 'Kanyakumari');
INSERT INTO
  `districts` (`id`, `state_id`, `name`)
VALUES
  (53, 4, 'Madurai');
INSERT INTO
  `districts` (`id`, `state_id`, `name`)
VALUES
  (54, 4, 'Namakkal');
INSERT INTO
  `districts` (`id`, `state_id`, `name`)
VALUES
  (55, 4, 'Salem');
INSERT INTO
  `districts` (`id`, `state_id`, `name`)
VALUES
  (56, 4, 'Thanjavur');
INSERT INTO
  `districts` (`id`, `state_id`, `name`)
VALUES
  (57, 4, 'Tiruchirappalli');
INSERT INTO
  `districts` (`id`, `state_id`, `name`)
VALUES
  (58, 4, 'Tirunelveli');
INSERT INTO
  `districts` (`id`, `state_id`, `name`)
VALUES
  (59, 4, 'Vellore');
INSERT INTO
  `districts` (`id`, `state_id`, `name`)
VALUES
  (60, 4, 'Viluppuram');
INSERT INTO
  `districts` (`id`, `state_id`, `name`)
VALUES
  (61, 1, 'Adilabad');
INSERT INTO
  `districts` (`id`, `state_id`, `name`)
VALUES
  (62, 1, 'Bhadradri Kothagudem');
INSERT INTO
  `districts` (`id`, `state_id`, `name`)
VALUES
  (67, 11, 'etst');

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: enquirie_s
# ------------------------------------------------------------

INSERT INTO
  `enquirie_s` (
    `id`,
    `service_id`,
    `service_name`,
    `type_of_employment`,
    `name`,
    `mobile`,
    `address`,
    `pincode`,
    `gender`,
    `company_name`,
    `loan_amount`,
    `monthly_salary`,
    `emis`,
    `preferred_type`,
    `preferred_institution`,
    `institution_name`,
    `state`,
    `district`,
    `otp_verified`,
    `created_at`
  )
VALUES
  (
    4,
    1,
    'Personal Loan',
    NULL,
    'sai kiran',
    '8978553778',
    'colour moon technologies',
    '500072',
    'Male',
    'colourmoon technologies',
    123456.00,
    123.00,
    123.00,
    'Bank',
    'SBI Bank',
    'SBI Bank',
    'Andhra Pradesh',
    'Visakhapatnam',
    1,
    '2025-10-23 15:34:28'
  );
INSERT INTO
  `enquirie_s` (
    `id`,
    `service_id`,
    `service_name`,
    `type_of_employment`,
    `name`,
    `mobile`,
    `address`,
    `pincode`,
    `gender`,
    `company_name`,
    `loan_amount`,
    `monthly_salary`,
    `emis`,
    `preferred_type`,
    `preferred_institution`,
    `institution_name`,
    `state`,
    `district`,
    `otp_verified`,
    `created_at`
  )
VALUES
  (
    6,
    1,
    'Personal Loan',
    NULL,
    'test',
    '9876543210',
    'testing by asiira',
    '504231',
    'Male',
    'colourmoon technologies',
    1234567.00,
    4567.00,
    67.00,
    'Bank',
    'SBI Bank',
    'SBI Bank',
    'Karnataka',
    'Hassan',
    1,
    '2025-10-23 16:30:18'
  );
INSERT INTO
  `enquirie_s` (
    `id`,
    `service_id`,
    `service_name`,
    `type_of_employment`,
    `name`,
    `mobile`,
    `address`,
    `pincode`,
    `gender`,
    `company_name`,
    `loan_amount`,
    `monthly_salary`,
    `emis`,
    `preferred_type`,
    `preferred_institution`,
    `institution_name`,
    `state`,
    `district`,
    `otp_verified`,
    `created_at`
  )
VALUES
  (
    12,
    1,
    'Personal Loan',
    NULL,
    'Ramesh',
    '6000000000',
    'ample residential address (India)\n4-158/9 5th Cross Road\nSainikpuri Secunderabad 500094, TS ',
    '533288',
    'Male',
    'aq',
    10000000.00,
    10000.00,
    10000.00,
    'Bank',
    'testing',
    'testing',
    'Andhra Pradesh',
    'Visakhapatnam',
    1,
    '2025-10-24 11:49:11'
  );
INSERT INTO
  `enquirie_s` (
    `id`,
    `service_id`,
    `service_name`,
    `type_of_employment`,
    `name`,
    `mobile`,
    `address`,
    `pincode`,
    `gender`,
    `company_name`,
    `loan_amount`,
    `monthly_salary`,
    `emis`,
    `preferred_type`,
    `preferred_institution`,
    `institution_name`,
    `state`,
    `district`,
    `otp_verified`,
    `created_at`
  )
VALUES
  (
    13,
    2,
    'Home Loan test',
    NULL,
    'Ramesh',
    '8500636892',
    'ample residential address (India)\n4-158/9 5th Cross Road\nSainikpuri Secunderabad 500094, TS ',
    '533288',
    'Male',
    'aq',
    1020221.00,
    252.00,
    52.00,
    'Bank',
    'Bajaj Finserv',
    'Bajaj Finserv',
    'Andhra Pradesh',
    'Prakasam',
    1,
    '2025-10-24 11:51:30'
  );
INSERT INTO
  `enquirie_s` (
    `id`,
    `service_id`,
    `service_name`,
    `type_of_employment`,
    `name`,
    `mobile`,
    `address`,
    `pincode`,
    `gender`,
    `company_name`,
    `loan_amount`,
    `monthly_salary`,
    `emis`,
    `preferred_type`,
    `preferred_institution`,
    `institution_name`,
    `state`,
    `district`,
    `otp_verified`,
    `created_at`
  )
VALUES
  (
    14,
    2,
    'Home Loan test',
    NULL,
    'Ramesh',
    '8500636892',
    'ample residential address (India)\n4-158/9 5th Cross Road\nSainikpuri Secunderabad 500094, TS ',
    '533288',
    'Male',
    'aq',
    1020221.00,
    252.00,
    52.00,
    'Bank',
    'Bajaj Finserv',
    'Bajaj Finserv',
    'Andhra Pradesh',
    'Prakasam',
    1,
    '2025-10-24 11:51:31'
  );
INSERT INTO
  `enquirie_s` (
    `id`,
    `service_id`,
    `service_name`,
    `type_of_employment`,
    `name`,
    `mobile`,
    `address`,
    `pincode`,
    `gender`,
    `company_name`,
    `loan_amount`,
    `monthly_salary`,
    `emis`,
    `preferred_type`,
    `preferred_institution`,
    `institution_name`,
    `state`,
    `district`,
    `otp_verified`,
    `created_at`
  )
VALUES
  (
    15,
    2,
    'Home Loan test',
    NULL,
    'Ramesh',
    '6000000000',
    'ample residential address (India)\n4-158/9 5th Cross Road\nSainikpuri Secunderabad 500094, TS ',
    '533288',
    'Male',
    'aq',
    151565.00,
    1515.00,
    11.00,
    'Bank',
    'Axis Bank',
    'Axis Bank',
    'Andhra Pradesh',
    'Srikakulam',
    1,
    '2025-10-24 11:52:55'
  );
INSERT INTO
  `enquirie_s` (
    `id`,
    `service_id`,
    `service_name`,
    `type_of_employment`,
    `name`,
    `mobile`,
    `address`,
    `pincode`,
    `gender`,
    `company_name`,
    `loan_amount`,
    `monthly_salary`,
    `emis`,
    `preferred_type`,
    `preferred_institution`,
    `institution_name`,
    `state`,
    `district`,
    `otp_verified`,
    `created_at`
  )
VALUES
  (
    16,
    2,
    'Home Loan test',
    NULL,
    'Ramesh',
    '6000000000',
    'ample residential address (India)\n4-158/9 5th Cross Road\nSainikpuri Secunderabad 500094, TS ',
    '533288',
    'Male',
    'aq',
    151565.00,
    1515.00,
    11.00,
    'Bank',
    'Axis Bank',
    'Axis Bank',
    'Andhra Pradesh',
    'Srikakulam',
    1,
    '2025-10-24 11:52:56'
  );
INSERT INTO
  `enquirie_s` (
    `id`,
    `service_id`,
    `service_name`,
    `type_of_employment`,
    `name`,
    `mobile`,
    `address`,
    `pincode`,
    `gender`,
    `company_name`,
    `loan_amount`,
    `monthly_salary`,
    `emis`,
    `preferred_type`,
    `preferred_institution`,
    `institution_name`,
    `state`,
    `district`,
    `otp_verified`,
    `created_at`
  )
VALUES
  (
    17,
    2,
    'Home Loan test',
    NULL,
    'Ramesh',
    '6000000000',
    'ample residential address (India)\n4-158/9 5th Cross Road\nSainikpuri Secunderabad 500094, TS ',
    '533288',
    'Male',
    'aq',
    151565.00,
    1515.00,
    11.00,
    'Bank',
    'Axis Bank',
    'Axis Bank',
    'Andhra Pradesh',
    'Srikakulam',
    1,
    '2025-10-24 11:52:57'
  );
INSERT INTO
  `enquirie_s` (
    `id`,
    `service_id`,
    `service_name`,
    `type_of_employment`,
    `name`,
    `mobile`,
    `address`,
    `pincode`,
    `gender`,
    `company_name`,
    `loan_amount`,
    `monthly_salary`,
    `emis`,
    `preferred_type`,
    `preferred_institution`,
    `institution_name`,
    `state`,
    `district`,
    `otp_verified`,
    `created_at`
  )
VALUES
  (
    18,
    2,
    'Home Loan test',
    NULL,
    'Ramesh',
    '6000000000',
    'ample residential address (India)\n4-158/9 5th Cross Road\nSainikpuri Secunderabad 500094, TS ',
    '533288',
    'Male',
    'aq',
    151565.00,
    1515.00,
    11.00,
    'Bank',
    'Axis Bank',
    'Axis Bank',
    'Andhra Pradesh',
    'Srikakulam',
    1,
    '2025-10-24 11:52:57'
  );
INSERT INTO
  `enquirie_s` (
    `id`,
    `service_id`,
    `service_name`,
    `type_of_employment`,
    `name`,
    `mobile`,
    `address`,
    `pincode`,
    `gender`,
    `company_name`,
    `loan_amount`,
    `monthly_salary`,
    `emis`,
    `preferred_type`,
    `preferred_institution`,
    `institution_name`,
    `state`,
    `district`,
    `otp_verified`,
    `created_at`
  )
VALUES
  (
    19,
    2,
    'Home Loan test',
    NULL,
    'Ramesh',
    '6000000000',
    'ample residential address (India)\n4-158/9 5th Cross Road\nSainikpuri Secunderabad 500094, TS ',
    '533288',
    'Male',
    'aq',
    151565.00,
    1515.00,
    11.00,
    'Bank',
    'Axis Bank',
    'Axis Bank',
    'Andhra Pradesh',
    'Srikakulam',
    1,
    '2025-10-24 11:52:57'
  );
INSERT INTO
  `enquirie_s` (
    `id`,
    `service_id`,
    `service_name`,
    `type_of_employment`,
    `name`,
    `mobile`,
    `address`,
    `pincode`,
    `gender`,
    `company_name`,
    `loan_amount`,
    `monthly_salary`,
    `emis`,
    `preferred_type`,
    `preferred_institution`,
    `institution_name`,
    `state`,
    `district`,
    `otp_verified`,
    `created_at`
  )
VALUES
  (
    20,
    2,
    'Home Loan test',
    NULL,
    'Ramesh',
    '6000000000',
    'ample residential address (India)\n4-158/9 5th Cross Road\nSainikpuri Secunderabad 500094, TS ',
    '533288',
    'Male',
    'aq',
    151565.00,
    1515.00,
    11.00,
    'Bank',
    'Axis Bank',
    'Axis Bank',
    'Andhra Pradesh',
    'Srikakulam',
    1,
    '2025-10-24 11:52:57'
  );
INSERT INTO
  `enquirie_s` (
    `id`,
    `service_id`,
    `service_name`,
    `type_of_employment`,
    `name`,
    `mobile`,
    `address`,
    `pincode`,
    `gender`,
    `company_name`,
    `loan_amount`,
    `monthly_salary`,
    `emis`,
    `preferred_type`,
    `preferred_institution`,
    `institution_name`,
    `state`,
    `district`,
    `otp_verified`,
    `created_at`
  )
VALUES
  (
    21,
    2,
    'Home Loan test',
    NULL,
    'Ramesh',
    '6000000000',
    'ample residential address (India)\n4-158/9 5th Cross Road\nSainikpuri Secunderabad 500094, TS ',
    '533288',
    'Male',
    'aq',
    151565.00,
    1515.00,
    11.00,
    'Bank',
    'Axis Bank',
    'Axis Bank',
    'Andhra Pradesh',
    'Srikakulam',
    1,
    '2025-10-24 11:52:57'
  );
INSERT INTO
  `enquirie_s` (
    `id`,
    `service_id`,
    `service_name`,
    `type_of_employment`,
    `name`,
    `mobile`,
    `address`,
    `pincode`,
    `gender`,
    `company_name`,
    `loan_amount`,
    `monthly_salary`,
    `emis`,
    `preferred_type`,
    `preferred_institution`,
    `institution_name`,
    `state`,
    `district`,
    `otp_verified`,
    `created_at`
  )
VALUES
  (
    22,
    2,
    'Home Loan test',
    NULL,
    'Ramesh',
    '6000000000',
    'ample residential address (India)\n4-158/9 5th Cross Road\nSainikpuri Secunderabad 500094, TS ',
    '533288',
    'Male',
    'aq',
    151565.00,
    1515.00,
    11.00,
    'Bank',
    'Axis Bank',
    'Axis Bank',
    'Andhra Pradesh',
    'Srikakulam',
    1,
    '2025-10-24 11:52:57'
  );
INSERT INTO
  `enquirie_s` (
    `id`,
    `service_id`,
    `service_name`,
    `type_of_employment`,
    `name`,
    `mobile`,
    `address`,
    `pincode`,
    `gender`,
    `company_name`,
    `loan_amount`,
    `monthly_salary`,
    `emis`,
    `preferred_type`,
    `preferred_institution`,
    `institution_name`,
    `state`,
    `district`,
    `otp_verified`,
    `created_at`
  )
VALUES
  (
    23,
    2,
    'Home Loan test',
    NULL,
    'Ramesh',
    '6000000000',
    'ample residential address (India)\n4-158/9 5th Cross Road\nSainikpuri Secunderabad 500094, TS ',
    '533288',
    'Male',
    'aq',
    151565.00,
    1515.00,
    11.00,
    'Bank',
    'Axis Bank',
    'Axis Bank',
    'Andhra Pradesh',
    'Srikakulam',
    1,
    '2025-10-24 11:52:57'
  );
INSERT INTO
  `enquirie_s` (
    `id`,
    `service_id`,
    `service_name`,
    `type_of_employment`,
    `name`,
    `mobile`,
    `address`,
    `pincode`,
    `gender`,
    `company_name`,
    `loan_amount`,
    `monthly_salary`,
    `emis`,
    `preferred_type`,
    `preferred_institution`,
    `institution_name`,
    `state`,
    `district`,
    `otp_verified`,
    `created_at`
  )
VALUES
  (
    25,
    3,
    'Business Loantest test',
    NULL,
    'Ramesh',
    '8143470027',
    'ample residential address (India)\n4-158/9 5th Cross Road\nSainikpuri Secunderabad 500094, TS ',
    '533288',
    'Male',
    'aq',
    4224444.00,
    5154.00,
    545.00,
    'Bank',
    'HDFC Bank test',
    'HDFC Bank test',
    'Andhra Pradesh',
    'Vizianagaram',
    1,
    '2025-10-24 11:55:02'
  );
INSERT INTO
  `enquirie_s` (
    `id`,
    `service_id`,
    `service_name`,
    `type_of_employment`,
    `name`,
    `mobile`,
    `address`,
    `pincode`,
    `gender`,
    `company_name`,
    `loan_amount`,
    `monthly_salary`,
    `emis`,
    `preferred_type`,
    `preferred_institution`,
    `institution_name`,
    `state`,
    `district`,
    `otp_verified`,
    `created_at`
  )
VALUES
  (
    26,
    3,
    'Business Loantest test',
    NULL,
    'Ramesh',
    '8143470027',
    'ample residential address (India)\n4-158/9 5th Cross Road\nSainikpuri Secunderabad 500094, TS ',
    '533288',
    'Male',
    'aq',
    4224444.00,
    5154.00,
    545.00,
    'Bank',
    'HDFC Bank test',
    'HDFC Bank test',
    'Andhra Pradesh',
    'Vizianagaram',
    1,
    '2025-10-24 11:55:04'
  );
INSERT INTO
  `enquirie_s` (
    `id`,
    `service_id`,
    `service_name`,
    `type_of_employment`,
    `name`,
    `mobile`,
    `address`,
    `pincode`,
    `gender`,
    `company_name`,
    `loan_amount`,
    `monthly_salary`,
    `emis`,
    `preferred_type`,
    `preferred_institution`,
    `institution_name`,
    `state`,
    `district`,
    `otp_verified`,
    `created_at`
  )
VALUES
  (
    27,
    1,
    'Personal Loan',
    NULL,
    'Ramesh Kumar',
    '9876543210',
    '123 MG Road Hyderabad 500001',
    '500001',
    'Male',
    'Tech Solutions Pvt Ltd',
    500000.00,
    75000.00,
    15000.00,
    'Bank',
    'Axis Bank',
    'Axis Bank',
    'Telangana',
    'Hyderabad',
    1,
    '2025-10-24 15:19:48'
  );
INSERT INTO
  `enquirie_s` (
    `id`,
    `service_id`,
    `service_name`,
    `type_of_employment`,
    `name`,
    `mobile`,
    `address`,
    `pincode`,
    `gender`,
    `company_name`,
    `loan_amount`,
    `monthly_salary`,
    `emis`,
    `preferred_type`,
    `preferred_institution`,
    `institution_name`,
    `state`,
    `district`,
    `otp_verified`,
    `created_at`
  )
VALUES
  (
    28,
    1,
    'Personal Loan',
    NULL,
    'Ramesh Kumar',
    '9876543210',
    '123 MG Road Hyderabad 500001',
    '500001',
    'Male',
    'Tech Solutions Pvt Ltd',
    500000.00,
    75000.00,
    15000.00,
    'Bank',
    'Axis Bank',
    'Axis Bank',
    'Telangana',
    'Hyderabad',
    1,
    '2025-10-24 15:25:41'
  );
INSERT INTO
  `enquirie_s` (
    `id`,
    `service_id`,
    `service_name`,
    `type_of_employment`,
    `name`,
    `mobile`,
    `address`,
    `pincode`,
    `gender`,
    `company_name`,
    `loan_amount`,
    `monthly_salary`,
    `emis`,
    `preferred_type`,
    `preferred_institution`,
    `institution_name`,
    `state`,
    `district`,
    `otp_verified`,
    `created_at`
  )
VALUES
  (
    29,
    1,
    'Personal Loan',
    NULL,
    'Ramesh Kumar',
    '9876543210',
    '123 MG Road Hyderabad 500001',
    '500001',
    'Male',
    'Tech Solutions Pvt Ltd',
    500000.00,
    75000.00,
    15000.00,
    'Bank',
    'Axis Bank',
    'Axis Bank',
    'Telangana',
    'Hyderabad',
    1,
    '2025-10-24 15:25:42'
  );
INSERT INTO
  `enquirie_s` (
    `id`,
    `service_id`,
    `service_name`,
    `type_of_employment`,
    `name`,
    `mobile`,
    `address`,
    `pincode`,
    `gender`,
    `company_name`,
    `loan_amount`,
    `monthly_salary`,
    `emis`,
    `preferred_type`,
    `preferred_institution`,
    `institution_name`,
    `state`,
    `district`,
    `otp_verified`,
    `created_at`
  )
VALUES
  (
    30,
    1,
    'Personal Loan',
    NULL,
    'Ramesh Kumar',
    '9876543210',
    '123 MG Road Hyderabad 500001',
    '500001',
    'Male',
    'Tech Solutions Pvt Ltd',
    500000.00,
    75000.00,
    15000.00,
    'Bank',
    'Axis Bank',
    'Axis Bank',
    'Telangana',
    'Hyderabad',
    1,
    '2025-10-24 15:30:19'
  );
INSERT INTO
  `enquirie_s` (
    `id`,
    `service_id`,
    `service_name`,
    `type_of_employment`,
    `name`,
    `mobile`,
    `address`,
    `pincode`,
    `gender`,
    `company_name`,
    `loan_amount`,
    `monthly_salary`,
    `emis`,
    `preferred_type`,
    `preferred_institution`,
    `institution_name`,
    `state`,
    `district`,
    `otp_verified`,
    `created_at`
  )
VALUES
  (
    31,
    1,
    'Personal Loan',
    NULL,
    'Ramesh Kumar',
    '9876543210',
    '123 MG Road Hyderabad 500001',
    '500001',
    'Male',
    'Tech Solutions Pvt Ltd',
    500000.00,
    75000.00,
    15000.00,
    'Bank',
    'Axis Bank',
    'Axis Bank',
    'Telangana',
    'Hyderabad',
    1,
    '2025-10-24 15:30:19'
  );
INSERT INTO
  `enquirie_s` (
    `id`,
    `service_id`,
    `service_name`,
    `type_of_employment`,
    `name`,
    `mobile`,
    `address`,
    `pincode`,
    `gender`,
    `company_name`,
    `loan_amount`,
    `monthly_salary`,
    `emis`,
    `preferred_type`,
    `preferred_institution`,
    `institution_name`,
    `state`,
    `district`,
    `otp_verified`,
    `created_at`
  )
VALUES
  (
    32,
    1,
    'Personal Loan',
    NULL,
    'Ramesh Kumar',
    '9876543210',
    '123 MG Road Hyderabad 500001',
    '500001',
    'Male',
    'Tech Solutions Pvt Ltd',
    500000.00,
    75000.00,
    15000.00,
    'Bank',
    'Axis Bank',
    'Axis Bank',
    'Telangana',
    'Hyderabad',
    1,
    '2025-10-24 15:30:19'
  );
INSERT INTO
  `enquirie_s` (
    `id`,
    `service_id`,
    `service_name`,
    `type_of_employment`,
    `name`,
    `mobile`,
    `address`,
    `pincode`,
    `gender`,
    `company_name`,
    `loan_amount`,
    `monthly_salary`,
    `emis`,
    `preferred_type`,
    `preferred_institution`,
    `institution_name`,
    `state`,
    `district`,
    `otp_verified`,
    `created_at`
  )
VALUES
  (
    33,
    1,
    'Personal Loan',
    NULL,
    'Ramesh Kumar',
    '9876543210',
    '123 MG Road Hyderabad 500001',
    '500001',
    'Male',
    'Tech Solutions Pvt Ltd',
    500000.00,
    75000.00,
    15000.00,
    'Bank',
    'Axis Bank',
    'Axis Bank',
    'Telangana',
    'Hyderabad',
    1,
    '2025-10-24 15:30:19'
  );
INSERT INTO
  `enquirie_s` (
    `id`,
    `service_id`,
    `service_name`,
    `type_of_employment`,
    `name`,
    `mobile`,
    `address`,
    `pincode`,
    `gender`,
    `company_name`,
    `loan_amount`,
    `monthly_salary`,
    `emis`,
    `preferred_type`,
    `preferred_institution`,
    `institution_name`,
    `state`,
    `district`,
    `otp_verified`,
    `created_at`
  )
VALUES
  (
    34,
    1,
    'Personal Loan',
    NULL,
    'Ramesh Kumar',
    '9876543210',
    '123 MG Road Hyderabad 500001',
    '500001',
    'Male',
    'Tech Solutions Pvt Ltd',
    500000.00,
    75000.00,
    15000.00,
    'Bank',
    'Axis Bank',
    'Axis Bank',
    'Telangana',
    'Hyderabad',
    1,
    '2025-10-24 15:30:20'
  );
INSERT INTO
  `enquirie_s` (
    `id`,
    `service_id`,
    `service_name`,
    `type_of_employment`,
    `name`,
    `mobile`,
    `address`,
    `pincode`,
    `gender`,
    `company_name`,
    `loan_amount`,
    `monthly_salary`,
    `emis`,
    `preferred_type`,
    `preferred_institution`,
    `institution_name`,
    `state`,
    `district`,
    `otp_verified`,
    `created_at`
  )
VALUES
  (
    35,
    1,
    'Personal Loan',
    NULL,
    'Ramesh Kumar',
    '9876543210',
    '123 MG Road Hyderabad 500001',
    '500001',
    'Male',
    'Tech Solutions Pvt Ltd',
    500000.00,
    75000.00,
    15000.00,
    'Bank',
    'Axis Bank',
    'Axis Bank',
    'Telangana',
    'Hyderabad',
    1,
    '2025-10-24 15:30:20'
  );
INSERT INTO
  `enquirie_s` (
    `id`,
    `service_id`,
    `service_name`,
    `type_of_employment`,
    `name`,
    `mobile`,
    `address`,
    `pincode`,
    `gender`,
    `company_name`,
    `loan_amount`,
    `monthly_salary`,
    `emis`,
    `preferred_type`,
    `preferred_institution`,
    `institution_name`,
    `state`,
    `district`,
    `otp_verified`,
    `created_at`
  )
VALUES
  (
    36,
    1,
    'Personal Loan',
    NULL,
    'Ramesh Kumar',
    '9876543210',
    '123 MG Road Hyderabad 500001',
    '500001',
    'Male',
    'Tech Solutions Pvt Ltd',
    500000.00,
    75000.00,
    15000.00,
    'Bank',
    'Axis Bank',
    'Axis Bank',
    'Telangana',
    'Hyderabad',
    1,
    '2025-10-24 15:30:20'
  );
INSERT INTO
  `enquirie_s` (
    `id`,
    `service_id`,
    `service_name`,
    `type_of_employment`,
    `name`,
    `mobile`,
    `address`,
    `pincode`,
    `gender`,
    `company_name`,
    `loan_amount`,
    `monthly_salary`,
    `emis`,
    `preferred_type`,
    `preferred_institution`,
    `institution_name`,
    `state`,
    `district`,
    `otp_verified`,
    `created_at`
  )
VALUES
  (
    37,
    1,
    'Personal Loan',
    NULL,
    'Ramesh Kumar',
    '9876543210',
    '123 MG Road Hyderabad 500001',
    '500001',
    'Male',
    'Tech Solutions Pvt Ltd',
    500000.00,
    75000.00,
    15000.00,
    'Bank',
    'Axis Bank',
    'Axis Bank',
    'Telangana',
    'Hyderabad',
    1,
    '2025-10-24 15:30:21'
  );
INSERT INTO
  `enquirie_s` (
    `id`,
    `service_id`,
    `service_name`,
    `type_of_employment`,
    `name`,
    `mobile`,
    `address`,
    `pincode`,
    `gender`,
    `company_name`,
    `loan_amount`,
    `monthly_salary`,
    `emis`,
    `preferred_type`,
    `preferred_institution`,
    `institution_name`,
    `state`,
    `district`,
    `otp_verified`,
    `created_at`
  )
VALUES
  (
    39,
    1,
    'Personal Loan',
    NULL,
    'Ramesh Kumar',
    '9876543210',
    '123 MG Road Hyderabad 500001',
    '500001',
    'Male',
    'Tech Solutions Pvt Ltd',
    500000.00,
    75000.00,
    15000.00,
    'Bank',
    'Axis Bank',
    'Axis Bank',
    'Telangana',
    'Hyderabad',
    1,
    '2025-10-24 15:30:21'
  );
INSERT INTO
  `enquirie_s` (
    `id`,
    `service_id`,
    `service_name`,
    `type_of_employment`,
    `name`,
    `mobile`,
    `address`,
    `pincode`,
    `gender`,
    `company_name`,
    `loan_amount`,
    `monthly_salary`,
    `emis`,
    `preferred_type`,
    `preferred_institution`,
    `institution_name`,
    `state`,
    `district`,
    `otp_verified`,
    `created_at`
  )
VALUES
  (
    40,
    1,
    'Personal Loan test',
    NULL,
    'sai kiran',
    '8978553778',
    'colour moon technologies',
    '500072',
    'Male',
    'colourmoon technologies',
    123456.00,
    345.00,
    345.00,
    'NBFC',
    'Finnable Finance',
    'Finnable Finance',
    'Tamil Nadu',
    'Namakkal',
    1,
    '2025-10-25 13:57:26'
  );
INSERT INTO
  `enquirie_s` (
    `id`,
    `service_id`,
    `service_name`,
    `type_of_employment`,
    `name`,
    `mobile`,
    `address`,
    `pincode`,
    `gender`,
    `company_name`,
    `loan_amount`,
    `monthly_salary`,
    `emis`,
    `preferred_type`,
    `preferred_institution`,
    `institution_name`,
    `state`,
    `district`,
    `otp_verified`,
    `created_at`
  )
VALUES
  (
    41,
    21,
    'Personal Loan',
    'Business Owner',
    'sai kiran',
    '8978553778',
    'colour moon technologies',
    '500072',
    'Male',
    'colourmoon technologies',
    123423.00,
    2.00,
    23.00,
    'NBFC',
    'Hero Finance',
    'Hero Finance',
    'Telangana',
    'Nizamabad',
    1,
    '2025-10-28 11:08:57'
  );
INSERT INTO
  `enquirie_s` (
    `id`,
    `service_id`,
    `service_name`,
    `type_of_employment`,
    `name`,
    `mobile`,
    `address`,
    `pincode`,
    `gender`,
    `company_name`,
    `loan_amount`,
    `monthly_salary`,
    `emis`,
    `preferred_type`,
    `preferred_institution`,
    `institution_name`,
    `state`,
    `district`,
    `otp_verified`,
    `created_at`
  )
VALUES
  (
    42,
    21,
    'Personal Loan',
    'Business Owner',
    'sai kiran',
    '8978553778',
    'colour moon technologies',
    '500072',
    'Male',
    'colourmoon technologies',
    123454.00,
    23.00,
    23.00,
    'NBFC',
    'Poonawalla Fincorp',
    'Poonawalla Fincorp',
    'Telangana',
    'Khammam',
    1,
    '2025-10-28 11:13:02'
  );
INSERT INTO
  `enquirie_s` (
    `id`,
    `service_id`,
    `service_name`,
    `type_of_employment`,
    `name`,
    `mobile`,
    `address`,
    `pincode`,
    `gender`,
    `company_name`,
    `loan_amount`,
    `monthly_salary`,
    `emis`,
    `preferred_type`,
    `preferred_institution`,
    `institution_name`,
    `state`,
    `district`,
    `otp_verified`,
    `created_at`
  )
VALUES
  (
    43,
    21,
    'Personal Loan',
    'Retired',
    'sai kiran',
    '8978553778',
    'colour moon technologies',
    '500072',
    'Female',
    'colourmoon technologies',
    23432.00,
    1.00,
    23.00,
    '',
    '',
    '',
    'Telangana',
    'Sangareddy',
    1,
    '2025-10-28 11:13:48'
  );
INSERT INTO
  `enquirie_s` (
    `id`,
    `service_id`,
    `service_name`,
    `type_of_employment`,
    `name`,
    `mobile`,
    `address`,
    `pincode`,
    `gender`,
    `company_name`,
    `loan_amount`,
    `monthly_salary`,
    `emis`,
    `preferred_type`,
    `preferred_institution`,
    `institution_name`,
    `state`,
    `district`,
    `otp_verified`,
    `created_at`
  )
VALUES
  (
    44,
    21,
    'Personal Loan',
    'Salaried',
    'sai kiran',
    '8978553778',
    'colour moon technologies',
    '500072',
    'Male',
    'colourmoon technologies',
    23453.00,
    123.00,
    234.00,
    'NBFC',
    'Aditya Birla Finance',
    'Aditya Birla Finance',
    'Telangana',
    'Nizamabad',
    1,
    '2025-10-28 11:17:57'
  );
INSERT INTO
  `enquirie_s` (
    `id`,
    `service_id`,
    `service_name`,
    `type_of_employment`,
    `name`,
    `mobile`,
    `address`,
    `pincode`,
    `gender`,
    `company_name`,
    `loan_amount`,
    `monthly_salary`,
    `emis`,
    `preferred_type`,
    `preferred_institution`,
    `institution_name`,
    `state`,
    `district`,
    `otp_verified`,
    `created_at`
  )
VALUES
  (
    45,
    1,
    '<h4>Personal Loan</h4>',
    'Salaried',
    'sai kiran',
    '8978553778',
    'colour moon technologies',
    '500072',
    'Male',
    'colourmoon technologies',
    1234567.00,
    123.00,
    2.00,
    NULL,
    '',
    '',
    'Telangana',
    'Mahabubnagar',
    1,
    '2025-10-28 15:34:08'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: enquiries
# ------------------------------------------------------------

INSERT INTO
  `enquiries` (
    `id`,
    `service_id`,
    `name`,
    `mobile`,
    `address`,
    `state_id`,
    `district_id`,
    `pincode`,
    `gender`,
    `company_name`,
    `loan_amount`,
    `monthly_salary`,
    `emis`,
    `company_address`,
    `preferred_type`,
    `preferred_institution`,
    `service_name`,
    `institution_name`,
    `otp_verified`,
    `created_at`,
    `state`,
    `district`
  )
VALUES
  (
    1,
    NULL,
    'sai kiran',
    '8978553778',
    'colour moon technologies',
    0,
    0,
    '500072',
    'Male',
    'colourmoon technologies',
    25000.00,
    12.00,
    22.00,
    'colour moon technologies',
    'Bank',
    'ICICI',
    NULL,
    NULL,
    0,
    '2025-10-21 14:47:46',
    NULL,
    NULL
  );
INSERT INTO
  `enquiries` (
    `id`,
    `service_id`,
    `name`,
    `mobile`,
    `address`,
    `state_id`,
    `district_id`,
    `pincode`,
    `gender`,
    `company_name`,
    `loan_amount`,
    `monthly_salary`,
    `emis`,
    `company_address`,
    `preferred_type`,
    `preferred_institution`,
    `service_name`,
    `institution_name`,
    `otp_verified`,
    `created_at`,
    `state`,
    `district`
  )
VALUES
  (
    2,
    NULL,
    'sai kiran',
    '8978553778',
    'colour moon technologies',
    0,
    0,
    '500072',
    'Male',
    'colourmoon technologies',
    100000.00,
    7.00,
    78.00,
    'colour moon technologies',
    'Bank',
    'ICICI',
    NULL,
    NULL,
    0,
    '2025-10-21 16:45:20',
    NULL,
    NULL
  );
INSERT INTO
  `enquiries` (
    `id`,
    `service_id`,
    `name`,
    `mobile`,
    `address`,
    `state_id`,
    `district_id`,
    `pincode`,
    `gender`,
    `company_name`,
    `loan_amount`,
    `monthly_salary`,
    `emis`,
    `company_address`,
    `preferred_type`,
    `preferred_institution`,
    `service_name`,
    `institution_name`,
    `otp_verified`,
    `created_at`,
    `state`,
    `district`
  )
VALUES
  (
    3,
    NULL,
    'sai kiran',
    '8978553778',
    'colour moon technologies',
    0,
    0,
    '500072',
    'Male',
    'colourmoon technologies',
    100000.00,
    12.00,
    23923.00,
    'colour moon technologies',
    'Bank',
    'ICICI',
    NULL,
    NULL,
    0,
    '2025-10-21 17:12:20',
    NULL,
    NULL
  );
INSERT INTO
  `enquiries` (
    `id`,
    `service_id`,
    `name`,
    `mobile`,
    `address`,
    `state_id`,
    `district_id`,
    `pincode`,
    `gender`,
    `company_name`,
    `loan_amount`,
    `monthly_salary`,
    `emis`,
    `company_address`,
    `preferred_type`,
    `preferred_institution`,
    `service_name`,
    `institution_name`,
    `otp_verified`,
    `created_at`,
    `state`,
    `district`
  )
VALUES
  (
    4,
    NULL,
    'sai kiran',
    '8978553778',
    'colour moon technologies',
    0,
    0,
    '500072',
    'Male',
    'colourmoon technologies',
    1000000.00,
    12.00,
    12.00,
    'colour moon technologies',
    'NBFC',
    'SMFG India Credit',
    NULL,
    NULL,
    0,
    '2025-10-21 17:23:16',
    NULL,
    NULL
  );
INSERT INTO
  `enquiries` (
    `id`,
    `service_id`,
    `name`,
    `mobile`,
    `address`,
    `state_id`,
    `district_id`,
    `pincode`,
    `gender`,
    `company_name`,
    `loan_amount`,
    `monthly_salary`,
    `emis`,
    `company_address`,
    `preferred_type`,
    `preferred_institution`,
    `service_name`,
    `institution_name`,
    `otp_verified`,
    `created_at`,
    `state`,
    `district`
  )
VALUES
  (
    5,
    NULL,
    'sai kiran',
    '8978553778',
    'colour moon technologies',
    0,
    0,
    '500072',
    'Male',
    'colourmoon technologies',
    1000000.00,
    12.00,
    12.00,
    'colour moon technologies',
    'NBFC',
    'SMFG India Credit',
    NULL,
    NULL,
    0,
    '2025-10-21 17:25:26',
    NULL,
    NULL
  );
INSERT INTO
  `enquiries` (
    `id`,
    `service_id`,
    `name`,
    `mobile`,
    `address`,
    `state_id`,
    `district_id`,
    `pincode`,
    `gender`,
    `company_name`,
    `loan_amount`,
    `monthly_salary`,
    `emis`,
    `company_address`,
    `preferred_type`,
    `preferred_institution`,
    `service_name`,
    `institution_name`,
    `otp_verified`,
    `created_at`,
    `state`,
    `district`
  )
VALUES
  (
    6,
    NULL,
    'sai kiran',
    '8978553778',
    'colour moon technologies',
    NULL,
    NULL,
    '500072',
    'Male',
    'colourmoon technologies',
    100000.00,
    23.00,
    23.00,
    'colour moon technologies',
    'NBFC',
    'Bajaj Finance',
    NULL,
    NULL,
    0,
    '2025-10-21 17:37:19',
    NULL,
    NULL
  );
INSERT INTO
  `enquiries` (
    `id`,
    `service_id`,
    `name`,
    `mobile`,
    `address`,
    `state_id`,
    `district_id`,
    `pincode`,
    `gender`,
    `company_name`,
    `loan_amount`,
    `monthly_salary`,
    `emis`,
    `company_address`,
    `preferred_type`,
    `preferred_institution`,
    `service_name`,
    `institution_name`,
    `otp_verified`,
    `created_at`,
    `state`,
    `district`
  )
VALUES
  (
    7,
    NULL,
    'sai kiran',
    '8978553778',
    'colour moon technologies',
    NULL,
    NULL,
    '500072',
    'Male',
    'colourmoon technologies',
    1300000.00,
    23.00,
    2.00,
    'colour moon technologies',
    'Bank',
    'ICICI',
    NULL,
    NULL,
    0,
    '2025-10-21 17:38:27',
    NULL,
    NULL
  );
INSERT INTO
  `enquiries` (
    `id`,
    `service_id`,
    `name`,
    `mobile`,
    `address`,
    `state_id`,
    `district_id`,
    `pincode`,
    `gender`,
    `company_name`,
    `loan_amount`,
    `monthly_salary`,
    `emis`,
    `company_address`,
    `preferred_type`,
    `preferred_institution`,
    `service_name`,
    `institution_name`,
    `otp_verified`,
    `created_at`,
    `state`,
    `district`
  )
VALUES
  (
    8,
    2,
    'sai kiran',
    '8978553778',
    'colour moon technologies',
    3,
    1,
    '500072',
    'Male',
    'colourmoon technologies',
    12000.00,
    23.00,
    23.00,
    'colour moon technologies',
    'NBFC',
    'Bajaj Finance',
    'Home Loan test',
    'Bajaj Finance',
    0,
    '2025-10-21 19:08:28',
    'Karnataka',
    'Adilabad'
  );
INSERT INTO
  `enquiries` (
    `id`,
    `service_id`,
    `name`,
    `mobile`,
    `address`,
    `state_id`,
    `district_id`,
    `pincode`,
    `gender`,
    `company_name`,
    `loan_amount`,
    `monthly_salary`,
    `emis`,
    `company_address`,
    `preferred_type`,
    `preferred_institution`,
    `service_name`,
    `institution_name`,
    `otp_verified`,
    `created_at`,
    `state`,
    `district`
  )
VALUES
  (
    9,
    3,
    'sai kiran',
    '8978553778',
    'colour moon technologies',
    3,
    16,
    '500072',
    'Male',
    'colourmoon technologies',
    20000.00,
    23.00,
    23.00,
    'colour moon technologies',
    'Bank',
    'HDFC',
    '<p>Business Loantest test</p>',
    'HDFC',
    0,
    '2025-10-21 19:10:14',
    'Karnataka',
    'Guntur'
  );
INSERT INTO
  `enquiries` (
    `id`,
    `service_id`,
    `name`,
    `mobile`,
    `address`,
    `state_id`,
    `district_id`,
    `pincode`,
    `gender`,
    `company_name`,
    `loan_amount`,
    `monthly_salary`,
    `emis`,
    `company_address`,
    `preferred_type`,
    `preferred_institution`,
    `service_name`,
    `institution_name`,
    `otp_verified`,
    `created_at`,
    `state`,
    `district`
  )
VALUES
  (
    10,
    2,
    'sai kiran',
    '8978553778',
    'colour moon technologies',
    2,
    1,
    '500072',
    'Male',
    'colourmoon technologies',
    12000.00,
    23.00,
    23.00,
    'colour moon technologies',
    'Bank',
    'HDFC',
    'Home Loan test',
    'HDFC',
    0,
    '2025-10-21 19:18:11',
    'Andhra Pradesh',
    'Adilabad'
  );
INSERT INTO
  `enquiries` (
    `id`,
    `service_id`,
    `name`,
    `mobile`,
    `address`,
    `state_id`,
    `district_id`,
    `pincode`,
    `gender`,
    `company_name`,
    `loan_amount`,
    `monthly_salary`,
    `emis`,
    `company_address`,
    `preferred_type`,
    `preferred_institution`,
    `service_name`,
    `institution_name`,
    `otp_verified`,
    `created_at`,
    `state`,
    `district`
  )
VALUES
  (
    11,
    1,
    'sai kiran',
    '8978553778',
    'colour moon technologies',
    2,
    1,
    '500072',
    'Male',
    'colourmoon technologies',
    12000.00,
    22.00,
    22.00,
    'colour moon technologies',
    'Bank',
    'HDFC',
    'Personal Loan',
    'HDFC',
    0,
    '2025-10-23 10:25:34',
    'Andhra Pradesh',
    'Adilabad'
  );
INSERT INTO
  `enquiries` (
    `id`,
    `service_id`,
    `name`,
    `mobile`,
    `address`,
    `state_id`,
    `district_id`,
    `pincode`,
    `gender`,
    `company_name`,
    `loan_amount`,
    `monthly_salary`,
    `emis`,
    `company_address`,
    `preferred_type`,
    `preferred_institution`,
    `service_name`,
    `institution_name`,
    `otp_verified`,
    `created_at`,
    `state`,
    `district`
  )
VALUES
  (
    12,
    3,
    'sai kiran',
    '8978553778',
    'colour moon technologies',
    2,
    61,
    '500072',
    'Male',
    'colourmoon technologies',
    12000.00,
    22.00,
    23.00,
    'colour moon technologies',
    'Bank',
    'ICICI',
    '<p>Business Loantest test</p>',
    'ICICI',
    0,
    '2025-10-23 10:49:31',
    'Andhra Pradesh',
    'Adilabad'
  );
INSERT INTO
  `enquiries` (
    `id`,
    `service_id`,
    `name`,
    `mobile`,
    `address`,
    `state_id`,
    `district_id`,
    `pincode`,
    `gender`,
    `company_name`,
    `loan_amount`,
    `monthly_salary`,
    `emis`,
    `company_address`,
    `preferred_type`,
    `preferred_institution`,
    `service_name`,
    `institution_name`,
    `otp_verified`,
    `created_at`,
    `state`,
    `district`
  )
VALUES
  (
    13,
    3,
    'sai kiran',
    '8978553778',
    'colour moon technologies',
    3,
    1,
    '500072',
    'Male',
    'colourmoon technologies',
    12000.00,
    22.00,
    1.00,
    'colour moon technologies',
    'NBFC',
    'Tata Capital',
    '<p>Business Loantest test</p>',
    'Tata Capital',
    0,
    '2025-10-23 10:51:35',
    'Karnataka',
    'Adilabad'
  );
INSERT INTO
  `enquiries` (
    `id`,
    `service_id`,
    `name`,
    `mobile`,
    `address`,
    `state_id`,
    `district_id`,
    `pincode`,
    `gender`,
    `company_name`,
    `loan_amount`,
    `monthly_salary`,
    `emis`,
    `company_address`,
    `preferred_type`,
    `preferred_institution`,
    `service_name`,
    `institution_name`,
    `otp_verified`,
    `created_at`,
    `state`,
    `district`
  )
VALUES
  (
    14,
    3,
    'sai kiran',
    '8978553778',
    'colour moon technologies',
    3,
    1,
    '500072',
    'Male',
    'colourmoon technologies',
    123494321.00,
    22.00,
    22.00,
    'colour moon technologies',
    'NBFC',
    'Bajaj Finance',
    '<p>Business Loantest test</p>',
    'Bajaj Finance',
    0,
    '2025-10-23 11:08:01',
    'Karnataka',
    'Adilabad'
  );
INSERT INTO
  `enquiries` (
    `id`,
    `service_id`,
    `name`,
    `mobile`,
    `address`,
    `state_id`,
    `district_id`,
    `pincode`,
    `gender`,
    `company_name`,
    `loan_amount`,
    `monthly_salary`,
    `emis`,
    `company_address`,
    `preferred_type`,
    `preferred_institution`,
    `service_name`,
    `institution_name`,
    `otp_verified`,
    `created_at`,
    `state`,
    `district`
  )
VALUES
  (
    15,
    2,
    'sai kiran',
    '8978553778',
    'colour moon technologies',
    2,
    34,
    '500072',
    'Male',
    'colourmoon technologies',
    120001.00,
    1.00,
    1.00,
    'colour moon technologies',
    'Bank',
    'HDFC Bank',
    'Home Loan test',
    'HDFC Bank',
    1,
    '2025-10-23 11:25:20',
    'Andhra Pradesh',
    'Davanagere'
  );
INSERT INTO
  `enquiries` (
    `id`,
    `service_id`,
    `name`,
    `mobile`,
    `address`,
    `state_id`,
    `district_id`,
    `pincode`,
    `gender`,
    `company_name`,
    `loan_amount`,
    `monthly_salary`,
    `emis`,
    `company_address`,
    `preferred_type`,
    `preferred_institution`,
    `service_name`,
    `institution_name`,
    `otp_verified`,
    `created_at`,
    `state`,
    `district`
  )
VALUES
  (
    16,
    2,
    'sai kiran',
    '8978553778',
    'colour moon technologies',
    2,
    17,
    '500072',
    'Male',
    'colourmoon technologies',
    12468.00,
    34.00,
    234.00,
    'colour moon technologies',
    'Bank',
    'HDFC Bank',
    'Home Loan test',
    'HDFC Bank',
    1,
    '2025-10-23 12:15:15',
    'Andhra Pradesh',
    'Kadapa'
  );
INSERT INTO
  `enquiries` (
    `id`,
    `service_id`,
    `name`,
    `mobile`,
    `address`,
    `state_id`,
    `district_id`,
    `pincode`,
    `gender`,
    `company_name`,
    `loan_amount`,
    `monthly_salary`,
    `emis`,
    `company_address`,
    `preferred_type`,
    `preferred_institution`,
    `service_name`,
    `institution_name`,
    `otp_verified`,
    `created_at`,
    `state`,
    `district`
  )
VALUES
  (
    17,
    2,
    'sai kiran',
    '8978553778',
    'colour moon technologies',
    2,
    24,
    '500072',
    'Male',
    'colourmoon technologies',
    123444.00,
    12.00,
    12.00,
    'colour moon technologies',
    'Bank',
    'Axis Bank',
    'Home Loan test',
    'Axis Bank',
    1,
    '2025-10-23 12:44:21',
    'Andhra Pradesh',
    'Vizianagaram'
  );
INSERT INTO
  `enquiries` (
    `id`,
    `service_id`,
    `name`,
    `mobile`,
    `address`,
    `state_id`,
    `district_id`,
    `pincode`,
    `gender`,
    `company_name`,
    `loan_amount`,
    `monthly_salary`,
    `emis`,
    `company_address`,
    `preferred_type`,
    `preferred_institution`,
    `service_name`,
    `institution_name`,
    `otp_verified`,
    `created_at`,
    `state`,
    `district`
  )
VALUES
  (
    18,
    2,
    'sai kiran',
    '8978553778',
    'colour moon technologies',
    1,
    7,
    '500072',
    'Male',
    'colourmoon technologies',
    123432.00,
    22.00,
    12.00,
    'colour moon technologies',
    'Bank',
    'Bajaj Finserv',
    'Home Loan test',
    'Bajaj Finserv',
    1,
    '2025-10-23 13:52:23',
    'Telangana',
    'Khammam'
  );
INSERT INTO
  `enquiries` (
    `id`,
    `service_id`,
    `name`,
    `mobile`,
    `address`,
    `state_id`,
    `district_id`,
    `pincode`,
    `gender`,
    `company_name`,
    `loan_amount`,
    `monthly_salary`,
    `emis`,
    `company_address`,
    `preferred_type`,
    `preferred_institution`,
    `service_name`,
    `institution_name`,
    `otp_verified`,
    `created_at`,
    `state`,
    `district`
  )
VALUES
  (
    19,
    2,
    'sai kiran',
    '9978553778',
    'colour moon technologies',
    1,
    12,
    '500072',
    'Male',
    'colourmoon technologies',
    12345.00,
    12.00,
    12.00,
    'colour moon technologies',
    'Bank',
    'SBI Bank',
    'Home Loan test',
    'SBI Bank',
    1,
    '2025-10-23 14:02:01',
    'Telangana',
    'Warangal'
  );
INSERT INTO
  `enquiries` (
    `id`,
    `service_id`,
    `name`,
    `mobile`,
    `address`,
    `state_id`,
    `district_id`,
    `pincode`,
    `gender`,
    `company_name`,
    `loan_amount`,
    `monthly_salary`,
    `emis`,
    `company_address`,
    `preferred_type`,
    `preferred_institution`,
    `service_name`,
    `institution_name`,
    `otp_verified`,
    `created_at`,
    `state`,
    `district`
  )
VALUES
  (
    20,
    1,
    'sai kiran fouty for',
    '8978553778',
    'colour moon technologies',
    1,
    12,
    '500072',
    'Male',
    'colourmoon technologies',
    12345.00,
    12.00,
    23.00,
    'colour moon technologies',
    'Bank',
    'HDFC Bank',
    'Personal Loan',
    'HDFC Bank',
    1,
    '2025-10-23 14:25:21',
    'Telangana',
    'Warangal'
  );
INSERT INTO
  `enquiries` (
    `id`,
    `service_id`,
    `name`,
    `mobile`,
    `address`,
    `state_id`,
    `district_id`,
    `pincode`,
    `gender`,
    `company_name`,
    `loan_amount`,
    `monthly_salary`,
    `emis`,
    `company_address`,
    `preferred_type`,
    `preferred_institution`,
    `service_name`,
    `institution_name`,
    `otp_verified`,
    `created_at`,
    `state`,
    `district`
  )
VALUES
  (
    21,
    2,
    'sai kiran',
    '8978553778',
    'colour moon technologies',
    1,
    7,
    '500072',
    'Male',
    'colourmoon technologies',
    12344.00,
    12.00,
    12.00,
    'colour moon technologies',
    'Bank',
    'Bajaj Finserv',
    'Home Loan test',
    'Bajaj Finserv',
    1,
    '2025-10-23 14:27:10',
    'Telangana',
    'Khammam'
  );
INSERT INTO
  `enquiries` (
    `id`,
    `service_id`,
    `name`,
    `mobile`,
    `address`,
    `state_id`,
    `district_id`,
    `pincode`,
    `gender`,
    `company_name`,
    `loan_amount`,
    `monthly_salary`,
    `emis`,
    `company_address`,
    `preferred_type`,
    `preferred_institution`,
    `service_name`,
    `institution_name`,
    `otp_verified`,
    `created_at`,
    `state`,
    `district`
  )
VALUES
  (
    22,
    2,
    'sai kiran',
    '8978553778',
    'colour moon technologies',
    3,
    27,
    '500072',
    'Male',
    'colourmoon technologies',
    123456.00,
    234.00,
    3.00,
    'colour moon technologies',
    'Bank',
    'SBI Bank',
    'Home Loan test',
    'SBI Bank',
    1,
    '2025-10-23 14:31:12',
    'Karnataka',
    'Ballari'
  );
INSERT INTO
  `enquiries` (
    `id`,
    `service_id`,
    `name`,
    `mobile`,
    `address`,
    `state_id`,
    `district_id`,
    `pincode`,
    `gender`,
    `company_name`,
    `loan_amount`,
    `monthly_salary`,
    `emis`,
    `company_address`,
    `preferred_type`,
    `preferred_institution`,
    `service_name`,
    `institution_name`,
    `otp_verified`,
    `created_at`,
    `state`,
    `district`
  )
VALUES
  (
    23,
    1,
    'Jayasree Meher Nemani',
    '9390572759',
    '42-11-9\nNear kothapeta, Railway gate, Rajahmundry.',
    2,
    17,
    '533101',
    'Male',
    'colourmoon technologies',
    23457.00,
    234.00,
    4.00,
    'colour moon technologies',
    'Bank',
    'SBI Bank',
    'Personal Loan',
    'SBI Bank',
    1,
    '2025-10-23 14:31:50',
    'Andhra Pradesh',
    'Kadapa'
  );
INSERT INTO
  `enquiries` (
    `id`,
    `service_id`,
    `name`,
    `mobile`,
    `address`,
    `state_id`,
    `district_id`,
    `pincode`,
    `gender`,
    `company_name`,
    `loan_amount`,
    `monthly_salary`,
    `emis`,
    `company_address`,
    `preferred_type`,
    `preferred_institution`,
    `service_name`,
    `institution_name`,
    `otp_verified`,
    `created_at`,
    `state`,
    `district`
  )
VALUES
  (
    24,
    2,
    'Jayasree Meher Nemani test',
    '9390572759',
    '42-11-9\nNear kothapeta, Railway gate, Rajahmundry.',
    2,
    21,
    '533101',
    'Male',
    'colourmoon technologies',
    12345.00,
    123.00,
    123.00,
    'colour moon technologies',
    'Bank',
    'HDFC Bank',
    'Home Loan test',
    'HDFC Bank',
    1,
    '2025-10-23 14:50:34',
    'Andhra Pradesh',
    'Prakasam'
  );
INSERT INTO
  `enquiries` (
    `id`,
    `service_id`,
    `name`,
    `mobile`,
    `address`,
    `state_id`,
    `district_id`,
    `pincode`,
    `gender`,
    `company_name`,
    `loan_amount`,
    `monthly_salary`,
    `emis`,
    `company_address`,
    `preferred_type`,
    `preferred_institution`,
    `service_name`,
    `institution_name`,
    `otp_verified`,
    `created_at`,
    `state`,
    `district`
  )
VALUES
  (
    25,
    1,
    'sai kiran etsting',
    '8978553778',
    'colour moon technologies',
    1,
    11,
    '500072',
    'Male',
    'colourmoon technologies',
    12345.00,
    12.00,
    12.00,
    'colour moon technologies',
    'Bank',
    'SBI Bank',
    'Personal Loan',
    'SBI Bank',
    1,
    '2025-10-23 14:51:46',
    'Telangana',
    'Sangareddy'
  );
INSERT INTO
  `enquiries` (
    `id`,
    `service_id`,
    `name`,
    `mobile`,
    `address`,
    `state_id`,
    `district_id`,
    `pincode`,
    `gender`,
    `company_name`,
    `loan_amount`,
    `monthly_salary`,
    `emis`,
    `company_address`,
    `preferred_type`,
    `preferred_institution`,
    `service_name`,
    `institution_name`,
    `otp_verified`,
    `created_at`,
    `state`,
    `district`
  )
VALUES
  (
    26,
    1,
    'sai kiran wwwwwww',
    '8978553778',
    'colour moon technologies',
    3,
    37,
    '500072',
    'Male',
    'colourmoon technologies',
    12343.00,
    123.00,
    234.00,
    'colour moon technologies',
    'Bank',
    'SBI Bank',
    'Personal Loan',
    'SBI Bank',
    1,
    '2025-10-23 15:05:16',
    'Karnataka',
    'Kalaburagi'
  );
INSERT INTO
  `enquiries` (
    `id`,
    `service_id`,
    `name`,
    `mobile`,
    `address`,
    `state_id`,
    `district_id`,
    `pincode`,
    `gender`,
    `company_name`,
    `loan_amount`,
    `monthly_salary`,
    `emis`,
    `company_address`,
    `preferred_type`,
    `preferred_institution`,
    `service_name`,
    `institution_name`,
    `otp_verified`,
    `created_at`,
    `state`,
    `district`
  )
VALUES
  (
    27,
    2,
    'sai kiran last',
    '8978553778',
    'colour moon technologies',
    2,
    22,
    '500072',
    'Male',
    'colourmoon technologies',
    2345123.00,
    123.00,
    123.00,
    'colour moon technologies',
    'Bank',
    'SBI Bank',
    'Home Loan test',
    'SBI Bank',
    1,
    '2025-10-23 15:06:19',
    'Andhra Pradesh',
    'Srikakulam'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: faq_section
# ------------------------------------------------------------

INSERT INTO
  `faq_section` (
    `id`,
    `section_subtitle`,
    `section_title`,
    `section_description`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    1,
    'Frequently Asked Questions ',
    'Find Answers to Common Questions',
    'We\'ve compiled a list of frequently asked questions to provide you with quick and helpful answers. If you have a question that is not addressed below',
    '2025-10-06 17:50:26',
    '2025-10-06 18:53:14'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: faqs
# ------------------------------------------------------------

INSERT INTO
  `faqs` (
    `id`,
    `question`,
    `answer`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    1,
    'How do I apply for a loan through your platform?  ',
    'Absolutely. We strive to provide reliable and up-to-date information. Our team follows strict editorial guidelines to ensure the accuracy and integrity of our content. However,',
    '2025-10-06 17:53:46',
    '2025-10-06 18:57:47'
  );
INSERT INTO
  `faqs` (
    `id`,
    `question`,
    `answer`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2,
    'What types of loans do you review and compare?',
    'Absolutely. We strive to provide reliable and up-to-date information. Our team follows strict editorial guidelines to ensure the accuracy and integrity of our content. However,',
    '2025-10-06 17:53:46',
    '2025-10-06 17:53:46'
  );
INSERT INTO
  `faqs` (
    `id`,
    `question`,
    `answer`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3,
    'Can I trust the information provided on your website?',
    'Absolutely. We strive to provide reliable and up-to-date information. Our team follows strict editorial guidelines to ensure the accuracy and integrity of our content. However,',
    '2025-10-06 17:53:46',
    '2025-10-06 17:53:46'
  );
INSERT INTO
  `faqs` (
    `id`,
    `question`,
    `answer`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    4,
    'Do you offer financial advice or recommendations?',
    'Absolutely. We strive to provide reliable and up-to-date information. Our team follows strict editorial guidelines to ensure the accuracy and integrity of our content. However,',
    '2025-10-06 17:53:46',
    '2025-10-06 17:53:46'
  );
INSERT INTO
  `faqs` (
    `id`,
    `question`,
    `answer`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    5,
    'Can I get a loan with bad credit?',
    'Absolutely. We strive to provide reliable and up-to-date information. Our team follows strict editorial guidelines to ensure the accuracy and integrity of our content. However,',
    '2025-10-06 17:53:46',
    '2025-10-06 17:53:46'
  );
INSERT INTO
  `faqs` (
    `id`,
    `question`,
    `answer`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    6,
    'Are there any fees associated with taking out a loan?',
    'Absolutely. We strive to provide reliable and up-to-date information. Our team follows strict editorial guidelines to ensure the accuracy and integrity of our content. However,',
    '2025-10-06 17:53:46',
    '2025-10-06 17:53:46'
  );
INSERT INTO
  `faqs` (
    `id`,
    `question`,
    `answer`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    7,
    'What happens if I miss a loan payment?',
    'Absolutely. We strive to provide reliable and up-to-date information. Our team follows strict editorial guidelines to ensure the accuracy and integrity of our content. However,',
    '2025-10-06 17:53:46',
    '2025-10-06 17:53:46'
  );
INSERT INTO
  `faqs` (
    `id`,
    `question`,
    `answer`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    8,
    'Can I repay my loan early?',
    'Absolutely. We strive to provide reliable and up-to-date information. Our team follows strict editorial guidelines to ensure the accuracy and integrity of our content. However,',
    '2025-10-06 17:53:46',
    '2025-10-06 17:53:46'
  );
INSERT INTO
  `faqs` (
    `id`,
    `question`,
    `answer`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    9,
    'Can I refinance my existing loan?',
    'Absolutely. We strive to provide reliable and up-to-date information. Our team follows strict editorial guidelines to ensure the accuracy and integrity of our content. However,',
    '2025-10-06 17:53:46',
    '2025-10-06 17:53:46'
  );
INSERT INTO
  `faqs` (
    `id`,
    `question`,
    `answer`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    12,
    'How do I apply for a loan through your platform?  test',
    'Absolutely. We strive to provide reliable and up-to-date information. Our team follows strict editorial guidelines to ensure the accuracy and integrity of our content. However,',
    '2025-10-23 17:39:07',
    '2025-10-23 17:39:07'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: hero_services
# ------------------------------------------------------------

INSERT INTO
  `hero_services` (
    `id`,
    `hero_header`,
    `hero_description`,
    `hero_image`,
    `services_heading`,
    `services_description`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    1,
    'Find the Best Loan Options for You Today',
    'Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator.',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1761547823/hero_images/kuxfcxph9j5jvovhtubc.png',
    'Empowering You with Loan Knowledge and Comparison Tools ',
    'We are dedicated to providing you with valuable services that simplify your loan search and empower you to make informed borrowing decisions. Our comprehensive range of services ',
    '2025-10-04 12:51:55',
    '2025-10-27 12:20:24'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: home_counts
# ------------------------------------------------------------

INSERT INTO
  `home_counts` (
    `id`,
    `total_services_heading`,
    `total_services_number`,
    `total_services_image`,
    `customer_satisfaction_heading`,
    `customer_satisfaction_number`,
    `customer_satisfaction_image`,
    `compare_loan_heading`,
    `compare_loan_number`,
    `compare_loan_image`,
    `awards_won_heading`,
    `awards_won_number`,
    `awards_won_image`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    1,
    'Total Services ',
    10,
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1759745143/hero_images/l5lmhxtcp2bajyqtajks.svg',
    'Customer Satisfaction',
    1,
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1759745145/hero_images/i9vxvnh1uvozze9a4qf3.svg',
    'Compare Loan',
    1,
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1759745146/hero_images/vtdydicl0vpjb6lwvjcg.svg',
    'Awards Won',
    4,
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1759745308/hero_images/i8peroo2e5vhr4hrois0.svg',
    '2025-10-06 14:43:22',
    '2025-10-06 15:39:51'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: institutions
# ------------------------------------------------------------

INSERT INTO
  `institutions` (`id`, `type`, `name`, `logo`, `details`, `created_at`)
VALUES
  (
    1,
    'Bank',
    'HDFC Bank test',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1761223514/hero_images/x84snfas2texnxfyllaf.png',
    '<ul><li>Interest: 7%-15%</li><li>&nbsp;Processing fee varies test</li></ul>',
    '2025-10-21 11:34:57'
  );
INSERT INTO
  `institutions` (`id`, `type`, `name`, `logo`, `details`, `created_at`)
VALUES
  (
    3,
    'Bank',
    'SBI Bank',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1759815294/favicon_gbj4o7.png',
    'Interest: 7%-15%, Processing fee varies',
    '2025-10-21 11:34:57'
  );
INSERT INTO
  `institutions` (`id`, `type`, `name`, `logo`, `details`, `created_at`)
VALUES
  (
    4,
    'Bank',
    'Axis Bank',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1761221126/hero_images/twmuoovxa4lqujjvwz3m.png',
    '<p>Interest: 7%-15%, Processing fee varies</p>',
    '2025-10-21 11:34:57'
  );
INSERT INTO
  `institutions` (`id`, `type`, `name`, `logo`, `details`, `created_at`)
VALUES
  (
    5,
    'Bank',
    'Bajaj Finserv',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1761224454/hero_images/s5ln7caoagry8qfhqn98.png',
    '<ol><li>Interest: 7%-15%, Processing fee varies</li></ol>',
    '2025-10-21 11:34:57'
  );
INSERT INTO
  `institutions` (`id`, `type`, `name`, `logo`, `details`, `created_at`)
VALUES
  (
    6,
    'NBFC',
    'Bajaj Finance',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1761281400/hero_images/xmm04bh3d5uozm7ijf9x.png',
    '<p>Interest: 7%-15%</p>',
    '2025-10-21 11:34:57'
  );
INSERT INTO
  `institutions` (`id`, `type`, `name`, `logo`, `details`, `created_at`)
VALUES
  (
    7,
    'NBFC',
    'Tata Capital',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1761281450/hero_images/fdvmggdxfx99epvqgosz.png',
    '<p>Interest: 7%-15%</p>',
    '2025-10-21 11:34:57'
  );
INSERT INTO
  `institutions` (`id`, `type`, `name`, `logo`, `details`, `created_at`)
VALUES
  (
    8,
    'NBFC',
    'Aditya Birla Finance',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1761281494/hero_images/iodv0mmdx4pkj6mhbnmz.png',
    '<p>Interest: 7%-15%</p>',
    '2025-10-21 11:34:57'
  );
INSERT INTO
  `institutions` (`id`, `type`, `name`, `logo`, `details`, `created_at`)
VALUES
  (
    9,
    'NBFC',
    'SMFG India Credit',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1761281544/hero_images/lvmobcqing2vlxxmbkcl.jpg',
    '<p>Interest: 7%-15%</p>',
    '2025-10-21 11:34:57'
  );
INSERT INTO
  `institutions` (`id`, `type`, `name`, `logo`, `details`, `created_at`)
VALUES
  (
    10,
    'NBFC',
    'Axis Finance',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1761281604/hero_images/p0gnib6g7s6qdsicbixj.png',
    '<p>Interest: 7%-15%</p>',
    '2025-10-21 11:34:57'
  );
INSERT INTO
  `institutions` (`id`, `type`, `name`, `logo`, `details`, `created_at`)
VALUES
  (
    11,
    'NBFC',
    'Muthoot Finance',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1761281641/hero_images/tnuyfuika46zeoogg426.png',
    '<p>Interest: 7%-15%</p>',
    '2025-10-21 11:34:57'
  );
INSERT INTO
  `institutions` (`id`, `type`, `name`, `logo`, `details`, `created_at`)
VALUES
  (
    12,
    'NBFC',
    'Hero Finance',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1761281686/hero_images/rpdrb2wkyipbzt5yv0p3.jpg',
    '<p>Interest: 7%-15%</p>',
    '2025-10-21 11:34:57'
  );
INSERT INTO
  `institutions` (`id`, `type`, `name`, `logo`, `details`, `created_at`)
VALUES
  (
    13,
    'NBFC',
    'Poonawalla Fincorp',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1761281720/hero_images/bpjgamn5s8mhtwbgtadj.png',
    '<p>Interest: 7%-15%</p>',
    '2025-10-21 11:34:57'
  );
INSERT INTO
  `institutions` (`id`, `type`, `name`, `logo`, `details`, `created_at`)
VALUES
  (
    14,
    'NBFC',
    'INcred Finance',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1761281739/hero_images/uggjehiwmjsi25wpj7pb.jpg',
    '<p>Interest: 7%-15%</p>',
    '2025-10-21 11:34:57'
  );
INSERT INTO
  `institutions` (`id`, `type`, `name`, `logo`, `details`, `created_at`)
VALUES
  (
    15,
    'NBFC',
    'Sriram Finance',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1761281760/hero_images/gnhblgajxc8o15botblp.jpg',
    '<p>Interest: 7%-15%</p>',
    '2025-10-21 11:34:57'
  );
INSERT INTO
  `institutions` (`id`, `type`, `name`, `logo`, `details`, `created_at`)
VALUES
  (
    16,
    'NBFC',
    'Finnable Finance',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1761281788/hero_images/hjhjfnuogseb6dhcildj.png',
    '<p>Interest: 7%-15%</p>',
    '2025-10-21 11:34:57'
  );
INSERT INTO
  `institutions` (`id`, `type`, `name`, `logo`, `details`, `created_at`)
VALUES
  (
    23,
    'Bank',
    'testing',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1761225174/hero_images/xt62ohoyewtmd8zph77t.png',
    '<ol><li>procecing fee 2k</li></ol>',
    '2025-10-23 18:42:55'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: seo_settings
# ------------------------------------------------------------

INSERT INTO
  `seo_settings` (
    `id`,
    `page_name`,
    `title`,
    `description`,
    `keywords`,
    `author`,
    `og_title`,
    `og_description`,
    `og_image`,
    `og_url`,
    `og_type`,
    `twitter_card`,
    `twitter_title`,
    `twitter_description`,
    `twitter_image`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    1,
    'home',
    'My Loan Bazar | Easy Personal, Home & Business Loans Online',
    'Apply for personal, home, business, and car loans at My Loan Bazar. Compare loan offers, check eligibility, and get instant approvals online with ease.',
    'My Loan Bazar, online loans, personal loan, home loan, business loan, car loan, loan comparison, instant loan approval, low interest loans',
    'My Loan Bazar',
    'My Loan Bazar | Easy Personal, Home & Business Loans Online',
    'Apply for personal, home, business, and car loans at My Loan Bazar. Compare loan offers, check eligibility, and get instant approvals online with ease.',
    'https://myloanbazar.com/images/loan-banner.jpg',
    'https://myloanbazar.com',
    'website',
    'summary_large_image',
    'My Loan Bazar | Easy Personal, Home & Business Loans Online',
    'Apply for personal, home, business, and car loans at My Loan Bazar. Compare loan offers, check eligibility, and get instant approvals online with ease.',
    'https://myloanbazar.com/images/loan-banner.jpg',
    '2025-10-07 14:14:41',
    '2025-10-07 14:14:41'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: services
# ------------------------------------------------------------

INSERT INTO
  `services` (
    `id`,
    `icon_image`,
    `heading`,
    `short_description`,
    `sub_heading`,
    `description`,
    `image_1`,
    `image_2`,
    `enquiry_icon_image`,
    `created_at`
  )
VALUES
  (
    1,
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1761642393/hero_images/gdpqqxfp0ryh3ktf0tgr.png',
    '<h4>Personal Loan</h4>',
    '<p>Get quick and hassle-free personal loans with flexible EMIs, instant approval, and minimal documentation.</p>',
    '<p>Personal Loan Assistance</p>',
    '<p>A Personal Loan is an unsecured loan designed to help you meet urgent financial needs like home renovation, travel, education, or medical expenses. You don’t need to provide any collateral or security. Approval depends on your income, employment type, and credit history. Enjoy quick disbursal, competitive interest rates, and easy repayment through flexible EMI options.</p>',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1761642399/hero_images/oymer5df7nnzjd0gxfxv.jpg',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1761633946/hero_images/ibiiavhgf5ejfr57z6sc.jpg',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1761642396/hero_images/ljiona8qi3mzc9wnjehp.png',
    '2025-10-28 14:31:32'
  );
INSERT INTO
  `services` (
    `id`,
    `icon_image`,
    `heading`,
    `short_description`,
    `sub_heading`,
    `description`,
    `image_1`,
    `image_2`,
    `enquiry_icon_image`,
    `created_at`
  )
VALUES
  (
    2,
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1761632647/hero_images/wuwzmoddpm0zrt1ravhy.png',
    '<h4>Home Loan</h4>',
    '<p>Easily finance your dream home with flexible repayment options, attractive interest rates, and quick approval.</p>',
    '<p>Home Loan Assistance</p>',
    '<p>A Home Loan helps you purchase or construct your dream home without financial stress. Offered at competitive interest rates, it provides flexible tenure options and convenient EMI plans to suit your budget. You can apply online with minimal documentation and quick processing. Whether you are buying a new home, renovating, or transferring your existing loan, our solutions make it simple and affordable.</p>',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1761643318/hero_images/dn9saidxjcdtwuzsipnh.jpg',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1761633946/hero_images/ibiiavhgf5ejfr57z6sc.jpg',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1761643317/hero_images/n7n2qtfzc0swy5nmkm85.png',
    '2025-10-28 14:31:32'
  );
INSERT INTO
  `services` (
    `id`,
    `icon_image`,
    `heading`,
    `short_description`,
    `sub_heading`,
    `description`,
    `image_1`,
    `image_2`,
    `enquiry_icon_image`,
    `created_at`
  )
VALUES
  (
    3,
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1761644703/hero_images/hbdxwvbuhhx3bmift5nu.png',
    '<h4>Business Loan</h4>',
    '<p>Provide informative articles, guides, and resources to educate users about different types of loans</p>',
    '<p>Business Loan Support</p>',
    '<p>Business Loans help entrepreneurs expand or manage working capital with ease. Get quick approval, minimal paperwork, and flexible EMIs designed for your business growth.</p>',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1761644708/hero_images/ftacsh2p5odyyd8gykky.png',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1761633946/hero_images/ibiiavhgf5ejfr57z6sc.jpg',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1761644707/hero_images/wf0ejhw90vvf1kyy8z5v.png',
    '2025-10-28 14:31:32'
  );
INSERT INTO
  `services` (
    `id`,
    `icon_image`,
    `heading`,
    `short_description`,
    `sub_heading`,
    `description`,
    `image_1`,
    `image_2`,
    `enquiry_icon_image`,
    `created_at`
  )
VALUES
  (
    4,
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1761644864/hero_images/xcafnjxnt0pxsdzdzmqg.png',
    '<h4>Mortgage Loan</h4>',
    '<p>Unlock the value of your property with flexible Mortgage Loans and enjoy quick approval at competitive rates.</p>',
    '<p>Mortgage Loan Assistance</p>',
    '<p>A Mortgage Loan, also known as a Loan Against Property (LAP), allows you to leverage the value of your residential or commercial property to meet business or personal financial needs. With HDFC Bank, you can get high-value funding with long repayment tenures and low EMIs. The process is quick, transparent, and designed to help you manage your financial goals while retaining property ownership.</p>',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1761644868/hero_images/mzp60lmdphay3afch9qn.png',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1761633946/hero_images/ibiiavhgf5ejfr57z6sc.jpg',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1761644867/hero_images/izbovvl1xt8nwog1tyhm.png',
    '2025-10-28 14:31:32'
  );
INSERT INTO
  `services` (
    `id`,
    `icon_image`,
    `heading`,
    `short_description`,
    `sub_heading`,
    `description`,
    `image_1`,
    `image_2`,
    `enquiry_icon_image`,
    `created_at`
  )
VALUES
  (
    5,
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1761645018/hero_images/ng5zq7wiw4jyf1kkavnp.png',
    '<h4>Doctor Loan</h4>',
    '<p>Empower your medical practice with a Doctor Loan designed for healthcare professionals to grow and manage expenses.</p>',
    '<p>Doctor Loan Assistance</p>',
    '<p>A Doctor Loan is a customized financial solution designed exclusively for medical professionals such as physicians, dentists, and specialists. It helps you expand your clinic, purchase medical equipment, or manage operational costs. With flexible repayment tenures, minimal documentation, and quick approval, Doctor Loans provide the financial support you need to focus on delivering quality healthcare without financial stress.</p>',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1761645022/hero_images/vbaizq037khqmiaj8dq0.png',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1761633946/hero_images/ibiiavhgf5ejfr57z6sc.jpg',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1761645020/hero_images/lrhlu9joke1bhjm8fdjj.png',
    '2025-10-28 14:31:32'
  );
INSERT INTO
  `services` (
    `id`,
    `icon_image`,
    `heading`,
    `short_description`,
    `sub_heading`,
    `description`,
    `image_1`,
    `image_2`,
    `enquiry_icon_image`,
    `created_at`
  )
VALUES
  (
    6,
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1761645102/hero_images/pufglgkadej6jrhk7miq.png',
    '<h4>CA Loan</h4>',
    '<p>A CA Loan helps chartered accountants expand their practice, manage working capital, or invest in business growth with ease.</p>',
    '<p>CA Loan Assistance</p>',
    '<p>A CA Loan is a specialized financial product designed for Chartered Accountants to support their professional and business growth. It can be used to upgrade office infrastructure, purchase software or equipment, or manage daily operations. With flexible repayment tenures, minimal paperwork, and quick disbursal, CA Loans make it easier for finance professionals to expand their practice and enhance client service efficiency.</p>',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1761645105/hero_images/qnimqwjwx5ngqnv4m3lm.png',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1761633946/hero_images/ibiiavhgf5ejfr57z6sc.jpg',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1761645104/hero_images/izdrz5mq0ckwxbjiyyrw.png',
    '2025-10-28 14:31:32'
  );
INSERT INTO
  `services` (
    `id`,
    `icon_image`,
    `heading`,
    `short_description`,
    `sub_heading`,
    `description`,
    `image_1`,
    `image_2`,
    `enquiry_icon_image`,
    `created_at`
  )
VALUES
  (
    7,
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1761645212/hero_images/ig9kkajjcrd3aaqnuwba.png',
    '<h4>New Cars / Used Cars Loan</h4>',
    '<p>Get easy financing for new or used cars with quick approval, low interest rates, and flexible repayment options.</p>',
    '<p>Car Loan Assistance</p>',
    '<p>A New or Used Car Loan offers quick and convenient financing to help you purchase your dream vehicle—brand-new or pre-owned. You can enjoy affordable EMIs, flexible repayment options, and minimal documentation. Whether upgrading your ride or buying your first car, this loan makes vehicle ownership simple, fast, and stress-free. Experience the freedom to drive your choice today.</p>',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1761645215/hero_images/dtvw52bmqk6qe8bieib8.png',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1761633946/hero_images/ibiiavhgf5ejfr57z6sc.jpg',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1761645214/hero_images/pw9na5oohtvzlo7ukgsk.png',
    '2025-10-28 14:31:32'
  );
INSERT INTO
  `services` (
    `id`,
    `icon_image`,
    `heading`,
    `short_description`,
    `sub_heading`,
    `description`,
    `image_1`,
    `image_2`,
    `enquiry_icon_image`,
    `created_at`
  )
VALUES
  (
    8,
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1761645304/hero_images/kn39ifbut1hainiyiw8c.png',
    '<h4>LAP Loan</h4>',
    '<p>Unlock the value of your property with a Loan Against Property offering high funds and flexible repayment terms.</p>',
    '<p>Loan Against Property</p>',
    '<p>A Loan Against Property (LAP) allows you to leverage the equity in your residential or commercial property to meet your financial needs. Whether for business expansion, debt consolidation, or personal expenses, you can access substantial funds at lower interest rates. With easy documentation, high loan amounts, and flexible repayment options, LAP helps you turn your assets into opportunities while retaining ownership.</p>',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1761645307/hero_images/g63w51o5fseg7a9zjakl.png',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1761633946/hero_images/ibiiavhgf5ejfr57z6sc.jpg',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1761645306/hero_images/fyb0x7mvcyf0i4ofgdbb.png',
    '2025-10-28 14:31:32'
  );
INSERT INTO
  `services` (
    `id`,
    `icon_image`,
    `heading`,
    `short_description`,
    `sub_heading`,
    `description`,
    `image_1`,
    `image_2`,
    `enquiry_icon_image`,
    `created_at`
  )
VALUES
  (
    9,
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1761645421/hero_images/lgslflcwrl8pgxhtefpu.png',
    '<h4>Education Loan</h4>',
    '<p>Pursue your academic dreams in India or abroad with affordable Education Loans and flexible repayment options.</p>',
    '<p>Education Loan Assistance</p>',
    '<p>An Education Loan helps students finance their higher education expenses, including tuition fees, accommodation, travel, and study materials. Whether you’re studying in India or overseas, it offers financial freedom to focus on academics without stress. With quick approval, flexible repayment schedules, and tax benefits, Education Loans empower students and parents to invest confidently in a brighter future.</p>',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1761645424/hero_images/nlk6kvqt96zl8gb7iun3.png',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1761633946/hero_images/ibiiavhgf5ejfr57z6sc.jpg',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1761645422/hero_images/resz8l0cmnhbsyy8fxna.png',
    '2025-10-28 14:31:32'
  );
INSERT INTO
  `services` (
    `id`,
    `icon_image`,
    `heading`,
    `short_description`,
    `sub_heading`,
    `description`,
    `image_1`,
    `image_2`,
    `enquiry_icon_image`,
    `created_at`
  )
VALUES
  (
    10,
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1761645504/hero_images/yd3erh78xs8xbreqhh5d.png',
    '<h4>Credit Cards</h4>',
    '<p>Enjoy cashless payments, exclusive rewards, and easy credit access with a wide range of Credit Card options.</p>',
    '<p>Credit Card Services</p>',
    '<p>Credit Cards offer a convenient way to manage daily expenses, make online purchases, and enjoy exciting reward programs. With flexible credit limits and easy EMI conversion options, they provide financial freedom and security. Whether for shopping, travel, or emergencies, a Credit Card ensures instant access to funds while helping you build a strong credit history. Responsible usage can enhance your financial profile and unlock premium benefits.</p>',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1761645509/hero_images/tctjh2sxpznyew6dwvgx.png',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1761633946/hero_images/ibiiavhgf5ejfr57z6sc.jpg',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1761645507/hero_images/wuuuxsmhbjfxn2h4m18m.png',
    '2025-10-28 14:31:32'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: services_content
# ------------------------------------------------------------

INSERT INTO
  `services_content` (`id`, `heading`, `description`, `created_at`)
VALUES
  (
    1,
    'Empowering You with Loan Knowledge and Comparison Tools',
    'We are dedicated to providing you with valuable services that simplify your loan search and empower you to make informed borrowing decisions. Our comprehensive range of services',
    '2025-10-17 10:35:00'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: services_faq
# ------------------------------------------------------------

INSERT INTO
  `services_faq` (
    `id`,
    `service_id`,
    `question`,
    `answer`,
    `created_at`
  )
VALUES
  (
    25,
    1,
    '<p>What are the main benefits of a Personal Loan?</p>',
    '<ul><li>No need for collateral or guarantor</li><li>Quick online approval and disbursal</li><li>Flexible repayment tenure up to 60 months</li><li>Attractive and competitive interest rates</li></ul>',
    '2025-10-28 14:45:35'
  );
INSERT INTO
  `services_faq` (
    `id`,
    `service_id`,
    `question`,
    `answer`,
    `created_at`
  )
VALUES
  (
    26,
    1,
    '<p>Who can apply for a Personal Loan?</p>',
    '<p>Any salaried or self-employed individual with a steady income and good credit history can apply for a Personal Loan.</p>',
    '2025-10-28 14:45:35'
  );
INSERT INTO
  `services_faq` (
    `id`,
    `service_id`,
    `question`,
    `answer`,
    `created_at`
  )
VALUES
  (
    42,
    3,
    '<p>What is a Business Loan and who can apply?</p>',
    '<p>A Business Loan is an unsecured credit facility available for self-employed professionals, business owners, and entrepreneurs to meet financial requirements without pledging collateral.</p>',
    '2025-10-28 15:16:23'
  );
INSERT INTO
  `services_faq` (
    `id`,
    `service_id`,
    `question`,
    `answer`,
    `created_at`
  )
VALUES
  (
    43,
    3,
    '<p>Key advantages?</p>',
    '<ul><li>Quick approval</li><li>No collateral (for select offers)</li><li>High loan amount</li></ul>',
    '2025-10-28 15:16:23'
  );
INSERT INTO
  `services_faq` (
    `id`,
    `service_id`,
    `question`,
    `answer`,
    `created_at`
  )
VALUES
  (
    44,
    3,
    '<p>How soon can I get the loan amount?</p>',
    '<p>Once your application and documents are verified, the loan is usually disbursed within 48 hours, ensuring you get funds exactly when you need them.</p>',
    '2025-10-28 15:16:24'
  );
INSERT INTO
  `services_faq` (
    `id`,
    `service_id`,
    `question`,
    `answer`,
    `created_at`
  )
VALUES
  (
    45,
    4,
    '<p>Who can apply for Mortgage Loan?</p>',
    '<p>Property owners with clear title and stable income.</p>',
    '2025-10-28 15:17:49'
  );
INSERT INTO
  `services_faq` (
    `id`,
    `service_id`,
    `question`,
    `answer`,
    `created_at`
  )
VALUES
  (
    46,
    4,
    '<p>Benefits of Mortgage Loan?</p>',
    '<ul><li>High loan amount</li><li>Flexible repayment</li><li>Low interest</li></ul>',
    '2025-10-28 15:17:49'
  );
INSERT INTO
  `services_faq` (
    `id`,
    `service_id`,
    `question`,
    `answer`,
    `created_at`
  )
VALUES
  (
    47,
    4,
    '<p>What are the main benefits of a Mortgage Loan?</p>',
    '<ul><li>High loan amount based on property value</li><li>Long repayment tenure up to 15 years</li><li>Low interest rates compared to personal loans</li><li>Quick approval and transparent processing</li></ul>',
    '2025-10-28 15:17:49'
  );
INSERT INTO
  `services_faq` (
    `id`,
    `service_id`,
    `question`,
    `answer`,
    `created_at`
  )
VALUES
  (
    48,
    5,
    '<p>Who is eligible for Doctor Loan?</p>',
    '<p>Registered medical professionals.</p>',
    '2025-10-28 15:20:22'
  );
INSERT INTO
  `services_faq` (
    `id`,
    `service_id`,
    `question`,
    `answer`,
    `created_at`
  )
VALUES
  (
    49,
    5,
    '<p>Features?</p>',
    '<ul><li>Fast approval</li><li>Minimal documentation</li><li>Attractive interest</li></ul>',
    '2025-10-28 15:20:22'
  );
INSERT INTO
  `services_faq` (
    `id`,
    `service_id`,
    `question`,
    `answer`,
    `created_at`
  )
VALUES
  (
    50,
    5,
    '<p>What are the common uses of a Doctor Loan?</p>',
    '<ul><li>Setting up or expanding a clinic or hospital</li><li>Purchasing medical equipment or technology</li><li>Renovating medical facilities</li><li>Managing day-to-day operational costs</li></ul>',
    '2025-10-28 15:20:22'
  );
INSERT INTO
  `services_faq` (
    `id`,
    `service_id`,
    `question`,
    `answer`,
    `created_at`
  )
VALUES
  (
    51,
    5,
    '<p>What documents are required to apply?</p>',
    '<p>You’ll typically need valid ID proof, medical registration certificate, income proof, and business or practice-related financial documents.</p>',
    '2025-10-28 15:20:23'
  );
INSERT INTO
  `services_faq` (
    `id`,
    `service_id`,
    `question`,
    `answer`,
    `created_at`
  )
VALUES
  (
    52,
    6,
    '<p>Who can apply for CA Loan?</p>',
    '<p>Practicing Chartered Accountants.</p>',
    '2025-10-28 15:21:46'
  );
INSERT INTO
  `services_faq` (
    `id`,
    `service_id`,
    `question`,
    `answer`,
    `created_at`
  )
VALUES
  (
    53,
    6,
    '<p>Benefits?</p>',
    '<ul><li>Instant approval</li><li>Unsecured up to ₹75L</li><li>Flexible EMIs</li></ul>',
    '2025-10-28 15:21:46'
  );
INSERT INTO
  `services_faq` (
    `id`,
    `service_id`,
    `question`,
    `answer`,
    `created_at`
  )
VALUES
  (
    54,
    6,
    '<p>What are the typical uses of a CA Loan?</p>',
    '<ul><li>Setting up or expanding an office</li><li>Upgrading accounting software or hardware</li><li>Managing working capital needs</li><li>Hiring or training staff</li></ul>',
    '2025-10-28 15:21:46'
  );
INSERT INTO
  `services_faq` (
    `id`,
    `service_id`,
    `question`,
    `answer`,
    `created_at`
  )
VALUES
  (
    55,
    7,
    '<p>Who can apply for Car Loan?</p>',
    '<p>Individuals with valid driving license and income proof.</p>',
    '2025-10-28 15:23:36'
  );
INSERT INTO
  `services_faq` (
    `id`,
    `service_id`,
    `question`,
    `answer`,
    `created_at`
  )
VALUES
  (
    56,
    7,
    '<p>Can I get a car loan without a guarantor?</p>',
    '<p>Yes, most car loans do not require a guarantor if you have a stable income and good credit history.</p>',
    '2025-10-28 15:23:36'
  );
INSERT INTO
  `services_faq` (
    `id`,
    `service_id`,
    `question`,
    `answer`,
    `created_at`
  )
VALUES
  (
    57,
    8,
    '<p>What is Loan Against Property?</p>',
    '<p>Loan taken by mortgaging your existing property.</p>',
    '2025-10-28 15:25:08'
  );
INSERT INTO
  `services_faq` (
    `id`,
    `service_id`,
    `question`,
    `answer`,
    `created_at`
  )
VALUES
  (
    58,
    8,
    '<p>Advantages?</p>',
    '<ul><li>Higher eligibility</li><li>Longer tenure</li><li>Competitive rates</li></ul>',
    '2025-10-28 15:25:08'
  );
INSERT INTO
  `services_faq` (
    `id`,
    `service_id`,
    `question`,
    `answer`,
    `created_at`
  )
VALUES
  (
    59,
    8,
    '<p>Can I get a LAP on both residential and commercial properties?</p>',
    '<p>Yes, loans can be availed against self-occupied, rented residential, or commercial properties, depending on the lender’s eligibility criteria.</p>',
    '2025-10-28 15:25:08'
  );
INSERT INTO
  `services_faq` (
    `id`,
    `service_id`,
    `question`,
    `answer`,
    `created_at`
  )
VALUES
  (
    60,
    9,
    '<p>Who can apply for Education Loan?</p>',
    '<p>Students with admission proof in recognized institutions.</p>',
    '2025-10-28 15:27:04'
  );
INSERT INTO
  `services_faq` (
    `id`,
    `service_id`,
    `question`,
    `answer`,
    `created_at`
  )
VALUES
  (
    61,
    9,
    '<p>Benefits?</p>',
    '<ul><li>Flexible moratorium</li><li>Low interest</li><li>Tax benefits</li></ul>',
    '2025-10-28 15:27:05'
  );
INSERT INTO
  `services_faq` (
    `id`,
    `service_id`,
    `question`,
    `answer`,
    `created_at`
  )
VALUES
  (
    62,
    9,
    '<p>What expenses are covered under an Education Loan?</p>',
    '<p>It covers tuition fees, hostel charges, books, travel, and other academic-related costs, depending on the course and institution.</p>',
    '2025-10-28 15:27:05'
  );
INSERT INTO
  `services_faq` (
    `id`,
    `service_id`,
    `question`,
    `answer`,
    `created_at`
  )
VALUES
  (
    63,
    9,
    '<p>When does loan repayment start?</p>',
    '<p>Repayment usually begins after course completion or 6–12 months after getting a job, whichever is earlier.</p>',
    '2025-10-28 15:27:05'
  );
INSERT INTO
  `services_faq` (
    `id`,
    `service_id`,
    `question`,
    `answer`,
    `created_at`
  )
VALUES
  (
    64,
    10,
    '<p>What are the eligibility criteria?</p>',
    '<p>18+ years, stable income, good credit history.</p>',
    '2025-10-28 15:28:30'
  );
INSERT INTO
  `services_faq` (
    `id`,
    `service_id`,
    `question`,
    `answer`,
    `created_at`
  )
VALUES
  (
    65,
    10,
    '<p>Advantages of Credit Cards?</p>',
    '<ul><li>Reward points</li><li>Cashback offers</li><li>Secure online payments</li></ul>',
    '2025-10-28 15:28:30'
  );
INSERT INTO
  `services_faq` (
    `id`,
    `service_id`,
    `question`,
    `answer`,
    `created_at`
  )
VALUES
  (
    66,
    10,
    '<p>What are the benefits of using a Credit Card?</p>',
    '<p>Credit Cards offer cashback, reward points, discounts, and the convenience of cashless transactions for both online and offline purchases.</p>',
    '2025-10-28 15:28:30'
  );
INSERT INTO
  `services_faq` (
    `id`,
    `service_id`,
    `question`,
    `answer`,
    `created_at`
  )
VALUES
  (
    67,
    10,
    '<p>Does using a Credit Card affect my credit score?</p>',
    '<p>Yes. Timely payments and low credit utilization help improve your credit score, while missed payments can lower it.</p>',
    '2025-10-28 15:28:30'
  );
INSERT INTO
  `services_faq` (
    `id`,
    `service_id`,
    `question`,
    `answer`,
    `created_at`
  )
VALUES
  (
    73,
    2,
    '<p>What is a Home Loan?</p>',
    '<p>A Home Loan is a secured loan offered by banks or financial institutions to help you purchase or construct a house. The property itself serves as collateral until the loan is fully repaid.</p>',
    '2025-10-28 15:32:26'
  );
INSERT INTO
  `services_faq` (
    `id`,
    `service_id`,
    `question`,
    `answer`,
    `created_at`
  )
VALUES
  (
    74,
    2,
    '<p>What documents are required for a Home Loan?</p>',
    '<ul><li>Proof of identity and address</li><li>Income proof (salary slips or IT returns)</li><li>Property documents</li><li>Bank statements for the last 6 months</li></ul>',
    '2025-10-28 15:32:26'
  );
INSERT INTO
  `services_faq` (
    `id`,
    `service_id`,
    `question`,
    `answer`,
    `created_at`
  )
VALUES
  (
    75,
    2,
    '<p>What documents are required to apply for a Home Loan?</p>',
    '<p>You typically need identity proof, address proof, income proof (salary slips or ITR), property documents, and recent bank statements to apply for a home loan.</p>',
    '2025-10-28 15:32:26'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: settings
# ------------------------------------------------------------

INSERT INTO
  `settings` (
    `id`,
    `site_name`,
    `logo_url`,
    `favicon_url`,
    `facebook_url`,
    `instagram_url`,
    `whatsapp_url`,
    `twitter_url`,
    `youtube_url`,
    `emails`,
    `address`,
    `phone_numbers`,
    `meta`,
    `is_active`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    1,
    'My Loan Bazar ',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1759816081/hero_images/fjg3534v3tnkvjsxvzrr.png',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1761221453/hero_images/wb5gtprlcazfipiwpjt8.png',
    'https://my-loan-bazar.com/facebook',
    'https://my-loan-bazar.com/instagram',
    'https://my-loan-bazar.com/whatsapp',
    'https://my-loan-bazar.com/twitter',
    'https://my-loan-bazar.com/youtube',
    'info@myloanbazar.com, support@myloanbazar.com',
    'Royal Ln. Mesa, New Jersey 45463',
    '(123) 456-7891, (907) 456-7891',
    NULL,
    1,
    '2025-10-07 10:12:26',
    '2025-10-23 17:40:53'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: states
# ------------------------------------------------------------

INSERT INTO
  `states` (`id`, `name`)
VALUES
  (1, 'Telangana');
INSERT INTO
  `states` (`id`, `name`)
VALUES
  (2, 'Andhra Pradesh');
INSERT INTO
  `states` (`id`, `name`)
VALUES
  (3, 'Karnataka');
INSERT INTO
  `states` (`id`, `name`)
VALUES
  (4, 'Tamil Nadu');
INSERT INTO
  `states` (`id`, `name`)
VALUES
  (11, 'maharasta');

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: testimonials
# ------------------------------------------------------------

INSERT INTO
  `testimonials` (
    `id`,
    `name`,
    `designation`,
    `content`,
    `image`,
    `created_at`
  )
VALUES
  (
    1,
    'John Doe  ',
    'CEO, Example Corp',
    'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1759752684/hero_images/gbbxbgh2adqzb3qnmk7y.png',
    '2025-10-06 16:36:36'
  );
INSERT INTO
  `testimonials` (
    `id`,
    `name`,
    `designation`,
    `content`,
    `image`,
    `created_at`
  )
VALUES
  (
    2,
    'Jane Smith',
    'Marketing Manager',
    'The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters.',
    '/images/testimonials2.png',
    '2025-10-06 16:36:36'
  );
INSERT INTO
  `testimonials` (
    `id`,
    `name`,
    `designation`,
    `content`,
    `image`,
    `created_at`
  )
VALUES
  (
    3,
    'Michael Johnson',
    'Product Designer',
    'Our experience with this company has been exceptional, delivering quality services consistently.',
    '/images/testimonials3.png',
    '2025-10-06 16:36:36'
  );
INSERT INTO
  `testimonials` (
    `id`,
    `name`,
    `designation`,
    `content`,
    `image`,
    `created_at`
  )
VALUES
  (
    7,
    'Sarah Williams',
    'Financial Consultant',
    'My Loan Bazar provided excellent service and helped me secure the perfect loan for my business. Their team was professional, responsive, and made the entire process seamless. Highly recommended!',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1761634564/hero_images/eyzyypztaosophqurbjs.jpg',
    '2025-10-28 12:25:15'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: testimonials_section
# ------------------------------------------------------------

INSERT INTO
  `testimonials_section` (
    `id`,
    `section_subtitle`,
    `section_title`,
    `section_description`,
    `created_at`
  )
VALUES
  (
    1,
    'Client Testimonials   ',
    'Success Stories Shared by Our Customers',
    'Feel free to customize the text with actual client testimonials, ensuring you have their permission to use their names and occupations',
    '2025-10-06 16:35:50'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: why_choose_us
# ------------------------------------------------------------

INSERT INTO
  `why_choose_us` (
    `id`,
    `section_heading`,
    `section_description`,
    `section_image`,
    `point_1`,
    `point_2`,
    `point_3`,
    `point_4`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    1,
    'Experience Excellence in Loan Review and Comparison  ',
    'Our dedicated team of experts conducts thorough research and analysis to provide you with comprehensive and unbiased reviews of various loan options.',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1759748155/hero_images/awyvm3sidxblexhwto3o.jpg',
    'Comprehensive and Reviews',
    'Expert Guidance and Insights',
    'User-Friendly Comparison',
    'Trusted User Reviews',
    '2025-10-06 15:44:19',
    '2025-10-06 16:25:56'
  );

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
