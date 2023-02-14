/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80032
 Source Host           : localhost:3306
 Source Schema         : e_hostpital_db

 Target Server Type    : MySQL
 Target Server Version : 80032
 File Encoding         : 65001

 Date: 13/02/2023 00:24:47
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for bloodpressure
-- ----------------------------
DROP TABLE IF EXISTS `bloodpressure`;
CREATE TABLE `bloodpressure`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `patient_id` int(0) NOT NULL,
  `doctor_id` int(0) NOT NULL,
  `RecordDate` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `patient_id`(`patient_id`) USING BTREE,
  INDEX `doctor_id`(`doctor_id`) USING BTREE,
  CONSTRAINT `bloodpressure_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients_registration` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `bloodpressure_ibfk_2` FOREIGN KEY (`doctor_id`) REFERENCES `doctors_registration` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cancers
-- ----------------------------
DROP TABLE IF EXISTS `cancers`;
CREATE TABLE `cancers`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `patient_id` int(0) NOT NULL,
  `doctor_id` int(0) NOT NULL,
  `CancerType` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `RecordDate` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `patient_id`(`patient_id`) USING BTREE,
  INDEX `doctor_id`(`doctor_id`) USING BTREE,
  CONSTRAINT `cancers_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients_registration` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `cancers_ibfk_2` FOREIGN KEY (`doctor_id`) REFERENCES `doctors_registration` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for clinic_admin
-- ----------------------------
DROP TABLE IF EXISTS `clinic_admin`;
CREATE TABLE `clinic_admin`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `ClinicName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Phone` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Location` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `City` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Province` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Country` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `PostalCode` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of clinic_admin
-- ----------------------------
INSERT INTO `clinic_admin` VALUES (3, 'Test', '6131112222', 'First Ave', 'Ottawa', 'Ontario', 'Canada', 'K1SK1S');

-- ----------------------------
-- Table structure for clinic_servicehistory
-- ----------------------------
DROP TABLE IF EXISTS `clinic_servicehistory`;
CREATE TABLE `clinic_servicehistory`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `patient_id` int(0) NOT NULL,
  `clinic_id` int(0) NOT NULL,
  `IsWalkIn` int(0) NOT NULL,
  `ServiceDate` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `patient_id`(`patient_id`) USING BTREE,
  INDEX `clinic_id`(`clinic_id`) USING BTREE,
  CONSTRAINT `clinic_servicehistory_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients_registration` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `clinic_servicehistory_ibfk_2` FOREIGN KEY (`clinic_id`) REFERENCES `clinic_admin` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of clinic_servicehistory
-- ----------------------------
INSERT INTO `clinic_servicehistory` VALUES (1, 1, 3, 1, '2023-01-19 00:00:00');
INSERT INTO `clinic_servicehistory` VALUES (2, 1, 3, 1, '2023-01-19 20:25:01');
INSERT INTO `clinic_servicehistory` VALUES (3, 1, 3, 0, '2023-01-30 15:50:30');

-- ----------------------------
-- Table structure for doctors_registration
-- ----------------------------
DROP TABLE IF EXISTS `doctors_registration`;
CREATE TABLE `doctors_registration`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `Fname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Mname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Lname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Age` int(0) NOT NULL,
  `bloodGroup` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `MobileNumber` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `EmailId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ConfirmEmail` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Location1` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Location2` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `PostalCode` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `City` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Province` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Country` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Medical_LICENSE_Number` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `DLNumber` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Specialization` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `PractincingHospital` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Gender` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `uuid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `verification` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of doctors_registration
-- ----------------------------
INSERT INTO `doctors_registration` VALUES (1, 'Demo', '', 'Test', 18, 'O', '123456789', 'test@test.com', 'test@test.com', 'Ottawa', '', 'Test', 'Ottawa', 'ON', 'Canada', '123456789-ABC', '123456789-ABC', '123456789-ABC', '123456789-ABC', 'Male', 'DOC123', 'DOC123', 1);
INSERT INTO `doctors_registration` VALUES (5, 'a', 'a', 'a', 0, 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'DOC-ON-a-a-6033310000', 'a8d3bdc110bf60c3dc114e27f1706a3c', 0);

-- ----------------------------
-- Table structure for hospital_admin
-- ----------------------------
DROP TABLE IF EXISTS `hospital_admin`;
CREATE TABLE `hospital_admin`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `Hospital_Name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Email_Id` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Confirm_Email` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Location1` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Location2` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `PostalCode` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `City` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Province` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Country` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Facilities_departments​` int(0) NOT NULL,
  `Number_Doctors` int(0) NOT NULL,
  `Number_Nurse` int(0) NOT NULL,
  `No_Admins` int(0) NOT NULL,
  `Patients_per_year` int(0) NOT NULL,
  `​Tax_registration_number​` int(0) NOT NULL,
  `uuid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `verification` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hospital_admin
