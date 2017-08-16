# Procesamiento de datos

##### Cuando ya tenemos la base de datos creada

- Cargar el virtual environment
- Importar los datos limpios a SQL con csvsql
    ```
        csvsql --insert --no-create --table embarcaciones --db sqlite:///datos/pescando.db datos/embarcaciones.csv
    ```
- Correr script de procesamiento para agregarle el código de INEGI
    ```
        python script/procesarpy embarcaciones
    ```
    
- Pronto


##### Cuando queremos crear la base de datos

- Cargar el virtual environment
- Crear estructura de la tabla con csvsql y agregarle el ID auto_increment
    ```
        csvsql --table embarcaciones --db sqlite:///datos/pescando.db datos/embarcaciones.csv > create.sql
        sqlite3 pescando.db < create.sql
    ```
- Importar los datos limpios a SQL con csvsql
    ```
        csvsql --insert --no-create --table embarcaciones --db sqlite:///datos/pescando.db datos/embarcaciones.csv
    ```
- Correr script de procesamiento para agregarle el código de INEGI
    ```
        python script/procesarpy embarcaciones
    ```
- Pronto