## GET ALL THE CODES
## CONVERT THEM INTO SOMETHING THAT WE CAN COMPARE WITHOUT UTF-8
## PASTE THEM INTO ALL THE TABLES

## CLEAN EACH TABLE

import sqlite3
import sys
from unidecode import unidecode

def remove_non_ascii(text):
    return unidecode(text).upper() #unicode(text, encoding = "utf-8"))

def main():
    #tables = ['PERMISOS', 'EMBARCACIONES', 'beneficiarios_diesel', 'beneficiarios_electricos', 'beneficiarios_gasolina', 'beneficiarios_integral', 'beneficiarios_menores', 'beneficiarios_modernizacion_mayores', 'beneficiarios_modernizacion_menores', 'beneficiarios_motores', 'beneficiarios_reconversion', 'solicitudes_gasolina', 'solicitudes_may', 'solicitudes_men']
    tables = [
        'unidades_economicas'
    ]
    conn = sqlite3.connect('pescando.db')
    c = conn.cursor()
    u = conn.cursor()

    codes = c.execute("SELECT COD_INEGI, ESTADO, MUNICIPIO, LOCALIDAD FROM inegi;")

    conn.commit()

    for table in tables:
        # try:
        #     a = conn.cursor()
        #     alter_query = "ALTER TABLE %s ADD COLUMN COD_INEGI INTEGER;" % table
        #     print alter_query
        #     a.execute(alter_query)
        #     conn.commit()
        # except:
        #     print "When adding cod_inegi: ", sys.exc_info()[0]

        for code in codes:
            estado = remove_non_ascii(code[1])
            municipio = remove_non_ascii(code[2])
            localidad = remove_non_ascii(code[3])

            update_query = """
                UPDATE %s SET COD_INEGI = %s
                WHERE ESTADO = "%s" AND MUNICIPIO = "%s" AND LOCALIDAD = "%s";
            """ % (table, code[0], estado, municipio, localidad)    
            try:
                u.execute(update_query)
            except: 
                print update_query
                print 'unexpected error: ',sys.exc_info()[1]
            conn.commit()

    conn.close()

if __name__ == "__main__":
    main()