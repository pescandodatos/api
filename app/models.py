# coding: utf-8

from app import db
from app import app

import sys
if sys.version_info >= (3, 0):
    enable_search = False
else:
    enable_search = app.config['WHOOSH_ENABLED']
    if enable_search:
        import flask_whooshalchemy as whooshalchemy

class Inegi(db.Model):
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    inegi_municipio = db.Column('COD_INEGI_MUNICIPIO', db.String)
    inegi_localidad = db.Column('COD_INEGI_MUNICIPIO', db.String)
    cod_estado = db.Column('COD_ESTADO', db.String)
    estado = db.Column('ESTADO', db.String(19), nullable=False)
    estado_abreviado = db.Column('NOM_ABR', db.String(19), nullable=False)
    cod_municipio = db.Column('COD_MUNICIPIO', db.String)
    municipio = db.Column('MUNICIPIO', db.String(33))
    cod_localidad = db.Column('COD_LOCALIDAD', db.String)
    localidad = db.Column('LOCALIDAD', db.String(326)) 
    ambito = db.Column('AMBITO', db.String)
    latitud = db.Column('LATITUD', db.String)
    longitud = db.Column('LONGITUD', db.String)
    altitud = db.Column('ALTITUD', db.String)
    cve_carta = db.Column('CVE_CARTA', db.String)
    inegi_localidad = db.Column('cod_inegi_localidad', db.String(9))
    inegi_municipio = db.Column('cod_inegi_municipio', db.String(6))

class Permisos(db.Model):
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    tipo_embarcacion = db.Column('tipo_embarcacion', db.String(7), nullable=False)
    tipo_permiso = db.Column('tipo_permiso', db.String)
    estado = db.Column('estado', db.String(19), nullable=False)
    municipio = db.Column('municipio', db.String(33))
    localidad = db.Column('localidad', db.String(326)) 
    area = db.Column('area', db.String(677))
    rnpa = db.Column('rnpa', db.String)
    titular = db.Column('titular', db.String(109), nullable=False)
    especie = db.Column('especie', db.String(216))
    inicio = db.Column('inicio', db.String)
    termino = db.Column('termino', db.String)
    inegi_localidad = db.Column('cod_inegi_localidad', db.String(9))
    inegi_municipio = db.Column('cod_inegi_municipio', db.String(6))
    
    def __repr__(self):
        return '<Permiso %r>' % self.titular

# Toma todos los datos de los beneficiarios
class Beneficiarios(db.Model):
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    rnpa = db.Column('rnpa', db.String)
    nombre = db.Column('nombre', db.String(109), nullable=False)
    
    def __repr__(self):
        return '<Beneficiario %r>' % self.nombre


class Activos(db.Model):
    __searchable__ = ['nombre']

    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    rnpa = db.Column('rnpa', db.String)
    nombre = db.Column('nombre', db.String(109), nullable=False)
    tipo = db.Column('tipo', db.String(7), nullable=False)
    estado = db.Column('estado', db.String(19), nullable=False)
    municipio = db.Column('municipio', db.String(33))
    localidad = db.Column('localidad', db.String(326))
    ano = db.Column('ano_construccion', db.String(13))
    inegi_localidad = db.Column('cod_inegi_localidad', db.String(9))
    inegi_municipio = db.Column('cod_inegi_municipio', db.String(6))
    
    def __repr__(self):
        return '<Activos %r>' % self.nombre

class Unidades(db.Model):
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
    inegi_localidad = db.Column('cod_inegi_localidad', db.String(9))
    inegi_municipio = db.Column('cod_inegi_municipio', db.String(6))

    def __repr__(self):
        return '<Unidad Economica %r>' % self.nombre

class Embarcaciones(db.Model):
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
    inegi_localidad = db.Column('cod_inegi_localidad', db.String(9))
    inegi_municipio = db.Column('cod_inegi_municipio', db.String(6))

    def __repr__(self):
        return '<Embarcacion %r>' % self.nombre

