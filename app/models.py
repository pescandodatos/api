from app import db
from app import app

import sys
if sys.version_info >= (3, 0):
    enable_search = False
else:
    enable_search = app.config['WHOOSH_ENABLED']
    if enable_search:
        import flask_whooshalchemy as whooshalchemy

class Permiso(db.Model):
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    tipo_embarcacion = db.Column('tipo_embarcacion', db.String(7), nullable=False)
    inegi = db.Column('cod_inegi', db.String)
    estado = db.Column('estado', db.String(19), nullable=False)
    municipio = db.Column('municipio', db.String(33))
    localidad = db.Column('localidad', db.String(326)) 
    area = db.Column('area', db.String(677))
    rnpa = db.Column('rnpa', db.String)
    titular = db.Column('titular', db.String(109), nullable=False)
    especie = db.Column('especie', db.String(216))
    inicio = db.Column('inicio', db.String)
    termino = db.Column('termino', db.String)
    
    def __repr__(self):
        return '<Permiso %r>' % self.titular

class Activo(db.Model):
    __searchable__ = ['nombre']

    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    rnpa = db.Column('rnpa', db.String)
    nombre = db.Column('nombre', db.String(109), nullable=False)
    tipo = db.Column('tipo', db.String(7), nullable=False)
    estado = db.Column('estado', db.String(19), nullable=False)
    municipio = db.Column('municipio', db.String(33))
    localidad = db.Column('localidad', db.String(326))
    inegi = db.Column('cod_inegi', db.String)
    ano = db.Column('ano_construccion', db.String(13))
    
    def __repr__(self):
        return '<Activo %r>' % self.nombre

class UnidadEconomica(db.Model):
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    rnpa = db.Column('rnpa', db.String(10))
    nombre = db.Column('nombre', db.String(109), nullable=False)
    tipo = db.Column('tipo', db.String(7), nullable=False)
    fecha_registro = db.Column('fecha_registro', db.String)
    tipo_persona = db.Column('tipo_persona', db.String(7), nullable=False)
    representante_legal = db.Column('representante_legal', db.String(109), nullable=False)
    inicio = db.Column('inicio', db.String)
    estado = db.Column('estado', db.String(19), nullable=False)
    municipio = db.Column('municipio', db.String(33))
    localidad = db.Column('localidad', db.String(326))
    inegi = db.Column('cod_inegi', db.String)

    def __repr__(self):
        return '<Unidad Economica %r>' % self.nombre

class Embarcacion(db.Model):
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    rnpa = db.Column('rnpa', db.String(10))
    nombre = db.Column('nombre', db.String(56))
    rnpa_unidad_economica = db.Column('rnpa_unidad_economica', db.String)
    nombre_unidad_economica = db.Column('nombre_unidad_economica', db.String)
    estado = db.Column('estado', db.String(19))
    municipio = db.Column('municipio', db.String(49))
    localidad = db.Column('localidad', db.String(60))
    tipo = db.Column('tipo', db.String)
    fecha_registro = db.Column('fecha_registro', db.String)
    inegi = db.Column('cod_inegi', db.String)

    def __repr__(self):
        return '<Embarcacion %r>' % self.nombre

if enable_search:
    whooshalchemy.whoosh_index(app, Activo)
