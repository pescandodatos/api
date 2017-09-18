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
    tables = ['localidades']                

    conn = sqlite3.connect('app/datos/pescando.db')        

    conn = sqlite3.connect('pescando.db')
    c = conn.cursor()
    u = conn.cursor()
    p = conn.cursor()

    codes = c.execute("SELECT COD_INEGI_LOCALIDAD, COD_INEGI_MUNICIPIO, ESTADO, MUNICIPIO, LOCALIDAD FROM inegi;")

    conn.commit()

    for table in tables:
        for code in codes:
            estado = remove_non_ascii(code[2])
            municipio = remove_non_ascii(code[3])
            localidad = remove_non_ascii(code[4])
            cod_inegi_localidad = code[0]
            cod_inegi_municipio = code[1]

            # cod inegi para localidad
            update_query = """UPDATE %s SET COD_INEGI_LOCALIDAD = %s WHERE ESTADO = "%s" AND MUNICIPIO = "%s" AND LOCALIDAD LIKE """ % (table, cod_inegi_localidad, estado, municipio)    
            update_query = update_query + "'%" + localidad.translate(None, "'") + "%'";
            try:
                u.execute(update_query)
            except: 
                print update_query
                print '\n\n--------------> unexpected error: ',sys.exc_info()[1]

            # cod inegi para municipio
            update_query = """UPDATE %s SET COD_INEGI_MUNICIPIO = %s WHERE ESTADO = "%s" AND MUNICIPIO LIKE """ % (table, cod_inegi_municipio, estado)    
            update_query = update_query + "'%"+ municipio +"%';"
            try:
                p.execute(update_query)
            except:
                print update_query 
                print '\n\n\n\n--------------> unexpected error: ',sys.exc_info()[1]

            conn.commit()

    conn.close()

if __name__ == "__main__":
    main()