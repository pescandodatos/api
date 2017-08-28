from flask import render_template, jsonify
from app import app, db
from .models import Permiso, Activo, UnidadEconomica, Embarcacion, Marginacion, beneficiarios_reconversion, beneficiarios_componentes, beneficiarios_diesel, beneficiarios_electricos, beneficiarios_gasolina, beneficiarios_integral, solicitudes_diesel, beneficiarios_menores, solicitudes_gasolina, beneficiarios_modernicacion_may, solicitudes_may, beneficiarios_modernizacion_men, solicitudes_men, beneficiarios_motores 

import flask.ext.restless

# Endpoints for the models
manager = flask.ext.restless.APIManager(app, flask_sqlalchemy_db=db)

manager.create_api(Permiso, primary_key='rnpa')
manager.create_api(Activo, methods=['GET'], primary_key='rnpa')
manager.create_api(UnidadEconomica, methods=['GET'], primary_key='rnpa')
manager.create_api(Embarcacion, methods=['GET'], primary_key='rnpa')
manager.create_api(Marginacion, methods=['GET'])

manager.create_api(beneficiarios_reconversion, methods=['GET'])               
manager.create_api(beneficiarios_componentes, methods=['GET'])                                          
manager.create_api(beneficiarios_diesel, methods=['GET'])                                                 
manager.create_api(beneficiarios_electricos, methods=['GET'])                                           
manager.create_api(beneficiarios_gasolina, methods=['GET'])                                                 
manager.create_api(beneficiarios_integral, methods=['GET'])           
manager.create_api(solicitudes_diesel, methods=['GET'])                           
manager.create_api(beneficiarios_menores, methods=['GET'])            
manager.create_api(solicitudes_gasolina, methods=['GET'])                         
manager.create_api(beneficiarios_modernicacion_may, methods=['GET'])  
manager.create_api(solicitudes_may, methods=['GET'])                              
manager.create_api(beneficiarios_modernizacion_men, methods=['GET'])  
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