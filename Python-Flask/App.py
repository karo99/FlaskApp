#!/usr/bin/env python
# -*- coding: utf-8 -*-

from flask import Flask, make_response, jsonify
from flask_marshmallow import Marshmallow
from flask_cors import CORS
import sqlite3
from sqlite3 import Error

conn = None
cursor = None


def login():
    global conn
    conn = sqlite3.connect("../pythonsqlite.db", check_same_thread=False)
    global cursor
    cursor = conn.cursor()
    print("Zalogowano")


def query():
    global conn
    global cursor
    query = '''INSERT OR REPLACE INTO Client (PersonalIDNbr, FirstName, LastName, PhoneNbr, Email, Address)
    VALUES (2, 'Krzysztof', 'Malina', '612217878', 'k.malinka@gmail.com', 'Orzechowa 3'); '''
    cursor.execute(query)  # Przygotowanie i wykonanie operacji bazy danych
    rows = cursor.fetchall()
    conn.commit()
    print(rows)
    return rows


def query2():
    global conn
    global cursor
    query = '''SELECT * FROM Client; '''
    cursor.execute(query)  # Przygotowanie i wykonanie operacji bazy danych
    rows = cursor.fetchall()
    conn.commit()
    print(rows)
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

@app.route('/query2', methods=['GET'])
def get_query2():
    queryList = query2()
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
    create_connection(r"..\pythonsqlite.db")
    app.run(debug=True)
