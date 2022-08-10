-- CreateTable
CREATE TABLE "Trainer_Items" (
    "id" SERIAL NOT NULL,
    "trainer_id" INTEGER NOT NULL,
    "item_id" INTEGER NOT NULL,

    CONSTRAINT "Trainer_Items_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Items" (
    "id" SERIAL NOT NULL,
    "name" TEXT,
    "type" TEXT,
    "description" TEXT,
    "price" INTEGER,
    "inventory" INTEGER,
    "imageUrl" TEXT,
    "floor_id" INTEGER NOT NULL,

    CONSTRAINT "Items_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Floors" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Floors_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Trainer_Items" ADD CONSTRAINT "Trainer_Items_trainer_id_fkey" FOREIGN KEY ("trainer_id") REFERENCES "Trainer"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Trainer_Items" ADD CONSTRAINT "Trainer_Items_item_id_fkey" FOREIGN KEY ("item_id") REFERENCES "Items"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Items" ADD CONSTRAINT "Items_floor_id_fkey" FOREIGN KEY ("floor_id") REFERENCES "Floors"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
