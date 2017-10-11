# Código para servir datos para plataforma de Pescando Datos.

## Como instalarlo para desarrollo

#### Crear ambiente virtual
```
    $ virtualenv .env
    $ source .env/bin/activate
```

#### Instalar librerias
```
    $ pip install -r requirements.txt
```

#### Configurar variables de ambiente
```
    $ source envvars.sh
```

#### Correr la aplicación
```
    $ python run.py
```

## Otros scripts

## Para agregar datos a la base de datos en Sqlite

Los archivos CSV actualizados vienen desde el repositorio https://github.com/pescandodatos/datos

Para ingresarlos a la base de datos corremos el siguiente script:

```
    $ sh scripts/import_csv_into_psql.sh
```
