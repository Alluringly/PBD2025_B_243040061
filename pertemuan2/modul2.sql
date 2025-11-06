CREATE DATABASE TokoRetailDB;

USE TokoRetailDB;

CREATE TABLE KategoriProduk (
	KategoriID INT IDENTITY(1,1) PRIMARY KEY,
	NamaKategori VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Produk (
	ProdukID INT IDENTITY(1001,1) PRIMARY KEY,
	SKU VARCHAR(20) NOT NULL UNIQUE,
	NamaProduk VARCHAR (150) NOT NULL,
	Harga DECIMAL (10,2) NOT NULL,
	Stok INT NOT NULL,
	KategoriID INT NULL,

	CONSTRAINT CHK_HargaPositif CHECK (Harga >= 0),
	
	CONSTRAINT CHK_StokPositif CHECK (Stok >= 0),

	CONSTRAINT FK_Produk_Kategori
		FOREIGN KEY (KategoriID)
		REFERENCES KategoriProduk(KategoriID)

);

INSERT INTO KategoriProduk (NamaKategori)
VALUES
('Pakaian'),
('Buku');

INSERT INTO KategoriProduk (NamaKategori)
VALUES
('Pakaian');

INSERT INTO KategoriProduk (NamaKategori)
VALUES
('Buku');

SELECT *
FROM KategoriProduk;

SELECT NamaKategori
FROM KategoriProduk;

INSERT INTO Produk (SKU, NamaProduk, Harga, Stok, KategoriID)
VALUES
('ELEC-001', 'Laptop Gaming', 15000000.00, 50, 2);

INSERT INTO Produk (SKU, NamaProduk, Harga, Stok, KategoriID)
VALUES
('ELEC-002', 'HP Gaming', 50000000.00, 50, 1);

SELECT *
FROM Produk;

UPDATE Produk
SET Stok = 30
WHERE ProdukID = 1001;

BEGIN TRANSACTION;

DELETE FROM Produk
WHERE ProdukID = 1002;

COMMIT TRANSACTION;

INSERT INTO Produk (SKU, NamaProduk, Harga, Stok, KategoriID)
VALUES
('Baju-0001', 'Kaos', 50000.00, 30, 2);

INSERT INTO Produk (SKU, NamaProduk, Harga, Stok, KategoriID)
VALUES
('Baju-0002', 'Kemeja', 50000.00, 30, 2);

BEGIN TRAN;

DELETE FROM Produk
WHERE ProdukID = 1004;

SELECT *
FROM Produk;

ROLLBACK TRANSACTION;










