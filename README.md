# Proyecto Integral N°3

El presente documento, es el **Proyecto Integral N°3** de ***Argentina Program 4.0***. Esta es una pequeña solución informática que sirve crear una base de datos en MySQL con un código en lenguaje SQL y además una vista general de los datos. También consta de un desarrollo de una API REST para diferetes consultas en la BD, pudiendo obtener las categorías disponibles, el catálogo completo o un catalogo reducido filtrado por género, actores/actrices, por ID o por categorías.
Las consultas fueron diseñadas y construida sobre una arquitectura API RESTful, la cual está desarrollada bajo las restricciones y recomendaciones de REST, además, implementa buenas prácticas de programación.

#### Especificaciones
- Servidor: http://127.0.0.1:8080
- Autor: Guillermo Rocatti
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



#### Método GET:
- Request: http://127.0.0.1:8080/api/v1/categorias 
  - Sin parámetros opcionales
- Response:
    ``` json
        [
          {
              "categoriaId": 1,
              "categoriaNombre": "Serie"
          },
          {
              "categoriaId": 2,
              "categoriaNombre": "Pelicula"
          }
        ]
    ```
  - Código HTTP: **200** *categorias*
  - Código HTTP: **404** *error: "La URL indicada no existe en este servidor"*
  - Código HTTP: **500** *error*
  - Nota: *Los valores indicados en el ejemplo, son datos esperados en los tests.*



#### Método GET:
- Request: http://127.0.0.1:8080/api/v1/catalogo
  - Parámetro opcional de tipo URL:
    - 7 *(tipo: integer. Indica el código del títulos que se requiere obtener)*
- Response:
    ``` json
        [
            {
                "id": 7,
                "poster": "https://www.trailerflix.com/posters/7.jpg",
                "titulo": "Guasón",
                "categoria": "Pelicula",
                "genero": "Crimen, Drama, Suspenso",
                "resumen": "Arthur Fleck (Phoenix) es un hombre ignorado por la sociedad, cuya motivación en la vida es hacer reír. Pero una serie de trágicos acontecimientos le llevarán a ver el mundo de otra forma. Película basada en el popular personaje de DC Comics Joker, conocido como archivillano de Batman, pero que en este film tomará un cariz más realista y oscuro.",
                "temporadas": "N/A",
                "reparto": "Brett Cullen, Frances Conroy, Joaquin Phoenix, Robert De Niro, Shea Whigham, Zazie Beetz",
                "trailer": "https://www.youtube.com/embed/zAGVQLHvwOY"
            }
        ]
    ```
  - Código HTTP: **200** *categorias*
  - Código HTTP: **400** *message: "El ID tiene que ser un número"*
  - Código HTTP: **404** *message: "El ID no se encontró"*
  - Código HTTP: **500** *error*
  - Nota: *Los valores indicados en el ejemplo, son datos esperados en los tests.*



#### Método GET - Específico:
- Request: http://127.0.0.1:8080/api/v1/catalogo/nombre/:nombre
  - Parámetro obligatorio de tipo URL:
    - Freeman   *(tipo: string. Trae los titulos del actor/actriz que tiene en su reparto)*
- Response:
    ``` json
        [
            {
                "id": 24,
                "poster": "https://www.trailerflix.com/posters/24.jpg",
                "titulo": "Pantera Negra",
                "categoria": "Pelicula",
                "genero": "Accion, Aventura, Fantasia",
                "resumen": "TChalla (Chadwick Boseman) regresa a su hogar en la apartada nación africana de Wakanda para servir como líder de su país. Tras suceder a su padre en el trono, pasa a convertirse en Pantera Negra, una sigilosa criatura de la noche, con agudos sentidos felinos y otras habilidades como súper fuerza e inteligencia, agilidad, estrategia o maestro del combate sin armas. Es bajo el liderazgo de T’Challa como Wakanda consigue convertirse en una de las naciones más ricas y tecnológicamente avanzadas del planeta.",
                "temporadas": "N/A",
                "reparto": "Chadwick Boseman, Danai Gurira, Daniel Kaluuya, Lupita Nyongo, Martin Freeman, Michael B. Jordan",
                "trailer": "https://www.youtube.com/embed/BE6inv8Xh4A"
            }
        ]
    ```
  - Código HTTP: **200** *catalogo*
  - Código HTTP: **404** *message: "No hay ningun título en el que actúa una persona con nombre :{name}"*
  - Código HTTP: **500** *error*
  - Nota: *Los valores indicados en el ejemplo, son datos esperados en los tests.*



