const { DataTypes } = require('sequelize');
const sequelize = require('../conection/conection');

const Categoria = sequelize.define('categoria', {
    categoriaId: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        allowNull: false,
    },
    categoriaNombre: {
      type: DataTypes.STRING,
      allowNull: false,
    },
}, {
  tableName: 'categoria',
  timestamps: false,
});

module.exports = Categoria;