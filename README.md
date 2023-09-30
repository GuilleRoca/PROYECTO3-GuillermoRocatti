# Proyecto Integral N°3

El presente documento, es el **Proyecto Integral N°3** de ***Argentina Program 4.0***. Esta es una pequeña solución informática que sirve crear una base de datos en MySQL con un código en lenguaje SQL y además una vista general de los datos. También consta de un desarrollo de una API REST para diferetes consultas en la BD, pudiendo obtener las categorías disponibles, el catálogo completo o un catalogo reducido filtrado por género, actores/actrices, por ID o por categorías.
Las consultas fueron diseñadas y construida sobre una arquitectura API RESTful, la cual está desarrollada bajo las restricciones y recomendaciones de REST, además, implementa buenas prácticas de programación.

#### Especificaciones
- Servidor: http://127.0.0.1:8080
- Autor: tu-nombre-y-apellido
- Versión: 1.0.8

#### Requerimientos
- Node.js v18.16.1
- Dotenv ^16.3.1
- Express ^4.18.2
- Mysql2 ^3.6.0
- Sequelize ^6.33.0
- GIT v2.40.1
- IDE - Visual Studio Code v1.78.2

#### Estructura de directorios
``` tree
    ├── node_modules
    ├── src
    │   └── conection
    │   │   └── conection.js
    │   └── models
    │   │   ├── catalogo.js
    │   │   ├── catalogoGenero.js
    │   │   ├── catalogoReparto.js
    │   │   ├── categorias.js
    │   │   ├── genero.js
    │   │   ├── reparto.js
    │   │   └── vistaRepato.js
    │   └── routes
    │   │   └── catalogo.js
    │   └── server.js
    ├── .env
    ├── .env.dist
    ├── .gitignore
    ├── package-lock.json 
    ├── package.json
    ├── package.json
    ├── trailerfliz.sql
    ├── trailerflixSchema.JPG
    └── vistaCatalogo.sql
```

---
### CONFIGURACION DE ENTORNO
  - #### VARIABLES DE ENTORNO
    Se debe hacer una copia del archivo **.env.dist** y renombrarlo como **.env**. Con respecto a su contenido, es necesario asignar los valores a correspondientes a las variables:
    ``` js
        PORT=8080
        HOST=127.0.0.1

        DATABASE=trailerflixdb
        DBUSER=tu-usuario
        PASSWORD=tu-contraseña
    ```
    
---

#### Métodos HTTP
|-----|----------------------------------------------------------|----------------------------|
| Tipo| URI                                                      | Descripción                |
|-----|----------------------------------------------------------|----------------------------|
| GET |http://127.0.0.1:8080/api/v1/categorias                   |Obtiene todas las categoías |
| GET |http://127.0.0.1:8080/api/v1/catalogo                     |Obtiene el catálogo completo|
|     |                                                          |(permite filtros)           |
| GET |http://127.0.0.1:8080/api/v1/catalogo/catalogo/1          |Obtiene el catálogo filrando|
|     |                                                          |por un ID específico        |
| GET |http://127.0.0.1:8080/api/v1/catalogo/nombre/:nombre      |Obtiene el catálogo filrando|
|     |                                                          |por nombre de actor/actriz  |
| GET |http://127.0.0.1:8080/api/v1/catalogo/genero/:genero      |Obtiene el catálogo filrando|
|     |                                                          |por el género               |
| GET |http://127.0.0.1:8080/api/v1/catalogo/categoria/:categoria|Obtiene el catálogo filrando|
|     |                                                          |por nombre de categoria     |
|-----|----------------------------------------------------------|----------------------------|



#### Método GET:
- Request:
  - Parámetros opcionales de tipo QUERY:
    - categoria=Oficina  *(tipo: string. Trae los muebles de una misma categoría)* 
    - precio_gte=500.00  *(tipo: decimal. Trae los muebles que tienen un precio mayor o igual a $500)* 
    - precio_lte=400.00  *(tipo: decimal. Trae los muebles que tienen un precio menor o igual a $400)* 
- Response:
    ``` json
        [
            {
                "_id": "64b082dabbbdbf35047fd6b6",
                "codigo": 7,
                "nombre": "Cama individual",
                "precio": 399.99,
                "categoria": "Dormitorio"
            }
        ]
    ```
  - Código HTTP: **200** *payload: muebles*
  - Código HTTP: **500** *message: Se ha generado un error en el servidor*


#### Método GET - Específico:
- Request:
  - Parámetro obligatorio de tipo URL:
    - 9 *(tipo: integer. Indica el código del mueble que se requiere obtener)*
- Response:
    ``` json
        {
              "_id": "64b082dabbbdbf35047fd6b7",
              "codigo": 9,
              "nombre": "Mesa de Comedor de Madera",
              "precio": 299.99,
              "categoria": "Comedor"
        }
    ```
  - Código HTTP: **200** *payload: mueble*
  - Código HTTP: **400** *message: El código no corresponde a un mueble registrado*
  - Código HTTP: **500** *message: Se ha generado un error en el servidor*


#### Método POST:
- Request:
  - Parámetros requeridos del BODY:
    - nombre=Biblioteca de madera deluxe *(tipo: string. Establece el valor del nombre)* 
    - precio=1250.55                     *(tipo: integer. Establece el valor del precio)* 
    - categoria=Oficina                  *(tipo: decimal. Establece el valor del categoría)* 
- Response:
  - Código HTTP: **201** *message: 'Registro creado', payload: mueble*
  - Código HTTP: **400** *message: Faltan datos relevantes*
  - Código HTTP: **500** *message: Se ha generado un error en el servidor*
- Nota: *Los valores indicados en el ejemplo, son datos esperados en los tests.*


#### Método PUT:
- Request:
  - Parámetro obligatorio de tipo URL:
    - 16 *(tipo: integer. Indica el código del mueble que se requiere modificar)*
  - Parámetros requeridos del BODY:
    - nombre=Modular metálico deluxe *(tipo: string. Establece el valor del nombre)* 
    - precio=999.75                  *(tipo: integer. Establece el valor del precio)* 
    - categoria=Oficina              *(tipo: decimal. Establece el valor del categoría)* 
- Response:
  - Código HTTP: **200** *message: 'Registro actualizado', payload: mueble*
  - Código HTTP: **400** *message: El código no corresponde a un mueble registrado*
  - Código HTTP: **400** *message: Faltan datos relevantes*
  - Código HTTP: **500** *message: Se ha generado un error en el servidor*
- Nota: *Los valores indicados en el ejemplo, son datos esperados en los tests.*


#### Método DELETE:
- Request:
  - Parámetro obligatorio de tipo URL:
    - 16 *(tipo: integer. Indica el código del mueble que se requiere eliminar)*
- Response:
  - Código HTTP: **200** *message: 'Registro eliminado'*
  - Código HTTP: **500** *message: Se ha generado un error en el servidor*
- Nota: *Los valores indicados en el ejemplo, son datos esperados en los tests.*
