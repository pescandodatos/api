-- Add inegi codes to all the tables
-- "COD_ESTADO" DECIMAL NOT NULL,              
-- "ESTADO" VARCHAR(20) NOT NULL,              
-- "COD_MUNICIPIO" DECIMAL NOT NULL,           
-- "MUNICIPIO" VARCHAR(76) NOT NULL,           
-- "COD_LOCALIDAD" DECIMAL NOT NULL,           
-- "LOCALIDAD" VARCHAR(82) NOT NULL,           

PRAGMA case_sensitive_like = false;

-- add the code that we need
ALTER TABLE inegi ADD COLUMN COD_INEGI INTEGER;
UPDATE inegi SET COD_INEGI = 
   cast(inegi.COD_ESTADO as varchar(9)) || '' ||  cast(inegi.COD_MUNICIPIO as varchar(9)) || '' || + cast(inegi.COD_LOCALIDAD as varchar(9));

SELECT inegi.COD_INEGI FROM inegi INNER JOIN PERMISOS ON UPPER(inegi.ESTADO) = PERMISOS.Estado AND UPPER(inegi.MUNICIPIO) = PERMISOS.Municipio AND UPPER(inegi.LOCALIDAD) = PERMISOS.Localidad COLLATE utf8_spanish_ci;


PRAGMA table_info(embarcaciones);

-- add inegi code to permisos
ALTER TABLE PERMISOS ADD COLUMN COD_INEGI DECIMAL;
ALTER TABLE PERMISOS DROP COLUMN k;
UPDATE PERMISOS SET COD_INEGI = 
    (SELECT inegi.COD_INEGI
    FROM inegi
    WHERE UPPER(inegi.ESTADO) = PERMISOS.Estado AND UPPER(inegi.MUNICIPIO) = PERMISOS.Municipio AND UPPER(inegi.LOCALIDAD) = PERMISOS.Localidad COLLATE utf8_spanish_ci);


-- add inegi code to embarcaciones
ALTER TABLE EMBARCACIONES ADD COLUMN COD_INEGI DECIMAL;
UPDATE EMBARCACIONES SET COD_INEGI = 
    (SELECT inegi.COD_INEGI 
    FROM inegi 
    WHERE UPPER(inegi.ESTADO) = EMBARCACIONES.Estado AND UPPER(inegi.MUNICIPIO) = EMBARCACIONES.Municipio AND UPPER(inegi.LOCALIDAD) = EMBARCACIONES.Localidad COLLATE NOCASE);    
