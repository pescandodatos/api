import flask
import flask.ext.sqlalchemy
from sqlalchemy import Column, Integer, String, Numeric, Date
import flask.ext.restless

from flask import render_template

app = flask.Flask(__name__)
app.config.from_envvar('SETTINGS')

db = flask.ext.sqlalchemy.SQLAlchemy(app)

# Models

class Permisos(db.Model):
    id = Column(Integer, primary_key=True, autoincrement=True)
    tipo_embarcacion = Column('tipo_embarcacion', String(7), nullable=False)

    inegi = Column('cod_inegi', String)
    estado = Column('estado', String(19), nullable=False)
    municipio = Column('municipio', String(33))
    localidad = Column('localidad', String(326)) 
    area = Column('area', String(677))
    rnpa = Column('rnpa', String)
    titular = Column('titular', String(109), nullable=False)
    especie = Column('especie', String(216))
    inicio = Column('inicio', Date)
    termino = Column('termino', Date)

class Activos(db.Model):
    id = Column(Integer, primary_key=True, autoincrement=True)
    rnpa = Column('rnpa', String)
    nombre = Column('nombre', String(109), nullable=False)
    tipo = Column('tipo', String(7), nullable=False)
    estado = Column('estado', String(19), nullable=False)
    municipio = Column('municipio', String(33))
    localidad = Column('localidad', String(326))
    inegi = Column('cod_inegi', String)
    ano = Column('ano_construccion', String(13))

class UnidadesEconomicas(db.Model):
    id = Column(Integer, primary_key=True, autoincrement=True)
    rnpa = Column('rnpa', db.String(10))
    nombre = Column('nombre', db.String(109), nullable=False)
    tipo = Column('tipo', db.String(7), nullable=False)
    fecha_registro = Column('fecha_registro', db.String)
    tipo_persona = Column('tipo_persona', db.String(7), nullable=False)
    representante_legal = Column('representante_legal', db.String(109), nullable=False)
    inicio = Column('inicio', db.String)
    estado = Column('estado', db.String(19), nullable=False)
    municipio = Column('municipio', db.String(33))
    localidad = Column('localidad', db.String(326))
    inegi = Column('cod_inegi', db.String)

    def __repr__(self):
        return '<Unidad Economica %r>' % self.nombre

# Create the database tables.
db.create_all()


# Endpoints for the models

manager = flask.ext.restless.APIManager(app, flask_sqlalchemy_db=db)

manager.create_api(Permisos, methods=['GET'])
manager.create_api(Activos, methods=['GET'])
manager.create_api(UnidadesEconomicas, methods=['GET'])

# Endpoints for the APP

@app.route("/")
def index():
    return render_template('index.html', object_list=[])


if __name__ == '__main__':
    app.run(
        host="0.0.0.0",
        port=8000,
        use_reloader=True,
        debug=True,
    )