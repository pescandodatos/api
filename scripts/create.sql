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