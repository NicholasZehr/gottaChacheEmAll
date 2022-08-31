const { PrismaClient } = require(`@prisma/client`);

const prisma = new PrismaClient();
// Adding comment for test.
module.exports = prisma;
