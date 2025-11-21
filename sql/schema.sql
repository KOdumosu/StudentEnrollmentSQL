-- schema.sql
-- Creates the database schema for the Student Enrollment System
-- Works for SQLite. Make sure foreign_keys is enabled.

PRAGMA foreign_keys = ON;

-------------------------------------------------
-- TABLE: Students
-------------------------------------------------
CREATE TABLE IF NOT EXISTS Students (
    student_id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    email TEXT UNIQUE,
    admission_year INTEGER NOT NULL,
    created_at TEXT DEFAULT (datetime('now'))
);

-- Index to speed up name searches
CREATE INDEX IF NOT EXISTS idx_students_lastname
ON Students(last_name);

-------------------------------------------------
-- TABLE: Courses
-------------------------------------------------
CREATE TABLE IF NOT EXISTS Courses (
    course_id INTEGER PRIMARY KEY AUTOINCREMENT,
    course_code TEXT NOT NULL UNIQUE,
    title TEXT NOT NULL,
    credits INTEGER DEFAULT 3,
    department TEXT DEFAULT 'General'
);

-- Index for quick lookups by course code
CREATE INDEX IF NOT EXISTS idx_course_code
ON Courses(course_code);

-------------------------------------------------
-- TABLE: Enrollments
-------------------------------------------------
CREATE TABLE IF NOT EXISTS Enrollments (
    enrollment_id INTEGER PRIMARY KEY AUTOINCREMENT,
    student_id INTEGER NOT NULL,
    course_id INTEGER NOT NULL,
    enrollment_date TEXT DEFAULT (date('now')),
    grade TEXT,

    FOREIGN KEY (student_id) REFERENCES Students(student_id)
        ON UPDATE CASCADE ON DELETE CASCADE,

    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
        ON UPDATE CASCADE ON DELETE CASCADE,

    -- Prevent the same student from enrolling twice in the same course
    UNIQUE (student_id, course_id)
);

-- Helpful indexes
CREATE INDEX IF NOT EXISTS idx_enrollments_student
ON Enrollments(student_id);

CREATE INDEX IF NOT EXISTS idx_enrollments_course
ON Enrollments(course_id);