const { DataTypes } = require('sequelize');
const sequelize = require('../conection/conection');

const VistaCatalogo = sequelize.define('vistaCatalogo', {
    id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true,
    },
    poster: {
      type: DataTypes.STRING,
      allowNull: false,
    },  
    titulo: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    categoria: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    genero: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    resumen: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    temporadas: {
        type: DataTypes.STRING,
        allowNull: false,
        default: 'N/A',
    },
    reparto: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    trailer: {
        type: DataTypes.STRING,
        allowNull: true,
    },
}, {
  tableName: 'vistaCatalogo',
  timestamps: false,
});

module.exports = VistaCatalogo;