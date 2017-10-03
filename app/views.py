from flask import render_template, jsonify
from app import app, db
from .models import Permisos, Activos, Unidades, Embarcaciones, Marginacion, beneficiarios_infraestructura, beneficiarios_componentes, beneficiarios_diesel, beneficiarios_electricos, beneficiarios_gasolina, solicitudes_diesel, beneficiarios_menores, solicitudes_gasolina, solicitudes_may, solicitudes_men, beneficiarios_motores, Beneficiarios

import flask.ext.restless

# Endpoints for the models
manager = flask.ext.restless.APIManager(app, flask_sqlalchemy_db=db)

manager.create_api(Permisos, primary_key='rnpa')
manager.create_api(Activos, methods=['GET'], primary_key='rnpa')
manager.create_api(Beneficiarios, methods=['GET'], primary_key='rnpa')
manager.create_api(Unidades, methods=['GET'], primary_key='rnpa')
manager.create_api(Embarcaciones, methods=['GET'], primary_key='rnpa')
manager.create_api(Marginacion, methods=['GET'])

manager.create_api(beneficiarios_infraestructura, methods=['GET'])               
manager.create_api(beneficiarios_componentes, methods=['GET'])                                          
manager.create_api(beneficiarios_diesel, methods=['GET'])                                                 
manager.create_api(beneficiarios_electricos, methods=['GET'])                                           
manager.create_api(beneficiarios_gasolina, methods=['GET'])           
manager.create_api(solicitudes_diesel, methods=['GET'])                           
manager.create_api(beneficiarios_menores, methods=['GET'])            
manager.create_api(solicitudes_gasolina, methods=['GET'])            
manager.create_api(solicitudes_may, methods=['GET'])                 
manager.create_api(solicitudes_men, methods=['GET'])                              
manager.create_api(beneficiarios_motores, methods=['GET'])   

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