#### Método GET - Específico:
- Request: http://127.0.0.1:8080/api/v1/catalogo/genero/:genero
  - Parámetro obligatorio de tipo URL:
    - Misterio   *(tipo: string. Trae los titulos del genero indicado)*
- Response:
    ``` json
        [
            {
                "id": 2,
                "poster": "https://www.trailerflix.com/posters/2.jpg",
                "titulo": "Riverdale",
                "categoria": "Serie",
                "genero": "Drama, Ficcion, Misterio",
                "resumen": "El paso a la edad adulta incluye sexo, romance, escuela y familia. Para Archie y sus amigos, también hay misterios oscuros.",
                "temporadas": "5",
                "reparto": "Camila Mendes, Casey Cott, Lili Reinhart, Mädchen Amick, Madelaine Petsch, Marisol Nichols",
                "trailer": ""
            },
            {
                "id": 6,
                "poster": "https://www.trailerflix.com/posters/6.jpg",
                "titulo": "Enola Holmes",
                "categoria": "Pelicula",
                "genero": "Drama, Ficcion, Misterio",
                "resumen": " hermana menor de Sherlock, descubre que su madre ha desaparecido y se dispone a encontrarla. En su búsqueda, saca a relucir el sabueso que corre por sus venas y se encuentra con una conspiración que gira en torno a un misterioso lord, demostrando que su ilustre hermano no es el único talento en la familia.",
                "temporadas": "N/A",
                "reparto": "Adeel Akhtar, Helena Bonham Carter, Henry Cavill, Louis Partridge, Millie Bobby Brown, Sam Claflin",
                "trailer": ""
            }
        ]
    ```
  - Código HTTP: **200** *catalogo*
  - Código HTTP: **404** *message: "No hay ningun título del género ${gender}"*
  - Código HTTP: **500** *error*
  - Nota: *Los valores indicados en el ejemplo, son datos esperados en los tests.*



#### Método GET - Específico:
- Request: http://127.0.0.1:8080/api/v1/catalogo/categoria/:categoria
  - Parámetro obligatorio de tipo URL:
    - pelicula   *(tipo: string. Trae los titulos de la categoría indicada)*
- Response:
    ``` json
        [
            {
                "id": 6,
                "poster": "https://www.trailerflix.com/posters/6.jpg",
                "titulo": "Enola Holmes",
                "categoria": "Pelicula",
                "genero": "Drama, Ficcion, Misterio",
                "resumen": " hermana menor de Sherlock, descubre que su madre ha desaparecido y se dispone a encontrarla. En su búsqueda, saca a relucir el sabueso que corre por sus venas y se encuentra con una conspiración que gira en torno a un misterioso lord, demostrando que su ilustre hermano no es el único talento en la familia.",
                "temporadas": "N/A",
                "reparto": "Adeel Akhtar, Helena Bonham Carter, Henry Cavill, Louis Partridge, Millie Bobby Brown, Sam Claflin",
                "trailer": ""
            },
            {
                "id": 7,
                "poster": "https://www.trailerflix.com/posters/7.jpg",
                "titulo": "Guasón",
                "categoria": "Pelicula",
                "genero": "Crimen, Drama, Suspenso",
                "resumen": "Arthur Fleck (Phoenix) es un hombre ignorado por la sociedad, cuya motivación en la vida es hacer reír. Pero una serie de trágicos acontecimientos le llevarán a ver el mundo de otra forma. Película basada en el popular personaje de DC Comics Joker, conocido como archivillano de Batman, pero que en este film tomará un cariz más realista y oscuro.",
                "temporadas": "N/A",
                "reparto": "Brett Cullen, Frances Conroy, Joaquin Phoenix, Robert De Niro, Shea Whigham, Zazie Beetz",
                "trailer": "https://www.youtube.com/embed/zAGVQLHvwOY"
            },
            {
              "..."
            }
        ]
    ```
  - Código HTTP: **200** *catalogo*
  - Código HTTP: **404** *message: "No hay ningun título de la categoría ${category}"*
  - Código HTTP: **500** *error*
  - Nota: *Los valores indicados en el ejemplo, solo se colocó un extracto de dos objetos. Son datos esperados en los tests.*