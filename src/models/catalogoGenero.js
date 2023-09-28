const { DataTypes } = require('sequelize');
const sequelize = require('../conection/conection');

const CatalogoGenero = sequelize.define('catalogoGenero', {
    catalogoGeneroId: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        allowNull: false,
    },
    catalogoId: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },  
    generoId: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
}, {
  tableName: 'catalogoGenero',
  timestamps: false,
});

module.exports = CatalogoGenero;