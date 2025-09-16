USE `af25enoca1_college_db`;

-- -----------------------------------------------------
-- Insert Departments
-- -----------------------------------------------------
INSERT INTO department (department_id, department_name) VALUES
(1, 'Department A'),
(2, 'Department B'),
(3, 'Department C'),
(4, 'Department D'),
(5, 'Department E');

-- -----------------------------------------------------
-- Insert People
-- -----------------------------------------------------
INSERT INTO people (people_id, first_name, last_name, email, date_of_birth, gender, address, phone_number) VALUES
(1, 'Emma', 'Johnson', 'emma.johnson@example.com', '1980-04-15', 'F', '1234 Oak Street, Lincoln, NE', 4025551234),
(2, 'Liam', 'Smith', 'liam.smith@example.com', '1975-11-08', 'M', '5678 Pine Road, Omaha, NE', 4025555678),
(3, 'Olivia', 'Brown', 'olivia.brown@example.com', '1995-06-22', 'F', '9101 Elm Ave, Wayne, NE', 4025559101),
(4, 'Noah', 'Davis', 'noah.davis@example.com', '1988-02-10', 'M', '1415 Maple Blvd, Norfolk, NE', 4025551415),
(5, 'Ava', 'Miller', 'ava.miller@example.com', '1992-09-30', 'F', '1617 Cedar Lane, Scottsbluff, NE', 4025551617),
(6, 'William', 'Wilson', 'william.wilson@example.com', '1983-12-05', 'M', '1819 Birch St, Grand Island, NE', 4025551819),
(7, 'Sophia', 'Moore', 'sophia.moore@example.com', '1997-03-14', 'F', '2021 Spruce Ct, Kearney, NE', 4025552021),
(8, 'James', 'Taylor', 'james.taylor@example.com', '1970-07-21', 'M', '2223 Ash Dr, Lincoln, NE', 4025552223),
(9, 'Isabella', 'Anderson', 'isabella.anderson@example.com', '1990-10-12', 'F', '2425 Poplar Way, Omaha, NE', 4025552425),
(10, 'Mason', 'Thomas', 'mason.thomas@example.com', '1985-05-28', 'M', '2627 Walnut St, Wayne, NE', 4025552627),
(11, 'Mia', 'Jackson', 'mia.jackson@example.com', '1994-01-19', 'F', '2829 Cherry Blvd, Norfolk, NE', 4025552829),
(12, 'Ethan', 'White', 'ethan.white@example.com', '1987-08-23', 'M', '3031 Fir Ave, Scottsbluff, NE', 4025553031),
(13, 'Harper', 'Harris', 'harper.harris@example.com', '1991-11-11', 'F', '3233 Pine Tree Rd, Grand Island, NE', 4025553233),
(14, 'Alexander', 'Martin', 'alexander.martin@example.com', '1982-04-02', 'M', '3435 Oak Leaf Dr, Kearney, NE', 4025553435),
(15, 'Charlotte', 'Thompson', 'charlotte.thompson@example.com', '1998-12-25', 'F', '3637 Aspen Cir, Lincoln, NE', 4025553637),
(16, 'Benjamin', 'Garcia', 'benjamin.garcia@example.com', '1993-09-09', 'M', '3839 Sycamore Ln, Omaha, NE', 4025553839),
(17, 'Evelyn', 'Martinez', 'evelyn.martinez@example.com', '1996-05-05', 'F', '4041 Magnolia Blvd, Wayne, NE', 4025554041),
(18, 'Logan', 'Robinson', 'logan.robinson@example.com', '1984-03-30', 'M', '4243 Hickory St, Norfolk, NE', 4025554243),
(19, 'Abigail', 'Clark', 'abigail.clark@example.com', '1999-07-07', 'F', '4445 Dogwood Dr, Scottsbluff, NE', 4025554445),
(20, 'Lucas', 'Rodriguez', 'lucas.rodriguez@example.com', '1992-02-17', 'M', '4647 Juniper Ave, Grand Island, NE', 4025554647);

