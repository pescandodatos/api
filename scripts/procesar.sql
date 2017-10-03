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
		`estado`	STRING,
		`localidad`	STRING,
		`municipio`	STRING,
         PRIMARY KEY (`nombre`, `rnpa`)
);

INSERT OR IGNORE INTO beneficiarios (nombre, rnpa, estado, localidad, municipio)
	SELECT beneficiario, rnpa, estado, localidad, municipio from beneficiarios_componentes;


INSERT OR IGNORE INTO beneficiarios (nombre, rnpa, estado, localidad, municipio)
	SELECT beneficiario, rnpa, estado, localidad, municipio from beneficiarios_diesel ;


INSERT OR IGNORE INTO beneficiarios (nombre, rnpa, estado, localidad, municipio)
	SELECT beneficiario, rnpa, estado, localidad, municipio from beneficiarios_electricos;

INSERT OR IGNORE INTO beneficiarios (nombre, rnpa, estado, localidad, municipio)
	SELECT beneficiario, rnpa, estado, localidad, municipio from beneficiarios_gasolina;

INSERT OR IGNORE INTO beneficiarios (nombre, rnpa, estado, localidad, municipio)
	SELECT beneficiario, rnpa, estado, localidad, municipio from beneficiarios_integral;

INSERT OR IGNORE INTO beneficiarios (nombre, rnpa, estado, localidad, municipio)
	SELECT beneficiario, rnpa, estado, localidad, municipio from beneficiarios_menores;

INSERT OR IGNORE INTO beneficiarios (nombre, rnpa)
	SELECT beneficiario, rnpa from beneficiarios_modernizacion_may_2014;

INSERT OR IGNORE INTO beneficiarios (nombre, rnpa)
	SELECT beneficiario, rnpa from beneficiarios_modernizacion_may_2015;

INSERT OR IGNORE INTO beneficiarios (nombre, rnpa, estado, localidad, municipio)
	SELECT beneficiario, rnpa, estado, localidad, municipio from beneficiarios_motores;

INSERT OR IGNORE INTO beneficiarios (nombre, rnpa, estado, localidad, municipio)
	SELECT beneficiario, rnpa, estado, localidad, municipio from beneficiarios_reconversion;

INSERT OR IGNORE INTO beneficiarios (nombre, rnpa, estado, localidad, municipio)
	SELECT nombre_unidad_economica, rnpa_unidad_economica, estado, localidad, municipio from embarcaciones;

-- beneficiarios que no estan en activos

select beneficiarios.nombre, beneficiarios.rnpa, beneficiarios.estado from beneficiarios left join activos on beneficiarios.rnpa = activos.rnpa and beneficiarios.estado = activos.estado and beneficiarios.municipio = activos.municipio and beneficiarios.localidad = activos.localidad where activos.rnpa is null;

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

-- COMPARAR BENEFICIARIOS CON UNIDADES

select count(*) from unidades join beneficiarios
on beneficiarios.rnpa = unidades.rnpa and beneficiarios.nombre = unidades.nombre

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
