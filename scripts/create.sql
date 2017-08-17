CREATE TABLE permisos (
		"id" INTEGER PRIMARY KEY AUTOINCREMENT,  
        "tipo_embarcacion" VARCHAR(7) NOT NULL,    
        "estado" VARCHAR(19) NOT NULL,             
        "municipio" VARCHAR(33),                   
        "localidad" VARCHAR(326),                  
        "rnpa" VARCHAR(55),  
        "titular" VARCHAR(109) NOT NULL,           
        "especie" VARCHAR(216),                    
        "area" VARCHAR(677),                       
        "inicio" DATE,                      
        "termino" DATE,
		"cod_inegi" VARCHAR(55)
);

CREATE TABLE activos (
		"id" INTEGER PRIMARY KEY AUTOINCREMENT, 
        "rnpa" VARCHAR(55), 
        "nombre" VARCHAR(105), 
        "tipo" VARCHAR(38) NOT NULL, 
        "municipio" VARCHAR(49) NOT NULL, 
        "localidad" VARCHAR(60) NOT NULL, 
        "estado" VARCHAR(19) NOT NULL, 
        "ano_construccion" VARCHAR(13) NOT NULL,
		"cod_inegi" VARCHAR(55)
);

CREATE TABLE unidades_economicas (
		"id" INTEGER PRIMARY KEY AUTOINCREMENT,
        "tipo" VARCHAR(20), 
        "rnpa" VARCHAR(55), 
        "nombre" VARCHAR(116), 
        "fecha_registro" DATE, 
        "tipo_persona" VARCHAR(6), 
        "representante_legal" VARCHAR(77), 
        "estado" VARCHAR(19), 
        "municipio" VARCHAR(49), 
        "localidad" VARCHAR(60), 
        "inicio"  DATE, 
		"cod_inegi" VARCHAR(55)
);

CREATE TABLE embarcaciones (      
		"id" INTEGER PRIMARY KEY AUTOINCREMENT,                  
        "rnpa" VARCHAR(10) NOT NULL,             
        "nombre" VARCHAR(56),           
        "rnpa_unidad_economica" VARCHAR(10),   
        "nombre_unidad_economica" VARCHAR(109),                                                
        "estado" VARCHAR(19) NOT NULL,              
        "municipio" VARCHAR(49) NOT NULL,           
        "localidad" VARCHAR(60) NOT NULL,           
        "tipo" VARCHAR(17) NOT NULL,    
        "fecha_registro" VARCHAR(13) NOT NULL, 
		"cod_inegi" VARCHAR(55)      
); 

CREATE TABLE marginacion (  
        "id" INTEGER PRIMARY KEY AUTOINCREMENT,                           
        "ENT" DECIMAL NOT NULL,         
        "NOM_ENT" VARCHAR(31) NOT NULL, 
        "MUN" DECIMAL NOT NULL, 
        "NOM_MUN" VARCHAR(35) NOT NULL, 
        "LOC" DECIMAL NOT NULL, 
        "NOM_LOC" VARCHAR(64) NOT NULL, 
        "POB_TOT" DECIMAL NOT NULL, 
        "VPH" DECIMAL NOT NULL, 
        "ANAL10" DECIMAL NOT NULL, 
        "SPRIM10" DECIMAL NOT NULL, 
        "SEXC10" DECIMAL NOT NULL, 
        "SEE10" DECIMAL NOT NULL, 
        "SAGUAE10" DECIMAL NOT NULL, 
        "PROM_OCC10" DECIMAL NOT NULL, 
        "PISOTIE10" DECIMAL NOT NULL, 
        "SREFRI10" DECIMAL NOT NULL, 
        "IM_2010" DECIMAL NOT NULL, 
        "GM_2010" VARCHAR(8) NOT NULL, 
        "IMC0A100" DECIMAL NOT NULL, 
        "LUG_NAL" DECIMAL NOT NULL, 
        "LUG_EDO" DECIMAL NOT NULL
);

