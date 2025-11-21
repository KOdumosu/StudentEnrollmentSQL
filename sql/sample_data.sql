-- sample_data.sql
INSERT INTO Students (first_name, last_name, email, admission_year) VALUES
('Aisha', 'Adebayo', 'aisha@example.com', 2023),
('John', 'Doe', 'john.doe@example.com', 2022),
('Mary', 'Smith', 'mary.s@example.com', 2024);

INSERT INTO Courses (course_code, title, credits) VALUES
('CSE101', 'Intro to Programming', 3),
('CSE210', 'Data Structures', 3),
('MAT101', 'Calculus I', 4);

INSERT INTO Enrollments (student_id, course_id, grade) VALUES
(1, 1, 'A'),
(2, 1, 'B+'),
(2, 2, NULL);