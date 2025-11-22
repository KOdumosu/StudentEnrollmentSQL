# StudentEnrollmentSQL

**Module:** SQL Relational Databases (CSE 310 – Module 2)  
**Author:** Kehinde Olusegun Odumosu  
**Date:** 22/11/2025

## Project Overview
This project demonstrates the core principles of relational database design using SQLite.  
It includes table creation (DDL), data manipulation (DML), normalization, foreign keys, JOIN queries, and a working Python command-line interface (CLI) to interact with the database.

The project simulates a Student Enrollment System, where:
- Students register for courses
- Courses belong to departments
- Enrollments map students to their courses with grades

All SQL and Python code is original and written for this module.

---

## Features
- **Three normalized tables:** Students, Courses, Enrollments  
- **Referential integrity:** FOREIGN KEY constraints with cascading behaviors  
- **Preloaded test data:** Using `sample_data.sql`  
- **Command-line interface (CLI):** Built with Python to query data  
- **Example queries:** JOIN, GROUP BY, COUNT, filtering  
- **Fully documented code:** In both SQL and Python files  

---

## Requirements
To run this project, you need:

- **Python 3.8+**  
- **SQLite (sqlite3)** installed and added to PATH  
- **Git** (for cloning the repo)

Optional:
- Visual Studio Code (recommended)
- ER diagram viewer

---
## Repository Structure