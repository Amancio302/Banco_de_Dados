# SELECT Funcionario.endereco, Funcionario.salario FROM Funcionario WHERE Funcionario.nomeFunc = "Luciana S. Santos"

# SELECT Funcionario.nomeFunc, Funcionario.salario FROM Funcionario 
# WHERE YEAR(Funcionario.dataNasc) >= 1960 and YEAR(Funcionario.dataNasc) <= 1969
# and Funcionario.sexo = "F" and Funcionario.salario < 1000

# SELECT Dependente.nomeDep FROM Dependente INNER JOIN Funcionario ON Dependente.idFunc = Funcionario.idFunc
# WHERE Funcionario.nomeFunc = "João B. Silva"

# SELECT Projeto.nomeProj FROM Projeto INNER JOIN Trabalha ON Trabalha.idProj = Projeto.idProj
# 									   INNER JOIN Funcionario ON Funcionario.idFunc = Trabalha.idFunc
# WHERE Funcionario.nomeFunc = "Frank T. Santos"

# SELECT Funcionario.nomeFunc FROM Funcionario INNER JOIN Departamento ON Departamento.idDepto = Funcionario.idDepto
# WHERE Departamento.nomeDepto = "Construção"

