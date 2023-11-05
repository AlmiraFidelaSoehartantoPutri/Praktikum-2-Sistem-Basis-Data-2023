CREATE DATABASE Kedai_Kopi_Nuri;
CREATE TABLE Pegawai (
	NIK CHAR(16) PRIMARY KEY NOT NULL,
	Nama_pegawai VARCHAR(100) NOT NULL,
	Jenis_kelamin CHAR(1) NOT NULL,
	Email VARCHAR(50) NOT NULL,
	Umur INTEGER NOT NULL
);
CREATE TABLE Telepon (
	No_telp_pegawai VARCHAR(15) PRIMARY KEY NOT NULL,
	Pegawai_NIK CHAR(16) NOT NULL,
	FOREIGN KEY (Pegawai_NIK) REFERENCES Pegawai(NIK)
);
CREATE TABLE Customer (
	ID_customer CHAR(6) PRIMARY KEY NOT NULL,
	Nama_customer VARCHAR(100) NOT NULL
);
CREATE TABLE Transaksi (
	ID_transaksi CHAR(10) PRIMARY KEY NOT NULL,
	Tanggal_transaksi DATE NOT NULL,
	Metode_pembayaran VARCHAR(15) NOT NULL,
	Customer_ID_customer CHAR(6) NOT NULL,
	Pegawai_NIK CHAR(16) NOT NULL,
	FOREIGN KEY (Customer_ID_customer) REFERENCES Customer(ID_Customer),
	FOREIGN KEY (Pegawai_NIK) REFERENCES Pegawai(NIK)
);
CREATE TABLE Menu_minuman (
	ID_minuman CHAR(6) PRIMARY KEY NOT NULL,
	Nama_minuman VARCHAR(50) NOT NULL,
	Harga_minuman FLOAT(2) NOT NULL
);
CREATE TABLE Transaksi_minuman (
	TM_Menu_minuman_ID CHAR(6) NOT NULL,
	TM_Transaksi_ID CHAR(10) NOT NULL,
	Jumlah_cup INTEGER NOT NULL,
	FOREIGN KEY (TM_Menu_minuman_ID) REFERENCES Menu_minuman(ID_minuman),
	FOREIGN KEY (TM_Transaksi_ID) REFERENCES Transaksi(ID_transaksi)
);
CREATE TABLE Sistem_membership (
	id_membership CHAR(6) NOT NULL,
	no_telepon_customer VARCHAR(15) NOT NULL,
	alamat_customer VARCHAR(100) NOT NULL,
	tanggal_pembuatan_kartu_membership DATE NOT NULL,
	tanggal_kedaluwarsa_kartu_membership DATE,
	total_poin INT NOT NULL,
	Customer_ID_customer CHAR(6) NOT NULL
);
ALTER TABLE Sistem_membership 
	ADD PRIMARY KEY (id_membership);
ALTER TABLE Sistem_membership
	ADD FOREIGN KEY (Customer_ID_customer) REFERENCES Customer (ID_customer)
	ON DELETE RESTRICT;
ALTER TABLE Sistem_membership
	ADD FOREIGN KEY (Customer_ID_customer) REFERENCES Customer (ID_customer)
	ON DELETE CASCADE;
ALTER TABLE Sistem_membership
	ADD CHECK (total_poin >= 0);
ALTER TABLE Sistem_membership
	MODIFY alamat_customer VARCHAR(150);
ALTER TABLE Pegawai
	ADD COLUMN nomor_telepon VARCHAR(15) NOT NULL;
INSERT INTO Customer (ID_customer, Nama_customer)
	VALUES ('CTR001','Budi Santoso'),
	('CTR002','Sisil Triana'),
	('CTR003','Davi Liam'),
	('CTR004','Sutris Ten An'),
	('CTR005','Hendra Asto');
INSERT INTO Sistem_membership (id_membership, no_telepon_customer, alamat_customer, tanggal_pembuatan_kartu_membership, tanggal_kedaluwarsa_kartu_membership, total_poin, Customer_ID_customer)
	VALUES ('MBR001','08123456789','Jl. Imam Bonjol','2023-10-24','2021-11-30','0','CTR001'),
	('MBR002','0812345678','Jl. Kelinci','2023-10-24','2023-11-30','3','CTR002'),
	('MBR003','081234567890','Jl. Abah Ojak','2023-10-25','2023-12-01','2','CTR003'),
	('MBR004','08987654321','Jl. Kenangan','26-10-2023','2023-12-02','6','CTR005');
INSERT INTO Pegawai (NIK, Nama_pegawai, Jenis_kelamin, Email, Umur, nomor_telepon)
	VALUES ('1234567890123456','Naufal Raf','L','naufal@gmail.com','19','62123456789'),
	('2345678901234561','Surinala','P','surinala@gmail.com','24','621234567890'),
	('3456789012345612','Ben John','L','benjohn@gmail.com','22','6212345678');
INSERT INTO Transaksi (ID_transaksi, Tanggal_transaksi, Metode_pembayaran, Pegawai_NIK, Customer_ID_customer)
	VALUES ('TRX0000001','2023-10-01','Kartu kredit','2345678901234561','CTR002'),
	('TRX0000002','2023-10-03','Transfer bank','3456789012345612','CTR004'),
	('TRX0000003','2023-10-05','Tunai','3456789012345612','CTR001'),
	('TRX0000004','2023-10-15','Kartu debit','1234567890123456','CTR003'),
	('TRX0000005','2023-10-15','E-wallet','1234567890123456','CTR004'),
	('TRX0000006','2023-10-21','Tunai','2345678901234561','CTR001');
INSERT INTO Menu_minuman(ID_minuman,Nama_minuman,Harga_minuman)
	VALUES ('MNM001','Expresso','18000'),
	('MNM002','Cappuchino','20000'),
	('MNM003','Latte','21000'),
	('MNM004','Americano','19000'),
	('MNM005','Mocha','22000'),
	('MNM006','Macchiato','23000'),
	('MNM007','Cold Brew','21000'),
	('MNM008','Iced Coffee','18000'),
	('MNM009','Affogato','23000'),
	('MNM010','Coffee Frappe','22000');
INSERT INTO Transaksi_minuman (TM_Transaksi_ID, TM_Menu_minuman_ID, Jumlah_cup)
	VALUES ('TRX0000005','MNM006','2'),
	('TRX0000001','MNM010','1'),
	('TRX0000002','MNM005','1'),
	('TRX0000005','MNM009','1'),
	('TRX0000003','MNM001','3'),
	('TRX0000006','MNM003','2'),
	('TRX0000004','MNM004','2'),
	('TRX0000004','MNM010','1'),
	('TRX0000002','MNM003','2'),
	('TRX0000001','MNM007','1'),
	('TRXOOOOOO5','MNM001','1'),
	('TRX0000003','MNM003','1');