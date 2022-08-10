/*
  Warnings:

  - You are about to drop the column `trainerId` on the `Pokemon` table. All the data in the column will be lost.
  - You are about to drop the column `age` on the `Trainer` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[name]` on the table `Pokemon` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `name` to the `Pokemon` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Pokemon" DROP CONSTRAINT "Pokemon_trainerId_fkey";

-- AlterTable
ALTER TABLE "Pokemon" DROP COLUMN "trainerId",
ADD COLUMN     "name" TEXT NOT NULL,
ADD COLUMN     "url" TEXT;

-- AlterTable
ALTER TABLE "Trainer" DROP COLUMN "age";

-- CreateTable
CREATE TABLE "Pokemon_Trainers" (
    "id" SERIAL NOT NULL,
    "pokemon_id" INTEGER NOT NULL,
    "trainer_id" INTEGER NOT NULL,

    CONSTRAINT "Pokemon_Trainers_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Pokemon_name_key" ON "Pokemon"("name");

-- AddForeignKey
ALTER TABLE "Pokemon_Trainers" ADD CONSTRAINT "Pokemon_Trainers_pokemon_id_fkey" FOREIGN KEY ("pokemon_id") REFERENCES "Pokemon"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Pokemon_Trainers" ADD CONSTRAINT "Pokemon_Trainers_trainer_id_fkey" FOREIGN KEY ("trainer_id") REFERENCES "Trainer"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