class Marginacion(db.Model):
    __tablename__ = 'marginacion_localidad'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    cod_inegi = db.Column('cod_inegi', db.String(9))
    cod_estado = db.Column('ENT', db.String, nullable=False)
    estado = db.Column('NOM_ENT', db.String(31), nullable=False)
    cod_municipio = db.Column('MUN', db.String, nullable=False)
    municipio = db.Column('NOM_MUN', db.String(35), nullable=False)
    cod_localidad = db.Column('LOC', db.String, nullable=False)
    localidad = db.Column('NOM_LOC', db.String(64), nullable=False)
    poblacion_total = db.Column('POB_TOT', db.Integer, nullable=False)
    viviendas_particulares = db.Column('VPH', db.Integer, nullable=False)
    analfabeta = db.Column('ANAL10', db.Integer, nullable=False)
    sin_primaria = db.Column('SPRIM10', db.Integer, nullable=False)
    sin_excusado = db.Column('SEXC10', db.Integer, nullable=False)
    sin_energia_electrica = db.Column('SEE10', db.Integer, nullable=False)
    sin_agua_entubada = db.Column('SAGUAE10', db.Integer, nullable=False)
    ocupantes_por_cuarto = db.Column('PROM_OCC10', db.Integer, nullable=False)
    sin_piso_tierra = db.Column('PISOTIE10', db.Integer, nullable=False)
    sin_refrigerador = db.Column('SREFRI10', db.Integer, nullable=False)
    indice_marginacion_2010 = db.Column('IM_2010', db.Integer, nullable=False)
    grado_marginacion = db.Column('GM_2010', db.String(8), nullable=False)
    indice_marginacion = db.Column('IMC0A100', db.Integer, nullable=False)
    lugar_en_nacional = db.Column('LUG_NAL', db.Integer, nullable=False)
    lugar_en_estatal = db.Column('LUG_EDO', db.Integer, nullable=False)

class beneficiarios_infraestructura(db.Model):
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    ano = db.Column('ano', db.String)
    beneficiario = db.Column('Beneficiario', db.String)
    rnpa = db.Column('Rnpa', db.String)
    nombre_proyecto  = db.Column('nombre_proyecto', db.String)
    tipo_proyecto  = db.Column('tipo_proyecto', db.String)
    especie  = db.Column('Especie', db.String)
    estado  = db.Column('Estado', db.String)
    municipio  = db.Column('Municipio', db.String)
    localidad  = db.Column('Localidad', db.String)
    monto = db.Column('Monto', db.Float)
    inegi_localidad = db.Column('cod_inegi_localidad', db.String(9))
    inegi_municipio = db.Column('cod_inegi_municipio', db.String(6))

class beneficiarios_componentes(db.Model):
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)   
    ano = db.Column('ano', db.String)
    beneficiario = db.Column('Beneficiario', db.String)
    rnpa = db.Column('Rnpa', db.String)
    especie  = db.Column('Especie', db.String)
    estado  = db.Column('Estado', db.String)
    municipio  = db.Column('Municipio', db.String)
    localidad  = db.Column('Localidad', db.String)
    monto = db.Column('Monto', db.Float)
    inegi_localidad = db.Column('cod_inegi_localidad', db.String(9))
    inegi_municipio = db.Column('cod_inegi_municipio', db.String(6))

class beneficiarios_diesel(db.Model):
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)  
    ano = db.Column('ano', db.String)
    beneficiario = db.Column('Beneficiario', db.String)
    rfc = db.Column('rfc', db.String)
    rnpa = db.Column('Rnpa', db.String)
    estado  = db.Column('Estado', db.String)
    municipio  = db.Column('Municipio', db.String)
    localidad  = db.Column('Localidad', db.String)
    monto = db.Column('Monto', db.Float)
    inegi_localidad = db.Column('cod_inegi_localidad', db.String(9))
    inegi_municipio = db.Column('cod_inegi_municipio', db.String(6))

class beneficiarios_electricos(db.Model):
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    ano = db.Column('ano', db.String)
    beneficiario = db.Column('Beneficiario', db.String)
    rnpa = db.Column('Rnpa', db.String)
    estado  = db.Column('Estado', db.String)
    municipio  = db.Column('Municipio', db.String)
    localidad  = db.Column('Localidad', db.String)
    tipo_monto = db.Column('tipo_monto', db.String)
    monto = db.Column('Monto', db.Float)
    inegi = db.Column('cod_inegi', db.String)

class beneficiarios_gasolina(db.Model):
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    ano = db.Column('ano', db.String)
    beneficiario = db.Column('Beneficiario', db.String)
    rfc = db.Column('rfc', db.String)
    rnpa = db.Column('Rnpa', db.String)
    estado  = db.Column('Estado', db.String)
    municipio  = db.Column('Municipio', db.String)
    localidad  = db.Column('Localidad', db.String)
    monto = db.Column('Monto', db.Float)
    inegi_localidad = db.Column('cod_inegi_localidad', db.String(9))
    inegi_municipio = db.Column('cod_inegi_municipio', db.String(6))

class solicitudes_diesel(db.Model):
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    tipo = db.Column('tipo', db.String)
    ano = db.Column('ano', db.String)
    estado  = db.Column('estado', db.String)                        
    solicitudes_recibidas = db.Column('solicitudes_recibidas', db.String)
    solicitudes_procesadas = db.Column('solicitudes_procesadas', db.String)

class beneficiarios_menores(db.Model):
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    componente = db.Column('componente', db.String)
    ano = db.Column('ano', db.String)
    beneficiario = db.Column('Beneficiario', db.String)
    rnpa = db.Column('Rnpa', db.String)
    estado  = db.Column('Estado', db.String)
    municipio  = db.Column('Municipio', db.String)
    localidad  = db.Column('Localidad', db.String)
    tipo_monto = db.Column('tipo_monto', db.String)
    monto = db.Column('Monto', db.Float)
    inegi_localidad = db.Column('cod_inegi_localidad', db.String(9))
    inegi_municipio = db.Column('cod_inegi_municipio', db.String(6)) 

