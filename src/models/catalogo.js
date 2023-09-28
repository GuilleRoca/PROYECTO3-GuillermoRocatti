const { DataTypes } = require('sequelize');
const sequelize = require('../conection/conection');

const Catalogo = sequelize.define('catalogo', {
  catalogoId: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true,
    },
    titulo: {
      type: DataTypes.STRING,
      allowNull: false,
    },  
    resumen: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    poster: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    temporadas: {
        type: DataTypes.STRING,
        allowNull: false,
        default: 'N/A',
    },
    trailer: {
        type: DataTypes.STRING,
        allowNull: true,
    },
    categoriaId: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },  
}, {
  tableName: 'catalogo',
  timestamps: false,
});

module.exports = Catalogo;