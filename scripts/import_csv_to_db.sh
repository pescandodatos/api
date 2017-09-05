# Estos son los comandos para hacer este proceso lo más automatico posible. Aveces será importante manualmente ir a sqlite y editar el schema.
# Los datos van a tener que ser "masajeados" antes de meterlos a la base de datos

csvsql --insert --table activos --db sqlite:///pescando.db activos.csv
csvsql --insert --table permisos --db sqlite:///app/datos/pescando.db app/datos/permisos.csv
csvsql --insert --table unidades --db sqlite:///pescando.db ../datos/unidades_economicas.csv
csvsql --insert --table embarcaciones --db sqlite:///datos/pescando.db datos/embarcaciones.csv
csvsql --insert -e iso-8859-1 --table marginacion_municipio --db sqlite:///app/datos/pescando.db app/datos/marginacion_municipal.csv
csvsql --insert -e iso-8859-1 --table marginacion_localidad --db sqlite:///app/datos/pescando.db app/datos/marginacion_localidad.csv
csvsql --insert --table solicitudes_may --db sqlite:///pescando.db solicitudes_embarcaciones_mayores.csv

csvsql --insert --table solicitudes_men --db sqlite:///pescando.db solicitudes_embarcaciones_menores.csv
csvsql --insert --table beneficiarios_reconversion --db sqlite:///pescando.db 2008_2011_beneficiarios_componente_infraestructura_reconversion.csv  
csvsql --insert  --table beneficiarios_modernizacion_men --db sqlite:///pescando.db 2015_beneficiarios_modernizacion_embarcaciones_mayores.csv >> create.sql

csvsql --insert  --table beneficiarios_motores --db sqlite:///pescando.db  2008_2012_beneficiarios_motores.csv 

csvsql --insert  --table beneficiarios_componentes --db sqlite:///pescando.db 2011_2012_beneficiarios_componente_infraestructura_pesca.csv          

csvsql --insert  --table beneficiarios_diesel --db sqlite:///pescando.db 2011_2015_beneficiarios_diesel.csv                                      

csvsql --insert  --table beneficiarios_menores --db sqlite:///pescando.db  2011_2015_beneficiarios_embarcaciones_menores.csv                   

csvsql --insert  --table beneficiarios_gasolina --db sqlite:///pescando.db 2011_2015_beneficiarios_gasolina.csv                                  

csvsql --insert  --table beneficiarios_electricos --db sqlite:///pescando.db 2011_beneficiarios_electricos.csv                                    

csvsql --insert  --table beneficiarios_integral --db sqlite:///pescando.db 2012_beneficiarios_componente_infraestructura_integral.csv           

csvsql --insert  --table solicitudes_diesel --db sqlite:///pescando.db 2014_2015_solicitudes_diesel.csv                
csvsql --insert  --table solicitudes_gasolina --db sqlite:///pescando.db 2014_2015_solicitudes_gasolina.csv

csvsql --insert  --table beneficiarios_modernicacion_may --db sqlite:///pescando.db 2014_beneficiarios_modernizacion_embarcaciones_mayores.csv   