-- -----------------------------------------------------
-- Insert Rooms
-- -----------------------------------------------------
INSERT INTO room (room_id, room_number, building, capacity) VALUES
(1, '101', 'Building A', 30),
(2, '102', 'Building A', 40),
(3, '201', 'Building B', 50),
(4, '202', 'Building B', 60),
(5, '301', 'Building C', 30),
(6, '302', 'Building C', 40),
(7, '401', 'Building A', 50),
(8, '402', 'Building B', 60),
(9, '501', 'Building C', 30),
(10, '502', 'Building A', 40);

-- -----------------------------------------------------
-- Insert Semesters
-- -----------------------------------------------------
INSERT INTO semester (semester_id, semester_term) VALUES
(1, 'Fall'),
(2, 'Spring'),
(3, 'Summer');

-- -----------------------------------------------------
-- Insert Courses
-- -----------------------------------------------------
INSERT INTO course (course_id, course_code, course_title, credits, department_id) VALUES
(1, 'CSE101', 'Introduction to Computer Science', 3, 1),
(2, 'CSE102', 'Data Structures', 4, 1),
(3, 'CSE201', 'Algorithms', 4, 1),
(4, 'MAT101', 'Calculus I', 4, 2),
(5, 'MAT102', 'Calculus II', 4, 2),
(6, 'MAT201', 'Linear Algebra', 3, 2),
(7, 'PHY101', 'General Physics I', 4, 3),
(8, 'PHY102', 'General Physics II', 4, 3),
(9, 'CHE101', 'General Chemistry', 4, 4),
(10, 'CHE102', 'Organic Chemistry', 4, 4),
(11, 'ENG101', 'English Composition', 3, 5),
(12, 'ENG102', 'Literature Survey', 3, 5),
(13, 'HIS101', 'World History', 3, 5),
(14, 'PSY101', 'Introduction to Psychology', 3, 5),
(15, 'BIO101', 'Biology I', 4, 3),
(16, 'BIO102', 'Biology II', 4, 3),
(17, 'ECON101', 'Principles of Economics', 3, 2),
(18, 'ECON102', 'Microeconomics', 3, 2),
(19, 'CSE301', 'Operating Systems', 4, 1),
(20, 'CSE302', 'Database Systems', 4, 1);

-- -----------------------------------------------------
-- Insert Letter Grades
-- -----------------------------------------------------
INSERT INTO letter_grade (letter_grade_id, grade_symbol, grade_points, letter_grade_col) VALUES
(1, 'A', 4.0, 'A'),
(2, 'B', 3.0, 'B'),
(3, 'C', 2.0, 'C'),
(4, 'D', 1.0, 'D'),
(5, 'F', 0.0, 'F'),
(6, 'I', NULL, 'I'),
(7, 'W', NULL, 'W');

-- -----------------------------------------------------
-- Insert Faculty
-- -----------------------------------------------------
INSERT INTO faculty (faculty_id, people_id, department_id, office_location) VALUES
(1, 1, 1, 'Office 101'),
(2, 2, 2, 'Office 202'),
(3, 3, 1, 'Office 303'),
(4, 4, 2, 'Office 404'),
(5, 5, 3, 'Office 105'),
(6, 6, 4, 'Office 206'),
(7, 7, 5, 'Office 307'),
(8, 8, 1, 'Office 408'),
(9, 9, 2, 'Office 109'),
(10, 10, 3, 'Office 210'),
(11, 11, 4, 'Office 311'),
(12, 12, 5, 'Office 412'),
(13, 13, 1, 'Office 113'),
(14, 14, 2, 'Office 214'),
(15, 15, 3, 'Office 315');

-- -----------------------------------------------------
-- Insert Students
-- -----------------------------------------------------
INSERT INTO student (student_id, people_id, cumulative_gpa, advisor_id) VALUES
(1, 16, 3.85, 1),
(2, 17, 3.45, 2),
(3, 18, 3.70, 3),
(4, 19, 2.95, 4),
(5, 20, 3.10, 5),
(6, 6, 3.90, 6),
(7, 7, 2.75, 7),
(8, 8, 3.50, 8),
(9, 9, 2.80, 9),
(10, 10, 3.60, 10),
(11, 11, 3.20, 11),
(12, 12, 2.50, 12),
(13, 13, 3.30, 13),
(14, 14, 3.95, 14),
(15, 15, 3.00, 15);

