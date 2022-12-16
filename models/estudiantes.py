from utils.db import db

class Estudiante (db.Model):
    id = db.Column(db.Integer, primary_key=True)
    nombre = db.Column(db.String(100), nullable=False)
    apellido = db.Column(db.String(100), nullable=False)
    email = db.Column(db.String(100), unique=True, nullable=False)
    
    def __init__(self,nombre,apellido,email):
        self.nombre=nombre
        self.apellido=apellido
        self.email=email
 
    def getId(self):
        return self.id
