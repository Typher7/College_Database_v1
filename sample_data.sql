-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema af25enoca1_college_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema af25enoca1_college_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `af25enoca1_college_db` DEFAULT CHARACTER SET utf8 ;
USE `af25enoca1_college_db` ;

-- -----------------------------------------------------
-- Table `af25enoca1_college_db`.`people`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `af25enoca1_college_db`.`people` (
  `people_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `email` VARCHAR(255) NULL,
  `dob` DATE NULL,
  `gender` VARCHAR(45) NULL COMMENT 'Possible values:\nF = Females\nM = Males',
  PRIMARY KEY (`people_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `af25enoca1_college_db`.`department`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `af25enoca1_college_db`.`department` (
  `department_id` INT NOT NULL AUTO_INCREMENT,
  `department_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`department_id`),
  INDEX `department_name_idx` (`department_name` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `af25enoca1_college_db`.`semester`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `af25enoca1_college_db`.`semester` (
  `semester_id` INT NOT NULL AUTO_INCREMENT,
  `semester_term` VARCHAR(45) NULL COMMENT 'Possible values:\nSummer\nFall\nSpring\n',
  PRIMARY KEY (`semester_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `af25enoca1_college_db`.`room`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `af25enoca1_college_db`.`room` (
  `room_id` INT NOT NULL AUTO_INCREMENT,
  `room_number` VARCHAR(45) NULL,
  `building` VARCHAR(45) NULL,
  `capacity` INT NULL,
  PRIMARY KEY (`room_id`),
  INDEX `idx_room_number` (`room_number` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `af25enoca1_college_db`.`course`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `af25enoca1_college_db`.`course` (
  `course_id` INT NOT NULL AUTO_INCREMENT,
  `course_code` VARCHAR(20) NOT NULL,
  `course_title` VARCHAR(45) NULL,
  `credits` INT NULL,
  `department_id` INT NOT NULL,
  INDEX `idx_course_code` (`course_code` ASC) VISIBLE,
  INDEX `idx_course_title` (`course_title` ASC) INVISIBLE,
  PRIMARY KEY (`course_id`),
  INDEX `idx_course_department` (`department_id` ASC) VISIBLE,
  CONSTRAINT `fk_course_department`
    FOREIGN KEY (`department_id`)
    REFERENCES `af25enoca1_college_db`.`department` (`department_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `af25enoca1_college_db`.`faculty`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `af25enoca1_college_db`.`faculty` (
  `faculty_id` INT NOT NULL AUTO_INCREMENT,
  `people_id` INT NOT NULL,
  `department_id` INT NOT NULL,
  PRIMARY KEY (`faculty_id`),
  INDEX `fk_faculty_people_idx` (`people_id` ASC) VISIBLE,
  INDEX `fk_faculty_department1_idx` (`department_id` ASC) VISIBLE,
  CONSTRAINT `fk_faculty_people`
    FOREIGN KEY (`people_id`)
    REFERENCES `af25enoca1_college_db`.`people` (`people_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_faculty_department`
    FOREIGN KEY (`department_id`)
    REFERENCES `af25enoca1_college_db`.`department` (`department_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `af25enoca1_college_db`.`course_offering`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `af25enoca1_college_db`.`course_offering` (
  `course_offering_id` INT NOT NULL AUTO_INCREMENT,
  `section_number` VARCHAR(45) NULL,
  `course_course_id` INT NOT NULL,
  `semester_semester_id1` INT NOT NULL,
  `room_room_id1` INT NOT NULL,
  `faculty_faculty_id` INT NOT NULL,
  PRIMARY KEY (`course_offering_id`),
  INDEX `fk_course_offering_course1_idx` (`course_course_id` ASC) VISIBLE,
  INDEX `fk_course_offering_semester1_idx` (`semester_semester_id1` ASC) VISIBLE,
  INDEX `fk_course_offering_room1_idx` (`room_room_id1` ASC) VISIBLE,
  INDEX `fk_course_offering_faculty1_idx` (`faculty_faculty_id` ASC) VISIBLE,
  CONSTRAINT `fk_course_offering_course`
    FOREIGN KEY (`course_course_id`)
    REFERENCES `af25enoca1_college_db`.`course` (`course_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_course_offering_semester`
    FOREIGN KEY (`semester_semester_id1`)
    REFERENCES `af25enoca1_college_db`.`semester` (`semester_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_course_offering_room`
    FOREIGN KEY (`room_room_id1`)
    REFERENCES `af25enoca1_college_db`.`room` (`room_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_course_offering_faculty`
    FOREIGN KEY (`faculty_faculty_id`)
    REFERENCES `af25enoca1_college_db`.`faculty` (`faculty_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `af25enoca1_college_db`.`letter_grade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `af25enoca1_college_db`.`letter_grade` (
  `letter_grade_id` INT NOT NULL AUTO_INCREMENT,
  `grade_symbol` VARCHAR(45) NULL COMMENT '(A, B, C, D, F, I, W)',
  `grade_points` DECIMAL(3,1) NULL COMMENT '(4.0, 3.0, …)',
  `letter_grade_col` VARCHAR(45) NULL,
  PRIMARY KEY (`letter_grade_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `af25enoca1_college_db`.`student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `af25enoca1_college_db`.`student` (
  `student_id` INT NOT NULL AUTO_INCREMENT,
  `people_id` INT NOT NULL,
  PRIMARY KEY (`student_id`),
  INDEX `fk_people_student_id_idx` (`people_id` ASC) VISIBLE,
  CONSTRAINT `fk_student_people`
    FOREIGN KEY (`people_id`)
    REFERENCES `af25enoca1_college_db`.`people` (`people_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `af25enoca1_college_db`.`enrollment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `af25enoca1_college_db`.`enrollment` (
  `enrollment_id` INT NOT NULL AUTO_INCREMENT,
  `enrollment_created` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `enrollment_modified` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `letter_grade_id` INT NOT NULL,
  `student_id` INT NOT NULL,
  `course_offering_id` INT NOT NULL,
  PRIMARY KEY (`enrollment_id`),
  INDEX `fk_enrollment_letter_grade1_idx` (`letter_grade_id` ASC) VISIBLE,
  INDEX `fk_enrollment_student1_idx` (`student_id` ASC) VISIBLE,
  INDEX `fk_enrollment_course_offering1_idx` (`course_offering_id` ASC) VISIBLE,
  CONSTRAINT `fk_enrollment_letter_grade`
    FOREIGN KEY (`letter_grade_id`)
    REFERENCES `af25enoca1_college_db`.`letter_grade` (`letter_grade_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_enrollment_student`
    FOREIGN KEY (`student_id`)
    REFERENCES `af25enoca1_college_db`.`student` (`student_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_enrollment_course_offering`
    FOREIGN KEY (`course_offering_id`)
    REFERENCES `af25enoca1_college_db`.`course_offering` (`course_offering_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `af25enoca1_college_db`.`staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `af25enoca1_college_db`.`staff` (
  `staff_id` INT NOT NULL AUTO_INCREMENT,
  `people_id` INT NOT NULL,
  `department_id` INT NOT NULL,
  PRIMARY KEY (`staff_id`),
  INDEX `fk_staff_people_idx` (`people_id` ASC) VISIBLE,
  INDEX `fk_staff_department1_idx` (`department_id` ASC) VISIBLE,
  CONSTRAINT `fk_staff_people`
    FOREIGN KEY (`people_id`)
    REFERENCES `af25enoca1_college_db`.`people` (`people_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_staff_department`
    FOREIGN KEY (`department_id`)
    REFERENCES `af25enoca1_college_db`.`department` (`department_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

USE af25enoca1_college_db;

-- PEOPLE (students, faculty, staff)
INSERT INTO people (first_name, last_name, email, dob, gender) VALUES
('Alice', 'Johnson', 'alice.johnson@college.edu', '2002-05-14', 'F'),
('Bob', 'Smith', 'bob.smith@college.edu', '2001-08-22', 'M'),
('Clara', 'Davis', 'clara.davis@college.edu', '2003-11-05', 'F'),
('David', 'Wilson', 'david.wilson@college.edu', '2000-02-29', 'M'),
('Emily', 'Taylor', 'emily.taylor@college.edu', '1999-12-10', 'F'),
('Frank', 'Brown', 'frank.brown@college.edu', '1980-03-03', 'M'),
('Grace', 'Miller', 'grace.miller@college.edu', '1975-09-17', 'F'),
('Henry', 'Anderson', 'henry.anderson@college.edu', '1982-01-12', 'M'),
('Isabella', 'Thomas', 'isabella.thomas@college.edu', '1995-04-21', 'F'),
('James', 'Martinez', 'james.martinez@college.edu', '1990-06-18', 'M');

-- DEPARTMENT
INSERT INTO department (department_name) VALUES
('Computer Science'),
('Mathematics'),
('English'),
('Biology'),
('History');

-- SEMESTER
INSERT INTO semester (semester_term) VALUES
('Fall 2025'),
('Spring 2026'),
('Summer 2026');

-- ROOM
INSERT INTO room (room_number, building, capacity) VALUES
('101', 'Science Hall', 40),
('202', 'Math Building', 35),
('303', 'Humanities Center', 50),
('404', 'Biology Annex', 25),
('105', 'Main Hall', 100);

-- COURSE
INSERT INTO course (course_code, course_title, credits, department_id) VALUES
('CS101', 'Intro to Programming', 3, 1),
('CS201', 'Data Structures', 4, 1),
('MATH101', 'Calculus I', 4, 2),
('ENG201', 'Literature Survey', 3, 3),
('BIO150', 'General Biology', 4, 4),
('HIST210', 'World History', 3, 5);

-- FACULTY
INSERT INTO faculty (people_id, department_id) VALUES
(6, 1), -- Frank, CS
(7, 2), -- Grace, Math
(8, 3), -- Henry, English
(9, 4), -- Isabella, Biology
(10, 5); -- James, History

-- COURSE OFFERING
INSERT INTO course_offering (section_number, course_course_id, semester_semester_id1, room_room_id1, faculty_faculty_id) VALUES
('001', 1, 1, 1, 1), -- CS101 Fall
('001', 2, 1, 1, 1), -- CS201 Fall
('001', 3, 1, 2, 2), -- Calculus I Fall
('001', 4, 1, 3, 3), -- English Lit Fall
('001', 5, 1, 4, 4), -- Biology Fall
('001', 6, 1, 5, 5), -- History Fall
('002', 1, 2, 1, 1), -- CS101 Spring
('002', 3, 2, 2, 2), -- Calculus I Spring
('002', 5, 2, 4, 4); -- Biology Spring

-- LETTER GRADE
INSERT INTO letter_grade (grade_symbol, grade_points) VALUES
('A', 4.0),
('B', 3.0),
('C', 2.0),
('D', 1.0),
('F', 0.0),
('I', NULL),
('W', NULL);

-- STUDENT
INSERT INTO student (people_id) VALUES
(1), -- Alice
(2), -- Bob
(3), -- Clara
(4), -- David
(5); -- Emily

-- ENROLLMENT (students taking classes, with grades)
INSERT INTO enrollment (letter_grade_id, student_id, course_offering_id) VALUES
(1, 1, 1), -- Alice in CS101 Fall with A
(2, 1, 3), -- Alice in Calculus I Fall with B
(3, 2, 1), -- Bob in CS101 Fall with C
(1, 2, 4), -- Bob in English Lit Fall with A
(2, 3, 5), -- Clara in Biology Fall with B
(4, 3, 6), -- Clara in History Fall with D
(5, 4, 2), -- David in Data Structures Fall with F
(1, 4, 3), -- David in Calculus I Fall with A
(2, 5, 4), -- Emily in English Lit Fall with B
(1, 5, 1), -- Emily in CS101 Fall with A
(6, 5, 5); -- Emily in Biology Fall (Incomplete)

-- STAFF
INSERT INTO staff (people_id, department_id) VALUES
(9, 1), -- Isabella also staff in CS dept (dual role example)
(10, 2); -- James staff in Math dept
