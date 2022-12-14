/* TSQL */

/* BLOCO DE EXECU??O */

BEGIN
	PRINT 'PRIMEIRO BLOCO'
END
GO


/* BLOCO DE ATRIBUI??O DE VARI?VEIS */

DECLARE
		@CONTADOR INT
BEGIN
		SET @CONTADOR = 5
		PRINT @CONTADOR
END
GO

DECLARE
		
		@V_NUMERO NUMERIC(10,2) = 100.52,
		@V_DATA DATETIME = '20170207'
BEGIN
		PRINT 'VALOR NUM?RICO: ' + CAST(@V_NUMERO AS VARCHAR)
		PRINT 'VALOR NUM?RICO: ' + CONVERT(VARCHAR, @V_NUMERO)
		PRINT 'VALOR DE DATA: ' + CAST(@V_DATA AS VARCHAR)
		PRINT 'VALOR DE DATA: ' + CONVERT(VARCHAR, @V_DATA, 121)
		PRINT 'VALOR DE DATA: ' + CONVERT(VARCHAR, @V_DATA, 120)
		PRINT 'VALOR DE DATA: ' + CONVERT(VARCHAR, @V_DATA, 105)

END
GO



CREATE TABLE CARROS(
	CARRO VARCHAR(20),
	FABRICANTE VARCHAR(30)
)
GO

INSERT INTO CARROS VALUES('KA','FORD')
INSERT INTO CARROS VALUES('FIEST','FORD')
INSERT INTO CARROS VALUES('PRISMA','FORD')
INSERT INTO CARROS VALUES('CLIO','RENAULT')
INSERT INTO CARROS VALUES('SANDERO','RENAULT')
INSERT INTO CARROS VALUES('CHEVET','CHEVROLET')
INSERT INTO CARROS VALUES('OMEGA','CHEVROLET')
INSERT INTO CARROS VALUES('PALIO','FIAT')
INSERT INTO CARROS VALUES('DOBLO','FIAT')
INSERT INTO CARROS VALUES('UNO','FIAT')
INSERT INTO CARROS VALUES('GOL','VOLKSWAGEN')
GO


DECLARE 

		@V_CONT_FORD INT,
		@V_CONT_FIAT INT

BEGIN
	-- M?TODO 1
	SET @V_CONT_FORD = (SELECT COUNT(*) FROM CARROS WHERE FABRICANTE = 'FORD')
	PRINT 'QUANTIDADE FORD: ' + CAST(@V_CONT_FORD AS VARCHAR)

	-- M?TODO 2
	SELECT @V_CONT_FIAT = COUNT(*) FROM CARROS WHERE FABRICANTE = 'FIAT'
	PRINT 'QUANTIDADE FIAT: ' + CAST(@V_CONT_FIAT AS VARCHAR)
END
GO


/* BLOCOS IF E ELSE */

DECLARE
		@NUMERO INT = 5

BEGIN
		IF @NUMERO = 5
			PRINT 'O VALOR ? VERDADEIRO'
		ELSE
			PRINT 'O VALOR ? FALSO'
END
GO

/* CASE */

DECLARE
		@CONTADOR INT

BEGIN
		SELECT -- O CASE REPRESENTA UMA COLUNA
		CASE
			WHEN FABRICANTE = 'FIAT' THEN 'FAIXA 1'
			WHEN FABRICANTE = 'CHEVROLET' THEN 'FAIXA 2'
			ELSE 'OUTRAS FAIXAS'
		END AS "INFORMA??ES",
		* FROM CARROS
END
GO



/* LOOPS */

DECLARE 
		@I INT = 1

BEGIN
		WHILE (@I <15)
		BEGIN
			PRINT 'VALOR DE I = ' + CAST(@I AS VARCHAR)
			SET @I += 1
		END
END
GO