-- ----------------------------
INSERT INTO `hospital_admin` VALUES (1, 'Ottawa', 'admin@admin.com', 'admin@admin.com', '1', '2', '31312', 'Lahore', 'Canada', 'ON', 0, 0, 0, 0, 0, 0, 'admin', 'admin', 1);
INSERT INTO `hospital_admin` VALUES (6, 'test', 'test@test', 'test@test', 'test', 'test', 'k1sk1s', 'ottawa', 'canada', 'on', 1, 1, 1, 1, 1, 1, 'HOS-3936010000', '2af685682b4e4c649685dfe26a645621', 0);
INSERT INTO `hospital_admin` VALUES (7, 'test1', 'test1@test', 'test1@test', 'test1', 'test1', 'k1sk1s', 'ottawa', 'canada', 'on', 1, 1, 1, 1, 1, 1, 'HOS-8449010000', 'da0afcaec024a50bdc25b87cf78d06b7', 0);
INSERT INTO `hospital_admin` VALUES (8, 'ohsfodsh', 'sdjfsdf', 'lsdjsl', 'jlsjd', 'jlsjd', 'jldsjdslkd', 'jlsdjsld', 'sljdjsdls', 'jsldjsldjsld', 0, 0, 0, 0, 0, 0, 'HOS-2537410000', '57fa2a6ab965ca1effdeacac5e8aaef2', 0);
INSERT INTO `hospital_admin` VALUES (9, 'aoifds', 'dfgdgfd', 'dfgdfgd', 'fffff', 'fffff', 'fsdfsdfsd', 'Ottawa', 'Canada', 'ON', 0, 10, 11, 12, 13, 14, 'HOS-1555010000', 'de4ee470f7a1d79c73f60e715ecf3515', 0);
INSERT INTO `hospital_admin` VALUES (10, 'r', 'r', 'r', 'r', 'r', 'r', 'r', 'r', 'r', 0, 0, 0, 0, 0, 0, 'HOS-4145210000', '9a2ca4689daa3c11f47f32d1217ca4a5', 0);
INSERT INTO `hospital_admin` VALUES (11, 'ffdf', 'ddddffd', 'ddfdfdf', 'dfddfdffddf', 'dfddfdffddf', 'dfdddf', 'fdfdfddd', 'fdfdfddffd', 'dfdfdfdffd', 0, 0, 0, 0, 0, 0, 'HOS-7711810000', 'c22ec73a949d9eb4a97b618f067ff7f1', 0);
INSERT INTO `hospital_admin` VALUES (12, 'dfsdf', 'fsdfsf', 'dsfsdfds', 'dsfsdf', 'dsfsdf', 'dsfsdf', 'dfsfds', 'dsdfsf', 'dsfsd', 0, 0, 0, 0, 0, 0, 'HOS-6906410000', 'd01edcc1332aeb5c485e096be99d3fe8', 0);
INSERT INTO `hospital_admin` VALUES (13, 'dfsdf', 'fsdfsf', 'dsfsdfds', 'dsfsdf', 'dsfsdf', 'dsfsdf', 'dfsfds', 'dsdfsf', 'dsfsd', 0, 0, 0, 0, 0, 0, 'HOS-7892110000', '59a005d76540ee3f8829c7a5379076af', 0);
INSERT INTO `hospital_admin` VALUES (14, 'dfsdf', 'fsdfsf', 'dsfsdfds', 'dsfsdf', 'dsfsdf', 'dsfsdf', 'dfsfds', 'dsdfsf', 'dsfsd', 0, 0, 0, 0, 0, 0, 'HOS-6634610000', 'cddc7e87c779f01d68a92937d34456f8', 0);
INSERT INTO `hospital_admin` VALUES (15, 'dfsdf', 'fsdfsf', 'dsfsdfds', 'dsfsdf', 'dsfsdf', 'dsfsdf', 'dfsfds', 'dsdfsf', 'dsfsd', 0, 0, 0, 0, 0, 0, 'HOS-4088310000', 'd56946cf608db036f69a42feae6d695c', 0);
INSERT INTO `hospital_admin` VALUES (16, 'dfsdf', 'fsdfsf', 'dsfsdfds', 'dsfsdf', 'dsfsdf', 'dsfsdf', 'dfsfds', 'dsdfsf', 'dsfsd', 0, 0, 0, 0, 0, 0, 'HOS-5604910000', 'bb79b263292dacd1f6b9b73d5a3d4e2b', 0);
INSERT INTO `hospital_admin` VALUES (17, 'dfsdf', 'fsdfsf', 'dsfsdfds', 'dsfsdf', 'dsfsdf', 'dsfsdf', 'dfsfds', 'dsdfsf', 'dsfsd', 0, 0, 0, 0, 0, 0, 'HOS-1361610000', '3cf371d39bd3070d24f500a50102da44', 0);
INSERT INTO `hospital_admin` VALUES (18, 'dfsdf', 'fsdfsf', 'dsfsdfds', 'dsfsdf', 'dsfsdf', 'dsfsdf', 'dfsfds', 'dsdfsf', 'dsfsd', 0, 0, 0, 0, 0, 0, 'HOS-6070510000', '62a0c1171c004aa53519e0813c6b0502', 0);
INSERT INTO `hospital_admin` VALUES (19, 'dfsdf', 'andre.band2000@gmail.com', 'andre.band2000@gmail.com', 'dsfsdf', 'dsfsdf', 'dsfsdf', 'dfsfds', 'dsdfsf', 'dsfsd', 0, 0, 0, 0, 0, 0, 'HOS-4263210000', '4bc1a425518bbde1102bd80f1051ef98', 0);
INSERT INTO `hospital_admin` VALUES (20, 'sds', 'alireza2777@gmail.com', 'alireza2777@gmail.com', 'dgd', 'dgd', 'dgd', 'kjlk', 'jljl', 'jllj', 0, 0, 0, 0, 0, 0, 'HOS-1012010000', 'b8099e6f145a5de2056ec0645ba21876', 0);
INSERT INTO `hospital_admin` VALUES (21, 'sjdhjsakd', 'sadathosseiny.hossein@gmail.co', 'sadathosseiny.hossein@gmail.co', 'qwqw', 'qwqw', 'K2P 1S4', 'ottawa', 'Canada', 'Ontario', 0, 0, 0, 0, 0, 0, 'HOS-351310000', '25e8d768782a227c26e280255138b514', 0);
INSERT INTO `hospital_admin` VALUES (22, 'Ssxzcz', 'sadathosseiny.hossein@gmail.co', 'sadathosseiny.hossein@gmail.co', 'saas', 'saas', 'K2P 1S4', 'ottawa', 'Canada', 'Ontario', 0, 0, 0, 0, 0, 0, 'HOS-4247610000', '3ba752d6d84586c52a99b9d4bd34a22d', 0);

