const { Sequelize } = require("sequelize");

//*Obtenciion de las variables de entorno
const database = "oazbRvylTF";
const usename = "oazbRvylTF";
const password = "LFPJkcbdeS";
const host = "remotemysql.com";

const sequelize = new Sequelize(database, usename, password, {
  host: host,
  dialect: "mysql",
});

module.exports = {
  sequelize,
};
