/* SEGUNDA E TERCEIRAS FORMAS NORMAIS */

/* 
PRIMEIRA FN 

ATOMICIDADE - UM CAMPO NAO PODE SER DIVISIVEL
UM CAMPO NAO PODE SER VETORIZADO
PK CHAVE PRIMARIA
*/

CREATE DATABASE CONSULTORIO;

USE CONSULTORIO;

CREATE TABLE PACIENTE(
	IDPACIENTE INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30),
	SEXO CHAR(1),
	EMAIL VARCHAR(30),
	NASCIMENTO DATE
);

CREATE TABLE MEDICO(
	IDMEDICO INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30),
	SEXO CHAR(1),
	ESPECIALIDADE VARCHAR(30),
	FUNCIONARIO ENUM('S','N')
);

CREATE TABLE HOSPITAL(
	IDHOSPITAL INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30),
	BAIRRO VARCHAR(30),
	CIDADE VARCHAR(30),
	ESTADO CHAR(2)
);

CREATE TABLE CONSULTA(
	IDCONSULTA INT PRIMARY KEY AUTO_INCREMENT,
	ID_PACIENTE INT,
	ID_MEDICO INT,
	ID_HOSPITAL INT,
	DATA DATETIME,
	DIAGNOSTICO VARCHAR(50)
);


CREATE TABLE INTERNACAO(
	IDINTERNACAO INT PRIMARY KEY AUTO_INCREMENT,
	ENTRADA DATETIME,
	QUARTO INT,
	SAIDA DATETIME,
	OBSERVACOES VARCHAR(50),
	ID_CONSULTA INT UNIQUE
);


ALTER TABLE CONSULTA ADD CONSTRAINT FK_PACIENTE_CONSULTA
FOREIGN KEY(ID_PACIENTE)
REFERENCES PACIENTE(IDPACIENTE);

ALTER TABLE CONSULTA ADD CONSTRAINT FK_MEDICO_CONSULTA
FOREIGN KEY(ID_MEDICO)
REFERENCES MEDICO(IDMEDICO);

ALTER TABLE CONSULTA ADD CONSTRAINT FK_HOSPITAL_CONSULTA
FOREIGN KEY(ID_HOSPITAL)
REFERENCES HOSPITAL(IDHOSPITAL);

ALTER TABLE INTERNACAO ADD CONSTRAINT FK_CONSULTA_INTERNACAO
FOREIGN KEY(ID_CONSULTA)
REFERENCES CONSULTA(IDCONSULTA);

