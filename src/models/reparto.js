const { DataTypes } = require('sequelize');
const sequelize = require('../conection/conection');

const Reparto = sequelize.define('reparto', {
  repartoId: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        allowNull: false,
    },
    repartoNombre: {
      type: DataTypes.STRING,
      allowNull: false,
    },  
}, {
  tableName: 'reparto',
  timestamps: false,
});

module.exports = Reparto;