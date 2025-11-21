# app.py -- simple CLI for demo
import argparse
import sqlite3
import sys

DB_HELP = "path to sqlite database file (e.g. ../enrollments.db)"

def connect(db_path):
    conn = sqlite3.connect(db_path)
    conn.row_factory = sqlite3.Row
    conn.execute("PRAGMA foreign_keys = ON;")
    return conn

def list_students(conn):
    cur = conn.execute("SELECT student_id, first_name, last_name FROM Students")
    for r in cur.fetchall():
        print(f"{r['student_id']}: {r['first_name']} {r['last_name']}")

def list_courses(conn):
    cur = conn.execute("SELECT course_id, course_code, title FROM Courses")
    for r in cur.fetchall():
        print(f"{r['course_id']}: {r['course_code']} - {r['title']}")

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--db", required=True, help=DB_HELP)
    parser.add_argument("--list", choices=['students','courses'], help="List items")
    args = parser.parse_args()

    conn = connect(args.db)
    if args.list == 'students':
        list_students(conn)
    elif args.list == 'courses':
        list_courses(conn)
    else:
        print("No command provided. Use --list students|courses")

if __name__ == "__main__":
    main()