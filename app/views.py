from flask import render_template
from app import app, db
from .models import Permiso, Activo, UnidadEconomica

import flask.ext.restless

# Endpoints for the models
manager = flask.ext.restless.APIManager(app, flask_sqlalchemy_db=db)

manager.create_api(Permiso, methods=['GET'])
manager.create_api(Activo, methods=['GET'])
manager.create_api(UnidadEconomica, methods=['GET'])

# @app.errorhandler(404)
# def not_found_error(error):
#     return render_template('404.html'), 404


@app.errorhandler(500)
def internal_error(error):
    return render_template('500.html')


@app.route('/', methods=['GET'])
@app.route('/index', methods=['GET'])
def index(page=1):
    return render_template('index.html',
                           title='Pescando Datos')