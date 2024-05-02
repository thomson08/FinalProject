-- MySQL dump 10.13  Distrib 8.0.36, for macos14 (arm64)
--
-- Host: localhost    Database: Fitness
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `daily_log`
--

DROP TABLE IF EXISTS `daily_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `daily_log` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `date` date DEFAULT NULL,
  `total_caloric_burn` int DEFAULT NULL,
  `total_caloric_intake` int DEFAULT NULL,
  `notes` text,
  PRIMARY KEY (`log_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `daily_log_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daily_log`
--

LOCK TABLES `daily_log` WRITE;
/*!40000 ALTER TABLE `daily_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `daily_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `daily_log_meal`
--

DROP TABLE IF EXISTS `daily_log_meal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `daily_log_meal` (
  `log_id` int NOT NULL,
  `meal_id` int NOT NULL,
  `time` time NOT NULL,
  `servings` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`log_id`,`meal_id`),
  KEY `meal_id` (`meal_id`),
  CONSTRAINT `daily_log_meal_ibfk_1` FOREIGN KEY (`log_id`) REFERENCES `daily_log` (`log_id`),
  CONSTRAINT `daily_log_meal_ibfk_2` FOREIGN KEY (`meal_id`) REFERENCES `meal` (`meal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daily_log_meal`
--

LOCK TABLES `daily_log_meal` WRITE;
/*!40000 ALTER TABLE `daily_log_meal` DISABLE KEYS */;
/*!40000 ALTER TABLE `daily_log_meal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exercise`
--

DROP TABLE IF EXISTS `exercise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exercise` (
  `exercise_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(35) NOT NULL,
  `muscle_group` varchar(35) NOT NULL,
  `description` text,
  `MET_value` decimal(5,2) DEFAULT NULL,
  `10_reps_time_secs` int DEFAULT NULL,
  PRIMARY KEY (`exercise_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exercise`
--

LOCK TABLES `exercise` WRITE;
/*!40000 ALTER TABLE `exercise` DISABLE KEYS */;
/*!40000 ALTER TABLE `exercise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fitness_target`
--

DROP TABLE IF EXISTS `fitness_target`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fitness_target` (
  `user_id` int NOT NULL,
  `weight` decimal(5,2) DEFAULT NULL,
  `body_fat_percentage` decimal(4,2) DEFAULT NULL,
  `daily_caloric_intake` int DEFAULT NULL,
  `daily_carb_intake_grams` int DEFAULT NULL,
  `daily_protein_intake_grams` int DEFAULT NULL,
  `daily_fat_intake_grams` int DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fitness_target_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fitness_target`
--

LOCK TABLES `fitness_target` WRITE;
/*!40000 ALTER TABLE `fitness_target` DISABLE KEYS */;
/*!40000 ALTER TABLE `fitness_target` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meal`
--

DROP TABLE IF EXISTS `meal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meal` (
  `meal_id` int NOT NULL AUTO_INCREMENT,
  `creator_id` int NOT NULL,
  `recipe` text NOT NULL,
  `serving_size` decimal(5,2) DEFAULT NULL,
  `serving_unit` varchar(25) DEFAULT NULL,
  `calories_per_serving` int DEFAULT NULL,
  `carbs_per_serving` decimal(5,2) DEFAULT NULL,
  `protein_per_serving` decimal(5,2) DEFAULT NULL,
  `fat_per_serving` decimal(5,2) DEFAULT NULL,
  `public` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`meal_id`),
  KEY `creator_id` (`creator_id`),
  CONSTRAINT `meal_ibfk_1` FOREIGN KEY (`creator_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meal`
--

LOCK TABLES `meal` WRITE;
/*!40000 ALTER TABLE `meal` DISABLE KEYS */;
/*!40000 ALTER TABLE `meal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `program`
--

DROP TABLE IF EXISTS `program`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `program` (
  `program_id` int NOT NULL AUTO_INCREMENT,
  `creator_id` int NOT NULL,
  `program_name` varchar(35) NOT NULL,
  `description` text,
  `days_per_week` int NOT NULL,
  `public` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`program_id`),
  KEY `creator_id` (`creator_id`),
  CONSTRAINT `program_ibfk_1` FOREIGN KEY (`creator_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `program`
--

LOCK TABLES `program` WRITE;
/*!40000 ALTER TABLE `program` DISABLE KEYS */;
/*!40000 ALTER TABLE `program` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `program_workout`
--

DROP TABLE IF EXISTS `program_workout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `program_workout` (
  `program_id` int NOT NULL,
  `workout_id` int NOT NULL,
  `day_number` int NOT NULL,
  PRIMARY KEY (`program_id`,`workout_id`),
  KEY `workout_id` (`workout_id`),
  CONSTRAINT `program_workout_ibfk_1` FOREIGN KEY (`program_id`) REFERENCES `program` (`program_id`),
  CONSTRAINT `program_workout_ibfk_2` FOREIGN KEY (`workout_id`) REFERENCES `workout` (`workout_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `program_workout`
--

LOCK TABLES `program_workout` WRITE;
/*!40000 ALTER TABLE `program_workout` DISABLE KEYS */;
/*!40000 ALTER TABLE `program_workout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `session`
--

DROP TABLE IF EXISTS `session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `session` (
  `session_id` int NOT NULL AUTO_INCREMENT,
  `log_id` int NOT NULL,
  `workout_id` int DEFAULT NULL,
  `start_time` time NOT NULL,
  `duration_mins` int DEFAULT NULL,
  `cals_burned` int DEFAULT NULL,
  `weight_moved` decimal(10,2) DEFAULT NULL,
  `notes` text,
  PRIMARY KEY (`session_id`),
  KEY `log_id` (`log_id`),
  KEY `workout_id` (`workout_id`),
  CONSTRAINT `session_ibfk_1` FOREIGN KEY (`log_id`) REFERENCES `daily_log` (`log_id`),
  CONSTRAINT `session_ibfk_2` FOREIGN KEY (`workout_id`) REFERENCES `workout` (`workout_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session`
--

LOCK TABLES `session` WRITE;
/*!40000 ALTER TABLE `session` DISABLE KEYS */;
/*!40000 ALTER TABLE `session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `session_exercise`
--

DROP TABLE IF EXISTS `session_exercise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `session_exercise` (
  `session_id` int NOT NULL,
  `exercise_id` int NOT NULL,
  `set_number` int NOT NULL,
  `reps` int NOT NULL,
  `weight` decimal(4,2) NOT NULL,
  PRIMARY KEY (`session_id`,`exercise_id`),
  KEY `exercise_id` (`exercise_id`),
  CONSTRAINT `session_exercise_ibfk_1` FOREIGN KEY (`session_id`) REFERENCES `session` (`session_id`),
  CONSTRAINT `session_exercise_ibfk_2` FOREIGN KEY (`exercise_id`) REFERENCES `exercise` (`exercise_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session_exercise`
--

LOCK TABLES `session_exercise` WRITE;
/*!40000 ALTER TABLE `session_exercise` DISABLE KEYS */;
/*!40000 ALTER TABLE `session_exercise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(35) NOT NULL,
  `password` varchar(18) NOT NULL,
  `current_program` int DEFAULT NULL,
  `first_name` varchar(35) NOT NULL,
  `last_name` varchar(35) NOT NULL,
  `height` decimal(5,2) NOT NULL,
  `weight` decimal(5,2) NOT NULL,
  `body_fat_percentage` decimal(4,2) DEFAULT NULL,
  `dob` date NOT NULL,
  `gender` varchar(35) DEFAULT NULL,
  `unit_type` enum('metric','imperial') NOT NULL DEFAULT 'metric',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`),
  KEY `user_ibfk_1` (`current_program`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`current_program`) REFERENCES `program` (`program_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workout`
--

DROP TABLE IF EXISTS `workout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workout` (
  `workout_id` int NOT NULL AUTO_INCREMENT,
  `workout_name` varchar(35) NOT NULL,
  `approx_duration_mins` int DEFAULT NULL,
  PRIMARY KEY (`workout_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workout`
--

LOCK TABLES `workout` WRITE;
/*!40000 ALTER TABLE `workout` DISABLE KEYS */;
/*!40000 ALTER TABLE `workout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workout_exercise`
--

DROP TABLE IF EXISTS `workout_exercise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workout_exercise` (
  `workout_id` int NOT NULL,
  `exercise_id` int NOT NULL,
  `set_number` int NOT NULL,
  `reps` int NOT NULL,
  PRIMARY KEY (`workout_id`,`exercise_id`),
  KEY `exercise_id` (`exercise_id`),
  CONSTRAINT `workout_exercise_ibfk_1` FOREIGN KEY (`workout_id`) REFERENCES `workout` (`workout_id`),
  CONSTRAINT `workout_exercise_ibfk_2` FOREIGN KEY (`exercise_id`) REFERENCES `exercise` (`exercise_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workout_exercise`
--

LOCK TABLES `workout_exercise` WRITE;
/*!40000 ALTER TABLE `workout_exercise` DISABLE KEYS */;
/*!40000 ALTER TABLE `workout_exercise` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-30 15:00:11
