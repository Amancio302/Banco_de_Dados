USE Empresa;

#Exercício 1

SELECT Funcionario.endereco, Funcionario.salario FROM Funcionario WHERE Funcionario.nomeFunc = "Luciana S. Santos";

#Exercício 2

SELECT Funcionario.nomeFunc, Funcionario.salario FROM Funcionario 
WHERE YEAR(Funcionario.dataNasc) >= 1960 and YEAR(Funcionario.dataNasc) <= 1969
and Funcionario.sexo = "F" and Funcionario.salario < 1000;

#Exercício 3

SELECT Dependente.nomeDep FROM Dependente
INNER JOIN Funcionario ON Dependente.idFunc = Funcionario.idFunc
WHERE Funcionario.nomeFunc = "João B. Silva";

#Exercício 4

SELECT Projeto.nomeProj FROM Projeto
INNER JOIN Trabalha ON Trabalha.idProj = Projeto.idProj
INNER JOIN Funcionario ON Funcionario.idFunc = Trabalha.idFunc
WHERE Funcionario.nomeFunc = "Frank T. Santos";

#Exercício 5

SELECT Funcionario.nomeFunc FROM Funcionario
INNER JOIN Departamento ON Departamento.idDepto = Funcionario.idDepto
WHERE Departamento.nomeDepto = "Construção";

#Exercício 6

SELECT Func.nomeFunc FROM Funcionario AS Func
JOIN Funcionario AS Superv ON Func.idSuperv = Superv.idFunc
WHERE Superv.nomeFunc = "Frank T. Santos";

#Exercício 7

SELECT DISTINCT Funcionario.nomeFunc, Funcionario.endereco FROM Funcionario
LEFT JOIN Dependente ON Dependente.idFunc = Funcionario.idFunc
WHERE Dependente.idDep IS NULL;

#Exercício 8

SELECT Funcionario.nomeFunc FROM Funcionario
NATURAL JOIN Departamento
WHERE Departamento.nomeDepto = "Pesquisa"
UNION
SELECT DISTINCT Funcionario.nomeFunc FROM Funcionario
INNER JOIN Trabalha ON Trabalha.idFunc = Funcionario.idFunc
INNER JOIN Projeto ON Projeto.idProj = Trabalha.idProj
INNER JOIN Departamento ON Departamento.idDepto = Projeto.idDepto
WHERE Departamento.nomeDepto = "Pesquisa";

#Exercício 9

SELECT DISTINCT Func.nomeFunc FROM Funcionario AS Func
INNER JOIN Trabalha ON Trabalha.idFunc = Func.idFunc
INNER JOIN Projeto ON Projeto.idProj = Trabalha.idProj
INNER JOIN Departamento ON Departamento.idDepto = Projeto.idDepto
INNER JOIN Funcionario AS Superv ON Superv.idFunc = Departamento.idGerente
WHERE Superv.nomeFunc = "Júnia B. Mendes";

#Exercício 10

#SELECT DISTINCT Func.nomeFunc FROM Funcionario AS Func
#INNER JOIN Trabalha ON Trabalha.idFunc = Func.idFunc
#WHERE EXISTS(ALL(SELECT idProj FROM Projeto
#INNER JOIN Departamento ON Departamento.idDepto = Projeto.idDepto
#INNER JOIN Funcionario AS Superv ON Superv.idFunc = Departamento.idGerente
#WHERE Superv.nomeFunc = "Júnia B. Mendes"));

#Exercício 11

SELECT Funcionario.nomeFunc, Dependente.nomeDep FROM Funcionario
LEFT JOIN Dependente ON Dependente.idFunc = Funcionario.idFunc;

#Exercício 12

SELECT COUNT(Funcionario.idFunc) AS Quantidade FROM Funcionario
NATURAL JOIN Departamento
NATURAL JOIN Projeto
WHERE Projeto.nomeProj = "ProdZ";

#Exercício 13

SELECT Funcionario.nomeFunc, COUNT(Trabalha.numHoras) FROM Funcionario
NATURAL JOIN Trabalha
WHERE Trabalha.numHoras > 10
GROUP BY Funcionario.idFunc;

#Exercício 14

SELECT Funcionario.nomeFunc, COUNT(Trabalha.idProj) FROM Funcionario
NATURAL JOIN Trabalha
GROUP BY Funcionario.idFunc
HAVING COUNT(Trabalha.idProj) > 1;

#Exercício 15

SELECT Departamento.nomeDepto, SUM(Funcionario.salario) AS Soma_Salarios FROM Funcionario
NATURAL JOIN Departamento
WHERE Departamento.idDepto IN (	SELECT Projeto.idDepto FROM Projeto
				GROUP BY Projeto.idDepto
				HAVING COUNT(Projeto.idProj) > 1)
GROUP BY Departamento.nomeDepto;
