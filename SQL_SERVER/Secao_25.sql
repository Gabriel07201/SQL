/* ORGANIZAR FISICAMENTE E LOGICAMENTE UM BANCO DE DADOS

1 - CRIAR O BANCO COM ARQUIVOS PARA OS SETORES MKT E VENDAS
2 - CRIAR UM ARQUIVO GERAL
3 - DEIXAR O MDF APENAS COM O DICIONARIO DE DADOS
4 - CRIAR 2 GRUPOS DE ARQUIVOS (PRIMARY - MDF)
*/

CREATE TABLE TB_EMPRESA(
	ID INT,
	NOME VARCHAR(50)
)
GO