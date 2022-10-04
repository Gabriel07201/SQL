Secao_11sql

USE COMERCIO;

/* USANDO IFNULL() */

SELECT 	C.NOME, 
		IFNULL(C.EMAIL, '******'), 
		E.ESTADO, 
		T.NUMERO
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE;

/* ALTERANDO O CABEÇALHO */

SELECT 	C.NOME, 
		IFNULL(C.EMAIL, '******') AS 'EMAIL',
		E.ESTADO, 
		T.NUMERO
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE;


/* VIEW */

SELECT 	C.NOME, 
		C.SEXO, 
		C.EMAIL, 
		T.TIPO, 
		T.NUMERO, 
		E.BAIRRO, 
		E.CIDADE, 
		E.ESTADO
FROM CLIENTE C
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE;

CREATE VIEW  RELATORIO AS 
SELECT 	C.NOME, 
		C.SEXO, 
		C.EMAIL, 
		T.TIPO, 
		T.NUMERO, 
		E.BAIRRO, 
		E.CIDADE, 
		E.ESTADO
FROM CLIENTE C
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE;

SELECT * FROM RELATORIO;


/* LOCALIZANDO AS VIEWS CRIADAS, IRÁ APARECER NO COMANDO SHOW TABLES */


/* APAGANDO UMA VIEW */

DROP VIEW RELATORIO;


/* VIEW COM PREFIXO */

CREATE VIEW  V_RELATORIO AS 
SELECT 	C.NOME, 
		C.SEXO, 
		IFNULL(C.EMAIL, '*****') AS 'EMAIL',
		T.TIPO, 
		T.NUMERO, 
		E.BAIRRO, 
		E.CIDADE, 
		E.ESTADO
FROM CLIENTE C
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE;

SELECT NOME, NUMERO, ESTADO
FROM V_RELATORIO;


/* UPTADE, INSERT, DELETE COM VIEW */
/* SOMENTE UPTADE É PERMITIDO FAZER COM O VIEW QUANDO SE EXISTE UMA TABELA COM JOIN.

CASO NÃO EXISTA O JOIN É POSSÍVEL DELETAR E INSERIR. */


/* ORDER BY */
/* PODER SER USADO POR ÍNDICE OU PELO NOME DA COLUNA */

SELECT * FROM CLIENTE
ORDER BY 1;

SELECT * FROM CLIENTE
ORDER BY 2;

/* PODE SER MESCLADO COM MAIS DE UMA COLUNA */
SELECT * FROM CLIENTE
ORDER BY 1,2;

/* ORDER BY DES / ASC */
/*TAMBÉM PODE SER MESCLADO */

SELECT * FROM CLIENTE
ORDER BY 1 DESC;

SELECT * FROM V_RELATORIO
ORDER BY 1;