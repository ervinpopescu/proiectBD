#SOURCE C:/Users/teodo/Desktop/script final.sql

DROP DATABASE IF EXISTS proiectBD;
CREATE DATABASE proiectBD;
USE proiectBD;

CREATE TABLE tblClient (
    idClient MEDIUMINT(8) ZEROFILL UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    CNP CHAR(13) UNIQUE NOT NULL,
    nume VARCHAR(45) NOT NULL,
    prenume VARCHAR(45) NOT NULL,
    nrTelefon VARCHAR(20) NOT NULL,
    email VARCHAR(100) NOT NULL
);

CREATE TABLE tblMasina (
    idMasina SMALLINT(5) ZEROFILL UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    idLocatieActuala TINYINT(2) ZEROFILL UNSIGNED,
    categorie ENUM("Economy","Intermediate","Premium"),
    marca VARCHAR(45),
    model VARCHAR(45),
    anFabricatie YEAR,
    serieSasiu VARCHAR(17) UNIQUE,
    serieCarteIdentitate VARCHAR(17) UNIQUE,
    nrInmatriculare VARCHAR(10) UNIQUE,
    tipMotor ENUM("Diesel", "Benzina", "Electric"),
    tipTransmisie ENUM("manuala", "automata"),
    nrPasageri TINYINT(2),
    nrUsi TINYINT(1)
);

CREATE TABLE tblLocatie (
    idLocatie TINYINT(2) ZEROFILL UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    adresa VARCHAR(200),
    codPostal CHAR(6),
    email VARCHAR(100),
    nrTelefon VARCHAR(20)
);