-- -----------------------------------------------------
-- Insert Staff
-- -----------------------------------------------------
INSERT INTO staff (staff_id, people_id, department_id) VALUES
(1, 3, 1),
(2, 4, 2),
(3, 5, 3),
(4, 6, 4),
(5, 7, 5),
(6, 16, 1),
(7, 17, 2),
(8, 18, 3),
(9, 19, 4),
(10, 20, 5);

-- -----------------------------------------------------
-- Insert Course Offerings
-- -----------------------------------------------------
INSERT INTO course_offering (course_offering_id, section_number, course_id, semester_id1, room_id1, faculty_id) VALUES
(1, '01', 1, 1, 1, 1),
(2, '02', 1, 1, 2, 2),
(3, '01', 2, 1, 3, 3),
(4, '01', 3, 2, 4, 4),
(5, '01', 4, 2, 5, 5),
(6, '02', 4, 3, 6, 6),
(7, '01', 5, 1, 7, 7),
(8, '02', 5, 2, 8, 8),
(9, '01', 6, 3, 9, 9),
(10, '01', 7, 1, 10, 10),
(11, '02', 7, 2, 1, 11),
(12, '01', 8, 3, 2, 12),
(13, '01', 9, 1, 3, 13),
(14, '01', 10, 2, 4, 14),
(15, '01', 11, 3, 5, 15),
(16, '02', 11, 1, 6, 1),
(17, '01', 12, 2, 7, 2),
(18, '01', 13, 3, 8, 3),
(19, '02', 14, 1, 9, 4),
(20, '01', 15, 2, 10, 5);

-- -----------------------------------------------------
-- Insert Enrollments
-- -----------------------------------------------------
INSERT INTO enrollment (enrollment_id, enrollment_created, enrollment_modified, letter_grade_id, student_id, course_offering_id) VALUES
(1, '2025-01-10 09:00:00', '2025-05-15 13:45:00', 1, 1, 1),
(2, '2025-01-11 10:30:00', '2025-05-16 14:00:00', 2, 2, 1),
(3, '2025-01-12 11:00:00', '2025-05-17 15:15:00', 3, 3, 2),
(4, '2025-01-13 08:45:00', '2025-05-18 16:30:00', 1, 4, 3),
(5, '2025-01-14 12:15:00', '2025-05-19 17:45:00', 5, 5, 4),
(6, '2025-01-15 13:45:00', '2025-05-20 18:00:00', 4, 6, 5),
(7, '2025-01-16 14:30:00', '2025-05-21 12:00:00', 2, 7, 6),
(8, '2025-01-17 15:00:00', '2025-05-22 13:30:00', 1, 8, 7),
(9, '2025-01-18 08:15:00', '2025-05-23 14:45:00', 3, 9, 8),
(10, '2025-01-19 09:30:00', '2025-05-24 15:00:00', 4, 10, 9),
(11, '2025-02-01 10:00:00', '2025-06-01 10:00:00', 2, 11, 10),
(12, '2025-02-02 11:30:00', '2025-06-02 11:30:00', 5, 12, 11),
(13, '2025-02-03 13:00:00', '2025-06-03 13:00:00', 1, 13, 12),
(14, '2025-02-04 14:45:00', '2025-06-04 14:45:00', 3, 14, 13),
(15, '2025-02-05 16:00:00', '2025-06-05 16:00:00', 4, 15, 14),
(16, '2025-03-10 09:15:00', '2025-07-10 09:15:00', 1, 1, 15),
(17, '2025-03-11 10:30:00', '2025-07-11 10:30:00', 2, 2, 16),
(18, '2025-03-12 11:45:00', '2025-07-12 11:45:00', 3, 3, 17),
(19, '2025-03-13 13:00:00', '2025-07-13 13:00:00', 4, 4, 18),
(20, '2025-03-14 14:15:00', '2025-07-14 14:15:00', 5, 5, 19);

-- (You can add more enrollments similarly as needed.)
