const { DataTypes } = require('sequelize');
const sequelize = require('../conection/conection');

const CatalogoReparto = sequelize.define('catalogoReparto', {
  catalogoRepartoId: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        allowNull: false,
    },
    catalogoId: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },  
    repartoId: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
}, {
  tableName: 'catalogoReparto',
  timestamps: false,
});

module.exports = CatalogoReparto;