SELECT c.course_code, c.course_title, co.section_number,
       sem.semester_term, r.building, r.room_number,
       p.first_name AS faculty_first, p.last_name AS faculty_last
-- Show all courses offered in Fall 2025, with instructor and room info
FROM course_offering co
JOIN course c ON co.course_course_id = c.course_id
JOIN semester sem ON co.semester_semester_id1 = sem.semester_id
JOIN room r ON co.room_room_id1 = r.room_id
JOIN faculty f ON co.faculty_faculty_id = f.faculty_id
JOIN people p ON f.people_id = p.people_id
WHERE sem.semester_term = 'Fall 2025';


-- List enrollments: student → course → grade
SELECT p.first_name, p.last_name, c.course_code, c.course_title,
       lg.grade_symbol
FROM enrollment e
JOIN student s ON e.student_id = s.student_id
JOIN people p ON s.people_id = p.people_id
JOIN course_offering co ON e.course_offering_id = co.course_offering_id
JOIN course c ON co.course_course_id = c.course_id
JOIN letter_grade lg ON e.letter_grade_id = lg.letter_grade_id
ORDER BY p.last_name, c.course_code;



-- Enrollment counts by course
SELECT r.building, r.room_number, COUNT(co.course_offering_id) AS courses_scheduled
FROM room r
LEFT JOIN course_offering co ON r.room_id = co.room_room_id1
GROUP BY r.building, r.room_number
ORDER BY courses_scheduled DESC;