CREATE TABLE solicitudes_may (
        "id" INTEGER PRIMARY KEY AUTOINCREMENT,  
        "Año" DECIMAL NOT NULL, 
        "Estado" VARCHAR(19) NOT NULL, 
        "Municipio" VARCHAR(14) NOT NULL, 
        "Localidad" VARCHAR(14) NOT NULL, 
        "Recibidas" DECIMAL, 
        "Apoyadas" DECIMAL, 
        "Monto" DECIMAL, 
		"cod_inegi" VARCHAR(55)
);

CREATE TABLE solicitudes_men (
        "id" INTEGER PRIMARY KEY AUTOINCREMENT,  
        "Componente" VARCHAR(11) NOT NULL, 
        "Año" DECIMAL NOT NULL, 
        "Estado" VARCHAR(19) NOT NULL, 
        "Municipio" VARCHAR(31626) NOT NULL, 
        "Localidad" VARCHAR(25992), 
        "Registradas" DECIMAL, 
        "Apoyadas" DECIMAL NOT NULL, 
		"cod_inegi" VARCHAR(55)
);

CREATE TABLE beneficiarios_reconversion (
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
	"Ano" DECIMAL NOT NULL, 
	"Beneficiario" VARCHAR(62) NOT NULL, 
	"Rnpa" DECIMAL, 
	"Nombre proyecto" VARCHAR(155) NOT NULL, 
	"Tipo proyecto" VARCHAR(38) NOT NULL, 
	"Especie" VARCHAR(40) NOT NULL, 
	"Estado" VARCHAR(12) NOT NULL, 
	"Municipio" VARCHAR(25) NOT NULL, 
	"Localidad" VARCHAR(47) NOT NULL, 
	"Monto" DECIMAL NOT NULL, 
    "cod_inegi" VARCHAR(55)
);

CREATE TABLE beneficiarios_modernizacion_men (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
	ano DECIMAL NOT NULL, 
	estado VARCHAR(19), 
	puerto VARCHAR(25), 
	beneficiario VARCHAR(111), 
	rnpa DECIMAL, 
	embarcacion VARCHAR(28), 
	monto_total DECIMAL, 
	aportacion_productor DECIMAL, 
	aportacion_conapesca DECIMAL, 
	pagado_por_concepto DECIMAL, 
	pagado_reembolso DECIMAL, 
	pasivos DECIMAL, 
	desistido DECIMAL, 
	saldo DECIMAL, 
    cod_inegi VARCHAR(55)
);

CREATE TABLE beneficiarios_motores (                                                                                                                                                                            
    id INTEGER PRIMARY KEY AUTOINCREMENT,                                                                                                                                                                       
        "Ano" DECIMAL NOT NULL,                                                                                                                                                                                 
        "Beneficiario" VARCHAR(72) NOT NULL,                                                                                                                                                                    
        "Rnpa" DECIMAL,                             
        "Estado" VARCHAR(19) NOT NULL,              
        "Municipio" VARCHAR(40) NOT NULL,           
        "Localidad" VARCHAR(47),                    
        "Tipo_monto" VARCHAR(7) NOT NULL,           
        "Monto_apoyado" DECIMAL,                    
    cod_inegi VARCHAR(55)                           
); 

CREATE TABLE beneficiarios_componentes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
	ano INTEGER, 
	beneficiario VARCHAR(165), 
	rnpa VARCHAR(61), 
	especie VARCHAR(70), 
	estado VARCHAR(19) NOT NULL, 
	municipio VARCHAR(36), 
	localidad VARCHAR(56), 
	monto INTEGER, 
    cod_inegi VARCHAR(55)
);

