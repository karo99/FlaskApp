from flask import Flask, make_response, jsonify
from flask_marshmallow import Marshmallow
from flask_cors import CORS
import psycopg2
import sqlite3
from sqlite3 import Error

conn = None
cursor = None

def login():
    global conn
    conn = sqlite3.connect("D:\MOJE PLIKI\FlaskApp\pythonsqlite.db", check_same_thread=False)
    global cursor
    cursor = conn.cursor()
    print("Zalogowano")

def query():
    query = '''SELECT * FROM Persons'''
    cursor.execute(query)  # Przygotowanie i wykonanie operacji bazy danych
    rows = cursor.fetchall()
    print(rows[0])
    return rows


app = Flask(__name__)
CORS(app)
ma = Marshmallow(app)


@app.route('/connection', methods=['GET'])
def get_conn():
    login()
    return jsonify('jasonderulo')

@app.route('/query', methods=['GET'])
def get_query():
    queryList = query()
    return jsonify(queryList)

def create_connection(db_file):
    """ create a database connection to a SQLite database """
    conn = None
    try:
        conn = sqlite3.connect(db_file)
        print(sqlite3.version)
    except Error as e:
        print(e)
    finally:
        if conn:
            conn.close()


if __name__ == '__main__':
    create_connection(r"D:\MOJE PLIKI\FlaskApp\pythonsqlite.db")
    app.run(debug=True)
