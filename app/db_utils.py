import sqlite3


def connect(db_path):
    """
    Creates a SQLite connection with foreign keys enabled.

    Args:
        db_path (str): Path to the SQLite database file.

    Returns:
        sqlite3.Connection: An open database connection.
    """
    conn = sqlite3.connect(db_path)
    conn.row_factory = sqlite3.Row  # return rows as dictionaries
    conn.execute("PRAGMA foreign_keys = ON;")
    return conn


def fetch_all(conn, query, params=None):
    """
    Runs a SELECT query and returns all rows.

    Args:
        conn: SQLite connection.
        query (str): SQL query.
        params (tuple): Optional parameters for a prepared statement.

    Returns:
        list[sqlite3.Row]: Query results.
    """
    cursor = conn.cursor()
    cursor.execute(query, params or ())
    return cursor.fetchall()


def fetch_one(conn, query, params=None):
    """
    Runs a SELECT query and returns a single row.

    Args:
        conn: SQLite connection.
        query (str): SQL query.
        params (tuple): parameters.

    Returns:
        sqlite3.Row | None: A single row or None if no match.
    """
    cursor = conn.cursor()
    cursor.execute(query, params or ())
    return cursor.fetchone()


def execute(conn, query, params=None):
    """
    Runs INSERT, UPDATE, or DELETE statements.

    Args:
        conn: SQLite connection.
        query (str): SQL statement.
        params (tuple): SQL parameters.

    Returns:
        int: Number of affected rows.
    """
    cursor = conn.cursor()
    cursor.execute(query, params or ())
    conn.commit()
    return cursor.rowcount