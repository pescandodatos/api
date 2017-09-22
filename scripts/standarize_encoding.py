# LOOK AT ALL THE TABLES
# REMOVE NON-ASCII CHARACTERS
# SAVE IT BACK
import sqlite3
import sys
from unidecode import unidecode

def remove_non_ascii(text):
    return unidecode(text).upper() #unicode(text, encoding = "utf-8"))

def main():
    tables = [
        'activos',
        'beneficiarios',
        'beneficiarios_componentes'
        'beneficiarios_gasolina',
        'embarcaciones',
        'localidades',
        'marginacion_localidad',
        'marginacion_municipio',
        'permisos',
        'solicitudes_may',
        'unidades'
    ]                 

    conn = sqlite3.connect('app/datos/pescando.db')
    c = conn.cursor()
    u = conn.cursor()

    for table in tables:
        select_query = """SELECT LOCALIDAD FROM {table}"""
        update_query = """UPDATE {table} SET LOCALIDAD = '{nuevo_estado}'"""

        try:
            estados = c.execute(select_query.format(table=table))
            for estado in estados:
                try:
                    nuevo_estado = remove_non_ascii(estado[0])
                    u.execute(update_query.format(table=table, nuevo_estado=nuevo_estado))
                except:
                    print "--------- Failed on %s" % estado
                    print sys.exc_info()[1]        
        except:
            print "> Failed selecting all from %s" % table
            print sys.exc_info()[1]
            
    conn.close()

# unidades y permisos necesitan verificar campos de FECHAS

if __name__ == "__main__":
    main()