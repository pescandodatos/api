-- Add inegi codes to all the tables
-- "COD_ESTADO" DECIMAL NOT NULL,              
-- "ESTADO" VARCHAR(20) NOT NULL,              
-- "COD_MUNICIPIO" DECIMAL NOT NULL,           
-- "MUNICIPIO" VARCHAR(76) NOT NULL,           
-- "COD_LOCALIDAD" DECIMAL NOT NULL,           
-- "LOCALIDAD" VARCHAR(82) NOT NULL,           

PRAGMA case_sensitive_like = false;

ALTER TABLE inegi ADD COLUMN COD_INEGI VARCHAR(9);
UPDATE inegi SET COD_INEGI = 
   substr('000'||COD_ESTADO, -3 , 3) || substr('00'||COD_MUNICIPIO, -3, 3) || + substr('00'||COD_LOCALIDAD, -3 , 3);

-- add the code that we need
ALTER TABLE inegi ADD COLUMN COD_INEGI INTEGER;
UPDATE inegi SET COD_INEGI = 
   cast(inegi.COD_ESTADO as varchar(9)) || '' ||  cast(inegi.COD_MUNICIPIO as varchar(9)) || '' || + cast(inegi.COD_LOCALIDAD as varchar(9));



-- crear una tabla de beneficiarios para comparar con las unidades
CREATE TABLE `beneficiarios` (
        `nombre`        STRING NOT NULL,
        `rnpa`     STRING,
         PRIMARY KEY (`nombre`, `rnpa`)
);

INSERT OR IGNORE INTO beneficiarios (nombre, rnpa)
	SELECT beneficiario, rnpa from beneficiarios_componentes;


INSERT OR IGNORE INTO beneficiarios (nombre, rnpa)
	SELECT beneficiario, rnpa from beneficiarios_diesel ;


INSERT OR IGNORE INTO beneficiarios (nombre, rnpa)
	SELECT beneficiario, rnpa from beneficiarios_electricos;

INSERT OR IGNORE INTO beneficiarios (nombre, rnpa)
	SELECT beneficiario, rnpa from beneficiarios_gasolina;

INSERT OR IGNORE INTO beneficiarios (nombre, rnpa)
	SELECT beneficiario, rnpa from beneficiarios_integral;

INSERT OR IGNORE INTO beneficiarios (nombre, rnpa)
	SELECT beneficiario, rnpa from beneficiarios_menores;

INSERT OR IGNORE INTO beneficiarios (nombre, rnpa)
	SELECT beneficiario, rnpa from beneficiarios_modernizacion_may_2014;

INSERT OR IGNORE INTO beneficiarios (nombre, rnpa)
	SELECT beneficiario, rnpa from beneficiarios_modernizacion_may_2015;

INSERT OR IGNORE INTO beneficiarios (nombre, rnpa)
	SELECT beneficiario, rnpa from beneficiarios_motores;

INSERT OR IGNORE INTO beneficiarios (nombre, rnpa)
	SELECT beneficiario, rnpa from beneficiarios_reconversion;

INSERT OR IGNORE INTO beneficiarios (nombre, rnpa)
	SELECT nombre_unidad_economica, rnpa_unidad_economica from embarcaciones;


-- TOMAR DATOS DE LOCALIDADES
-- CREAR TABLA SIMPLE CON LOCALIDADES
drop table `localidades`;
CREATE TABLE `localidades` (
        `estado`        STRING NOT NULL,
        `municipio`     STRING,
        `localidad`     STRING,
         PRIMARY KEY (`estado`, `municipio`, `localidad`)
);

INSERT OR IGNORE INTO localidades (estado, municipio, localidad)
	SELECT estado, municipio, localidad from activos;

INSERT OR IGNORE INTO localidades (estado, municipio, localidad)
	SELECT estado, municipio, localidad from unidades;

INSERT OR IGNORE INTO localidades (estado, municipio, localidad)
	SELECT estado, municipio, localidad from beneficiarios_componentes;
	
INSERT OR IGNORE INTO localidades (estado, municipio, localidad)
	SELECT estado, municipio, localidad from beneficiarios_diesel;

INSERT OR IGNORE INTO localidades (estado, municipio, localidad)
	SELECT estado, municipio, localidad from beneficiarios_electricos;

INSERT OR IGNORE INTO localidades (estado, municipio, localidad)
	SELECT estado, municipio, localidad from beneficiarios_gasolina;

INSERT OR IGNORE INTO localidades (estado, municipio, localidad)
	SELECT estado, municipio, localidad from beneficiarios_integral;

INSERT OR IGNORE INTO localidades (estado, municipio, localidad)
	SELECT estado, municipio, localidad from beneficiarios_menores;

INSERT OR IGNORE INTO localidades (estado, municipio, localidad)
	SELECT estado, municipio, localidad from beneficiarios_menores;


INSERT OR IGNORE INTO localidades (estado, municipio, localidad)
	SELECT estado, municipio, localidad from permiso; 

INSERT OR IGNORE INTO localidades (estado, municipio, localidad)
	SELECT estado, municipio, localidad from beneficiarios_motores;     

INSERT OR IGNORE INTO localidades (estado, municipio, localidad)
	SELECT estado, municipio, localidad from beneficiarios_reconversion;     

INSERT OR IGNORE INTO localidades (estado, municipio, localidad)
	SELECT estado, municipio, localidad from embarcacion;     

INSERT OR IGNORE INTO localidades (estado, municipio, localidad)
	SELECT estado, municipio, localidad from solicitudes_men;                     
  
INSERT OR IGNORE  INTO localidades (estado, municipio, localidad, cod_inegi_municipio, cod_inegi_localidad)
	SELECT estado, municipio, localidad, cod_inegi_municipio, cod_inegi_localidad from inegi;


-- PARA ACTUALIZAR CODIGOS INEGIS, SQL CODE A USAR CON TODAS LAS TABLAS

UPDATE LOCALIDADES 
SET COD_INEGI_LOCALIDAD = (select COD_INEGI_LOCALIDAD from INEGI where LOCALIDADES.ESTADO = INEGI.ESTADO AND LOCALIDADES.MUNICIPIO = INEGI.MUNICIPIO AND LOCALIDADES.LOCALIDAD = INEGI.LOCALIDAD)

UPDATE permisos
SET COD_INEGI_LOCALIDAD = (
select COD_INEGI_LOCALIDAD from LOCALIDADES 
where LOCALIDADES.ESTADO = permisos.ESTADO 
AND LOCALIDADES.MUNICIPIO = permisos.MUNICIPIO
AND LOCALIDADES.LOCALIDAD = permisos.LOCALIDAD
);