CREATE TABLE beneficiarios_diesel (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
	ano INTEGER, 
	beneficiario VARCHAR(119) NOT NULL, 
	rfc VARCHAR(13), 
	rnpa DECIMAL, 
	estado VARCHAR(31), 
	municipio VARCHAR(22), 
	localidad VARCHAR(36), 
	monto INTEGER,
    cod_inegi VARCHAR(55)
);

CREATE TABLE beneficiarios_menores (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
	componente VARCHAR(13) NOT NULL, 
	ano INTEGER, 
	beneficiario VARCHAR(52) NOT NULL, 
	rnpa DECIMAL NOT NULL, 
	estado VARCHAR(26) NOT NULL, 
	municipio VARCHAR(77) NOT NULL, 
	localidad VARCHAR(58), 
	tipo_monto VARCHAR(7), 
	monto INTEGER,
    cod_inegi VARCHAR(55)
);

CREATE TABLE beneficiarios_gasolina (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
	ano INTEGER, 
	beneficiario VARCHAR(108) NOT NULL, 
	rfc INTEGER, 
	rnpa INTEGER, 
	estado VARCHAR(31), 
	municipio VARCHAR(38), 
	localidad VARCHAR(52), 
	monto DECIMAL,
    cod_inegi VARCHAR(55)
);

CREATE TABLE beneficiarios_electricos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
	ano DECIMAL NOT NULL, 
	estado VARCHAR(6) NOT NULL, 
	beneficiario VARCHAR(37) NOT NULL, 
	rnpa DECIMAL NOT NULL, 
	municipio VARCHAR(10) NOT NULL, 
	localidad VARCHAR(14) NOT NULL, 
	tipo_monto VARCHAR(7) NOT NULL, 
	monto DECIMAL NOT NULL,
    cod_inegi VARCHAR(55)
);

CREATE TABLE beneficiarios_integral (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
	ano INTEGER, 
	beneficiario VARCHAR(76) NOT NULL, 
	rnpa VARCHAR(64) NOT NULL, 
	nombre_proyecto VARCHAR(156) NOT NULL, 
	tipo_apoyo VARCHAR(32) NOT NULL, 
	especie VARCHAR(73) NOT NULL, 
	estado VARCHAR(19) NOT NULL, 
	municipio VARCHAR(17) NOT NULL, 
	localidad VARCHAR(30) NOT NULL, 
	monto DECIMAL NOT NULL,
    cod_inegi VARCHAR(55)
);

CREATE TABLE solicitudes_diesel (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
	tipo VARCHAR(6) NOT NULL, 
	ano INTEGER, 
	estado VARCHAR(19) NOT NULL, 
	solicitudes_recibidas INTEGER, 
	solicitudes_procesadas INTEGER,
    cod_inegi VARCHAR(55)
);

CREATE TABLE solicitudes_gasolina (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
	tipo VARCHAR(8) NOT NULL, 
	ano INTEGER, 
	estado VARCHAR(19) NOT NULL, 
	municipio VARCHAR(36) NOT NULL, 
	localidad VARCHAR(52) NOT NULL, 
	solicitudes_atendidas DECIMAL NOT NULL, 
	solicitudes_recibidas DECIMAL NOT NULL,
    cod_inegi VARCHAR(55)
);

CREATE TABLE beneficiarios_modernicacion_may (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
	ano INTEGER, 
	estado VARCHAR(15) NOT NULL, 
	puerto VARCHAR(14) NOT NULL, 
	beneficiario VARCHAR(108) NOT NULL, 
	rnpa DECIMAL, 
	embarcacion VARCHAR(32) NOT NULL, 
	monto_aprobado DECIMAL NOT NULL, 
	pagado DECIMAL, 
	"2014_nov_dic_pasivos" DECIMAL, 
	"2014_enero_marzo_pasivos" DECIMAL, 
	desistido DECIMAL, 
	acta DECIMAL, 
	reintegro DECIMAL, 
	pdte_comprobante_pago DECIMAL,
    cod_inegi VARCHAR(55)
);
