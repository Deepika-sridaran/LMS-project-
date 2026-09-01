-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: lms_database
-- ------------------------------------------------------
-- Server version	8.0.46

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `assignments`
--

DROP TABLE IF EXISTS `assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assignments` (
  `assignment_id` int NOT NULL AUTO_INCREMENT,
  `course_id` int NOT NULL,
  `module_id` int NOT NULL,
  `title` varchar(200) NOT NULL,
  `description` text,
  `maximum_marks` decimal(10,2) NOT NULL,
  `deadline` datetime NOT NULL,
  `allowed_file_types` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`assignment_id`),
  KEY `fk_assignment_course` (`course_id`),
  KEY `fk_assignment_module` (`module_id`),
  CONSTRAINT `fk_assignment_course` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`),
  CONSTRAINT `fk_assignment_module` FOREIGN KEY (`module_id`) REFERENCES `modules` (`module_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignments`
--

LOCK TABLES `assignments` WRITE;
/*!40000 ALTER TABLE `assignments` DISABLE KEYS */;
INSERT INTO `assignments` VALUES (1,1,1,'Python Basics Assignment','Create a Python program using variables and data types.',100.00,'2026-09-15 23:59:00','py,zip','2026-08-29 16:06:20'),(2,1,2,'Control Flow Assignment','Create programs using conditions and loops.',100.00,'2026-09-20 23:59:00','py,zip','2026-08-29 16:06:20'),(3,2,4,'OOP Assignment','Implement classes and inheritance in Python.',100.00,'2026-09-18 23:59:00','py,zip','2026-08-29 16:06:20'),(4,3,7,'Excel Analysis Assignment','Analyze the provided sales dataset.',100.00,'2026-09-17 23:59:00','xlsx,csv','2026-08-29 16:06:20'),(5,4,10,'Python Data Analysis','Analyze a dataset using Pandas.',100.00,'2026-09-22 23:59:00','ipynb,csv','2026-08-29 16:06:20'),(6,5,13,'Statistics Assignment','Calculate descriptive statistics for a dataset.',100.00,'2026-09-25 23:59:00','xlsx,pdf','2026-08-29 16:06:20'),(7,6,16,'SQL Queries Assignment','Write SQL queries for the given database.',100.00,'2026-09-19 23:59:00','sql,txt','2026-08-29 16:06:20'),(8,6,17,'Advanced SQL Assignment','Solve advanced JOIN and subquery problems.',100.00,'2026-09-28 23:59:00','sql','2026-08-29 16:06:20'),(9,7,19,'MySQL Administration','Configure a sample MySQL database.',100.00,'2026-09-30 23:59:00','sql,pdf','2026-08-29 16:06:20'),(10,8,22,'HTML Project','Create a responsive HTML page.',100.00,'2026-09-16 23:59:00','html,zip','2026-08-29 16:06:20'),(11,8,23,'CSS Project','Design a responsive website.',100.00,'2026-09-21 23:59:00','html,css,zip','2026-08-29 16:06:20'),(12,9,25,'React Component Project','Build a React component application.',100.00,'2026-09-25 23:59:00','jsx,zip','2026-08-29 16:06:20'),(13,10,28,'Android Application','Build a basic Android application.',100.00,'2026-10-01 23:59:00','zip','2026-08-29 16:06:20'),(14,11,31,'AI Research Assignment','Research a real-world AI application.',100.00,'2026-09-27 23:59:00','pdf,docx','2026-08-29 16:06:20'),(15,12,34,'Machine Learning Project','Build and evaluate a machine learning model.',100.00,'2026-10-05 23:59:00','ipynb,csv','2026-08-29 16:06:20'),(16,13,37,'AWS Assignment','Deploy a basic application using AWS.',100.00,'2026-10-02 23:59:00','pdf,zip','2026-08-29 16:06:20'),(17,14,40,'Cyber Security Assignment','Analyze common cyber security threats.',100.00,'2026-09-29 23:59:00','pdf,docx','2026-08-29 16:06:20'),(18,15,43,'Docker Assignment','Containerize a simple application.',100.00,'2026-10-04 23:59:00','zip,yml','2026-08-29 16:06:20'),(19,16,46,'Testing Assignment','Create automated test cases.',100.00,'2026-09-26 23:59:00','java,py,zip','2026-08-29 16:06:20'),(20,18,52,'Power BI Dashboard Project','Create a business intelligence dashboard.',100.00,'2026-10-06 23:59:00','pbix,pdf','2026-08-29 16:06:20'),(21,19,55,'Tableau Dashboard Project','Create an interactive Tableau dashboard.',100.00,'2026-10-07 23:59:00','twb,pdf','2026-08-29 16:06:20'),(22,20,58,'Digital Marketing Project','Create a digital marketing campaign plan.',100.00,'2026-10-08 23:59:00','pdf,docx','2026-08-29 16:06:20');
/*!40000 ALTER TABLE `assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(100) NOT NULL,
  `description` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `category_name` (`category_name`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Programming',NULL,'2026-08-29 15:59:04'),(2,'Data Analytics',NULL,'2026-08-29 15:59:04'),(3,'Data Science',NULL,'2026-08-29 15:59:04'),(4,'Database Management',NULL,'2026-08-29 15:59:04'),(5,'Web Development',NULL,'2026-08-29 15:59:04'),(6,'Mobile App Development',NULL,'2026-08-29 15:59:04'),(7,'Artificial Intelligence',NULL,'2026-08-29 15:59:04'),(8,'Machine Learning',NULL,'2026-08-29 15:59:04'),(9,'Cloud Computing',NULL,'2026-08-29 15:59:04'),(10,'Cyber Security',NULL,'2026-08-29 15:59:04'),(11,'DevOps',NULL,'2026-08-29 15:59:04'),(12,'Software Testing',NULL,'2026-08-29 15:59:04'),(13,'UI/UX Design',NULL,'2026-08-29 15:59:04'),(14,'Business Intelligence',NULL,'2026-08-29 15:59:04'),(15,'Digital Marketing',NULL,'2026-08-29 15:59:04');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certificates`
--

DROP TABLE IF EXISTS `certificates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `certificates` (
  `certificate_id` int NOT NULL AUTO_INCREMENT,
  `certificate_number` varchar(100) NOT NULL,
  `student_id` int NOT NULL,
  `course_id` int NOT NULL,
  `issued_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`certificate_id`),
  UNIQUE KEY `certificate_number` (`certificate_number`),
  UNIQUE KEY `unique_student_course_certificate` (`student_id`,`course_id`),
  KEY `fk_certificate_course` (`course_id`),
  CONSTRAINT `fk_certificate_course` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`),
  CONSTRAINT `fk_certificate_student` FOREIGN KEY (`student_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificates`
--

LOCK TABLES `certificates` WRITE;
/*!40000 ALTER TABLE `certificates` DISABLE KEYS */;
INSERT INTO `certificates` VALUES (1,'CERT-LMS-0001',7,1,'2026-08-20 10:00:00'),(2,'CERT-LMS-0002',7,6,'2026-08-21 10:00:00'),(3,'CERT-LMS-0003',8,4,'2026-08-22 10:00:00'),(4,'CERT-LMS-0004',9,3,'2026-08-22 11:00:00'),(5,'CERT-LMS-0005',9,18,'2026-08-23 10:00:00'),(6,'CERT-LMS-0006',11,4,'2026-08-23 11:00:00'),(7,'CERT-LMS-0007',14,6,'2026-08-24 10:00:00'),(8,'CERT-LMS-0008',15,17,'2026-08-24 11:00:00'),(9,'CERT-LMS-0009',17,3,'2026-08-25 10:00:00'),(10,'CERT-LMS-0010',18,12,'2026-08-25 11:00:00'),(11,'CERT-LMS-0011',19,16,'2026-08-26 10:00:00'),(12,'CERT-LMS-0012',20,18,'2026-08-26 11:00:00');
/*!40000 ALTER TABLE `certificates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_status_history`
--

DROP TABLE IF EXISTS `course_status_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_status_history` (
  `history_id` int NOT NULL AUTO_INCREMENT,
  `course_id` int NOT NULL,
  `old_status` enum('DRAFT','SUBMITTED','UNDER_REVIEW','APPROVED','PUBLISHED','ARCHIVED','REJECTED','REVISION','RESUBMITTED') DEFAULT NULL,
  `new_status` enum('DRAFT','SUBMITTED','UNDER_REVIEW','APPROVED','PUBLISHED','ARCHIVED','REJECTED','REVISION','RESUBMITTED') NOT NULL,
  `changed_by` int NOT NULL,
  `remarks` text,
  `changed_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`history_id`),
  KEY `fk_status_history_course` (`course_id`),
  KEY `fk_status_history_user` (`changed_by`),
  CONSTRAINT `fk_status_history_course` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_status_history_user` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_status_history`
--

