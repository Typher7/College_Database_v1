# 🎓 College Database Project (Version 1)

This project defines a relational database schema for managing a college's academic system using **MySQL**. It includes support for students, faculty, admins, courses, departments, enrollment, grades, rooms, and semesters.

Designed for use with **MySQL Workbench EER Diagrams**, this schema enforces key **relational constraints** and supports **normalized data** suitable for reporting and extensions.

---

## 🗃️ Entities and Relationships

### 📌 Main Tables

| Table             | Description |
|------------------|-------------|
| `People`         | Stores all individuals (students, faculty, admins) with a `role` field. |
| `Department`     | Contains college departments (e.g., CS, Math). |
| `Semester`       | Tracks academic terms like Fall 2025. |
| `Course`         | Master list of courses (e.g., CS101). |
| `Room`           | Physical rooms with capacity information. |
| `Course_Offering`| Represents a specific course section offered in a semester, assigned to a faculty member and room. |
| `Enrollment`     | Tracks student enrollment in course offerings, including final letter grades. |

---

## 📋 Table Structure Summary

### `People`

- `person_id`: Primary Key
- `first_name`, `last_name`, `email`
- `role`: ENUM (`student`, `faculty`, `admin`)

### `Department`

- `department_id`: Primary Key
- `name`: Unique

### `Semester`

- `semester_id`: Primary Key
- `name`, `start_date`, `end_date`

### `Course`

- `course_id`: Primary Key
- `course_code`: Unique (e.g., CS101)
- `title`, `department_id` (FK)

### `Room`

- `room_id`: Primary Key
- `building`, `room_number`, `capacity`

### `Course_Offering`

- `offering_id`: Primary Key
- `course_id`, `semester_id`, `section`, `teacher_id`, `room_id`
- Unique Constraint: (`course_id`, `semester_id`, `section`)

### `Enrollment`

- `enrollment_id`: Primary Key
- `student_id`, `offering_id`, `letter_grade`
- Unique Constraint: (`student_id`, `offering_id`)

---

## 🔐 Constraints & Notes

- ✅ All foreign keys use `ON DELETE RESTRICT` by default.
- ✅ Room capacity is enforced via a `CHECK (capacity > 0)` constraint.
- 🔁 Only users with `role = 'faculty'` should be assigned as `teacher_id` (to be enforced via application logic or trigger).
- 🎓 Only `role = 'student'` users can be enrolled in courses.

---

## 📂 Files

| File | Description |
|------|-------------|
| `schema.sql` | SQL script to create the full database schema |
| `README.md` | Project documentation |
| `college_eer.mwb` | *(Optional)* MySQL Workbench EER diagram file (if available) |

---

## 🚀 Getting Started

1. Open **MySQL Workbench**
2. Create a new schema/database
3. Run the contents of `schema.sql`
4. (Optional) Use `college_eer.mwb` to view or edit the EER diagram visually

---

## 📈 Future Enhancements (Version 2+)

- ✅ Triggers to enforce role-based logic (e.g., only faculty teach courses)
- ✅ Room booking constraints by time slots
- ✅ Prerequisite relationships between courses
- ✅ Attendance and assignment tracking
- ✅ Stored procedures and views

---

## 👥 Contributors

- [Enoch Atuahene](https://github.com/Typher7)
- [William Asante](https://github.com/Kraeon20)

---

## 💬 Feedback or Contributions?

Feel free to open an issue or submit a pull request if you’d like to improve or expand this database project!
