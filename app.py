import json

from flask import Flask
import sqlite3

app = Flask(__name__)
app.config['JSON_AS_ASCII'] = False


@app.get('/<itemid>')
def search_page(itemid):
    with sqlite3.connect('new_animal.db') as db:
        db.row_factory = sqlite3.Row
        query = db.execute(
            f"""
            SELECT *
            FROM animals
            WHERE id = {itemid}
            """).fetchone()

        return app.response_class(json.dumps(dict(query)), status=200, mimetype="application/json")


if __name__ == "__main__":
    app.run(debug=True)