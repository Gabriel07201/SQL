create database exercicio;

use exercicio;

create table funcionarios
  (
      idFuncionario integer,
      nome varchar(100),
      email varchar(200),
      sexo varchar(10),
      departamento varchar(100),
      admissao varchar(10),
      salario integer,
      cargo varchar(100),
      idRegiao int
  );

SELECT COUNT(*), departamento FROM funcionarios GROUP BY departamento ORDER BY 1;  
SELECT * FROM funcionarios WHERE departamento = 'Filmes' OR departamento = 'Roupas';

SELECT COUNT(*), sexo FROM funcionarios GROUP BY sexo;
SELECT nome, email, sexo, departamento FROM funcionarios WHERE ( sexo = 'Feminino' AND departamento = 'Filmes' ) OR ( departamento = 'Lar' and sexo = 'Feminino' );

SELECT COUNT(*), sexo FROM funcionarios GROUP BY sexo;
SELECT nome from funcionarios WHERE sexo = 'Masculino' or departamento LIKE 'Jardim';