LOCK TABLES `course_status_history` WRITE;
/*!40000 ALTER TABLE `course_status_history` DISABLE KEYS */;
INSERT INTO `course_status_history` VALUES (1,1,NULL,'DRAFT',2,'Course created by trainer','2026-08-29 16:31:43'),(2,1,'DRAFT','SUBMITTED',2,'Submitted for administrator approval','2026-08-29 16:31:43'),(3,1,'SUBMITTED','UNDER_REVIEW',1,'Administrator started reviewing the course','2026-08-29 16:31:43'),(4,1,'UNDER_REVIEW','APPROVED',1,'Course approved','2026-08-29 16:31:43'),(5,1,'APPROVED','PUBLISHED',1,'Course published','2026-08-29 16:31:43'),(6,2,NULL,'DRAFT',2,'Course created by trainer','2026-08-29 16:31:51'),(7,2,'DRAFT','SUBMITTED',2,'Course submitted for approval','2026-08-29 16:31:51'),(8,2,'SUBMITTED','UNDER_REVIEW',1,'Administrator started reviewing','2026-08-29 16:31:51'),(9,2,'UNDER_REVIEW','REJECTED',1,'Course needs improvement','2026-08-29 16:31:51'),(10,2,'REJECTED','REVISION',2,'Trainer started revising the course','2026-08-29 16:31:51'),(11,2,'REVISION','RESUBMITTED',2,'Course resubmitted after revision','2026-08-29 16:31:51'),(12,2,'RESUBMITTED','UNDER_REVIEW',1,'Administrator re-reviewing resubmitted course','2026-08-29 11:02:00'),(13,2,'APPROVED','PUBLISHED',1,'Course published','2026-08-29 11:02:10'),(14,2,'UNDER_REVIEW','APPROVED',1,'Course approved after revision','2026-08-29 11:02:05');
/*!40000 ALTER TABLE `course_status_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses` (
  `course_id` int NOT NULL AUTO_INCREMENT,
  `category_id` int NOT NULL,
  `trainer_id` int NOT NULL,
  `title` varchar(200) NOT NULL,
  `description` text,
  `learning_objectives` text,
  `thumbnail` varchar(500) DEFAULT NULL,
  `level` enum('BEGINNER','INTERMEDIATE','ADVANCED') DEFAULT NULL,
  `duration` int DEFAULT NULL,
  `status` enum('DRAFT','SUBMITTED','UNDER_REVIEW','APPROVED','PUBLISHED','REJECTED','ARCHIVED','REVISION','RESUBMITTED') DEFAULT 'DRAFT',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`course_id`),
  KEY `fk_courses_category` (`category_id`),
  KEY `fk_courses_trainer` (`trainer_id`),
  CONSTRAINT `fk_courses_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`),
  CONSTRAINT `fk_courses_trainer` FOREIGN KEY (`trainer_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (1,1,2,'Python Programming for Beginners','Learn Python programming from the fundamentals.','Variables, conditions, loops, functions and basic projects.','python.jpg','BEGINNER',40,'PUBLISHED','2026-08-29 16:03:31','2026-08-29 16:03:31'),(2,1,2,'Advanced Python Programming','Advanced concepts for professional Python development.','OOP, decorators, generators and advanced modules.','advanced-python.jpg','ADVANCED',50,'PUBLISHED','2026-08-29 16:03:31','2026-08-29 16:03:31'),(3,2,3,'Data Analytics with Excel','Learn Excel for practical data analysis.','Excel formulas, pivot tables, charts and dashboards.','excel.jpg','BEGINNER',35,'PUBLISHED','2026-08-29 16:03:31','2026-08-29 16:03:31'),(4,2,3,'Data Analytics with Python','Analyze business data using Python.','Pandas, NumPy, data cleaning and visualization.','python-data.jpg','INTERMEDIATE',45,'PUBLISHED','2026-08-29 16:03:31','2026-08-29 16:03:31'),(5,3,3,'Data Science Fundamentals','Introduction to data science concepts.','Statistics, data preparation and machine learning basics.','data-science.jpg','BEGINNER',50,'PUBLISHED','2026-08-29 16:03:31','2026-08-29 16:03:31'),(6,4,4,'SQL Mastery','Master SQL for data analysis and application development.','SELECT, JOIN, GROUP BY, subqueries and window functions.','sql.jpg','INTERMEDIATE',40,'PUBLISHED','2026-08-29 16:03:31','2026-08-29 16:03:31'),(7,4,4,'MySQL Database Administration','Learn MySQL database administration.','Indexes, users, permissions, backups and optimization.','mysql.jpg','ADVANCED',45,'APPROVED','2026-08-29 16:03:31','2026-08-29 16:03:31'),(8,5,4,'HTML CSS and JavaScript','Build modern websites from scratch.','HTML, CSS, JavaScript and responsive design.','web.jpg','BEGINNER',45,'PUBLISHED','2026-08-29 16:03:31','2026-08-29 16:03:31'),(9,5,5,'React JS Complete Course','Learn React for frontend development.','Components, props, state, hooks and routing.','react.jpg','INTERMEDIATE',50,'PUBLISHED','2026-08-29 16:03:31','2026-08-29 16:03:31'),(10,6,5,'Android App Development','Build Android applications.','Activities, layouts, APIs and application deployment.','android.jpg','INTERMEDIATE',55,'PUBLISHED','2026-08-29 16:03:31','2026-08-29 16:03:31'),(11,7,6,'Artificial Intelligence Fundamentals','Introduction to artificial intelligence.','AI concepts, search, reasoning and intelligent systems.','ai.jpg','BEGINNER',40,'PUBLISHED','2026-08-29 16:03:31','2026-08-29 16:03:31'),(12,8,6,'Machine Learning with Python','Build machine learning models using Python.','Regression, classification, clustering and evaluation.','ml.jpg','INTERMEDIATE',55,'PUBLISHED','2026-08-29 16:03:31','2026-08-29 16:03:31'),(13,9,2,'AWS Cloud Fundamentals','Learn the fundamentals of AWS cloud computing.','EC2, S3, IAM, databases and cloud architecture.','aws.jpg','BEGINNER',35,'PUBLISHED','2026-08-29 16:03:31','2026-08-29 16:03:31'),(14,10,2,'Cyber Security Fundamentals','Learn essential cyber security concepts.','Threats, authentication, encryption and security practices.','security.jpg','BEGINNER',40,'PUBLISHED','2026-08-29 16:03:31','2026-08-29 16:03:31'),(15,11,3,'DevOps with Docker and Jenkins','Learn modern DevOps practices.','Docker, CI/CD, Jenkins and deployment.','devops.jpg','INTERMEDIATE',45,'PUBLISHED','2026-08-29 16:03:31','2026-08-29 16:03:31'),(16,12,4,'Software Testing with Selenium','Learn automated software testing.','Testing fundamentals, Selenium and test automation.','testing.jpg','INTERMEDIATE',40,'PUBLISHED','2026-08-29 16:03:31','2026-08-29 16:03:31'),(17,13,5,'UI UX Design Fundamentals','Learn principles of modern UI and UX design.','Wireframes, prototypes, usability and design systems.','uiux.jpg','BEGINNER',30,'PUBLISHED','2026-08-29 16:03:31','2026-08-29 16:03:31'),(18,14,5,'Power BI Business Intelligence','Create professional business intelligence dashboards.','Power Query, DAX, data modeling and dashboards.','powerbi.jpg','INTERMEDIATE',45,'PUBLISHED','2026-08-29 16:03:31','2026-08-29 16:03:31'),(19,14,6,'Tableau Data Visualization','Create interactive visualizations using Tableau.','Charts, dashboards, filters and calculated fields.','tableau.jpg','INTERMEDIATE',40,'PUBLISHED','2026-08-29 16:03:31','2026-08-29 16:03:31'),(20,15,6,'Digital Marketing Fundamentals','Learn the fundamentals of digital marketing.','SEO, social media, content marketing and analytics.','marketing.jpg','BEGINNER',30,'PUBLISHED','2026-08-29 16:03:31','2026-08-29 16:03:31');
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrollments`
--

DROP TABLE IF EXISTS `enrollments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enrollments` (
  `enrollment_id` int NOT NULL AUTO_INCREMENT,
  `student_id` int NOT NULL,
  `course_id` int NOT NULL,
  `status` enum('ACTIVE','COMPLETED','CANCELLED') DEFAULT 'ACTIVE',
  `enrolled_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `completed_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`enrollment_id`),
  UNIQUE KEY `unique_student_course` (`student_id`,`course_id`),
  KEY `fk_enrollment_course` (`course_id`),
  CONSTRAINT `fk_enrollment_course` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`),
  CONSTRAINT `fk_enrollment_student` FOREIGN KEY (`student_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrollments`
--

LOCK TABLES `enrollments` WRITE;
/*!40000 ALTER TABLE `enrollments` DISABLE KEYS */;
INSERT INTO `enrollments` VALUES (1,7,1,'COMPLETED','2026-08-29 16:06:56',NULL),(2,7,6,'COMPLETED','2026-08-29 16:06:56',NULL),(3,7,18,'ACTIVE','2026-08-29 16:06:56',NULL),(4,8,1,'COMPLETED','2026-08-29 16:06:56','2026-08-29 16:57:34'),(5,8,4,'COMPLETED','2026-08-29 16:06:56',NULL),(6,8,18,'ACTIVE','2026-08-29 16:06:56',NULL),(7,9,3,'COMPLETED','2026-08-29 16:06:56',NULL),(8,9,5,'COMPLETED','2026-08-29 16:06:56','2026-08-29 16:57:34'),(9,9,18,'COMPLETED','2026-08-29 16:06:56',NULL),(10,10,6,'COMPLETED','2026-08-29 16:06:56','2026-08-29 16:57:34'),(11,10,12,'ACTIVE','2026-08-29 16:06:56',NULL),(12,11,4,'COMPLETED','2026-08-29 16:06:56',NULL),(13,11,18,'ACTIVE','2026-08-29 16:06:56',NULL),(14,12,1,'COMPLETED','2026-08-29 16:06:56','2026-08-29 16:57:34'),(15,12,8,'COMPLETED','2026-08-29 16:06:56',NULL),(16,13,12,'COMPLETED','2026-08-29 16:06:56','2026-08-29 16:57:34'),(17,13,14,'ACTIVE','2026-08-29 16:06:56',NULL),(18,14,6,'COMPLETED','2026-08-29 16:06:56',NULL),(19,14,18,'COMPLETED','2026-08-29 16:06:56',NULL),(20,15,9,'COMPLETED','2026-08-29 16:06:56','2026-08-29 16:57:34'),(21,15,17,'COMPLETED','2026-08-29 16:06:56',NULL),(22,16,13,'COMPLETED','2026-08-29 16:06:56','2026-08-29 16:57:34'),(23,16,15,'ACTIVE','2026-08-29 16:06:56',NULL),(24,17,3,'COMPLETED','2026-08-29 16:06:56',NULL),(25,17,18,'COMPLETED','2026-08-29 16:06:56','2026-08-29 16:57:34'),(26,18,4,'COMPLETED','2026-08-29 16:06:56','2026-08-29 16:57:34'),(27,18,12,'COMPLETED','2026-08-29 16:06:56',NULL),(28,19,14,'COMPLETED','2026-08-29 16:06:56','2026-08-29 16:57:34'),(29,19,16,'COMPLETED','2026-08-29 16:06:56',NULL),(30,20,6,'ACTIVE','2026-08-29 16:06:56',NULL),(31,20,18,'COMPLETED','2026-08-29 16:06:56',NULL),(32,21,20,'COMPLETED','2026-08-29 16:06:56','2026-08-29 16:57:34');
/*!40000 ALTER TABLE `enrollments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lesson_progress`
--

DROP TABLE IF EXISTS `lesson_progress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lesson_progress` (
  `progress_id` int NOT NULL AUTO_INCREMENT,
  `student_id` int NOT NULL,
  `lesson_id` int NOT NULL,
  `completed` tinyint(1) DEFAULT '0',
  `completed_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`progress_id`),
  UNIQUE KEY `unique_student_lesson` (`student_id`,`lesson_id`),
  KEY `fk_progress_lesson` (`lesson_id`),
  CONSTRAINT `fk_progress_lesson` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`lesson_id`),
  CONSTRAINT `fk_progress_student` FOREIGN KEY (`student_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lesson_progress`
--

LOCK TABLES `lesson_progress` WRITE;
/*!40000 ALTER TABLE `lesson_progress` DISABLE KEYS */;
INSERT INTO `lesson_progress` VALUES (1,7,1,1,'2026-08-10 04:30:00'),(2,7,2,1,'2026-08-10 05:30:00'),(3,7,3,1,'2026-08-11 04:30:00'),(4,7,4,1,'2026-08-11 05:30:00'),(5,7,31,1,'2026-08-12 04:30:00'),(6,7,32,1,'2026-08-12 05:30:00'),(7,8,1,1,'2026-08-15 03:30:00'),(8,8,2,1,'2026-08-15 04:30:00'),(9,8,3,0,NULL),(10,8,4,0,NULL),(11,9,13,1,'2026-08-14 03:30:00'),(12,9,14,1,'2026-08-14 04:30:00'),(13,9,15,1,'2026-08-15 03:30:00'),(14,10,31,1,'2026-08-16 04:30:00'),(15,10,32,0,NULL),(16,10,33,0,NULL),(17,11,19,1,'2026-08-17 03:30:00'),(18,11,20,1,'2026-08-17 04:30:00'),(19,11,21,1,'2026-08-18 03:30:00'),(20,12,1,1,'2026-08-18 03:30:00'),(21,12,2,0,NULL),(22,13,67,1,'2026-08-18 04:30:00'),(23,13,68,1,'2026-08-18 05:30:00'),(24,14,31,1,'2026-08-19 03:30:00'),(25,14,32,1,'2026-08-19 04:30:00'),(26,15,49,1,'2026-08-20 03:30:00'),(27,15,50,0,NULL),(28,16,73,1,'2026-08-20 04:30:00'),(29,16,74,0,NULL),(30,17,103,1,'2026-08-21 03:30:00'),(31,17,104,1,'2026-08-21 04:30:00'),(32,18,19,1,'2026-08-21 05:30:00'),(33,18,20,0,NULL),(34,19,79,1,'2026-08-22 03:30:00'),(35,19,80,1,'2026-08-22 04:30:00'),(36,20,31,1,'2026-08-22 05:30:00'),(37,20,32,0,NULL),(38,21,115,1,'2026-08-23 03:30:00'),(39,21,116,0,NULL);
/*!40000 ALTER TABLE `lesson_progress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lessons`
--

DROP TABLE IF EXISTS `lessons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lessons` (
  `lesson_id` int NOT NULL AUTO_INCREMENT,
  `module_id` int NOT NULL,
  `lesson_name` varchar(200) NOT NULL,
  `description` text,
  `lesson_order` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`lesson_id`),
  KEY `fk_lessons_module` (`module_id`),
  CONSTRAINT `fk_lessons_module` FOREIGN KEY (`module_id`) REFERENCES `modules` (`module_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lessons`
--

LOCK TABLES `lessons` WRITE;
/*!40000 ALTER TABLE `lessons` DISABLE KEYS */;
INSERT INTO `lessons` VALUES (1,1,'Introduction to Python','Python overview and installation.',1,'2026-08-29 16:05:42'),(2,1,'Variables and Data Types','Learn Python variables and data types.',2,'2026-08-29 16:05:42'),(3,2,'Conditional Statements','Using if and else.',1,'2026-08-29 16:05:42'),(4,2,'Loops','Using for and while loops.',2,'2026-08-29 16:05:42'),(5,3,'Defining Functions','Creating Python functions.',1,'2026-08-29 16:05:42'),(6,3,'Function Arguments','Working with function parameters.',2,'2026-08-29 16:05:42'),(7,4,'Classes and Objects','Introduction to advanced OOP.',1,'2026-08-29 16:05:42'),(8,4,'Inheritance','Understanding inheritance.',2,'2026-08-29 16:05:42'),(9,5,'Decorator Basics','Creating decorators.',1,'2026-08-29 16:05:42'),(10,5,'Practical Decorators','Using decorators in applications.',2,'2026-08-29 16:05:42'),(11,6,'Iterators','Understanding iterators.',1,'2026-08-29 16:05:42'),(12,6,'Generators','Using Python generators.',2,'2026-08-29 16:05:42'),(13,7,'Excel Interface','Excel workbook fundamentals.',1,'2026-08-29 16:05:42'),(14,7,'Formulas','Using common Excel formulas.',2,'2026-08-29 16:05:42'),(15,8,'Cleaning Data','Removing errors and duplicates.',1,'2026-08-29 16:05:42'),(16,8,'Formatting Data','Preparing datasets.',2,'2026-08-29 16:05:42'),(17,9,'Pivot Tables','Creating pivot tables.',1,'2026-08-29 16:05:42'),(18,9,'Dashboard Design','Building Excel dashboards.',2,'2026-08-29 16:05:42'),(19,10,'NumPy Basics','Introduction to NumPy.',1,'2026-08-29 16:05:42'),(20,10,'Pandas Basics','Introduction to Pandas.',2,'2026-08-29 16:05:42'),(21,11,'Missing Values','Handling missing data.',1,'2026-08-29 16:05:42'),(22,11,'Data Transformation','Transforming datasets.',2,'2026-08-29 16:05:42'),(23,12,'Matplotlib','Creating charts.',1,'2026-08-29 16:05:42'),(24,12,'Seaborn Concepts','Advanced visualization concepts.',2,'2026-08-29 16:05:42'),(25,13,'Mean Median Mode','Descriptive statistics.',1,'2026-08-29 16:05:42'),(26,13,'Probability','Probability fundamentals.',2,'2026-08-29 16:05:42'),(27,14,'Feature Preparation','Preparing features.',1,'2026-08-29 16:05:42'),(28,14,'Data Splitting','Training and testing data.',2,'2026-08-29 16:05:42'),(29,15,'Machine Learning Overview','ML fundamentals.',1,'2026-08-29 16:05:42'),(30,15,'Model Evaluation','Evaluating models.',2,'2026-08-29 16:05:42'),(31,16,'SELECT Statements','Basic SQL queries.',1,'2026-08-29 16:05:42'),(32,16,'Filtering Data','WHERE and filtering.',2,'2026-08-29 16:05:42'),(33,17,'SQL JOINs','Joining tables.',1,'2026-08-29 16:05:42'),(34,17,'Subqueries','Nested SQL queries.',2,'2026-08-29 16:05:42'),(35,18,'Window Functions','Analytical window functions.',1,'2026-08-29 16:05:42'),(36,18,'Ranking Functions','ROW_NUMBER and RANK.',2,'2026-08-29 16:05:42'),(37,19,'MySQL Installation','Installing MySQL.',1,'2026-08-29 16:05:42'),(38,19,'Database Management','Managing databases.',2,'2026-08-29 16:05:42'),(39,20,'Users and Roles','Database users and permissions.',1,'2026-08-29 16:05:42'),(40,20,'Privileges','Managing privileges.',2,'2026-08-29 16:05:42'),(41,21,'Indexes','Database indexing.',1,'2026-08-29 16:05:42'),(42,21,'Query Optimization','Optimizing queries.',2,'2026-08-29 16:05:42'),(43,22,'HTML Structure','HTML page structure.',1,'2026-08-29 16:05:42'),(44,22,'HTML Forms','Creating forms.',2,'2026-08-29 16:05:42'),(45,23,'CSS Selectors','CSS selectors.',1,'2026-08-29 16:05:42'),(46,23,'Responsive CSS','Responsive design.',2,'2026-08-29 16:05:42'),(47,24,'JavaScript Basics','JavaScript syntax.',1,'2026-08-29 16:05:42'),(48,24,'DOM Manipulation','Working with the DOM.',2,'2026-08-29 16:05:42'),(49,25,'React Components','Creating React components.',1,'2026-08-29 16:05:42'),(50,25,'JSX','Using JSX.',2,'2026-08-29 16:05:42'),(51,26,'State','Managing component state.',1,'2026-08-29 16:05:42'),(52,26,'Hooks','Using React hooks.',2,'2026-08-29 16:05:42'),(53,27,'React Router','Application routing.',1,'2026-08-29 16:05:42'),(54,27,'Protected Routes','Creating protected pages.',2,'2026-08-29 16:05:42'),(55,28,'Android Studio','Android development environment.',1,'2026-08-29 16:05:42'),(56,28,'Activities','Android activities.',2,'2026-08-29 16:05:42'),(57,29,'Layouts','Creating application layouts.',1,'2026-08-29 16:05:42'),(58,29,'UI Components','Android UI components.',2,'2026-08-29 16:05:42'),(59,30,'REST APIs','Calling REST APIs.',1,'2026-08-29 16:05:42'),(60,30,'JSON Data','Working with JSON.',2,'2026-08-29 16:05:42'),(61,31,'AI Introduction','Introduction to AI.',1,'2026-08-29 16:05:42'),(62,31,'AI Applications','Real world AI applications.',2,'2026-08-29 16:05:42'),(63,32,'Search Strategies','Search strategies.',1,'2026-08-29 16:05:42'),(64,32,'Problem Solving','AI problem solving.',2,'2026-08-29 16:05:42'),(65,33,'Expert Systems','Expert system concepts.',1,'2026-08-29 16:05:42'),(66,33,'Intelligent Agents','Understanding agents.',2,'2026-08-29 16:05:42'),(67,34,'ML Workflow','Machine learning workflow.',1,'2026-08-29 16:05:42'),(68,34,'Training Models','Training machine learning models.',2,'2026-08-29 16:05:42'),(69,35,'Regression','Regression algorithms.',1,'2026-08-29 16:05:42'),(70,35,'Classification','Classification algorithms.',2,'2026-08-29 16:05:42'),(71,36,'Clustering','Clustering algorithms.',1,'2026-08-29 16:05:42'),(72,36,'Dimensionality Reduction','Reducing feature dimensions.',2,'2026-08-29 16:05:42'),(73,37,'Cloud Computing','Introduction to cloud computing.',1,'2026-08-29 16:05:42'),(74,37,'Cloud Models','IaaS, PaaS and SaaS.',2,'2026-08-29 16:05:42'),(75,38,'EC2','AWS EC2 fundamentals.',1,'2026-08-29 16:05:42'),(76,38,'S3','AWS S3 fundamentals.',2,'2026-08-29 16:05:42'),(77,39,'IAM','AWS identity management.',1,'2026-08-29 16:05:42'),(78,39,'Cloud Security','Cloud security practices.',2,'2026-08-29 16:05:42'),(79,40,'Cyber Threats','Common cyber threats.',1,'2026-08-29 16:05:42'),(80,40,'Security Principles','Core security principles.',2,'2026-08-29 16:05:42'),(81,41,'Network Security','Protecting networks.',1,'2026-08-29 16:05:42'),(82,41,'Firewalls','Firewall concepts.',2,'2026-08-29 16:05:42'),(83,42,'Encryption','Encryption fundamentals.',1,'2026-08-29 16:05:42'),(84,42,'Hashing','Hashing concepts.',2,'2026-08-29 16:05:42'),(85,43,'DevOps Culture','DevOps principles.',1,'2026-08-29 16:05:42'),(86,43,'DevOps Tools','Common DevOps tools.',2,'2026-08-29 16:05:42'),(87,44,'Docker Basics','Introduction to Docker.',1,'2026-08-29 16:05:42'),(88,44,'Docker Images','Working with images.',2,'2026-08-29 16:05:42'),(89,45,'CI Pipelines','Continuous integration.',1,'2026-08-29 16:05:42'),(90,45,'CD Deployment','Continuous deployment.',2,'2026-08-29 16:05:42'),(91,46,'Testing Fundamentals','Software testing concepts.',1,'2026-08-29 16:05:42'),(92,46,'Test Cases','Writing test cases.',2,'2026-08-29 16:05:42'),(93,47,'Selenium Basics','Selenium introduction.',1,'2026-08-29 16:05:42'),(94,47,'Browser Automation','Automating browsers.',2,'2026-08-29 16:05:42'),(95,48,'Automation Frameworks','Test automation frameworks.',1,'2026-08-29 16:05:42'),(96,48,'Test Reports','Generating test reports.',2,'2026-08-29 16:05:42'),(97,49,'UI Principles','UI design principles.',1,'2026-08-29 16:05:42'),(98,49,'UX Principles','UX design principles.',2,'2026-08-29 16:05:42'),(99,50,'Wireframes','Creating wireframes.',1,'2026-08-29 16:05:42'),(100,50,'User Flows','Designing user flows.',2,'2026-08-29 16:05:42'),(101,51,'Prototypes','Creating prototypes.',1,'2026-08-29 16:05:42'),(102,51,'Usability Testing','Testing designs.',2,'2026-08-29 16:05:42'),(103,52,'Power BI Interface','Introduction to Power BI.',1,'2026-08-29 16:05:42'),(104,52,'Power Query','Data transformation with Power Query.',2,'2026-08-29 16:05:42'),(105,53,'DAX Basics','Introduction to DAX.',1,'2026-08-29 16:05:42'),(106,53,'DAX Measures','Creating DAX measures.',2,'2026-08-29 16:05:42'),(107,54,'Dashboard Design','Building dashboards.',1,'2026-08-29 16:05:42'),(108,54,'Publishing Reports','Publishing Power BI reports.',2,'2026-08-29 16:05:42'),(109,55,'Tableau Interface','Introduction to Tableau.',1,'2026-08-29 16:05:42'),(110,55,'Connecting Data','Connecting datasets.',2,'2026-08-29 16:05:42'),(111,56,'Charts','Creating Tableau charts.',1,'2026-08-29 16:05:42'),(112,56,'Calculated Fields','Using calculated fields.',2,'2026-08-29 16:05:42'),(113,57,'Dashboards','Creating Tableau dashboards.',1,'2026-08-29 16:05:42'),(114,57,'Dashboard Filters','Using dashboard filters.',2,'2026-08-29 16:05:42'),(115,58,'Digital Marketing','Marketing fundamentals.',1,'2026-08-29 16:05:42'),(116,58,'Marketing Channels','Digital marketing channels.',2,'2026-08-29 16:05:42'),(117,59,'SEO Basics','Search engine optimization.',1,'2026-08-29 16:05:42'),(118,59,'Keyword Research','Keyword research fundamentals.',2,'2026-08-29 16:05:42'),(119,60,'Marketing Analytics','Measuring campaigns.',1,'2026-08-29 16:05:42'),(120,60,'Conversion Tracking','Tracking conversions.',2,'2026-08-29 16:05:42');
/*!40000 ALTER TABLE `lessons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materials`
--

DROP TABLE IF EXISTS `materials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materials` (
  `material_id` int NOT NULL AUTO_INCREMENT,
  `lesson_id` int NOT NULL,
  `material_name` varchar(200) NOT NULL,
  `file_path` varchar(500) DEFAULT NULL,
  `file_type` varchar(50) DEFAULT NULL,
  `file_size` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`material_id`),
  KEY `fk_materials_lesson` (`lesson_id`),
  CONSTRAINT `fk_materials_lesson` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`lesson_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1241 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materials`
--

LOCK TABLES `materials` WRITE;
/*!40000 ALTER TABLE `materials` DISABLE KEYS */;
INSERT INTO `materials` VALUES (1,1,'Python Introduction Video','/materials/python-introduction.mp4','VIDEO',15728640,'2026-08-31 05:49:01'),(2,1,'Python Introduction','/database/material/Introduction of Python Basics.pdf','PDF',524288,'2026-08-29 16:06:07'),(3,2,'Python Data Types Video','/materials/python-data-types.mp4','VIDEO',18874368,'2026-08-31 05:49:01'),(4,2,'Python Data Types','/materials/python-data-types.pdf','PDF',612000,'2026-08-29 16:06:07'),(5,3,'Conditional Statements Video','/materials/conditions.mp4','VIDEO',20971520,'2026-08-31 05:49:01'),(6,3,'Conditional Statements','/materials/conditions.pdf','PDF',430000,'2026-08-29 16:06:07'),(7,4,'Python Loops Video','/materials/loops.mp4','VIDEO',25165824,'2026-08-31 05:49:01'),(8,4,'Python Loops','/materials/loops.pdf','PDF',510000,'2026-08-29 16:06:07'),(9,5,'Functions Guide Video','/materials/functions.mp4','VIDEO',22020096,'2026-08-31 05:49:01'),(10,5,'Functions Guide','/materials/functions.pdf','PDF',480000,'2026-08-29 16:06:07'),(11,6,'Function Arguments Video','/materials/arguments.mp4','VIDEO',17825792,'2026-08-31 05:49:01'),(12,6,'Function Arguments','/materials/arguments.pdf','PDF',450000,'2026-08-29 16:06:07'),(13,7,'OOP Guide Video','/materials/oop.mp4','VIDEO',24117248,'2026-08-31 05:49:01'),(14,7,'OOP Guide','/materials/oop.pdf','PDF',700000,'2026-08-29 16:06:07'),(15,8,'Inheritance Guide Video','/materials/inheritance.mp4','VIDEO',19922944,'2026-08-31 05:49:01'),(16,8,'Inheritance Guide','/materials/inheritance.pdf','PDF',620000,'2026-08-29 16:06:07'),(17,9,'Decorators Guide Video','/materials/decorators.mp4','VIDEO',20971520,'2026-08-31 05:49:01'),(18,9,'Decorators Guide','/materials/decorators.pdf','PDF',510000,'2026-08-29 16:06:07'),(19,10,'Advanced Decorators Video','/materials/advanced-decorators.mp4','VIDEO',23068672,'2026-08-31 05:49:01'),(20,10,'Advanced Decorators','/materials/advanced-decorators.pdf','PDF',530000,'2026-08-29 16:06:07'),(21,11,'Iterators Video','/materials/iterators.mp4','VIDEO',18874368,'2026-08-31 05:49:01'),(22,11,'Iterators','/materials/iterators.pdf','PDF',410000,'2026-08-29 16:06:07'),(23,12,'Generators Video','/materials/generators.mp4','VIDEO',19922944,'2026-08-31 05:49:01'),(24,12,'Generators','/materials/generators.pdf','PDF',470000,'2026-08-29 16:06:07'),(25,13,'Excel Basics Video','/materials/excel-basics.mp4','VIDEO',26214400,'2026-08-31 05:49:01'),(26,13,'Excel Basics','/materials/excel-basics.pdf','PDF',500000,'2026-08-29 16:06:07'),(27,14,'Excel Formulas Video','/materials/excel-formulas.mp4','VIDEO',24117248,'2026-08-31 05:49:01'),(28,14,'Excel Formulas','/materials/excel-formulas.pdf','PDF',650000,'2026-08-29 16:06:07'),(29,15,'Data Cleaning Video','/materials/data-cleaning.mp4','VIDEO',22020096,'2026-08-31 05:49:01'),(30,15,'Data Cleaning','/materials/data-cleaning.pdf','PDF',580000,'2026-08-29 16:06:07'),(31,16,'Data Formatting Video','/materials/data-formatting.mp4','VIDEO',19922944,'2026-08-31 05:49:01'),(32,16,'Data Formatting','/materials/data-formatting.pdf','PDF',420000,'2026-08-29 16:06:07'),(33,17,'Pivot Tables Video','/materials/pivot-tables.mp4','VIDEO',25165824,'2026-08-31 05:49:01'),(34,17,'Pivot Tables','/materials/pivot-tables.pdf','PDF',610000,'2026-08-29 16:06:07'),(35,18,'Excel Dashboard Video','/materials/excel-dashboard.mp4','VIDEO',28311552,'2026-08-31 05:49:01'),(36,18,'Excel Dashboard','/materials/excel-dashboard.pdf','PDF',730000,'2026-08-29 16:06:07'),(37,19,'NumPy Basics Video','/materials/numpy.mp4','VIDEO',22020096,'2026-08-31 05:49:01'),(38,19,'NumPy Basics','/materials/numpy.pdf','PDF',490000,'2026-08-29 16:06:07'),(39,20,'Pandas Basics Video','/materials/pandas.mp4','VIDEO',24117248,'2026-08-31 05:49:01'),(40,20,'Pandas Basics','/materials/pandas.pdf','PDF',620000,'2026-08-29 16:06:07'),(41,21,'Missing Values Video','/materials/missing-values.mp4','VIDEO',18874368,'2026-08-31 05:49:01'),(42,21,'Missing Values','/materials/missing-values.pdf','PDF',410000,'2026-08-29 16:06:07'),(43,22,'Data Transformation Video','/materials/transformation.mp4','VIDEO',23068672,'2026-08-31 05:49:01'),(44,22,'Data Transformation','/materials/transformation.pdf','PDF',520000,'2026-08-29 16:06:07'),(45,23,'Matplotlib Video','/materials/matplotlib.mp4','VIDEO',25165824,'2026-08-31 05:49:01'),(46,23,'Matplotlib','/materials/matplotlib.pdf','PDF',580000,'2026-08-29 16:06:07'),(47,24,'Visualization Guide Video','/materials/visualization.mp4','VIDEO',26214400,'2026-08-31 05:49:01'),(48,24,'Visualization Guide','/materials/visualization.pdf','PDF',630000,'2026-08-29 16:06:07'),(49,25,'Statistics Video','/materials/statistics.mp4','VIDEO',22020096,'2026-08-31 05:49:01'),(50,25,'Statistics','/materials/statistics.pdf','PDF',550000,'2026-08-29 16:06:07'),(51,26,'Probability Video','/materials/probability.mp4','VIDEO',20971520,'2026-08-31 05:49:01'),(52,26,'Probability','/materials/probability.pdf','PDF',450000,'2026-08-29 16:06:07'),(53,27,'Feature Engineering Video','/materials/features.mp4','VIDEO',24117248,'2026-08-31 05:49:01'),(54,27,'Feature Engineering','/materials/features.pdf','PDF',510000,'2026-08-29 16:06:07'),(55,28,'Train Test Split Video','/materials/train-test.mp4','VIDEO',19922944,'2026-08-31 05:49:01'),(56,28,'Train Test Split','/materials/train-test.pdf','PDF',430000,'2026-08-29 16:06:07'),(57,29,'Machine Learning Video','/materials/ml.mp4','VIDEO',28311552,'2026-08-31 05:49:01'),(58,29,'Machine Learning','/materials/ml.pdf','PDF',600000,'2026-08-29 16:06:07'),(59,30,'Model Evaluation Video','/materials/evaluation.mp4','VIDEO',23068672,'2026-08-31 05:49:01'),(60,30,'Model Evaluation','/materials/evaluation.pdf','PDF',480000,'2026-08-29 16:06:07'),(61,31,'SQL SELECT Video','/materials/sql-select.mp4','VIDEO',18874368,'2026-08-31 05:49:01'),(62,31,'SQL SELECT','/materials/sql-select.pdf','PDF',420000,'2026-08-29 16:06:07'),(63,32,'SQL Filtering Video','/materials/sql-filtering.mp4','VIDEO',17825792,'2026-08-31 05:49:01'),(64,32,'SQL Filtering','/materials/sql-filtering.pdf','PDF',390000,'2026-08-29 16:06:07'),(65,33,'SQL JOINs Video','/materials/sql-joins.mp4','VIDEO',26214400,'2026-08-31 05:49:01'),(66,33,'SQL JOINs','/materials/sql-joins.pdf','PDF',520000,'2026-08-29 16:06:07'),(67,34,'SQL Subqueries Video','/materials/subqueries.mp4','VIDEO',23068672,'2026-08-31 05:49:01'),(68,34,'SQL Subqueries','/materials/subqueries.pdf','PDF',470000,'2026-08-29 16:06:07'),(69,35,'Window Functions Video','/materials/window-functions.mp4','VIDEO',24117248,'2026-08-31 05:49:01'),(70,35,'Window Functions','/materials/window-functions.pdf','PDF',560000,'2026-08-29 16:06:07'),(71,36,'SQL Ranking Video','/materials/ranking.mp4','VIDEO',19922944,'2026-08-31 05:49:01'),(72,36,'SQL Ranking','/materials/ranking.pdf','PDF',430000,'2026-08-29 16:06:07'),(73,37,'MySQL Setup Video','/materials/mysql-setup.mp4','VIDEO',20971520,'2026-08-31 05:49:01'),(74,37,'MySQL Setup','/materials/mysql-setup.pdf','PDF',390000,'2026-08-29 16:06:07'),(75,38,'MySQL Administration Video','/materials/mysql-admin.mp4','VIDEO',23068672,'2026-08-31 05:49:01'),(76,38,'MySQL Administration','/materials/mysql-admin.pdf','PDF',510000,'2026-08-29 16:06:07'),(77,39,'Database Users Video','/materials/db-users.mp4','VIDEO',19922944,'2026-08-31 05:49:01'),(78,39,'Database Users','/materials/db-users.pdf','PDF',420000,'2026-08-29 16:06:07'),(79,40,'Database Privileges Video','/materials/privileges.mp4','VIDEO',20971520,'2026-08-31 05:49:01'),(80,40,'Database Privileges','/materials/privileges.pdf','PDF',440000,'2026-08-29 16:06:07'),(81,41,'Indexes Video','/materials/indexes.mp4','VIDEO',20000000,'2026-09-01 05:26:12'),(82,41,'Indexes','/materials/indexes.pdf','PDF',500000,'2026-09-01 05:26:12'),(83,42,'Query Optimization Video','/materials/query-optimization.mp4','VIDEO',20137000,'2026-09-01 05:26:12'),(84,42,'Query Optimization','/materials/query-optimization.pdf','PDF',505300,'2026-09-01 05:26:12'),(85,43,'HTML Structure Video','/materials/html-structure.mp4','VIDEO',20274000,'2026-09-01 05:26:12'),(86,43,'HTML Structure','/materials/html-structure.pdf','PDF',510600,'2026-09-01 05:26:12'),(87,44,'HTML Forms Video','/materials/html-forms.mp4','VIDEO',20411000,'2026-09-01 05:26:12'),(88,44,'HTML Forms','/materials/html-forms.pdf','PDF',515900,'2026-09-01 05:26:12'),(89,45,'CSS Selectors Video','/materials/css-selectors.mp4','VIDEO',20548000,'2026-09-01 05:26:12'),(90,45,'CSS Selectors','/materials/css-selectors.pdf','PDF',521200,'2026-09-01 05:26:12'),(91,46,'Responsive CSS Video','/materials/responsive-css.mp4','VIDEO',20685000,'2026-09-01 05:26:12'),(92,46,'Responsive CSS','/materials/responsive-css.pdf','PDF',526500,'2026-09-01 05:26:12'),(93,47,'JavaScript Basics Video','/materials/javascript-basics.mp4','VIDEO',20822000,'2026-09-01 05:26:12'),(94,47,'JavaScript Basics','/materials/javascript-basics.pdf','PDF',531800,'2026-09-01 05:26:12'),(95,48,'DOM Manipulation Video','/materials/dom-manipulation.mp4','VIDEO',20959000,'2026-09-01 05:26:12'),(96,48,'DOM Manipulation','/materials/dom-manipulation.pdf','PDF',537100,'2026-09-01 05:26:12'),(97,49,'React Components Video','/materials/react-components.mp4','VIDEO',21096000,'2026-09-01 05:26:12'),(98,49,'React Components','/materials/react-components.pdf','PDF',542400,'2026-09-01 05:26:12'),(99,50,'JSX Video','/materials/jsx.mp4','VIDEO',21233000,'2026-09-01 05:26:12'),(100,50,'JSX','/materials/jsx.pdf','PDF',547700,'2026-09-01 05:26:12'),(101,51,'State Video','/materials/state.mp4','VIDEO',21370000,'2026-09-01 05:26:12'),(102,51,'State','/materials/state.pdf','PDF',553000,'2026-09-01 05:26:12'),(103,52,'Hooks Video','/materials/hooks.mp4','VIDEO',21507000,'2026-09-01 05:26:12'),(104,52,'Hooks','/materials/hooks.pdf','PDF',558300,'2026-09-01 05:26:12'),(105,53,'React Router Video','/materials/react-router.mp4','VIDEO',21644000,'2026-09-01 05:26:12'),(106,53,'React Router','/materials/react-router.pdf','PDF',563600,'2026-09-01 05:26:12'),(107,54,'Protected Routes Video','/materials/protected-routes.mp4','VIDEO',21781000,'2026-09-01 05:26:12'),(108,54,'Protected Routes','/materials/protected-routes.pdf','PDF',568900,'2026-09-01 05:26:12'),(109,55,'Android Studio Video','/materials/android-studio.mp4','VIDEO',21918000,'2026-09-01 05:26:12'),(110,55,'Android Studio','/materials/android-studio.pdf','PDF',574200,'2026-09-01 05:26:12'),(111,56,'Activities Video','/materials/activities.mp4','VIDEO',22055000,'2026-09-01 05:26:12'),(112,56,'Activities','/materials/activities.pdf','PDF',579500,'2026-09-01 05:26:12'),(113,57,'Layouts Video','/materials/layouts.mp4','VIDEO',22192000,'2026-09-01 05:26:12'),(114,57,'Layouts','/materials/layouts.pdf','PDF',584800,'2026-09-01 05:26:12'),(115,58,'UI Components Video','/materials/ui-components.mp4','VIDEO',22329000,'2026-09-01 05:26:12'),(116,58,'UI Components','/materials/ui-components.pdf','PDF',590100,'2026-09-01 05:26:12'),(117,59,'REST APIs Video','/materials/rest-apis.mp4','VIDEO',22466000,'2026-09-01 05:26:12'),(118,59,'REST APIs','/materials/rest-apis.pdf','PDF',595400,'2026-09-01 05:26:12'),(119,60,'JSON Data Video','/materials/json-data.mp4','VIDEO',22603000,'2026-09-01 05:26:12'),(120,60,'JSON Data','/materials/json-data.pdf','PDF',600700,'2026-09-01 05:26:12'),(121,61,'AI Introduction Video','/materials/ai-introduction.mp4','VIDEO',22740000,'2026-09-01 05:26:12'),(122,61,'AI Introduction','/materials/ai-introduction.pdf','PDF',606000,'2026-09-01 05:26:12'),(123,62,'AI Applications Video','/materials/ai-applications.mp4','VIDEO',22877000,'2026-09-01 05:26:12'),(124,62,'AI Applications','/materials/ai-applications.pdf','PDF',611300,'2026-09-01 05:26:12'),(125,63,'Search Strategies Video','/materials/search-strategies.mp4','VIDEO',23014000,'2026-09-01 05:26:12'),(126,63,'Search Strategies','/materials/search-strategies.pdf','PDF',616600,'2026-09-01 05:26:12'),(127,64,'Problem Solving Video','/materials/problem-solving.mp4','VIDEO',23151000,'2026-09-01 05:26:12'),(128,64,'Problem Solving','/materials/problem-solving.pdf','PDF',621900,'2026-09-01 05:26:12'),(129,65,'Expert Systems Video','/materials/expert-systems.mp4','VIDEO',23288000,'2026-09-01 05:26:12'),(130,65,'Expert Systems','/materials/expert-systems.pdf','PDF',627200,'2026-09-01 05:26:12'),(131,66,'Intelligent Agents Video','/materials/intelligent-agents.mp4','VIDEO',23425000,'2026-09-01 05:26:12'),(132,66,'Intelligent Agents','/materials/intelligent-agents.pdf','PDF',632500,'2026-09-01 05:26:12'),(133,67,'ML Workflow Video','/materials/ml-workflow.mp4','VIDEO',23562000,'2026-09-01 05:26:12'),(134,67,'ML Workflow','/materials/ml-workflow.pdf','PDF',637800,'2026-09-01 05:26:12'),(135,68,'Training Models Video','/materials/training-models.mp4','VIDEO',23699000,'2026-09-01 05:26:12'),(136,68,'Training Models','/materials/training-models.pdf','PDF',643100,'2026-09-01 05:26:12'),(137,69,'Regression Video','/materials/regression.mp4','VIDEO',23836000,'2026-09-01 05:26:12'),(138,69,'Regression','/materials/regression.pdf','PDF',648400,'2026-09-01 05:26:12'),(139,70,'Classification Video','/materials/classification.mp4','VIDEO',23973000,'2026-09-01 05:26:12'),(140,70,'Classification','/materials/classification.pdf','PDF',653700,'2026-09-01 05:26:12'),(141,71,'Clustering Video','/materials/clustering.mp4','VIDEO',24110000,'2026-09-01 05:26:12'),(142,71,'Clustering','/materials/clustering.pdf','PDF',659000,'2026-09-01 05:26:12'),(143,72,'Dimensionality Reduction Video','/materials/dimensionality-reduction.mp4','VIDEO',24247000,'2026-09-01 05:26:12'),(144,72,'Dimensionality Reduction','/materials/dimensionality-reduction.pdf','PDF',664300,'2026-09-01 05:26:12'),(145,73,'Cloud Computing Video','/materials/cloud-computing.mp4','VIDEO',24384000,'2026-09-01 05:26:12'),(146,73,'Cloud Computing','/materials/cloud-computing.pdf','PDF',669600,'2026-09-01 05:26:12'),(147,74,'Cloud Models Video','/materials/cloud-models.mp4','VIDEO',24521000,'2026-09-01 05:26:12'),(148,74,'Cloud Models','/materials/cloud-models.pdf','PDF',674900,'2026-09-01 05:26:12'),(149,75,'EC2 Video','/materials/ec2.mp4','VIDEO',24658000,'2026-09-01 05:26:12'),(150,75,'EC2','/materials/ec2.pdf','PDF',680200,'2026-09-01 05:26:12'),(151,76,'S3 Video','/materials/s3.mp4','VIDEO',24795000,'2026-09-01 05:26:12'),(152,76,'S3','/materials/s3.pdf','PDF',685500,'2026-09-01 05:26:12'),(153,77,'IAM Video','/materials/iam.mp4','VIDEO',24932000,'2026-09-01 05:26:12'),(154,77,'IAM','/materials/iam.pdf','PDF',690800,'2026-09-01 05:26:12'),(155,78,'Cloud Security Video','/materials/cloud-security.mp4','VIDEO',25069000,'2026-09-01 05:26:12'),(156,78,'Cloud Security','/materials/cloud-security.pdf','PDF',696100,'2026-09-01 05:26:12'),(157,79,'Cyber Threats Video','/materials/cyber-threats.mp4','VIDEO',25206000,'2026-09-01 05:26:12'),(158,79,'Cyber Threats','/materials/cyber-threats.pdf','PDF',701400,'2026-09-01 05:26:12'),(159,80,'Security Principles Video','/materials/security-principles.mp4','VIDEO',25343000,'2026-09-01 05:26:12'),(160,80,'Security Principles','/materials/security-principles.pdf','PDF',706700,'2026-09-01 05:26:12'),(161,81,'Network Security Video','/materials/network-security.mp4','VIDEO',25480000,'2026-09-01 05:26:12'),(162,81,'Network Security','/materials/network-security.pdf','PDF',712000,'2026-09-01 05:26:12'),(163,82,'Firewalls Video','/materials/firewalls.mp4','VIDEO',25617000,'2026-09-01 05:26:12'),(164,82,'Firewalls','/materials/firewalls.pdf','PDF',717300,'2026-09-01 05:26:12'),(165,83,'Encryption Video','/materials/encryption.mp4','VIDEO',25754000,'2026-09-01 05:26:12'),(166,83,'Encryption','/materials/encryption.pdf','PDF',722600,'2026-09-01 05:26:12'),(167,84,'Hashing Video','/materials/hashing.mp4','VIDEO',25891000,'2026-09-01 05:26:12'),(168,84,'Hashing','/materials/hashing.pdf','PDF',727900,'2026-09-01 05:26:12'),(169,85,'DevOps Culture Video','/materials/devops-culture.mp4','VIDEO',26028000,'2026-09-01 05:26:12'),(170,85,'DevOps Culture','/materials/devops-culture.pdf','PDF',733200,'2026-09-01 05:26:12'),(171,86,'DevOps Tools Video','/materials/devops-tools.mp4','VIDEO',26165000,'2026-09-01 05:26:12'),(172,86,'DevOps Tools','/materials/devops-tools.pdf','PDF',738500,'2026-09-01 05:26:12'),(173,87,'Docker Basics Video','/materials/docker-basics.mp4','VIDEO',26302000,'2026-09-01 05:26:12'),(174,87,'Docker Basics','/materials/docker-basics.pdf','PDF',743800,'2026-09-01 05:26:12'),(175,88,'Docker Images Video','/materials/docker-images.mp4','VIDEO',26439000,'2026-09-01 05:26:12'),(176,88,'Docker Images','/materials/docker-images.pdf','PDF',749100,'2026-09-01 05:26:12'),(177,89,'CI Pipelines Video','/materials/ci-pipelines.mp4','VIDEO',26576000,'2026-09-01 05:26:12'),(178,89,'CI Pipelines','/materials/ci-pipelines.pdf','PDF',754400,'2026-09-01 05:26:12'),(179,90,'CD Deployment Video','/materials/cd-deployment.mp4','VIDEO',26713000,'2026-09-01 05:26:12'),(180,90,'CD Deployment','/materials/cd-deployment.pdf','PDF',759700,'2026-09-01 05:26:12'),(181,91,'Testing Fundamentals Video','/materials/testing-fundamentals.mp4','VIDEO',26850000,'2026-09-01 05:26:12'),(182,91,'Testing Fundamentals','/materials/testing-fundamentals.pdf','PDF',765000,'2026-09-01 05:26:12'),(183,92,'Test Cases Video','/materials/test-cases.mp4','VIDEO',26987000,'2026-09-01 05:26:12'),(184,92,'Test Cases','/materials/test-cases.pdf','PDF',770300,'2026-09-01 05:26:12'),(185,93,'Selenium Basics Video','/materials/selenium-basics.mp4','VIDEO',27124000,'2026-09-01 05:26:12'),(186,93,'Selenium Basics','/materials/selenium-basics.pdf','PDF',775600,'2026-09-01 05:26:12'),(187,94,'Browser Automation Video','/materials/browser-automation.mp4','VIDEO',27261000,'2026-09-01 05:26:12'),(188,94,'Browser Automation','/materials/browser-automation.pdf','PDF',780900,'2026-09-01 05:26:12'),(189,95,'Automation Frameworks Video','/materials/automation-frameworks.mp4','VIDEO',27398000,'2026-09-01 05:26:12'),(190,95,'Automation Frameworks','/materials/automation-frameworks.pdf','PDF',786200,'2026-09-01 05:26:12'),(191,96,'Test Reports Video','/materials/test-reports.mp4','VIDEO',27535000,'2026-09-01 05:26:12'),(192,96,'Test Reports','/materials/test-reports.pdf','PDF',791500,'2026-09-01 05:26:12'),(193,97,'UI Principles Video','/materials/ui-principles.mp4','VIDEO',27672000,'2026-09-01 05:26:12'),(194,97,'UI Principles','/materials/ui-principles.pdf','PDF',796800,'2026-09-01 05:26:12'),(195,98,'UX Principles Video','/materials/ux-principles.mp4','VIDEO',27809000,'2026-09-01 05:26:12'),(196,98,'UX Principles','/materials/ux-principles.pdf','PDF',802100,'2026-09-01 05:26:12'),(197,99,'Wireframes Video','/materials/wireframes.mp4','VIDEO',27946000,'2026-09-01 05:26:12'),(198,99,'Wireframes','/materials/wireframes.pdf','PDF',807400,'2026-09-01 05:26:12'),(199,100,'User Flows Video','/materials/user-flows.mp4','VIDEO',28083000,'2026-09-01 05:26:12'),(200,100,'User Flows','/materials/user-flows.pdf','PDF',812700,'2026-09-01 05:26:12'),(201,101,'Prototypes Video','/materials/prototypes.mp4','VIDEO',28220000,'2026-09-01 05:26:12'),(202,101,'Prototypes','/materials/prototypes.pdf','PDF',818000,'2026-09-01 05:26:12'),(203,102,'Usability Testing Video','/materials/usability-testing.mp4','VIDEO',28357000,'2026-09-01 05:26:12'),(204,102,'Usability Testing','/materials/usability-testing.pdf','PDF',823300,'2026-09-01 05:26:12'),(205,103,'Power BI Interface Video','/materials/power-bi-interface.mp4','VIDEO',28494000,'2026-09-01 05:26:12'),(206,103,'Power BI Interface','/materials/power-bi-interface.pdf','PDF',828600,'2026-09-01 05:26:12'),(207,104,'Power Query Video','/materials/power-query.mp4','VIDEO',28631000,'2026-09-01 05:26:12'),(208,104,'Power Query','/materials/power-query.pdf','PDF',833900,'2026-09-01 05:26:12'),(209,105,'DAX Basics Video','/materials/dax-basics.mp4','VIDEO',28768000,'2026-09-01 05:26:12'),(210,105,'DAX Basics','/materials/dax-basics.pdf','PDF',839200,'2026-09-01 05:26:12'),(211,106,'DAX Measures Video','/materials/dax-measures.mp4','VIDEO',28905000,'2026-09-01 05:26:12'),(212,106,'DAX Measures','/materials/dax-measures.pdf','PDF',844500,'2026-09-01 05:26:12'),(213,107,'Dashboard Design Video','/materials/dashboard-design.mp4','VIDEO',29042000,'2026-09-01 05:26:12'),(214,107,'Dashboard Design','/materials/dashboard-design.pdf','PDF',849800,'2026-09-01 05:26:12'),(215,108,'Publishing Reports Video','/materials/publishing-reports.mp4','VIDEO',29179000,'2026-09-01 05:26:12'),(216,108,'Publishing Reports','/materials/publishing-reports.pdf','PDF',855100,'2026-09-01 05:26:12'),(217,109,'Tableau Interface Video','/materials/tableau-interface.mp4','VIDEO',29316000,'2026-09-01 05:26:12'),(218,109,'Tableau Interface','/materials/tableau-interface.pdf','PDF',860400,'2026-09-01 05:26:12'),(219,110,'Connecting Data Video','/materials/connecting-data.mp4','VIDEO',29453000,'2026-09-01 05:26:12'),(220,110,'Connecting Data','/materials/connecting-data.pdf','PDF',865700,'2026-09-01 05:26:12'),(221,111,'Charts Video','/materials/charts.mp4','VIDEO',29590000,'2026-09-01 05:26:12'),(222,111,'Charts','/materials/charts.pdf','PDF',871000,'2026-09-01 05:26:12'),(223,112,'Calculated Fields Video','/materials/calculated-fields.mp4','VIDEO',29727000,'2026-09-01 05:26:12'),(224,112,'Calculated Fields','/materials/calculated-fields.pdf','PDF',876300,'2026-09-01 05:26:12'),(225,113,'Dashboards Video','/materials/dashboards.mp4','VIDEO',29864000,'2026-09-01 05:26:12'),(226,113,'Dashboards','/materials/dashboards.pdf','PDF',881600,'2026-09-01 05:26:12'),(227,114,'Dashboard Filters Video','/materials/dashboard-filters.mp4','VIDEO',30001000,'2026-09-01 05:26:12'),(228,114,'Dashboard Filters','/materials/dashboard-filters.pdf','PDF',886900,'2026-09-01 05:26:12'),(229,115,'Digital Marketing Video','/materials/digital-marketing.mp4','VIDEO',30138000,'2026-09-01 05:26:12'),(230,115,'Digital Marketing','/materials/digital-marketing.pdf','PDF',892200,'2026-09-01 05:26:12'),(231,116,'Marketing Channels Video','/materials/marketing-channels.mp4','VIDEO',30275000,'2026-09-01 05:26:12'),(232,116,'Marketing Channels','/materials/marketing-channels.pdf','PDF',897500,'2026-09-01 05:26:12'),(233,117,'SEO Basics Video','/materials/seo-basics.mp4','VIDEO',30412000,'2026-09-01 05:26:12'),(234,117,'SEO Basics','/materials/seo-basics.pdf','PDF',902800,'2026-09-01 05:26:12'),(235,118,'Keyword Research Video','/materials/keyword-research.mp4','VIDEO',30549000,'2026-09-01 05:26:12'),(236,118,'Keyword Research','/materials/keyword-research.pdf','PDF',908100,'2026-09-01 05:26:12'),(237,119,'Marketing Analytics Video','/materials/marketing-analytics.mp4','VIDEO',30686000,'2026-09-01 05:26:12'),(238,119,'Marketing Analytics','/materials/marketing-analytics.pdf','PDF',913400,'2026-09-01 05:26:12'),(239,120,'Conversion Tracking Video','/materials/conversion-tracking.mp4','VIDEO',30823000,'2026-09-01 05:26:12'),(240,120,'Conversion Tracking','/materials/conversion-tracking.pdf','PDF',918700,'2026-09-01 05:26:12');
/*!40000 ALTER TABLE `materials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modules`
--

DROP TABLE IF EXISTS `modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modules` (
  `module_id` int NOT NULL AUTO_INCREMENT,
  `course_id` int NOT NULL,
  `module_name` varchar(200) NOT NULL,
  `description` text,
  `module_order` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`module_id`),
  KEY `fk_modules_course` (`course_id`),
  CONSTRAINT `fk_modules_course` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modules`
--

LOCK TABLES `modules` WRITE;
/*!40000 ALTER TABLE `modules` DISABLE KEYS */;
INSERT INTO `modules` VALUES (1,1,'Python Basics','Introduction to Python and programming fundamentals.',1,'2026-08-29 16:05:12'),(2,1,'Control Flow','Conditions and loops.',2,'2026-08-29 16:05:12'),(3,1,'Functions','Functions and reusable code.',3,'2026-08-29 16:05:12'),(4,2,'Advanced OOP','Advanced object oriented programming.',1,'2026-08-29 16:05:12'),(5,2,'Decorators','Decorators and higher order functions.',2,'2026-08-29 16:05:12'),(6,2,'Generators','Generators and iterators.',3,'2026-08-29 16:05:12'),(7,3,'Excel Basics','Excel fundamentals.',1,'2026-08-29 16:05:12'),(8,3,'Data Cleaning','Cleaning business datasets.',2,'2026-08-29 16:05:12'),(9,3,'Excel Dashboards','Creating dashboards.',3,'2026-08-29 16:05:12'),(10,4,'Python Data Tools','NumPy and Pandas.',1,'2026-08-29 16:05:12'),(11,4,'Data Cleaning','Cleaning datasets with Pandas.',2,'2026-08-29 16:05:12'),(12,4,'Visualization','Charts and visualization.',3,'2026-08-29 16:05:12'),(13,5,'Statistics Basics','Statistics for data science.',1,'2026-08-29 16:05:12'),(14,5,'Data Preparation','Preparing data for models.',2,'2026-08-29 16:05:12'),(15,5,'ML Introduction','Introduction to machine learning.',3,'2026-08-29 16:05:12'),(16,6,'SQL Basics','SQL fundamentals.',1,'2026-08-29 16:05:12'),(17,6,'Advanced Queries','Joins and subqueries.',2,'2026-08-29 16:05:12'),(18,6,'Window Functions','Advanced analytical SQL.',3,'2026-08-29 16:05:12'),(19,7,'MySQL Administration','Database administration basics.',1,'2026-08-29 16:05:12'),(20,7,'Security','Users and permissions.',2,'2026-08-29 16:05:12'),(21,7,'Optimization','Indexes and performance.',3,'2026-08-29 16:05:12'),(22,8,'HTML','HTML fundamentals.',1,'2026-08-29 16:05:12'),(23,8,'CSS','CSS styling.',2,'2026-08-29 16:05:12'),(24,8,'JavaScript','JavaScript fundamentals.',3,'2026-08-29 16:05:12'),(25,9,'React Fundamentals','React components and JSX.',1,'2026-08-29 16:05:12'),(26,9,'React State','State and hooks.',2,'2026-08-29 16:05:12'),(27,9,'React Routing','Routing and application structure.',3,'2026-08-29 16:05:12'),(28,10,'Android Basics','Android development fundamentals.',1,'2026-08-29 16:05:12'),(29,10,'UI Development','Android user interfaces.',2,'2026-08-29 16:05:12'),(30,10,'APIs','Connecting applications to APIs.',3,'2026-08-29 16:05:12'),(31,11,'AI Concepts','Artificial intelligence fundamentals.',1,'2026-08-29 16:05:12'),(32,11,'Search Algorithms','Search and reasoning.',2,'2026-08-29 16:05:12'),(33,11,'Intelligent Systems','Building intelligent applications.',3,'2026-08-29 16:05:12'),(34,12,'ML Fundamentals','Machine learning fundamentals.',1,'2026-08-29 16:05:12'),(35,12,'Supervised Learning','Regression and classification.',2,'2026-08-29 16:05:12'),(36,12,'Unsupervised Learning','Clustering techniques.',3,'2026-08-29 16:05:12'),(37,13,'Cloud Basics','Cloud computing fundamentals.',1,'2026-08-29 16:05:12'),(38,13,'AWS Services','Core AWS services.',2,'2026-08-29 16:05:12'),(39,13,'Cloud Security','Cloud security fundamentals.',3,'2026-08-29 16:05:12'),(40,14,'Security Basics','Cyber security fundamentals.',1,'2026-08-29 16:05:12'),(41,14,'Network Security','Network protection.',2,'2026-08-29 16:05:12'),(42,14,'Cryptography','Encryption fundamentals.',3,'2026-08-29 16:05:12'),(43,15,'DevOps Basics','DevOps fundamentals.',1,'2026-08-29 16:05:12'),(44,15,'Docker','Containerization with Docker.',2,'2026-08-29 16:05:12'),(45,15,'CI/CD','Continuous integration and deployment.',3,'2026-08-29 16:05:12'),(46,16,'Testing Basics','Software testing fundamentals.',1,'2026-08-29 16:05:12'),(47,16,'Selenium','Browser automation.',2,'2026-08-29 16:05:12'),(48,16,'Automation','Automated test frameworks.',3,'2026-08-29 16:05:12'),(49,17,'Design Principles','UI UX design principles.',1,'2026-08-29 16:05:12'),(50,17,'Wireframing','Creating wireframes.',2,'2026-08-29 16:05:12'),(51,17,'Prototyping','Interactive prototypes.',3,'2026-08-29 16:05:12'),(52,18,'Power BI Basics','Power BI fundamentals.',1,'2026-08-29 16:05:12'),(53,18,'DAX','DAX calculations.',2,'2026-08-29 16:05:12'),(54,18,'Dashboards','Interactive dashboards.',3,'2026-08-29 16:05:12'),(55,19,'Tableau Basics','Tableau fundamentals.',1,'2026-08-29 16:05:12'),(56,19,'Visualization','Creating visualizations.',2,'2026-08-29 16:05:12'),(57,19,'Dashboards','Interactive Tableau dashboards.',3,'2026-08-29 16:05:12'),(58,20,'Marketing Basics','Digital marketing fundamentals.',1,'2026-08-29 16:05:12'),(59,20,'SEO','Search engine optimization.',2,'2026-08-29 16:05:12'),(60,20,'Analytics','Marketing analytics.',3,'2026-08-29 16:05:12');
/*!40000 ALTER TABLE `modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `notification_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `title` varchar(200) NOT NULL,
  `message` text NOT NULL,
  `notification_type` varchar(100) DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`notification_id`),
  KEY `fk_notification_user` (`user_id`),
  CONSTRAINT `fk_notification_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (1,7,'Course Completed','Congratulations! You completed Python Programming for Beginners.','COURSE',1,'2026-08-29 16:17:31'),(2,7,'Certificate Issued','Your Python course certificate has been issued.','CERTIFICATE',0,'2026-08-29 16:17:31'),(3,8,'New Course Available','A new Data Analytics course is available.','COURSE',0,'2026-08-29 16:17:31'),(4,9,'Assignment Evaluated','Your Excel assignment has been evaluated.','ASSIGNMENT',1,'2026-08-29 16:17:31'),(5,10,'Quiz Result','Your SQL quiz result is available.','QUIZ',0,'2026-08-29 16:17:31'),(6,11,'Course Completed','You have completed Data Analytics with Python.','COURSE',1,'2026-08-29 16:17:31'),(7,12,'Assignment Deadline','Your assignment deadline is approaching.','ASSIGNMENT',0,'2026-08-29 16:17:31'),(8,13,'Certificate Issued','Your Machine Learning certificate is available.','CERTIFICATE',0,'2026-08-29 16:17:31'),(9,14,'Quiz Passed','Congratulations! You passed the SQL quiz.','QUIZ',1,'2026-08-29 16:17:31'),(10,15,'New Lesson','A new React lesson has been published.','LESSON',0,'2026-08-29 16:17:31'),(11,16,'Course Reminder','Continue your AWS Cloud course.','COURSE',0,'2026-08-29 16:17:31'),(12,17,'Certificate Issued','Your Power BI certificate has been issued.','CERTIFICATE',1,'2026-08-29 16:17:31'),(13,18,'Assignment Evaluated','Your assignment has been evaluated.','ASSIGNMENT',0,'2026-08-29 16:17:31'),(14,19,'Quiz Passed','You successfully passed the Cyber Security quiz.','QUIZ',1,'2026-08-29 16:17:31'),(15,20,'Course Completed','You completed the Power BI course.','COURSE',1,'2026-08-29 16:17:31'),(16,21,'New Course Available','Explore our new Digital Marketing course.','COURSE',0,'2026-08-29 16:17:31'),(17,2,'New Student Enrollment','A student enrolled in your Python course.','ENROLLMENT',0,'2026-08-29 16:17:31'),(18,3,'Assignment Submitted','A student submitted an assignment.','ASSIGNMENT',0,'2026-08-29 16:17:31'),(19,4,'New Review','A student posted a review on your course.','REVIEW',0,'2026-08-29 16:17:31'),(20,5,'New Enrollment','A new student enrolled in your React course.','ENROLLMENT',0,'2026-08-29 16:17:31'),(21,6,'Quiz Submitted','A student completed your quiz.','QUIZ',0,'2026-08-29 16:17:31'),(22,1,'System Update','LMS database sample data has been added.','SYSTEM',1,'2026-08-29 16:17:31');
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questions` (
  `question_id` int NOT NULL AUTO_INCREMENT,
  `quiz_id` int NOT NULL,
  `question_text` text NOT NULL,
  `option_a` varchar(500) NOT NULL,
  `option_b` varchar(500) NOT NULL,
  `option_c` varchar(500) NOT NULL,
  `option_d` varchar(500) NOT NULL,
  `correct_option` char(1) NOT NULL,
  `marks` decimal(10,2) NOT NULL,
  PRIMARY KEY (`question_id`),
  KEY `fk_question_quiz` (`quiz_id`),
  CONSTRAINT `fk_question_quiz` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`quiz_id`) ON DELETE CASCADE,
  CONSTRAINT `chk_correct_option` CHECK ((`correct_option` in (_utf8mb4'A',_utf8mb4'B',_utf8mb4'C',_utf8mb4'D')))
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (1,1,'Which keyword defines a function in Python?','func','define','def','function','C',5.00),(2,1,'Which data type stores True or False?','String','Boolean','Integer','Float','B',5.00),(3,2,'What does inheritance allow?','Code deletion','Code reuse','Database creation','File compression','B',5.00),(4,2,'Which feature allows modifying function behavior?','Decorator','Variable','Tuple','Comment','A',5.00),(5,3,'Which Excel feature summarizes data?','Pivot Table','Paint','Notepad','Calculator','A',5.00),(6,3,'Which function calculates average?','SUM','COUNT','AVERAGE','MAX','C',5.00),(7,4,'Which Python library is widely used for data analysis?','Pandas','Flask','Django','Tkinter','A',5.00),(8,4,'Which method displays the first rows of a DataFrame?','head()','top()','first()','show()','A',5.00),(9,5,'What is the median?','Largest value','Middle value','Smallest value','Total value','B',5.00),(10,5,'Which field combines statistics and programming?','Data Science','Networking','Graphic Design','Accounting','A',5.00),(11,6,'Which SQL command retrieves data?','SELECT','PUSH','FETCHALL','READTABLE','A',5.00),(12,6,'Which clause filters rows?','ORDER BY','WHERE','GROUP BY','JOIN','B',5.00),(13,7,'What is an index used for?','Faster queries','Changing passwords','Creating users','Deleting databases','A',5.00),(14,7,'Which system manages relational databases?','RDBMS','HTML','CSS','HTTP','A',5.00),(15,8,'Which language structures web pages?','HTML','SQL','Python','Java','A',5.00),(16,8,'Which language styles web pages?','CSS','SQL','C','PHP','A',5.00),(17,9,'What is React primarily used for?','UI development','Database backup','Networking','Cyber security','A',5.00),(18,9,'Which React feature manages state?','useState','useSQL','useData','useValue','A',5.00),(19,10,'Which platform is used for Android development?','Android Studio','Power BI','Tableau','MySQL','A',5.00),(20,10,'Which format is commonly used for API data?','JSON','BMP','EXE','DLL','A',5.00),(21,11,'What does AI stand for?','Automated Internet','Artificial Intelligence','Advanced Interface','Application Integration','B',5.00),(22,11,'Which is an AI application?','Speech recognition','Spreadsheet formatting','File copying','Disk cleanup','A',5.00),(23,12,'Which algorithm is used for classification?','Logistic Regression','Linear Search','Bubble Sort','Binary Search','A',5.00),(24,12,'Which technique groups similar records?','Clustering','Sorting','Parsing','Indexing','A',5.00),(25,13,'What does AWS provide?','Cloud services','Only spreadsheets','Only databases','Only antivirus','A',5.00),(26,13,'Which AWS service provides object storage?','S3','EC2','IAM','Route53','A',5.00),(27,14,'What protects accounts from unauthorized access?','Authentication','Formatting','Compression','Compilation','A',5.00),(28,14,'What converts readable data into protected form?','Encryption','Sorting','Indexing','Parsing','A',5.00),(29,15,'What does CI stand for in DevOps?','Continuous Integration','Code Inspection','Cloud Interface','Computer Integration','A',5.00),(30,15,'Which technology creates containers?','Docker','Excel','Power BI','MySQL','A',5.00),(31,16,'What is testing used for?','Finding defects','Creating databases','Writing emails','Designing logos','A',5.00),(32,16,'Which tool automates browsers?','Selenium','NumPy','Pandas','MySQL','A',5.00),(33,17,'What does UX focus on?','User experience','Database indexes','Server hardware','Programming syntax','A',5.00),(34,17,'What is a wireframe?','Basic design layout','Database table','Programming language','Cloud server','A',5.00),(35,18,'Which language is used for Power BI calculations?','DAX','HTML','Java','C++','A',5.00),(36,18,'Which Power BI tool transforms data?','Power Query','PowerPoint','PowerShell','Power Automate','A',5.00),(37,19,'Which tool creates interactive visualizations?','Tableau','Notepad','Git','MySQL','A',5.00),(38,19,'What is a dashboard?','Visual collection of data','Database password','Programming compiler','File system','A',5.00),(39,20,'What does SEO stand for?','Search Engine Optimization','Social Email Operation','Server Engine Output','Search Entry Option','A',5.00),(40,20,'Which channel is used for online promotion?','Social Media','BIOS','RAM','CPU','A',5.00);
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_answers`
--

DROP TABLE IF EXISTS `quiz_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quiz_answers` (
  `answer_id` int NOT NULL AUTO_INCREMENT,
  `attempt_id` int NOT NULL,
  `question_id` int NOT NULL,
  `selected_option` char(1) DEFAULT NULL,
  `marks_awarded` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`answer_id`),
  UNIQUE KEY `unique_attempt_question` (`attempt_id`,`question_id`),
  KEY `fk_answer_question` (`question_id`),
  CONSTRAINT `fk_answer_attempt` FOREIGN KEY (`attempt_id`) REFERENCES `quiz_attempts` (`attempt_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_answer_question` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`),
  CONSTRAINT `chk_selected_option` CHECK (((`selected_option` is null) or (`selected_option` in (_utf8mb4'A',_utf8mb4'B',_utf8mb4'C',_utf8mb4'D'))))
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_answers`
--

LOCK TABLES `quiz_answers` WRITE;
/*!40000 ALTER TABLE `quiz_answers` DISABLE KEYS */;
INSERT INTO `quiz_answers` VALUES (1,1,1,'C',5.00),(2,1,2,'B',5.00),(3,2,11,'A',5.00),(4,2,12,'A',5.00),(5,3,35,'A',5.00),(6,3,36,'A',5.00),(7,4,1,'A',0.00),(8,4,2,'C',0.00),(9,5,1,'C',5.00),(10,5,2,'B',5.00),(11,6,5,'A',5.00),(12,6,6,'C',5.00),(13,7,9,'A',5.00),(14,7,10,'A',5.00),(15,8,11,'A',5.00),(16,8,12,'A',5.00),(17,9,7,'A',5.00),(18,9,8,'A',5.00),(19,10,1,'C',5.00),(20,10,2,'B',5.00),(21,11,23,'A',5.00),(22,11,24,'A',5.00),(23,12,11,'A',5.00),(24,12,12,'A',5.00),(25,13,17,'A',5.00),(26,13,18,'A',5.00),(27,14,19,'A',5.00),(28,14,20,'B',5.00),(29,15,25,'A',5.00),(30,15,26,'A',5.00),(31,16,31,'A',5.00),(32,16,32,'B',5.00),(33,17,27,'A',5.00),(34,17,28,'A',5.00),(35,18,33,'A',5.00),(36,18,34,'A',5.00),(37,19,39,'A',5.00),(38,19,40,'A',5.00);
/*!40000 ALTER TABLE `quiz_answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_attempts`
--

DROP TABLE IF EXISTS `quiz_attempts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quiz_attempts` (
  `attempt_id` int NOT NULL AUTO_INCREMENT,
  `quiz_id` int NOT NULL,
  `student_id` int NOT NULL,
  `attempt_number` int NOT NULL,
  `score` decimal(10,2) DEFAULT NULL,
  `status` enum('IN_PROGRESS','SUBMITTED','PASSED','FAILED') DEFAULT 'IN_PROGRESS',
  `started_at` datetime NOT NULL,
  `submitted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`attempt_id`),
  UNIQUE KEY `unique_quiz_attempt` (`quiz_id`,`student_id`,`attempt_number`),
  KEY `fk_attempt_student` (`student_id`),
  CONSTRAINT `fk_attempt_quiz` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`quiz_id`),
  CONSTRAINT `fk_attempt_student` FOREIGN KEY (`student_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_attempts`
--

LOCK TABLES `quiz_attempts` WRITE;
/*!40000 ALTER TABLE `quiz_attempts` DISABLE KEYS */;
INSERT INTO `quiz_attempts` VALUES (1,1,7,1,90.00,'PASSED','2026-08-10 12:00:00','2026-08-10 12:25:00'),(2,6,7,1,85.00,'PASSED','2026-08-12 12:00:00','2026-08-12 12:25:00'),(3,18,7,1,75.00,'PASSED','2026-08-20 12:00:00','2026-08-20 12:20:00'),(4,1,8,1,55.00,'FAILED','2026-08-15 12:00:00','2026-08-15 12:25:00'),(5,1,8,2,80.00,'PASSED','2026-08-16 12:00:00','2026-08-16 12:22:00'),(6,3,9,1,95.00,'PASSED','2026-08-15 12:00:00','2026-08-15 12:20:00'),(7,5,9,1,70.00,'PASSED','2026-08-17 12:00:00','2026-08-17 12:25:00'),(8,6,10,1,65.00,'PASSED','2026-08-18 12:00:00','2026-08-18 12:25:00'),(9,4,11,1,88.00,'PASSED','2026-08-18 12:00:00','2026-08-18 12:22:00'),(10,1,12,1,60.00,'PASSED','2026-08-19 12:00:00','2026-08-19 12:20:00'),(11,12,13,1,92.00,'PASSED','2026-08-20 12:00:00','2026-08-20 12:25:00'),(12,6,14,1,78.00,'PASSED','2026-08-21 12:00:00','2026-08-21 12:20:00'),(13,9,15,1,68.00,'PASSED','2026-08-21 12:00:00','2026-08-21 12:25:00'),(14,13,16,1,72.00,'PASSED','2026-08-22 12:00:00','2026-08-22 12:20:00'),(15,3,17,1,82.00,'PASSED','2026-08-22 12:00:00','2026-08-22 12:20:00'),(16,4,18,1,58.00,'FAILED','2026-08-23 12:00:00','2026-08-23 12:25:00'),(17,14,19,1,90.00,'PASSED','2026-08-23 12:00:00','2026-08-23 12:20:00'),(18,6,20,1,76.00,'PASSED','2026-08-24 12:00:00','2026-08-24 12:20:00'),(19,20,21,1,84.00,'PASSED','2026-08-24 12:00:00','2026-08-24 12:20:00');
/*!40000 ALTER TABLE `quiz_attempts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quizzes`
--

DROP TABLE IF EXISTS `quizzes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quizzes` (
  `quiz_id` int NOT NULL AUTO_INCREMENT,
  `course_id` int NOT NULL,
  `module_id` int DEFAULT NULL,
  `title` varchar(200) NOT NULL,
  `description` text,
  `time_limit` int NOT NULL,
  `maximum_attempts` int NOT NULL,
  `passing_score` decimal(5,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `is_final_assessment` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`quiz_id`),
  KEY `fk_quiz_course` (`course_id`),
  CONSTRAINT `fk_quiz_course` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`),
  CONSTRAINT `chk_final_assessment_is_course_level` CHECK (((`is_final_assessment` <> 1) or (`module_id` is null)))
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quizzes`
--

LOCK TABLES `quizzes` WRITE;
/*!40000 ALTER TABLE `quizzes` DISABLE KEYS */;
INSERT INTO `quizzes` VALUES (1,1,NULL,'Python Basics Quiz','Test your Python fundamentals.',30,3,60.00,'2026-08-29 16:06:35',1),(2,2,NULL,'Advanced Python Quiz','Test advanced Python knowledge.',30,3,60.00,'2026-08-29 16:06:35',1),(3,3,NULL,'Excel Quiz','Test Excel data analysis skills.',30,3,60.00,'2026-08-29 16:06:35',1),(4,4,NULL,'Python Analytics Quiz','Test Pandas and data analysis.',30,3,60.00,'2026-08-29 16:06:35',1),(5,5,NULL,'Data Science Quiz','Test data science fundamentals.',30,3,60.00,'2026-08-29 16:06:35',1),(6,6,NULL,'SQL Quiz','Test SQL knowledge.',30,3,60.00,'2026-08-29 16:06:35',1),(7,7,NULL,'MySQL Quiz','Test MySQL administration.',30,3,60.00,'2026-08-29 16:06:35',1),(8,8,NULL,'Web Development Quiz','Test HTML CSS and JavaScript.',30,3,60.00,'2026-08-29 16:06:35',1),(9,9,NULL,'React Quiz','Test React fundamentals.',30,3,60.00,'2026-08-29 16:06:35',1),(10,10,NULL,'Android Quiz','Test Android development.',30,3,60.00,'2026-08-29 16:06:35',1),(11,11,NULL,'AI Quiz','Test artificial intelligence concepts.',30,3,60.00,'2026-08-29 16:06:35',1),(12,12,NULL,'Machine Learning Quiz','Test machine learning concepts.',30,3,60.00,'2026-08-29 16:06:35',1),(13,13,NULL,'AWS Quiz','Test cloud computing knowledge.',30,3,60.00,'2026-08-29 16:06:35',1),(14,14,NULL,'Cyber Security Quiz','Test cyber security concepts.',30,3,60.00,'2026-08-29 16:06:35',1),(15,15,NULL,'DevOps Quiz','Test DevOps concepts.',30,3,60.00,'2026-08-29 16:06:35',1),(16,16,NULL,'Testing Quiz','Test software testing knowledge.',30,3,60.00,'2026-08-29 16:06:35',1),(17,17,NULL,'UI UX Quiz','Test design fundamentals.',30,3,60.00,'2026-08-29 16:06:35',1),(18,18,NULL,'Power BI Quiz','Test Power BI knowledge.',30,3,60.00,'2026-08-29 16:06:35',1),(19,19,NULL,'Tableau Quiz','Test Tableau knowledge.',30,3,60.00,'2026-08-29 16:06:35',1),(20,20,NULL,'Digital Marketing Quiz','Test digital marketing knowledge.',30,3,60.00,'2026-08-29 16:06:35',1);
/*!40000 ALTER TABLE `quizzes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `review_id` int NOT NULL AUTO_INCREMENT,
  `student_id` int NOT NULL,
  `course_id` int NOT NULL,
  `rating` int NOT NULL,
  `review_text` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`review_id`),
  UNIQUE KEY `unique_student_course_review` (`student_id`,`course_id`),
  KEY `fk_review_course` (`course_id`),
  CONSTRAINT `fk_review_course` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`),
  CONSTRAINT `fk_review_student` FOREIGN KEY (`student_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `chk_rating` CHECK ((`rating` between 1 and 5))
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (1,7,1,5,'Excellent Python course for beginners.','2026-08-29 16:16:54','2026-08-29 16:16:54'),(2,7,6,5,'Very useful SQL course.','2026-08-29 16:16:54','2026-08-29 16:16:54'),(3,8,1,4,'Good introduction to Python.','2026-08-29 16:16:54','2026-08-29 16:16:54'),(4,8,4,5,'Very useful for data analysis.','2026-08-29 16:16:54','2026-08-29 16:16:54'),(5,9,3,5,'Excel explanations were very clear.','2026-08-29 16:16:54','2026-08-29 16:16:54'),(6,9,5,4,'Good introduction to data science.','2026-08-29 16:16:54','2026-08-29 16:16:54'),(7,10,6,5,'Excellent SQL examples.','2026-08-29 16:16:54','2026-08-29 16:16:54'),(8,11,4,5,'Great Pandas lessons.','2026-08-29 16:16:54','2026-08-29 16:16:54'),(9,12,1,4,'Easy to understand.','2026-08-29 16:16:54','2026-08-29 16:16:54'),(10,13,12,5,'Machine learning concepts were explained well.','2026-08-29 16:16:54','2026-08-29 16:16:54'),(11,14,6,4,'Good advanced SQL content.','2026-08-29 16:16:54','2026-08-29 16:16:54'),(12,15,9,5,'React examples were excellent.','2026-08-29 16:16:54','2026-08-29 16:16:54'),(13,16,13,4,'Good AWS introduction.','2026-08-29 16:16:54','2026-08-29 16:16:54'),(14,17,18,5,'Power BI dashboard section was excellent.','2026-08-29 16:16:54','2026-08-29 16:16:54'),(15,18,4,4,'Useful course for analysts.','2026-08-29 16:16:54','2026-08-29 16:16:54'),(16,19,14,5,'Cyber security topics were well explained.','2026-08-29 16:16:54','2026-08-29 16:16:54'),(17,20,18,5,'Very practical Power BI course.','2026-08-29 16:16:54','2026-08-29 16:16:54'),(18,21,20,4,'Good digital marketing fundamentals.','2026-08-29 16:16:54','2026-08-29 16:16:54');
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) NOT NULL,
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `role_name` (`role_name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Administrator'),(3,'Student'),(2,'Trainer');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submissions`
--

DROP TABLE IF EXISTS `submissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `submissions` (
  `submission_id` int NOT NULL AUTO_INCREMENT,
  `assignment_id` int NOT NULL,
  `student_id` int NOT NULL,
  `file_path` varchar(500) DEFAULT NULL,
  `comments` text,
  `marks` decimal(10,2) DEFAULT NULL,
  `feedback` text,
  `status` enum('PENDING','SUBMITTED','LATE','EVALUATED') DEFAULT 'PENDING',
  `submitted_at` datetime DEFAULT NULL,
  `evaluated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`submission_id`),
  UNIQUE KEY `unique_assignment_student_submission` (`assignment_id`,`student_id`),
  KEY `fk_submission_student` (`student_id`),
  CONSTRAINT `fk_submission_assignment` FOREIGN KEY (`assignment_id`) REFERENCES `assignments` (`assignment_id`),
  CONSTRAINT `fk_submission_student` FOREIGN KEY (`student_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submissions`
--

LOCK TABLES `submissions` WRITE;
/*!40000 ALTER TABLE `submissions` DISABLE KEYS */;
INSERT INTO `submissions` VALUES (1,1,7,'/submissions/python-basics-sathish.zip','Completed all exercises.',90.00,'Good implementation.','EVALUATED','2026-08-15 18:00:00','2026-08-16 10:00:00'),(2,2,8,'/submissions/control-flow-vijay.zip','Loops and conditions completed.',82.00,'Good work.','EVALUATED','2026-08-17 17:00:00','2026-08-18 10:00:00'),(3,3,9,'/submissions/oop-anjali.zip','Implemented classes and inheritance.',88.00,'Very good implementation.','EVALUATED','2026-08-18 16:00:00','2026-08-19 10:00:00'),(4,4,10,'/submissions/excel-ravi.xlsx','Sales analysis completed.',91.00,'Excellent analysis.','EVALUATED','2026-08-18 18:00:00','2026-08-19 11:00:00'),(5,5,11,'/submissions/python-analysis-meena.ipynb','Pandas analysis completed.',86.00,'Good data analysis.','EVALUATED','2026-08-20 17:00:00','2026-08-21 10:00:00'),(6,6,12,'/submissions/statistics-ajay.xlsx','Statistics calculations completed.',79.00,'Good understanding.','EVALUATED','2026-08-21 17:00:00','2026-08-22 10:00:00'),(7,7,13,'/submissions/sql-sneha.sql','SQL queries submitted.',94.00,'Excellent SQL queries.','EVALUATED','2026-08-22 17:00:00','2026-08-23 10:00:00'),(8,8,14,'/submissions/advanced-sql-manoj.sql','Advanced queries completed.',85.00,'Good query design.','EVALUATED','2026-08-23 17:00:00','2026-08-24 10:00:00'),(9,10,15,'/submissions/html-deepa.zip','Website project submitted.',90.00,'Excellent website.','EVALUATED','2026-08-24 18:00:00','2026-08-25 10:00:00'),(10,21,17,'/submissions/powerbi-deepa.pbix','Dashboard submitted.',95.00,'Excellent dashboard design.','EVALUATED','2026-08-25 17:00:00','2026-08-26 10:00:00'),(11,2,7,'/submissions/control-flow-sathish.zip','Completed loops and conditions exercises.',88.00,'Well done.','EVALUATED','2026-08-29 16:20:00','2026-08-29 16:25:00');
/*!40000 ALTER TABLE `submissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role_id` int NOT NULL,
  `status` enum('ACTIVE','SUSPENDED','DEACTIVATED') DEFAULT 'ACTIVE',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`),
  KEY `fk_users_role` (`role_id`),
  CONSTRAINT `fk_users_role` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Admin User','admin@lms.com','$2b$12$LQv3c1yqBW6e7n9k8p4m6O9wJ7s8H2xQ1zR5tY6uI3oP4aS5dF6gH',1,'ACTIVE','2026-08-29 16:02:09','2026-08-29 16:02:09'),(2,'Arun Trainer','arun.trainer@lms.com','$2b$12$LQv3c1yqBW6e7n9k8p4m6O9wJ7s8H2xQ1zR5tY6uI3oP4aS5dF6gH',2,'ACTIVE','2026-08-29 16:02:09','2026-08-29 16:02:09'),(3,'Priya Trainer','priya.trainer@lms.com','$2b$12$LQv3c1yqBW6e7n9k8p4m6O9wJ7s8H2xQ1zR5tY6uI3oP4aS5dF6gH',2,'ACTIVE','2026-08-29 16:02:09','2026-08-29 16:02:09'),(4,'Rahul Trainer','rahul.trainer@lms.com','$2b$12$LQv3c1yqBW6e7n9k8p4m6O9wJ7s8H2xQ1zR5tY6uI3oP4aS5dF6gH',2,'ACTIVE','2026-08-29 16:02:09','2026-08-29 16:02:09'),(5,'Divya Trainer','divya.trainer@lms.com','$2b$12$LQv3c1yqBW6e7n9k8p4m6O9wJ7s8H2xQ1zR5tY6uI3oP4aS5dF6gH',2,'ACTIVE','2026-08-29 16:02:09','2026-08-29 16:02:09'),(6,'Karthik Trainer','karthik.trainer@lms.com','$2b$12$LQv3c1yqBW6e7n9k8p4m6O9wJ7s8H2xQ1zR5tY6uI3oP4aS5dF6gH',2,'ACTIVE','2026-08-29 16:02:09','2026-08-29 16:02:09'),(7,'Sathish Kumar','sathish@lms.com','$2b$12$LQv3c1yqBW6e7n9k8p4m6O9wJ7s8H2xQ1zR5tY6uI3oP4aS5dF6gH',3,'ACTIVE','2026-08-29 16:02:09','2026-08-29 16:02:09'),(8,'Vijay Kumar','vijay@lms.com','$2b$12$LQv3c1yqBW6e7n9k8p4m6O9wJ7s8H2xQ1zR5tY6uI3oP4aS5dF6gH',3,'ACTIVE','2026-08-29 16:02:09','2026-08-29 16:02:09'),(9,'Anjali Sharma','anjali@lms.com','$2b$12$LQv3c1yqBW6e7n9k8p4m6O9wJ7s8H2xQ1zR5tY6uI3oP4aS5dF6gH',3,'ACTIVE','2026-08-29 16:02:09','2026-08-29 16:02:09'),(10,'Ravi Shankar','ravi@lms.com','$2b$12$LQv3c1yqBW6e7n9k8p4m6O9wJ7s8H2xQ1zR5tY6uI3oP4aS5dF6gH',3,'ACTIVE','2026-08-29 16:02:09','2026-08-29 16:02:09'),(11,'Meena Raj','meena@lms.com','$2b$12$LQv3c1yqBW6e7n9k8p4m6O9wJ7s8H2xQ1zR5tY6uI3oP4aS5dF6gH',3,'ACTIVE','2026-08-29 16:02:09','2026-08-29 16:02:09'),(12,'Ajay Kumar','ajay@lms.com','$2b$12$LQv3c1yqBW6e7n9k8p4m6O9wJ7s8H2xQ1zR5tY6uI3oP4aS5dF6gH',3,'ACTIVE','2026-08-29 16:02:09','2026-08-29 16:02:09'),(13,'Sneha Reddy','sneha@lms.com','$2b$12$LQv3c1yqBW6e7n9k8p4m6O9wJ7s8H2xQ1zR5tY6uI3oP4aS5dF6gH',3,'ACTIVE','2026-08-29 16:02:09','2026-08-29 16:02:09'),(14,'Manoj Kumar','manoj@lms.com','$2b$12$LQv3c1yqBW6e7n9k8p4m6O9wJ7s8H2xQ1zR5tY6uI3oP4aS5dF6gH',3,'ACTIVE','2026-08-29 16:02:09','2026-08-29 16:02:09'),(15,'Deepa Mohan','deepa@lms.com','$2b$12$LQv3c1yqBW6e7n9k8p4m6O9wJ7s8H2xQ1zR5tY6uI3oP4aS5dF6gH',3,'ACTIVE','2026-08-29 16:02:09','2026-08-29 16:02:09'),(16,'Hari Prasad','hari@lms.com','$2b$12$LQv3c1yqBW6e7n9k8p4m6O9wJ7s8H2xQ1zR5tY6uI3oP4aS5dF6gH',3,'ACTIVE','2026-08-29 16:02:09','2026-08-29 16:02:09'),(17,'Lakshmi Devi','lakshmi@lms.com','$2b$12$LQv3c1yqBW6e7n9k8p4m6O9wJ7s8H2xQ1zR5tY6uI3oP4aS5dF6gH',3,'ACTIVE','2026-08-29 16:02:09','2026-08-29 16:02:09'),(18,'Naveen Raj','naveen@lms.com','$2b$12$LQv3c1yqBW6e7n9k8p4m6O9wJ7s8H2xQ1zR5tY6uI3oP4aS5dF6gH',3,'ACTIVE','2026-08-29 16:02:09','2026-08-29 16:02:09'),(19,'Pooja Singh','pooja@lms.com','$2b$12$LQv3c1yqBW6e7n9k8p4m6O9wJ7s8H2xQ1zR5tY6uI3oP4aS5dF6gH',3,'ACTIVE','2026-08-29 16:02:09','2026-08-29 16:02:09'),(20,'Vignesh Kumar','vignesh@lms.com','$2b$12$LQv3c1yqBW6e7n9k8p4m6O9wJ7s8H2xQ1zR5tY6uI3oP4aS5dF6gH',3,'ACTIVE','2026-08-29 16:02:09','2026-08-29 16:02:09'),(21,'Aishwarya N','aishwarya@lms.com','$2b$12$LQv3c1yqBW6e7n9k8p4m6O9wJ7s8H2xQ1zR5tY6uI3oP4aS5dF6gH',3,'ACTIVE','2026-08-29 16:02:09','2026-08-29 16:02:09');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-01 11:55:28
