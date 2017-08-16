# Procesamiento de datos

- Cargar el virtual environment
- Crear estructura de la tabla con csvsql y agregarle el ID auto_increment
    ```
        csvsql --table embarcaciones --db sqlite:///datos/pescando.db datos/embarcaciones.csv
    ```
- Importar los datos limpios a SQL con csvsql
    ```
        csvsql --insert --table embarcaciones --db sqlite:///datos/pescando.db datos/embarcaciones.csv
    ```
- Correr script de procesamiento para agregarle el código de INEGI
- Pronto