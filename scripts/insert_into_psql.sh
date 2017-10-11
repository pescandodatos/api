#!/bin/bash

# CREATE TABLES AND INSERT DATA
# csvsql --insert --table activos --db postgresql:///pescando2 app/datos/activos.csv
# csvsql --insert --table permisos --db postgresql:///pescando2 app/datos/permisos.csv
# csvsql --insert --table unidades --db postgresql:///pescando2 app/datos/unidades.csv
# csvsql --insert --table beneficiarios --db postgresql:///pescando2 app/datos/beneficiarios.csv
# csvsql --insert --table embarcaciones --db sqlite:///datos/pescando app/datos/embarcaciones_permisos.csv
# csvsql --insert --table inegi --db postgresql:///pescando2 app/datos/inegi.csv
# csvsql --insert --table localidades --db postgresql:///pescando2 app/datos/localidades.csv

# csvsql --insert --table marginacion --db postgresql:///pescando2 app/datos/marginacion.csv
# csvsql --insert --table marginacion_localidad --db postgresql:///pescando2 app/datos/marginacion_localidad.csv
# csvsql --insert --table marginacion_municipio --db postgresql:///pescando2 app/datos/marginacion_municipio.csv

# csvsql --insert --table beneficiarios_infraestructura --db postgresql:///pescando2 app/datos/beneficiarios_infraestructura.csv
# csvsql --insert --table beneficiarios_reconversion --db postgresql:///pescando2 app/datos/beneficiarios_reconversion.csv  

# csvsql --insert --table beneficiarios_motores --db postgresql:///pescando2  app/datos/beneficiarios_motores.csv 
# csvsql --insert --table beneficiarios_componentes --db postgresql:///pescando2 app/datos/beneficiarios_componentes.csv          
# csvsql --insert --table beneficiarios_diesel --db postgresql:///pescando2 app/datos/beneficiarios_diesel.csv                                      
# csvsql --insert --table beneficiarios_menores --db postgresql:///pescando2  app/datos/beneficiarios_menores.csv                   
# csvsql --insert --table beneficiarios_gasolina --db postgresql:///pescando2 app/datos/beneficiarios_gasolina.csv                                  
# csvsql --insert --table beneficiarios_electricos --db postgresql:///pescando2 app/datos/beneficiarios_electricos.csv                                    
# csvsql --insert --table beneficiarios_integral --db postgresql:///pescando2 app/datos/beneficiarios_integral.csv           


# csvsql --insert --table beneficiarios_modernizacion_may_2014 --db postgresql:///pescando2 app/datos/beneficiarios_modernizacion_may_2014.csv   
# csvsql --insert --table beneficiarios_modernizacion_may_2015 --db postgresql:///pescando2 app/datos/beneficiarios_modernizacion_may_2015.csv   

# csvsql --insert --table solicitudes_diesel --db postgresql:///pescando2 app/datos/solicitudes_diesel.csv                
# csvsql --insert --table solicitudes_gasolina --db postgresql:///pescando2 app/datos/solicitudes_gasolina.csv

# csvsql --insert --table solicitudes_may --db postgresql:///pescando2 app/datos/solicitudes_may.csv
# csvsql --insert --table solicitudes_men --db postgresql:///pescando2 app/datos/solicitudes_men.csv

# csvsql --insert --table sustitucion_motores --db postgresql:///pescando2 app/datos/sustitucion_motores.csv
# csvsql --insert --table beneficiarios_pesca --db postgresql:///pescando2 app/datos/beneficiarios_pesca.csv
# csvsql --insert --table permisos_menores --db postgresql:///pescando2 app/datos/permisos_menores.csv


# ALTER TABLES

# psql -h localhost -U gaba -w -d pescando2 -c "alter table activos alter column rnpa type text;"

# psql -h localhost -U gaba -w -d pescando2 -c "alter table beneficiarios alter column rnpa type text;"
# psql -h localhost -U gaba -w -d pescando2 -c "alter table beneficiarios alter column rnpa type text;"

# psql -h localhost -U gaba -w -d pescando2 -c "alter table beneficiarios_componentes alter column cod_inegi_localidad type text;"
# psql -h localhost -U gaba -w -d pescando2 -c "alter table beneficiarios_componentes alter column cod_inegi_municipio type text;"


# psql -h localhost -U gaba -w -d pescando2 -c "alter table beneficiarios_diesel alter ano type integer;"

suffix='.csv'
for i in $( ls app/datos/ ); do
    item=${i%$suffix}
    echo item: ${item}
    #psql -h localhost -U gaba -w -d pescando2 -c "alter table ${item} alter ano type integer;"
    #psql -h localhost -U gaba -w -d pescando2 -c "alter table ${item} alter column cod_inegi_localidad type text;"
    #psql -h localhost -U gaba -w -d pescando2 -c "alter table ${item} alter column cod_inegi_municipio type text;"
    #psql -h localhost -U gaba -w -d pescando2 -c "alter table ${item} alter column rnpa type text;"
    psql -h localhost -U gaba -w -d pescando2 -c "alter table ${item} ADD PRIMARY KEY (id);"
done