const { DataTypes } = require('sequelize');
const sequelize = require('../conection/conection');

const Genero = sequelize.define('genero', {
  generoId: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        allowNull: false,
    },
    generoNombre: {
      type: DataTypes.STRING,
      allowNull: false,
    },  
}, {
  tableName: 'genero',
  timestamps: false,
});

module.exports = Genero;