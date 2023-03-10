from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from config import SQL_DATABASE_URI
from controllers.routes import router

app = Flask(__name__)
app.config["SQLALCHEMY_DATABASE_URI"] = SQL_DATABASE_URI
app.config['SQLALCHEMY_TRACK_MODIFICATIONS']=False
app.secret_key="clave super secreta"
#sqlite:///tmp/contactos.db => https://flask-sqlalchemy.palletsprojects.com/en/3.0.x/quickstart/#what-to-remember => 
# configure extension, explica como conectar a SQLITE

SQLAlchemy(app)

if __name__ == "__main__":
    #app.run(debug=True)
    app.run(host="0.0.0.0", port=5000)

app.register_blueprint(router)