class solicitudes_gasolina(db.Model):
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    tipo = db.Column('tipo', db.String)
    ano = db.Column('ano', db.String)
    estado  = db.Column('Estado', db.String)
    municipio  = db.Column('Municipio', db.String)
    localidad  = db.Column('Localidad', db.String)
    solicitudes_atendidas = db.Column('solicitudes_atendidas', db.Integer)
    solicitudes_recibidas = db.Column('solicitudes_recibidas', db.Integer)
    inegi_localidad = db.Column('cod_inegi_localidad', db.String(9))
    inegi_municipio = db.Column('cod_inegi_municipio', db.String(6))

class solicitudes_may(db.Model):
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    ano = db.Column('ano', db.String)
    estado  = db.Column('Estado', db.String)
    municipio  = db.Column('Municipio', db.String)
    localidad  = db.Column('Localidad', db.String)
    solicitudes_atendidas = db.Column('Apoyadas', db.Integer)
    solicitudes_recibidas = db.Column('Recibidas', db.Integer)
    monto = db.Column('Monto', db.Integer)
    inegi_localidad = db.Column('cod_inegi_localidad', db.String(9))
    inegi_municipio = db.Column('cod_inegi_municipio', db.String(6)) 

class solicitudes_men(db.Model):
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    componente = db.Column('Componente', db.String)
    ano = db.Column('Ano', db.String)
    estado  = db.Column('Estado', db.String)
    municipio  = db.Column('Municipio', db.String)
    localidad  = db.Column('Localidad', db.String)
    solicitudes_atendidas = db.Column('apoyadas', db.Integer)
    solicitudes_recibidas = db.Column('registradas', db.Integer)    
    inegi_localidad = db.Column('cod_inegi_localidad', db.String(9))
    inegi_municipio = db.Column('cod_inegi_municipio', db.String(6))

# TODO: Estos modelos son TERRIBLES pero hay que entenderlos mejor para poder hacer la unión.
class beneficiarios_modernizacion_may_2014(db.Model):
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    ano = db.Column('ano', db.String)
    beneficiario = db.Column('Beneficiario', db.String)
    rnpa = db.Column('Rnpa', db.String)
    estado  = db.Column('Estado', db.String)
    municipio  = db.Column('Municipio', db.String)
    localidad  = db.Column('Localidad', db.String)
    puerto = db.Column('puerto', db.String)
    embarcacion = db.Column('embarcacion', db.String)
    monto_aprobado = db.Column('monto_aprobado', db.Float)
    pagado = db.Column('pagado', db.Float)
    desistido = db.Column('desistido', db.Integer)
    acta = db.Column('acta', db.Integer)
    reintegro = db.Column('reintegro', db.Integer)
    pdte_comprobante_pago = db.Column('pdte_comprobante_pago', db.Integer)
    inegi = db.Column('cod_inegi', db.String)   

class beneficiarios_modernizacion_may_2015(db.Model):
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    ano = db.Column('ano', db.String)
    beneficiario = db.Column('Beneficiario', db.String)
    rnpa = db.Column('Rnpa', db.String)
    estado  = db.Column('Estado', db.String)
    municipio  = db.Column('Municipio', db.String)
    localidad  = db.Column('Localidad', db.String)
    puerto = db.Column('puerto', db.String)
    embarcacion = db.Column('embarcacion', db.String)
    monto_total = db.Column('monto_total', db.Integer)
    aportacion_productor = db.Column('aportacion_productor', db.Integer)
    aportacion_conapesca = db.Column('aportacion_conapesca', db.Integer)
    pagado_por_concepto = db.Column('pagado_por_concepto', db.Integer)
    pagado_reembolso = db.Column('pagado_reembolso', db.Integer)
    pasivos = db.Column('pasivos', db.Integer)
    desistido = db.Column('desistido', db.Integer)
    saldo = db.Column('saldo', db.Integer)

class beneficiarios_motores(db.Model):
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    ano = db.Column('ano', db.String)
    beneficiario = db.Column('Beneficiario', db.String)
    rnpa = db.Column('Rnpa', db.String)
    estado  = db.Column('Estado', db.String)
    municipio  = db.Column('Municipio', db.String)
    localidad  = db.Column('Localidad', db.String)
    tipo_monto = db.Column('Tipo_monto', db.String)
    monto = db.Column('Monto', db.Float)
    inegi_localidad = db.Column('cod_inegi_localidad', db.String(9))
    inegi_municipio = db.Column('cod_inegi_municipio', db.String(6))

if enable_search:
    whooshalchemy.whoosh_index(app, Activos)
