from models.estudiantes import Estudiante
from models.cursos import Curso
from flask import request, Blueprint, redirect, render_template, url_for
from utils.db import db
from sqlalchemy.orm import Session


router = Blueprint("estudiantes", __name__)

@router.route('/')
def index():
    todosLosCursos = Curso.query.all()
    return render_template("index.html", cursos = todosLosCursos )

@router.route("/renderFormEstudiante/")
def renderFormEstudiante():
    return render_template("formEstudiante.html")

@router.route("/agregarEstudiante/", methods=["POST"])
def agregarEstudiante():
    nombre = request.form["nombre"]  # ESTO DEBE SALIR COMO NAME EN EL FORM DEL FRONT
    apellido = request.form["apellido"] # ESTO DEBE SALIR COMO NAME EN EL FORM DEL FRONT
    email = request.form["email"] # ESTO DEBE SALIR COMO NAME EN EL FORM DEL FRONT

    nuevoEstudiante = Estudiante(nombre, apellido, email)
    print(nuevoEstudiante)
    db.session.add(nuevoEstudiante)
    db.session.commit()
    return redirect(url_for('estudiantes.admin'))

@router.route("/actualizarEstudiante/<id>" , methods=["POST", "GET"])
def actualizarEstudiante(id):
    estudianteAActualizar = Estudiante.query.get(id)
    if request.method=="POST":
        estudianteAActualizar.nombre =request.form["nombre"]
        estudianteAActualizar.apellido = request.form["apellido"]
        estudianteAActualizar.email = request.form["email"]
        db.session.commit()
        return redirect(url_for('estudiantes.admin'))
    else:
        return render_template("actualizarEstudianteForm.html", estudiante=estudianteAActualizar)

@router.route("/borrarEstudiante/<id>")
def borrarEstudiante(id):
    estudianteAEliminar = Estudiante.query.get(id)
    db.session.delete(estudianteAEliminar)
    db.session.commit()
    return redirect(url_for('estudiantes.admin'))

@router.route("/agregarCurso/", methods=["POST"])
def agregarCurso():
    nombre = request.form["nombre"]  # ESTO DEBE SALIR COMO NAME EN EL FORM DEL FRONT
    contenido = request.form["contenido"]  # ESTO DEBE SALIR COMO NAME EN EL FORM DEL FRONT
    clases = request.form["clases"] # ESTO DEBE SALIR COMO NAME EN EL FORM DEL FRONT
    descripcion = request.form["descripcion"] # ESTO DEBE SALIR COMO NAME EN EL FORM DEL FRONT
    requisitos = request.form["requisitos"] # ESTO DEBE SALIR COMO NAME EN EL FORM DEL FRONT
    precio = request.form["precio"] # ESTO DEBE SALIR COMO NAME EN EL FORM DEL FRONT

    nuevoCurso = Curso(nombre,contenido, clases, descripcion,requisitos, precio)
    db.session.add(nuevoCurso)
    db.session.commit()
    return redirect(url_for('estudiantes.admin'))

@router.route("/borrarCurso/<id>")
def borrarCurso(id):
    cursoAEliminar = Curso.query.get(id)
    db.session.delete(cursoAEliminar)
    db.session.commit()
    return redirect(url_for('estudiantes.admin'))


@router.route("/actualizarCurso/<id>", methods=["POST", "GET"])
def actualizarCurso(id):
    cursoAActualizar = Curso.query.get(id)
    if request.method=="POST":
        cursoAActualizar.nombre =request.form["nombre"]
        cursoAActualizar.contenido =request.form["contenido"]
        cursoAActualizar.clases = request.form["clases"]
        cursoAActualizar.descripcion = request.form["descripcion"]
        cursoAActualizar.requisitos = request.form["requisitos"]  
        cursoAActualizar.precio = request.form["precio"]          
        db.session.commit()
        
        return redirect(url_for('estudiantes.admin'))
    else:
        return render_template("actualizarCursoForm.html", curso=cursoAActualizar)
    

@router.route("/inscribirEstudiante/<id>", methods=["POST", "GET"])
def inscribirEstudiante(id):
    curso = Curso.query.get(id)
    if request.method=="POST":
        nombre = request.form["nombre"]  # ESTO DEBE SALIR COMO NAME EN EL FORM DEL FRONT
        apellido = request.form["apellido"] # ESTO DEBE SALIR COMO NAME EN EL FORM DEL FRONT
        email = request.form["email"] # ESTO DEBE SALIR COMO NAME EN EL FORM DEL FRONT

        estudianteEnBd = db.session.query(Estudiante).filter(
            Estudiante.email == email
            ).first()
            
        if estudianteEnBd == None: 
            nuevoEstudiante = Estudiante(nombre, apellido, email)
            db.session.add(nuevoEstudiante)
            db.session.commit()
            estudianteEnBd = db.session.query(Estudiante).filter(Estudiante.email == email).first()
        
        curso.agregarEstudiante(estudianteEnBd)
        db.session.commit()
        return redirect(url_for('estudiantes.index'))
    else:
        return render_template("inscripcionCursoForm.html", curso=curso)


@router.route("/admin/")
def admin():
    todosLosEstudiantes = Estudiante.query.all()
    todosLosCursos = Curso.query.all()
    return render_template("admin.html" , estudiantes = todosLosEstudiantes , cursos = todosLosCursos )

@router.route("/admin/verEstudiantesPorCurso/<id>")
def verEstudiantesPorCurso(id):
    cursoAConsultar = Curso.query.get(id)
    listaEstudiantesId = cursoAConsultar.estudiantes.split(",")
    listaEstudiantesEnCurso = []
    for estID in listaEstudiantesId:
       listaEstudiantesEnCurso.append(Estudiante.query.get(estID)) 
    return render_template("verEstudiantesPorCurso.html" , estudiantesPorCurso = listaEstudiantesEnCurso, curso = cursoAConsultar )