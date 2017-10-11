#!/usr/bin/python
import psycopg2
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
        'beneficiarios_diesel',
        'beneficiarios_electricos',
        'beneficiarios_infraestructura',
        'beneficiarios_menores',
        'beneficiarios_modernizacion_may_2014',
        'beneficiarios_modernizacion_may_2015',
        'beneficiarios_reconversion',
        'beneficiarios_motores',
        'beneficiarios_pesca',
        'embarcaciones',
        'localidades',
        'marginacion_localidad',
        'marginacion_municipio',
        'permisos',
        'solicitudes_may',
        'unidades'
    ]

    conn_string = "host='localhost' dbname='pescando2' user='gaba'"
    conn = psycopg2.connect(conn_string)

    c = conn.cursor()
    u = conn.cursor()


    for table in tables:
        print table

        print "NOMBRE\n"
        # STANDARIZE NOMBRE
        select_query = """SELECT nombre FROM {table}"""
        update_query = """UPDATE {table} SET nombre = '{nuevo_estado}'"""

        try:
            c.execute(select_query.format(table=table))
            estados = c.fetchall()
            for estado in estados:
                try:
                    nuevo_estado = remove_non_ascii(estado[0])
                    u.execute(update_query.format(table=table, nuevo_estado=nuevo_estado))
                except:
                    print "--------- Failed on %s" % estado
                    print update_query.format(table=table, nuevo_estado=nuevo_estado)
                    print sys.exc_info()[1]
        except:
            print "> Failed selecting all from %s" % table
            print sys.exc_info()[1]

        print "BENEFICIARIO\n"
        # STANDARIZE BENEFICIARIO
        select_query = """SELECT beneficiario FROM {table}"""
        update_query = """UPDATE {table} SET beneficiario = '{nuevo_beneficiario}'"""

        try:
            c.execute(select_query.format(table=table))
            beneficarios = c.fetchall()
            for beneficiario in beneficarios:
                try:
                    nuevo_beneficiario = remove_non_ascii(beneficiario[0])
                    u.execute(update_query.format(table=table, nuevo_beneficiario=nuevo_beneficiario))
                except:
                    print "--------- Failed on %s" % beneficiario
                    print update_query.format(table=table, nuevo_beneficiario=nuevo_beneficiario)
                    print sys.exc_info()[1]
        except:
            print "> Failed selecting all from %s" % table
            print sys.exc_info()[1]

        print "MUNICIPIO\n"
        # STANDARIZE MUNICIPIO
        select_query = """SELECT municipio FROM {table}"""
        update_query = """UPDATE {table} SET municipio = '{nuevo_municipio}'"""

        try:
            c.execute(select_query.format(table=table))
            municipios  = c.fetchall()
            for municipio in municipios:
                try:
                    nuevo_municipio = remove_non_ascii(municipio[0])
                    u.execute(update_query.format(table=table, nuevo_municipio=nuevo_municipio))
                except:
                    print "--------- Failed on %s" % municipio
                    print update_query.format(table=table, nuevo_municipio=nuevo_municipio)
                    print sys.exc_info()[1]
        except:
            print "> Failed selecting all from %s" % table
            print sys.exc_info()[1]

        print "LOCALIDAD\n"
        # STANDARIZE LOCALIDAD
        select_query = """SELECT localidad FROM {table}"""
        update_query = """UPDATE {table} SET localidad = '{nuevo_localidad}'"""

        try:
            c.execute(select_query.format(table=table))
            localidades = c.fetchall()
            for localidad in localidades:
                try:
                    nuevo_localidad = remove_non_ascii(localidad[0])
                    u.execute(update_query.format(table=table, nuevo_localidad=nuevo_localidad))
                except:
                    print "--------- Failed on %s" % localidad
                    print update_query.format(table=table, nuevo_localidad=nuevo_localidad)
                    print sys.exc_info()[1]
        except:
            print "> Failed selecting all from %s" % table
            print sys.exc_info()[1]

        print "ESTADO\n"
        # STANDARIZE ESTADO
        select_query = """SELECT estado FROM {table}"""
        update_query = """UPDATE {table} SET estado = '{nuevo_estado}'"""

        try:
            c.execute(select_query.format(table=table))
            estados = c.fetchall()
            for estado in estados:
                try:
                    nuevo_estado = remove_non_ascii(estado[0])
                    u.execute(update_query.format(table=table, nuevo_estado=nuevo_estado))
                except:
                    print "--------- Failed on %s" % estado
                    print update_query.format(table=table, nuevo_estado=nuevo_estado)
                    print sys.exc_info()[1]
        except:
            print "> Failed selecting all from %s" % table
            print sys.exc_info()[1]

    conn.close()

# unidades y permisos necesitan verificar campos de FECHAS

if __name__ == "__main__":
    main()