CREATE TABLE tblInchiriere (
    idInchiriere INT(10) ZEROFILL UNSIGNED NOT NULL UNIQUE AUTO_INCREMENT,
    idClient MEDIUMINT(8) ZEROFILL UNSIGNED NOT NULL,
    idMasina SMALLINT(5) ZEROFILL UNSIGNED NOT NULL,
    dataInchiriere DATE NOT NULL,
    dataPredareLimita DATE NOT NULL,
    dataPredareEfectiva DATE,
    idLocatieInchiriere TINYINT(2) ZEROFILL UNSIGNED NOT NULL,
    idLocatiePredare TINYINT(2) ZEROFILL UNSIGNED NOT NULL,
    PRIMARY KEY(idClient, idMasina),
    CONSTRAINT fk_client FOREIGN KEY (idClient) REFERENCES tblClient(idClient) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_masina FOREIGN KEY (idMasina) REFERENCES tblMasina(idMasina) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_locatieInchiriere FOREIGN KEY (idLocatieInchiriere) REFERENCES tblLocatie(idLocatie) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_locatiePredare FOREIGN KEY (idLocatiePredare) REFERENCES tblLocatie(idLocatie) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE tblPlata (
    idPlata INT(10) ZEROFILL UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    tipPlata ENUM("card", "cash"),
    idInchiriere INT(10) ZEROFILL UNSIGNED NOT NULL,
    suma DECIMAL(7,2),
    statusPlata ENUM("achitata", "neachitata"),
    CONSTRAINT fk_inchiriere FOREIGN KEY (idInchiriere) REFERENCES tblInchiriere(idInchiriere) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO tblClient VALUES(DEFAULT, "2821205341248", "Popescu", "Maria", "+40744055645", "popescu_maria01@gmail.com");
INSERT INTO tblClient VALUES(DEFAULT, "1770202890311", "Ionescu", "Robert Andrei", "+40755357795", "ionescu_robert45@gmail.com");
INSERT INTO tblClient VALUES(DEFAULT, "2800304289990", "Udrea",	"Ioana", "+40722315349", "udrea.ioana04@gmail.com");
INSERT INTO tblClient VALUES(DEFAULT, "2780101009008", "Lungu",	"Simona", "+40723452861", "lungu_simona22@gmail.com");
INSERT INTO tblClient VALUES(DEFAULT, "1750409145145", "Cristea", "Daniel Mihai", "+40744997175", "cristea.danielmihai@gmail.com");
INSERT INTO tblClient VALUES(DEFAULT, "1810909177177", "Popescu", "Andrei", "+40742637324", "andrei_popescu39@gmail.com");
INSERT INTO tblClient VALUES(DEFAULT, "1770624335463", "Vasile", "Alexandru", "+40758754882", "vasile.alexandru@gmail.com");
INSERT INTO tblClient VALUES(DEFAULT, "1910513536142", "Sima", "Elena", "+40742893413", "sima_elena78@gmail.com");
INSERT INTO tblClient VALUES(DEFAULT, "6000311434411", "Aldea",	"Eliza", "+40741283748", "aldea.eliza93@gmail.com");
INSERT INTO tblClient VALUES(DEFAULT, "2951007093161", "Petre", "Madalina Bianca", "+40729200126", "petremadalinabianca@gmail.com");

INSERT INTO tblLocatie VALUES(DEFAULT, "Bucuresti, Bd. Iuliu Maniu, Nr. 54", "063423", "bucuresti@first.ro", "+40244234340");
INSERT INTO tblLocatie VALUES(DEFAULT, "Timisoara, Calea Sever Bocu, Nr. 15", "306843", "timisoara@first.ro", "+40244234341");
INSERT INTO tblLocatie VALUES(DEFAULT, "Cluj-Napoca, Str. Horea, Nr. 20", "401791", "cluj@first.ro", "+40244234342");
INSERT INTO tblLocatie VALUES(DEFAULT, "Iasi, Str. 14 Decembrie 1989, Nr. 7", "700036", "iasi@first.ro", "+40244234343");
INSERT INTO tblLocatie VALUES(DEFAULT, "Brasov, Calea Bucuresti, Nr. 238", "504733", "brasov@first.ro", "+40244234344");
INSERT INTO tblLocatie VALUES(DEFAULT, "Craiova, Bd. Stirbey Voda, Nr. 27", "209588", "craiova@first.ro", "+40244234345");
INSERT INTO tblLocatie VALUES(DEFAULT, "Oradea, Bd. Decebal, Nr. 34", "331164", "oradea@first.ro", "+40244234346");
INSERT INTO tblLocatie VALUES(DEFAULT, "Baia Mare, Str. Progresului, Nr. 5 ", "430071", "baiamare@first.ro", "+40244234347");
INSERT INTO tblLocatie VALUES(DEFAULT, "Sibiu, Str. Stefan cel Mare, Nr. 6", "551216", "sibiu@first.ro", "+40244234348");
INSERT INTO tblLocatie VALUES(DEFAULT, "Constanta, Bd. Alexandru Lapusneanu, Nr. 175", "901822", "constanta@first.ro", "+40244234349");

INSERT INTO tblMasina VALUES(DEFAULT, 1, "Economy", "Volkswagen", "Golf", 2018, "NR916E9LP5", "3DEO7J5B7V", "B 20 FIR", "Benzina", "manuala", 5, 4);
INSERT INTO tblMasina VALUES(DEFAULT, 9, "Intermediate", "Hyundai", "Tucson", 2017, "3L6CB8B4FH", "5CSUULRKZX", "B 21 FIR", "Diesel", "automata", 5, 4);
INSERT INTO tblMasina VALUES(DEFAULT, 8, "Premium", "Volvo", "XC50", 2018, "71H0YSOJM7", "T1Z7TQIZYU", "B 22 FIR", "Benzina", "automata", 5, 4);
INSERT INTO tblMasina VALUES(DEFAULT, 7, "Intermediate", "Ford", "Focus", 2018, "8IW050QCTL", "45V14RPJ82", "B 23 FIR", "Diesel", "manuala", 5, 4);
INSERT INTO tblMasina VALUES(DEFAULT, 6, "Premium", "Audi", "A3", 2019, "G6LASTSLV3", "LKMOGLFE4Z", "B 24 FIR", "Diesel", "automata", 5, 4);
INSERT INTO tblMasina VALUES(DEFAULT, 4, "Premium", "BMW", "X6", 2020, "AH13DVUEHD", "ZN5F1KM5QL", "B 25 FIR", "Diesel", "automata", 5, 4);
INSERT INTO tblMasina VALUES(DEFAULT, 4, "Premium", "BMW", "i3", 2020, "FUAPWO0RHR", "NYRKGTJE4K", "B 26 FIR", "Electric", "automata", 5, 4);
INSERT INTO tblMasina VALUES(DEFAULT, 3, "Intermediate", "Seat", "Ateca", 2021, "DVNPOTITMM", "8AEUYUR569", "B 27 FIR", "Benzina", "manuala", 5, 4);
INSERT INTO tblMasina VALUES(DEFAULT, 2, "Premium", "Mercedes", "E Class", 2020, "HPN981MSNA", "JUMEMHE705", "B 28 FIR", "Diesel", "automata", 5, 4);
INSERT INTO tblMasina VALUES(DEFAULT, 1, "Premium", "Audi", "Q7", 2022, "7F8W6XWVXI", "DHCYY2VLED", "B 29 FIR", "Diesel", "automata", 5, 4);

INSERT INTO tblInchiriere VALUES(DEFAULT, 7, 1, "2022-09-13", "2022-09-15", DEFAULT, 8, 5);
INSERT INTO tblInchiriere VALUES(DEFAULT, 9, 5, "2022-11-20", "2022-11-23", DEFAULT, 8, 2);
INSERT INTO tblInchiriere VALUES(DEFAULT, 8, 1, "2022-06-15", "2022-06-15", DEFAULT, 3, 3);
INSERT INTO tblInchiriere VALUES(DEFAULT, 6, 3, "2022-12-16", "2022-12-27", DEFAULT, 4, 4);
INSERT INTO tblInchiriere VALUES(DEFAULT, 1, 1, "2022-10-17", "2022-10-23", DEFAULT, 5, 3);
INSERT INTO tblInchiriere VALUES(DEFAULT, 1, 8, "2022-08-18", "2022-08-20", DEFAULT, 5, 5);
INSERT INTO tblInchiriere VALUES(DEFAULT, 5, 6, "2022-10-19", "2022-10-21", DEFAULT, 3, 8);
INSERT INTO tblInchiriere VALUES(DEFAULT, 3, 3, "2022-12-21", "2022-12-24", DEFAULT, 5, 2);
INSERT INTO tblInchiriere VALUES(DEFAULT, 2, 1, "2022-11-01", "2022-11-06", DEFAULT, 7, 3);
INSERT INTO tblInchiriere VALUES(DEFAULT, 1, 2, "2022-05-23", "2022-05-26", DEFAULT, 9, 4);

INSERT INTO tblPlata VALUES(DEFAULT, "cash", 1, 298.99, "achitata");
INSERT INTO tblPlata VALUES(DEFAULT, "cash", 5, 498.50, "achitata");
INSERT INTO tblPlata VALUES(DEFAULT, "card", 3, 150.99, "achitata");
INSERT INTO tblPlata VALUES(DEFAULT, "cash", 8, 232.89, "neachitata");
INSERT INTO tblPlata VALUES(DEFAULT, "card", 10, 345.64, "achitata");
INSERT INTO tblPlata VALUES(DEFAULT, "cash", 2, 422.33, "achitata");
INSERT INTO tblPlata VALUES(DEFAULT, "cash", 9, 502.99, "neachitata");
INSERT INTO tblPlata VALUES(DEFAULT, "card", 4, 120.99, "achitata");
INSERT INTO tblPlata VALUES(DEFAULT, "card", 7, 187.63, "neachitata");
INSERT INTO tblPlata VALUES(DEFAULT, "cash", 6, 145.27, "achitata");

DESCRIBE tblClient;
SELECT * FROM tblClient;

DESCRIBE tblMasina;
SELECT * FROM tblMasina;

DESCRIBE tblLocatie;
SELECT * FROM tblLocatie;

DESCRIBE tblInchiriere;
SELECT * FROM tblInchiriere ORDER BY idInchiriere;

DESCRIBE tblPlata;
SELECT * FROM tblPlata;
