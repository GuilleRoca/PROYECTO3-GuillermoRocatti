const dotenv = require('dotenv');
dotenv.config();
const express = require('express');
const { Op } = require("sequelize")
const sequelize = require("./conection/conection")
const Categoria = require("./models/categoria")
const VistaCatalogo = require("./models/vistaCatalogo")
const catalogo = require("./routes/catalogo")

const server = express();

// Middlewares
server.use(express.json());


//Obtener listado de categorías : Ruta GET http://127.0.0.1:8080/api/v1/categorias
server.get('/api/v1/categorias' , async (req,res) => {
    const categorias = await Categoria.findAll()
    res.status(200).send(categorias)
})

//Rutas catalogo
server.use("/api/v1/catalogo", catalogo)


//Manejo de Errores
server.use((err, req, res, next) => {
    console.log(err)
    res.send(err)
})

//Manejo de rutas inexistentes
server.use('*', (req, res) => {
    res.status(404).send({error: `La URL indicada no existe en este servidor`});
});

//Levantar el servidor
sequelize.authenticate()
    .then(()=>{
        server.listen(process.env.PORT, process.env.HOST, () => {
            console.log(`El servidor está escuchando en: http://${process.env.HOST}:${process.env.PORT}`);
        });
    })
    .catch(()=>{
        console.log("Hubo un problema con la autenticación a la base de datos.")
});