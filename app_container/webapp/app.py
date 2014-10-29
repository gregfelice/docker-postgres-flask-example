import os
import psycopg2

from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello():
    provider = str(os.environ.get('PROVIDER', 'world'))
    conn = psycopg2.connect("dbname=docker user=postgres host=db port=5432")
    # conn = psycopg2.connect("dbname=docker user=postgres host=172.16.107.93 port=49153")
    cur = conn.cursor()
    cur.execute("SELECT * FROM person;")
    s = cur.fetchone()
    cur.close()
    conn.close()
    return 'from the database comes the name: ' + s[1] + ' ' + s[0]

@app.route('/health')
def health():
    return 'OK'

if __name__ == '__main__':
    # Bind to PORT if defined, otherwise default to 5000.
    port = int(os.environ.get('PORT', 5000))
    app.run(host='0.0.0.0', port=port)

