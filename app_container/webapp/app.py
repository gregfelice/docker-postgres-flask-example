import os
import psycopg2

from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello():
    provider = str(os.environ.get('PROVIDER', 'world'))
    conn = psycopg2.connect("dbname=docker user=postgres host=db port=5432")
    cur = conn.cursor()
    cur.execute("select * from information_schema.tables;");
    rows = cur.fetchall()
    s = "<ul>"
    for row in rows:
        s = s + "<li>" + row[1] + " " + row[2] + " " + row[3] + "</li>"
    s = s + "</ul>"
    cur.close()
    conn.close()
    return s

@app.route('/health')
def health():
    return 'OK'

if __name__ == '__main__':
    # Bind to PORT if defined, otherwise default to 5000.
    port = int(os.environ.get('PORT', 5000))
    app.run(host='0.0.0.0', port=port)

