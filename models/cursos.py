from utils.db import db
class Curso (db.Model):
    id = db.Column(db.Integer, primary_key=True)
    nombre = db.Column(db.String(100), unique=True, nullable=False)
    contenido = db.Column(db.String(500), nullable=False)
    clases = db.Column(db.String(100), nullable=False)
    descripcion = db.Column(db.String(500), nullable=False)
    requisitos = db.Column(db.String(500), nullable=False)
    precio = db.Column(db.String(100), nullable=False)
    estudiantes = db.Column(db.String(500)) 


    
    def __init__(self,nombre,contenido,clases,descripcion,requisitos,precio):
        self.nombre=nombre
        self.contenido=contenido
        self.clases=clases
        self.descripcion=descripcion
        self.requisitos=requisitos
        self.precio=precio
        self.estudiantes=""

    def agregarEstudiante(self,estudiante):
        idEst = estudiante.getId()

        if len(self.estudiantes) > 0: 
            listaEstudiantes = self.estudiantes.split(",")
            
            if idEst not in listaEstudiantes:
                listaEstudiantes.append(str(idEst))
                self.estudiantes = ",".join(str(idEst))
        else:
            self.estudiantes = str(idEst)



