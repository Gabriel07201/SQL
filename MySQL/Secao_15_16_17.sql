/* SUBQUERIES */
USE PROJETO;

SELECT NOME, VALOR FROM CURSOS
WHERE VALOR = (SELECT MIN(VALOR) FROM CURSOS);

SELECT NOME, VALOR FROM CURSOS
WHERE VALOR = (SELECT MAX(VALOR) FROM CURSOS);

SELECT NOME, VALOR FROM CURSOS
WHERE VALOR >= (SELECT AVG(VALOR) FROM CURSOS);


/* SECAO 16 */

CREATE TABLE TABELA(
		COLUNA1 VARCHAR(30),
		COLUNA2 VARCHAR(30),
		COLUNA3 VARCHAR(30)
);

/* ADICIONANDO UMA PRIMARY KEY */

ALTER TABLE TABELA
ADD PRIMARY KEY (COLUNA1);

/* ADICIONANDO UMA COLUNA SEM POSIÇÃO, VAI PARA ÚLTIMA POSIÇÃO */

ALTER TABLE TABELA
ADD COLUNA VARCHAR(30);

/* ADICIONANDO UMA COLUNA COM POSIÇÃO */

ALTER TABLE TABELA
ADD COLUMN COLUNA4 VARCHAR(30) NOT NULL UNIQUE
AFTER COLUNA3;

/* MODIFICANDO O TIPO DE UM CAMPO */

ALTER TABLE TABELA MODIFY COLUNA2 DATE NOT NULL;


CREATE TABLE TIME(
		IDTIME INT PRIMARY KEY AUTO_INCREMENT,
		TIME VARCHAR(30),
		ID_PESSOA VARCHAR(30)
);

/* RENOMEANDO O NOME DA TABELA */

ALTER TABLE TABELA
RENAME PESSOA;

/* ADD FOREIGN KEY */

ALTER TABLE TIME
ADD FOREIGN KEY (ID_PESSOA)
REFERENCES PESSOA (COLUNA1);

/* VERIFICAR AS CHAVES */

SHOW CREATE TABLE TIME;


/* ORGANIZAÇÃO DE CHAVES - CONSTRAINT (REGRA) */

CREATE TABLE JOGADOR(
	IDJOGADOR INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30)
);

CREATE TABLE TIMES(
	IDTIME INT PRIMARY KEY AUTO_INCREMENT,
	NOMETIME VARCHAR(30),
	ID_JOGADOR INT,
	FOREIGN KEY (ID_JOGADOR)
	REFERENCES JOGADOR(IDJOGADOR)
);

INSERT INTO JOGADOR VALUES(NULL,'GUERRERO');
INSERT INTO TIMES VALUES(NULL,'FLAMENGO',1);

SHOW CREATE TABLE JOGADOR;
SHOW CREATE TABLE TIMES;

CREATE TABLE CLIENTE(
	IDCLIENTE INT,
	NOME VARCHAR(30)
);

CREATE TABLE TELEFONE(
	IDTELEFONE INT,
	TIPO CHAR(3) NOT NULL,
	NUMERO VARCHAR(10) NOT NULL,
	ID_CLIENTE INT
);

ALTER TABLE CLIENTE ADD CONSTRAINT PK_CLIENTE
PRIMARY KEY (IDCLIENTE);

ALTER TABLE TELEFONE ADD CONSTRAINT FK_CLIENTE_TELEFONE
FOREIGN KEY(ID_CLIENTE) REFERENCES CLIENTE(IDCLIENTE);


/* DICIONÁRIO DE DADOS */

USE INFORMATION_SCHEMA;
SHOW TABLES;

DESC TABLE_CONSTRAINTS;

SELECT CONSTRAINT_SCHEMA AS "BANCO",
	TABLE_NAME AS "TABELA",
	CONSTRAINT_NAME AS "NOME REGRA",
	CONSTRAINT_TYPE AS "TIPO"
FROM TABLE_CONSTRAINTS
	WHERE CONSTRAINT_SCHEMA = "PROJETO";

/* APAGANDO CONSTRAINT */

USE PROJETO;
ALTER TABLE TELEFONE
DROP FOREIGN KEY FK_CLIENTE_TELEFONE;