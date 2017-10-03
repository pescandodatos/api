# Estos son los comandos para hacer este proceso lo más automatico posible. Aveces será importante manualmente ir a sqlite y editar el schema.
# Los datos van a tener que ser "masajeados" antes de meterlos a la base de datos

csvsql --insert --no-create --table activos_id --db sqlite:///app/datos/pescando.db app/datos/activos.csv


csvsql --insert --table permisos --db sqlite:///datos/pescando.db datos/permisos.csv
csvsql --insert --table unidades_economicas --db sqlite:///pescando.db ../datos/unidades_economicas.csv
csvsql --insert --table embarcaciones --db sqlite:///datos/pescando.db datos/embarcaciones.csv
csvsql --insert --table inegi --db sqlite:///pescando.db inegi.csv >> create.sql
csvsql --insert --no-create -e iso-8859-1 --table marginacion --db sqlite:///pescando.db marginacion.csv

# Create table, add cod inegi, insert data
csvsql --table solicitudes_may --db sqlite:///pescando.db solicitudes_embarcaciones_mayores.csv
echo "alter table solicitudes_may add column cod_inegi VARCHAR(55)" > sqlite3 pescando.db
csvsql --insert --no-create --table solicitudes_may --db sqlite:///pescando.db solicitudes_embarcaciones_mayores.csv

# Create table, add cod inegi, insert data
csvsql --insert --no-create --table solicitudes_men --db sqlite:///pescando.db solicitudes_embarcaciones_menores.csv

# Create table, add cod inegi, insert data
csvsql --table beneficiarios_reconversion 2008_2011_beneficiarios_componente_infraestructura_reconversion.csv > temporal.sql    
# Agregarle primary key id y cod inegi al temporal
sqlite3 pescando.db < temporal.sql
csvsql --insert --no-create --table beneficiarios_reconversion --db sqlite:///pescando.db 2008_2011_beneficiarios_componente_infraestructura_reconversion.csv  

# Create table, add cod inegi, insert data
csvsql --table beneficiarios_modernizacion_men 2015_beneficiarios_modernizacion_embarcaciones_mayores.csv > temporal.sql
# Agregarle primary key id y cod inegi al temporal
sqlite3 pescando.db < temporal.sql
csvsql --insert --no-create --table beneficiarios_modernizacion_men --db sqlite:///pescando.db 2015_beneficiarios_modernizacion_embarcaciones_mayores.csv >> create.sql

# Create table, add cod inegi, insert data
csvsql --table beneficiarios_motores 2008_2012_beneficiarios_motores.csv > temporal.sql 
sqlite3 pescando.db < temporal.sql
csvsql --insert --no-create --table beneficiarios_motores --db sqlite:///pescando.db  2008_2012_beneficiarios_motores.csv 

# Create table, add cod inegi, insert data
csvsql --table beneficiarios_componentes 2011_2012_beneficiarios_componente_infraestructura_pesca.csv > temporal.sql         
sqlite3 pescando.db < temporal.sql
csvsql --insert --no-create --table beneficiarios_componentes --db sqlite:///pescando.db 2011_2012_beneficiarios_componente_infraestructura_pesca.csv          

# Create table, add cod inegi, insert data
csvsql --table beneficiarios_diesel 2011_2015_beneficiarios_diesel.csv > temporal.sql                                      
sqlite3 pescando.db < temporal.sql
csvsql --insert --no-create --table beneficiarios_diesel --db sqlite:///pescando.db 2011_2015_beneficiarios_diesel.csv                                      

# Create table, add cod inegi, insert data
csvsql --table beneficiarios_menores 2011_2015_beneficiarios_embarcaciones_menores.csv > temporal.sql                       
sqlite3 pescando.db < temporal.sql
csvsql --insert --no-create --table beneficiarios_menores --db sqlite:///pescando.db  2011_2015_beneficiarios_embarcaciones_menores.csv                   

# Create table, add cod inegi, insert data
csvsql --table beneficiarios_gasolina 2011_2015_beneficiarios_gasolina.csv > temporal.sql                                  
sqlite3 pescando.db < temporal.sql
csvsql --insert --no-create --table beneficiarios_gasolina --db sqlite:///pescando.db 2011_2015_beneficiarios_gasolina.csv                                  

# Create table, add cod inegi, insert data
csvsql --table beneficiarios_electricos 2011_beneficiarios_electricos.csv > temporal.sql                                     
sqlite3 pescando.db < temporal.sql
csvsql --insert --no-create --table beneficiarios_electricos --db sqlite:///pescando.db 2011_beneficiarios_electricos.csv                                    

# Create table, add cod inegi, insert data
csvsql --table beneficiarios_integral 2012_beneficiarios_componente_infraestructura_integral.csv > temporal.sql              
sqlite3 pescando.db < temporal.sql
csvsql --insert --no-create --table beneficiarios_integral --db sqlite:///pescando.db 2012_beneficiarios_componente_infraestructura_integral.csv           


# Create table, add cod inegi, insert data
csvsql --table solicitudes_diesel 2014_2015_solicitudes_diesel.csv > temporal.sql                
sqlite3 pescando.db < temporal.sql
csvsql --insert --no-create --table solicitudes_diesel --db sqlite:///pescando.db 2014_2015_solicitudes_diesel.csv                

# Create table, add cod inegi, insert data
csvsql --table solicitudes_gasolina 2014_2015_solicitudes_gasolina.csv > temporal.sql
sqlite3 pescando.db < temporal.sql
csvsql --insert --no-create --table solicitudes_gasolina --db sqlite:///pescando.db 2014_2015_solicitudes_gasolina.csv

# Create table, add cod inegi, insert data
csvsql --table beneficiarios_modernicacion_may 2014_beneficiarios_modernizacion_embarcaciones_mayores.csv > temporal.sql  
sqlite3 pescando.db < temporal.sql
csvsql --insert --no-create --table beneficiarios_modernicacion_may --db sqlite:///pescando.db 2014_beneficiarios_modernizacion_embarcaciones_mayores.csv   


#csvsql --insert  --table solicitudes_embarcaciones_menores --db sqlite:///pescando.db 2014_2015_solicitudes_embarcaciones_menores.csv                         

sqlite3 app/datos/pescando.db.bak "Select localidades.estado, inegi.estado from localidades, inegi where localidades.estado like '%' + inegi.estado + '%' OR inegi.estado like '%' + localidades.estado + '%'"
sqlite3 app/datos/pescando.db.bak "Select localidades.localidad, inegi.localidad from localidades, inegi where localidades.localidad like '%' + inegi.localidad + '%' OR inegi.localidad like '%' + localidades.localidad + '%'"
sqlite3 app/datos/pescando.db.bak "Select localidades.municipio, inegi.municipio from localidades, inegi where localidades.municipio like '%' + inegi.municipio + '%' OR inegi.municipio like '%' + localidades.municipio + '%'"



SELECT localidades.estado, inegi.estado FROM localidades, inegi WHERE  IFNULL( INSTR(localidades.estado , inegi.estado),0) = 0