-- ----------------------------
-- Table structure for master_admin
-- ----------------------------
DROP TABLE IF EXISTS `master_admin`;
CREATE TABLE `master_admin`  (
  `id` int(0) NOT NULL,
  `userName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of master_admin
-- ----------------------------
INSERT INTO `master_admin` VALUES (0, 'ADM-M-CA-01', 'E@hospital01', 'uottawabiomedicalsystems@gmail');
INSERT INTO `master_admin` VALUES (2, 'admin', 'admin', 'admin@example.com');

-- ----------------------------
-- Table structure for medialboodpressure
-- ----------------------------
DROP TABLE IF EXISTS `medialboodpressure`;
CREATE TABLE `medialboodpressure`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `patient_id` int(0) NOT NULL,
  `doctor_id` int(0) NOT NULL,
  `RecordDate` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `patient_id`(`patient_id`) USING BTREE,
  INDEX `doctor_id`(`doctor_id`) USING BTREE,
  CONSTRAINT `medialboodpressure_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients_registration` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `medialboodpressure_ibfk_2` FOREIGN KEY (`doctor_id`) REFERENCES `doctors_registration` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for patients_registration
-- ----------------------------
DROP TABLE IF EXISTS `patients_registration`;
CREATE TABLE `patients_registration`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `FName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `MName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `LName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Age` int(0) NOT NULL,
  `BloodGroup` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `MobileNumber` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `EmailId` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Location` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `PostalCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `City` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Province` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `HCardNumber` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `PassportNumber` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `PRNumber` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `DLNumber` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Gender` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `uuid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `verification` tinyint(1) NULL DEFAULT NULL,
  `isSick` int(0) NULL DEFAULT NULL COMMENT 'type 1: sicked, type 2: unsicked',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patients_registration
-- ----------------------------
INSERT INTO `patients_registration` VALUES (1, 'Test', '', 'Demo', 18, 'O', '123456789', 'test@test.com', 'Testing Address', 'Ottawa', 'Test123', 'Ottawa', 'Ontario', '123456789-ABC', '123456789-ABC', '123456789-ABC', '123456789-ABC', 'Male', 'PAT123', 'PAT123', 1, 1);
INSERT INTO `patients_registration` VALUES (7, 'demo', '12', 'demo', 12, 'O', '123456789', 'demo@admin.com', 'University', 'Ottawa', 'Ottawa', 'Ottawa', '122324465', '12324325', '1263521365123', '235613213615', '21365123621536', 'Male', 'PAT-ON-12-122324465-5622310000', 'a9b2f4e0b8d81cdc0d276b9e757417b6', 1, 0);
INSERT INTO `patients_registration` VALUES (8, 'Yolo', 'Polo', 'Golo', 35, 'O', '2436576879', 'TRETFTHT@gmail.com', '1234', 'Ottawa', 'k1bfhyt', 'dgry', 'wfey5', 'grty6tughjyk', 'ngfjyuiytuky', 'frhgjgykumvm', 'nhyjtyitu76ti', 'Male', 'PAT-ON-35-wfey5-7648010000', 'e143e66717960f8f24978ea7d20bcf37', 0, 0);
INSERT INTO `patients_registration` VALUES (9, 'Dongchen', ' ', 'Gu', 24, 'B', '', 'dgu068@uottawa.ca', '320 Maclaren street', 'ottawa', 'K2P 0M6', 'ottawa', 'ontario', 'n/a', 'n/a', 'n/a', 'n/a', 'male', 'PAT-ON-24-ontario-3943910000', '2b79fe2866b6b6756cf960039c2de9ec', 1, 1);
INSERT INTO `patients_registration` VALUES (10, 'jk', 'null', 'test', 18, 'b', '16131234567', 'jliu475@uottawa.ca', '171 Lees Avenue', 'Ottawa', 'K1S 5P3', 'Ottawa', 'ON', 'test', 'test', 'test', 'test', 'Male', 'PAT-ON-18-ON-5191710000', '15799df3881cc57cef2975b470f8631f', 0, 0);
INSERT INTO `patients_registration` VALUES (11, 'Sick', '-', 'Guy', 98, 'C+', '9876543210', 'sickguy@admin.com', '123 xyz', 'abc', 'a2f c2z', 'asd', 'asd', '123245456', '123345436356', '23325346536', '2534635657', 'Male', 'PAT-ON-98-asd-1941310000', '393655fd6c84d02dd18254f33d76ca4f', 1, 0);
INSERT INTO `patients_registration` VALUES (12, 'abc', 'abc', 'abc', 23, 'O', '1234567890', 'mkagz064@uottawa.ca', 'asafaf', 'asfasfasf', 'asfafaf', 'Ottawa', 'ON', '425436253', '243235346', '325246357', '235346547', 'Male', 'PAT-ON-23-ON-4910510000', '0ccf472a01b3517a4729f73547db64c4', 1, 0);
INSERT INTO `patients_registration` VALUES (13, 'Hoseintest55', 'Hosein', 'Sadat Hosseini', 35, 'o+', '43543534543', 'HospitalTest2@gmail.com', '45435435', '33333', '4353453', 'Ottawa', 'ON', '34343434', '324234324', '324242424', '32432424', 'male', 'PAT-ON-35-ON-8572910000', 'TestH', 1, 1);
INSERT INTO `patients_registration` VALUES (14, 'test', 'test', 'test', 1, 'A', '111-222-3333', 'test@test.ca', 'a', 'ottawa', 'A1A2BC', 'Ottawa', 'ON', '1112223333', '111-1111-1111', '112', 'A1A2BC', 'male', 'PAT-ON-1-ON-663510000', 'c05f008d81ec86e11c8935d2e703092c', 0, 0);
INSERT INTO `patients_registration` VALUES (15, 'nnnn', 'Hosein', 'Sadat Hosseini', 35, 'd', '5646465654', 'HospitalTest2@gmail.com', '45435435', 'u', '4353453', 'Ottawa', 'ON', 'o', 'i', 'u', 'h', 'dwefmd', 'PAT-ON-35-ON-1730710000', 'b150a358e4def1c06e32c6d9bbe001b4', 1, 0);
INSERT INTO `patients_registration` VALUES (16, 'test', 'tess', 'tes', 12, 'a', '132322323232', '123', '123', '123', '13', '123', '123', '123', '123', '123', '123', 'ts', 'PAT-ON-12-123-2375410000', '2c29b857913d4abeb8114ac4f37b9aad', 0, 0);
INSERT INTO `patients_registration` VALUES (17, 'mndfownflw', 'jkjbk ', 'kjfhuhf', 65, 'a', '123456789', 'kjbdkjw @gmail.com', ',wnfowjfl f', 'khbgoehbdl,', 'khflwed', 'jvfiughljnm ', 'jhgiubj', '54984132798', 'efer5456', '35rfr21946', '6565323e', 'Male', 'PAT-ON-65-jhgiubj-5847910000', 'a43792493773c7146a45a49ad8b823ef', 0, 1);
INSERT INTO `patients_registration` VALUES (18, 'a', 'a', 'a', 0, 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'aa', 'a', 'a', 'a', 'PAT-ON-a-a-602110000', 'c5867a228b0f3eb1ca787f399f30d8dd', 0, 0);
INSERT INTO `patients_registration` VALUES (19, 'SMS TEst', 'Hosein', 'Sadat Hosseini', 35, 'd', '16132622138', 'HospitalTest2@gmail.com', '45435435', 'u', '4353453', 'Ottawa', 'ON', 'o', 'i', 'u', 'h', 'dwefmd', 'PAT-ON-35-ON-6204510000', 'e4f363febca19626fd34402efc9b4eb8', 0, 0);
INSERT INTO `patients_registration` VALUES (20, 'SMS TEst', 'Hosein', 'Sadat Hosseini', 35, 'd', '16132622138', 'HospitalTest2@gmail.com', '45435435', 'u', '4353453', 'Ottawa', 'ON', 'o', 'i', 'u', 'h', 'male', 'PAT-ON-35-ON-4544810000', '4facc5ee5e77168d2659af3ec17a4b92', 0, 1);
INSERT INTO `patients_registration` VALUES (21, 'SMS TEst', 'Hosein', 'Sadat Hosseini', 234213, '231313', '16132622138', 'HospitalTest2@gmail.com', '45435435', '213133', '4353453', 'Ottawa', 'ON', '213131', '321321313', '3213131', '321313', 'dwefmd', 'PAT-ON-234213-ON-6204510000', '6cba6c12b9905fd41400402f5c55ee09', 0, 1);
INSERT INTO `patients_registration` VALUES (22, 'SMS TEst', 'Hosein', 'Sadat Hosseini', 0, 'd', '16132622138', 'HospitalTest2@gmail.com', '45435435', 'u', '4353453', 'Ottawa', 'ON', 'o', 'i', 'u', '32432424', 'dwefmd', 'PAT-ON-sdfds-ON-2480810000', '2fd1b7f314a8726e83ea3956ef4f9121', 0, 0);
INSERT INTO `patients_registration` VALUES (23, 'TestH fdsfd', 'Hosein', 'Sadat Hosseini', 35, 'd', '16132622138', 'HospitalTest2@gmail.com', '45435435', 'u', '4353453', 'Ottawa', 'ON', 'o', 'i', 'u', '32432424', 'dwefmd', 'PAT-ON-35-ON-416210000', '28497cc0f32d970b8ab999786de43ee6', 0, 0);

-- ----------------------------
-- Table structure for sickness_record
-- ----------------------------
DROP TABLE IF EXISTS `sickness_record`;
CREATE TABLE `sickness_record`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT 'Create Time',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `patient_id` int(0) NULL DEFAULT NULL COMMENT 'patient\'s id',
  `isSick` tinyint(1) NULL DEFAULT NULL,
  `diagnosis` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT 'doctor write diagnosis according uploaded images',
  `doctor_id` int(0) NULL DEFAULT NULL COMMENT 'doctor id',
  `PatientName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `DoctorName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Gender` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sickness_record
-- ----------------------------
INSERT INTO `sickness_record` VALUES (2, NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, '2');
INSERT INTO `sickness_record` VALUES (3, NULL, NULL, NULL, 1, NULL, NULL, 'Leo', NULL, 'man');
INSERT INTO `sickness_record` VALUES (4, NULL, NULL, NULL, 1, NULL, NULL, 'Dongchen', NULL, 'man');

-- ----------------------------
-- Table structure for tmp_etl_table
-- ----------------------------
DROP TABLE IF EXISTS `tmp_etl_table`;
CREATE TABLE `tmp_etl_table`  (
  `ClinicName` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `Location` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `City` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `Province` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `Country` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `PostalCode` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `NumberOfPatients` decimal(18, 0) NULL DEFAULT NULL,
  `Date` date NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tmp_etl_table
-- ----------------------------
INSERT INTO `tmp_etl_table` VALUES ('Test', 'First Ave', 'Ottawa', 'Ontario', 'Canada', 'K1SK1S', 2, '2023-01-19');
INSERT INTO `tmp_etl_table` VALUES ('Test', 'First Ave', 'Ottawa', 'Ontario', 'Canada', 'K1SK1S', 1, '2023-01-30');

SET FOREIGN_KEY_CHECKS = 1;
