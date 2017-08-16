from flask import render_template, jsonify
from app import app, db
from .models import Permiso, Activo, UnidadEconomica, Embarcacion

import flask.ext.restless

# Endpoints for the models
manager = flask.ext.restless.APIManager(app, flask_sqlalchemy_db=db)

manager.create_api(Permiso, primary_key='rnpa')
manager.create_api(Activo, methods=['GET'], primary_key='rnpa')
manager.create_api(UnidadEconomica, methods=['GET'], primary_key='rnpa')
manager.create_api(Embarcacion, methods=['GET'], primary_key='rnpa')

@app.errorhandler(404)
def not_found_error(error):
    return render_template('404.html'), 404

@app.errorhandler(500)
def internal_error(error):
    return render_template('500.html')


@app.route('/', methods=['GET'])
@app.route('/index', methods=['GET'])
def index(page=1):
    return render_template('index.html',
                           title='Pescando Datos')