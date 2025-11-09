CREATE DATABASE UNPAS;

USE UNPAS;

CREATE TABLE Mahasiswa (
	npm	CHAR(9),
	nama VARCHAR(100),
	jurusan VARCHAR(50),
);

EXEC sp_help 'Mahasiswa';

ALTER TABLE Mahasiswa
ADD alamat VARCHAR(100) NOT NULL;

ALTER TABLE Mahasiswa
ALTER COLUMN nama VARCHAR(50);

ALTER TABLE Mahasiswa
ADD CONSTRAINT UQ_npm_mahasiswa UNIQUE (npm);

CREATE TABLE Dosen (
	nama VARCHAR(50),
	nip CHAR(9),
	alamat VARCHAR(100),
	prodi VARCHAR(50),
);

DROP TABLE Dosen;

DROP DATABASE UNPAS;

ALTER TABLE Dosen 
ALTER COLUMN nip CHAR(9) NOT NULL;

ALTER TABLE Dosen 
ADD CONSTRAINT PK_nip_dosen PRIMARY KEY (nip);

ALTER TABLE Mahasiswa
DROP CONSTRAINT UQ_npm_mahasiswa;

ALTER TABLE Mahasiswa
ALTER COLUMN npm CHAR(9) NOT NULL;

ALTER TABLE Mahasiswa 
ADD CONSTRAINT PK_npm_mahasiswa PRIMARY KEY (npm);

ALTER TABLE Mahasiswa
ADD nip_pembimbing CHAR(9);

ALTER TABLE Mahasiswa 
ADD CONSTRAINT FK_mahasiswa_dosen 
FOREIGN KEY (nip_pembimbing)
REFERENCES Dosen(nip);

ALTER TABLE Dosen
DROP CONSTRAINT PK_nip_dosen;

ALTER TABLE Dosen
ALTER COLUMN nip CHAR(9) NOT NULL

EXEC sp_help 'Dosen';

