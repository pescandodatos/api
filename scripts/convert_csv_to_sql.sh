csvsql --table permisos permisos.csv
csvsql --insert --table permisos --db sqlite:///datos/pescando.db datos/permisos.csv

csvsql --insert --table activos --db sqlite:///pescando.db ../datos/activos.csv
csvsql --insert --table unidades_economicas --db sqlite:///pescando.db ../datos/unidades_economicas.csv

csvsql --table embarcaciones --db sqlite:///datos/pescando.db datos/embarcaciones.csv >> create.sql
csvsql --insert --no-create --table embarcaciones --db sqlite:///datos/pescando.db datos/embarcaciones.csv


csvsql --insert --table inegi --db sqlite:///pescando.db inegi.csv >> create.sql
csvsql --insert -e iso-8859-1 --table marginacion --db sqlite:///pescando.db marginacion.csv >> create.sql
csvsql --insert --table solicitudes_may --db sqlite:///pescando.db solicitudes_embarcaciones_mayores.csv >> create.sql
csvsql --insert --table solicitudes_men --db sqlite:///pescando.db solicitudes_embarcaciones_menores.csv >> create.sql
csvsql --insert --table beneficiarios_reconversion --db sqlite:///pescando.db 2008_2011_beneficiarios_componente_infraestructura_reconversion.csv >> create.sql    
csvsql --insert --table beneficiarios_modernizacion_men --db sqlite:///pescando.db 2015_beneficiarios_modernizacion_embarcaciones_mayores.csv >> create.sql
csvsql --insert --table beneficiarios_motores --db sqlite:///pescando.db  2008_2012_beneficiarios_motores.csv >> create.sql 
csvsql --insert --table beneficiarios_componentes--db sqlite:///pescando.db 2011_2012_beneficiarios_componente_infraestructura_pesca.csv >> create.sql            
csvsql --insert --table beneficiarios_diesel --db sqlite:///pescando.db 2011_2015_beneficiarios_diesel.csv >> create.sql                                      
csvsql --insert --table beneficiarios_menores --db sqlite:///pescando.db  2011_2015_beneficiarios_embarcaciones_menores.csv >> create.sql                       
csvsql --insert --table beneficiarios_gasolina --db sqlite:///pescando.db 2011_2015_beneficiarios_gasolina.csv >> create.sql                                    
csvsql --insert --table beneficiarios_electricos --db sqlite:///pescando.db 2011_beneficiarios_electricos.csv >> create.sql                                       

csvsql --insert --table beneficiarios_integral --db sqlite:///pescando.db 2012_beneficiarios_componente_infraestructura_integral.csv           
csvsql --insert --table solicitudes_diesel --db sqlite:///pescando.db 2014_2015_solicitudes_diesel.csv                
csvsql --insert --table solicitudes_gasolina --db sqlite:///pescando.db 2014_2015_solicitudes_gasolina.csv     
csvsql --insert --table beneficiarios_modernicacion_may --db sqlite:///pescando.db 2014_beneficiarios_modernizacion_embarcaciones_mayores.csv   

#csvsql --insert  --table solicitudes_embarcaciones_menores --db sqlite:///pescando.db 2014_2015_solicitudes_embarcaciones_menores.csv                         
