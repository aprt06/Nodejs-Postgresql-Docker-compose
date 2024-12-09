module.exports = {
  HOST: process.env.DB_HOST || "postgresdb",  // Default fallback to "postgresdb"
  USER: process.env.DB_USER || "postgres",
  PASSWORD: process.env.DB_PASSWORD || "123",
  DB: process.env.DB_NAME || "testdb",
  dialect: "postgres",
  pool: {
    max: 5,
    min: 0,
    acquire: 30000,
    idle: 10000
  }
};