-- 1. List all students with their advisor’s name
SELECT s.student_id, p.first_name AS student_first, p.last_name AS student_last,
       f.faculty_id, pf.first_name AS advisor_first, pf.last_name AS advisor_last
FROM student s
JOIN people p ON s.people_id = p.people_id
JOIN faculty f ON s.advisor_id = f.faculty_id
JOIN people pf ON f.people_id = pf.people_id;

-- 2. Get all courses offered in Fall 2025 with instructor names
SELECT c.course_code, c.course_title, sem.semester_term, co.section_number,
       pf.first_name, pf.last_name
FROM course_offering co
JOIN course c ON co.course_id = c.course_id
JOIN semester sem ON co.semester_id1 = sem.semester_id
JOIN faculty f ON co.faculty_id = f.faculty_id
JOIN people pf ON f.people_id = pf.people_id
WHERE sem.semester_term = 'Fall 2025';

-- 3. Show enrollment list (student, course, grade)
SELECT p.first_name, p.last_name, c.course_code, c.course_title, lg.grade_symbol
FROM enrollment e
JOIN student s ON e.student_id = s.student_id
JOIN people p ON s.people_id = p.people_id
JOIN course_offering co ON e.course_offering_id = co.course_offering_id
JOIN course c ON co.course_id = c.course_id
JOIN letter_grade lg ON e.letter_grade_id = lg.letter_grade_id;

-- 4. Find average GPA of students in Computer Science department
SELECT d.department_name, AVG(s.cumulative_gpa) AS avg_gpa
FROM student s
JOIN faculty f ON s.advisor_id = f.faculty_id
JOIN department d ON f.department_id = d.department_id
WHERE d.department_name = 'Computer Science';

-- 5. Get course capacity and current enrollment
SELECT c.course_code, c.course_title, r.room_number, r.capacity,
       COUNT(e.enrollment_id) AS enrolled_students
FROM course_offering co
JOIN course c ON co.course_id = c.course_id
JOIN room r ON co.room_id1 = r.room_id
LEFT JOIN enrollment e ON co.course_offering_id = e.course_offering_id
GROUP BY co.course_offering_id;
