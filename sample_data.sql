USE af25willa1_college_db;

-- Departments
INSERT INTO department (department_name) VALUES
('Computer Science'),
('Mathematics'),
('English'),
('Biology'),
('History');

-- Semesters
INSERT INTO semester (semester_term) VALUES
('Fall 2025'), ('Spring 2026'), ('Summer 2026');

-- Rooms
INSERT INTO room (room_number, building, capacity) VALUES
('101', 'Science Hall', 50),
('202', 'Math Center', 40),
('303', 'Liberal Arts', 60),
('404', 'Tech Building', 100);

-- People
INSERT INTO people (first_name, last_name, email, date_of_birth, gender, address, phone_number) VALUES
('Alice', 'Johnson', 'alice.johnson@example.edu', '2001-05-14', 'F', '123 College Ave', '4025551234'),
('Bob', 'Smith', 'bob.smith@example.edu', '2000-09-22', 'M', '456 University St', '4025555678'),
('Carol', 'Davis', 'carol.davis@example.edu', '1975-03-11', 'F', '789 Faculty Ln', '4025559876'),
('David', 'Miller', 'david.miller@example.edu', '1980-08-19', 'M', '101 Staff Ct', '4025552468'),
('Eva', 'Brown', 'eva.brown@example.edu', '2002-12-01', 'F', '202 Student Dr', '4025551357'),
('Frank', 'Wilson', 'frank.wilson@example.edu', '1999-07-04', 'M', '303 Dormitory Rd', '4025551111'),
('Grace', 'Taylor', 'grace.taylor@example.edu', '1985-10-10', 'F', '404 Staff Blvd', '4025552222'),
('Henry', 'Thomas', 'henry.thomas@example.edu', '1970-01-30', 'M', '505 Admin Pl', '4025553333');

-- Faculty
INSERT INTO faculty (people_id, department_id, office_location) VALUES
(3, 1, 'Tech 201'),
(7, 2, 'Math 105'),
(8, 3, 'Admin 210');

-- Students
INSERT INTO student (people_id, cumulative_gpa, advisor_id) VALUES
(1, 3.75, 1),
(2, 3.20, 1),
(5, 3.90, 2),
(6, 2.80, 1);

-- Staff
INSERT INTO staff (people_id, department_id, staffcol) VALUES
(4, 1, 'Lab Technician'),
(7, 2, 'Department Secretary');

-- Courses
INSERT INTO course (course_code, course_title, credits, department_id) VALUES
('CS101', 'Intro to Programming', 3, 1),
('CS201', 'Data Structures', 4, 1),
('MATH101', 'Calculus I', 4, 2),
('ENG101', 'English Literature', 3, 3),
('BIO101', 'General Biology', 4, 4);

-- Course Offerings
INSERT INTO course_offering (section_number, course_id, semester_id1, room_id1, faculty_id) VALUES
('001', 1, 1, 4, 1),
('002', 2, 1, 4, 1),
('001', 3, 1, 2, 2),
('001', 4, 2, 3, 3),
('001', 5, 2, 1, 1);

-- Letter Grades
INSERT INTO letter_grade (grade_symbol, grade_points) VALUES
('A', 4.0),
('B', 3.0),
('C', 2.0),
('D', 1.0),
('F', 0.0),
('W', NULL);

-- Enrollments
INSERT INTO enrollment (letter_grade_id, student_id, course_offering_id) VALUES
(1, 1, 1),
(2, 2, 1),
(1, 3, 2),
(3, 4, 3),
(1, 1, 2),
(2, 2, 4),
(5, 3, 5),
(6, 4, 5);
