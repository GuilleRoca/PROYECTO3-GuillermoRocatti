const express = require("express")
const router = express.Router()

const { Op } = require("sequelize")
const { QueryTypes } = require("sequelize")
const Catalogo = require('../models/vistaCatalogo')

router.get("/", async (req, res, next) =>  {
    
    try {
        const catalogo = await Catalogo.findAll()
        res.status(200).send(catalogo);
    } catch (err) {
        res.status(500)
        next(err)
    }
})

//Catálogo de títulos filtrado por el nombre de alguno/a de sus actores/actrices
router.get("/nombre/:nombre", async (req, res, next) =>  {
    const name = req.params.nombre
    const catalogoName = await Catalogo.findAll({ where:{reparto: { [Op.substring]: name }}})
    if (catalogoName.length==0) {
        res.status(404)
        next({ message: `No hay ningun título en el que actúa una persona con nombre ${name}` })
        return
    }

    res.status(200).send(catalogoName);
})

//Catálogo de títulos filtrado por Género
router.get("/genero/:genero", async (req, res, next) =>  {
    const gender = req.params.genero
    const catalogoGender = await Catalogo.findAll({ where:{genero: { [Op.substring]: gender }}})
    if (catalogoGender.length==0) {
        res.status(404)
        next({ message: `No hay ningun título del género ${gender}` })
        return
    }

    res.status(200).send(catalogoGender);
})

//Catálogo de títulos filtrado por Categoría
router.get("/categoria/:categoria", async (req, res, next) =>  {
    const category = req.params.categoria
    const catalogoCategory = await Catalogo.findAll({ where:{categoria: { [Op.substring]: category }}})
    if (catalogoCategory.length==0) {
        res.status(404)
        next({ message: `No hay ningun título de la categoría ${category}` })
        return
    }

    res.status(200).send(catalogoCategory);
})

//Catálogo de títulos filtrado por ID de categoría el título
router.get("/:catalogoId", async (req, res, next) =>  {
    const ID = req.params.catalogoId
    if (Number.isNaN(Number(ID))) {
        res.status(400).send({ message: "El ID tiene que ser un número" })
        return
    }
    
    const catalogo = await Catalogo.findByPk(ID)
    console.log(catalogo)
    if (!catalogo) {
        res.status(404)
        next({ message: "El ID no se encontró" })
        return
    }

    res.status(200).send(catalogo);
})

module.exports = router;