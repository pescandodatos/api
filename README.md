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
    $ export SETTINGS=settings.cfg
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
    $ sh scripts/convert_csv_to_sql.sh
```
