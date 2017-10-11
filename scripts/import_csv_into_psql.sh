psql -h localhost -U gaba -w pescando -c "delete from beneficiarios_gasolina"
csvsql --insert --no-create --db postgresql:///pescando --table beneficiarios_gasolina beneficiarios_gasolina.csv
psql -h localhost -U gaba -w pescando -c "delete from beneficiarios_motores"
csvsql --insert --no-create --db postgresql:///pescando --table beneficiarios_motores beneficiarios_motores.csv
psql -h localhost -U gaba -w pescando -c "delete from localidades"
csvsql --insert --no-create --db postgresql:///pescando --table localidades localidades.csv
psql -h localhost -U gaba -w pescando -c "delete from permisos_menores"
csvsql --insert --no-create --db postgresql:///pescando --table permisos_menores permisos_menores.csv
psql -h localhost -U gaba -w pescando -c "delete from unidades"
csvsql --insert --no-create --db postgresql:///pescando --table unidades unidades.csv
psql -h localhost -U gaba -w pescando -c "delete from activos"
csvsql --insert --no-create --db postgresql:///pescando --table activos activos.csv
psql -h localhost -U gaba -w pescando -c "delete from beneficiarios_infraestructura"
csvsql --insert --no-create --db postgresql:///pescando --table beneficiarios_infraestructura.csv 
psql -h localhost -U gaba -w pescando -c "delete from beneficiarios_pesca"              
csvsql --insert --no-create --db postgresql:///pescando --table beneficiarios_pesca beneficiarios_pesca.csv        
psql -h localhost -U gaba -w pescando -c "delete from solicitudes_diesel"                
csvsql --insert --no-create --db postgresql:///pescando --table solicitudes_diesel solicitudes_diesel.csv
psql -h localhost -U gaba -w pescando -c "delete from beneficiarios"
csvsql --insert --no-create --db postgresql:///pescando --table beneficiarios beneficiarios.csv
psql -h localhost -U gaba -w pescando -c "delete from beneficiarios_integral"
csvsql --insert --no-create --db postgresql:///pescando --table beneficiarios_integral beneficiarios_integral.csv 
psql -h localhost -U gaba -w pescando -c "delete from beneficiarios_reconversion"                     
csvsql --insert --no-create --db postgresql:///pescando --table beneficiarios_reconversion beneficiarios_reconversion.csv 
psql -h localhost -U gaba -w pescando -c "delete from marginacion"                 
csvsql --insert --no-create --db postgresql:///pescando --table marginacion.csv         
psql -h localhost -U gaba -w pescando -c "delete from solicitudes_gasolina"                        
csvsql --insert --no-create --db postgresql:///pescando --table solicitudes_gasolina solicitudes_gasolina.csv
psql -h localhost -U gaba -w pescando -c "delete from beneficiarios_componentes"
csvsql --insert --no-create --db postgresql:///pescando --table beneficiarios_componentes beneficiarios_componentes.csv
psql -h localhost -U gaba -w pescando -c "delete from beneficiarios_menores"
csvsql --insert --no-create --db postgresql:///pescando --table beneficiarios_menores beneficiarios_menores.csv   
psql -h localhost -U gaba -w pescando -c "delete from embarcaciones"                    
csvsql --insert --no-create --db postgresql:///pescando --table embarcaciones embarcaciones.csv 
psql -h localhost -U gaba -w pescando -c "delete from marginacion_localidad"                              
csvsql --insert --no-create --db postgresql:///pescando --table marginacion_localidad marginacion_localidad.csv 
psql -h localhost -U gaba -w pescando -c "delete from solicitudes_may"                      
csvsql --insert --no-create --db postgresql:///pescando --table solicitudes_may solicitudes_may.csv
psql -h localhost -U gaba -w pescando -c "delete from beneficiarios_diesel"
csvsql --insert --no-create --db postgresql:///pescando --table beneficiarios_diesel beneficiarios_diesel.csv
psql -h localhost -U gaba -w pescando -c "delete from beneficiarios_modernizacion_may_2014"
csvsql --insert --no-create --db postgresql:///pescando --table beneficiarios_modernizacion_may_2014 beneficiarios_modernizacion_may_2014.csv        
psql -h localhost -U gaba -w pescando -c "delete from  embarcaciones_permisos"
csvsql --insert --no-create --db postgresql:///pescando --table embarcaciones_permisos embarcaciones_permisos.csv    
psql -h localhost -U gaba -w pescando -c "delete from marginacion_municipio"                  
csvsql --insert --no-create --db postgresql:///pescando --table marginacion_municipio marginacion_municipio.csv 
psql -h localhost -U gaba -w pescando -c "delete from solicitudes_men"                      
csvsql --insert --no-create --db postgresql:///pescando --table solicitudes_men solicitudes_men.csv
psql -h localhost -U gaba -w pescando -c "delete from beneficiarios_electricos"
csvsql --insert --no-create --db postgresql:///pescando --table beneficiarios_electricos beneficiarios_electricos.csv
psql -h localhost -U gaba -w pescando -c "delete from beneficiarios_modernizacion_may_2015"
csvsql --insert --no-create --db postgresql:///pescando --table beneficiarios_modernizacion_may_2015 beneficiarios_modernizacion_may_2015.csv        
psql -h localhost -U gaba -w pescando -c "delete from inegi"
csvsql --insert --no-create --db postgresql:///pescando --table inegi inegi.csv               
psql -h localhost -U gaba -w pescando -c "delete from sustitucion_motores"                                
csvsql --insert --no-create --db postgresql:///pescando --table sustitucion_motores sustitucion_motores.csv
psql -h localhost -U gaba -w pescando -c "delete from permisos"
csvsql --insert --no-create --db postgresql:///pescando --table permisos permisos.csv 