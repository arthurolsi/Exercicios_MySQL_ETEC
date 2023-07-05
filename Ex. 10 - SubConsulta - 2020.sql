/* Atividade realizada em 2020 */

create database paisefilhos;
use paisefilhos;

 

 CREATE TABLE Pai 
(
    Cod_Pai int auto_increment not null Primary key,
    Nome_Pai  varchar(30)  not null,
    Idade_Pai  int      not null
);

 

CREATE TABLE Filho
(
    Cod_Filho int auto_increment not null Primary key,
    Cod_Pai int     not null References Pai(Cod_pai),
    Nome_Filho  varchar(30)  not null,
    Sexo_Filho  char(1)      not null Check(Sexo_Filho IN ("F", "M"))
);

 

insert into pai (Nome_Pai, Idade_Pai)
values('Daniel de Souza Leão Sobrinho', 62);

 

insert into pai (Nome_Pai, Idade_Pai)
values('João Carlos da Silva', 38);

 

insert into pai (Nome_Pai, Idade_Pai)
values('Fernando de Oliveira', 36);

 

insert into pai (Nome_Pai, Idade_Pai)
values('Jairo de Oliveira Leão', 32);

 

select * from pai;

 


insert into Filho (Cod_Pai, Nome_Filho, Sexo_Filho)
values(1, 'Renata de Oliveira Leão', 'F');

 

insert into Filho (Cod_Pai, Nome_Filho, Sexo_Filho)
values(1, 'Fernando de Oliveira Leão', 'M');

 

insert into Filho (Cod_Pai, Nome_Filho, Sexo_Filho)
values(1, 'Roberta de Oliveira Leão', 'F');

 

insert into Filho (Cod_Pai, Nome_Filho, Sexo_Filho)
values(1, 'Jairo de Oliveira Leão', 'M');

 

insert into Filho (Cod_Pai, Nome_Filho, Sexo_Filho)
values(2, 'Giovanna da Silva', 'F');

 

insert into Filho (Cod_Pai, Nome_Filho, Sexo_Filho)
values(3, 'Lucas Ribeiro Oliveira', 'M');

 

insert into Filho (Cod_Pai, Nome_Filho, Sexo_Filho)
values(3, 'Helder Ribeiro Oliveira', 'M');


/* 1 
O que são Subqueries?

A Sub-Query é uma instrução do tipo Select que está dentro de outra instrução SQL. São utilizadas
para fazer consultas entre duas tabelas de forma fácil, pois para obter os mesmos resultados com
outros comandos necessitaria um maior trabalho.
 

/* 2 
Faça todos os exemplos dos slides. */

/* Exemplo 1: Suponha que você precisasse obter da tabela Pai todos os dados do pai mais velho. */
SELECT * FROM Pai WHERE Idade_Pai = (Select Max(Idade_Pai) FROM Pai); 

SELECT * FROM Pai WHERE Idade_Pai IN (Select Max(Idade_Pai) FROM Pai);


/* Exemplo 2: Obtenha os dados do pais sem mostrar o pai mais velho.*/
SELECT * FROM Pai WHERE Idade_Pai <> (Select Max(Idade_Pai) FROM Pai);

SELECT * FROM Pai WHERE Idade_Pai  < (Select Max(Idade_Pai) FROM Pai);

SELECT * FROM Pai WHERE Idade_Pai  not in (Select Max(Idade_Pai) FROM Pai);


/* Exemplo 3: Suponha que você precisasse obter da tabela Pai todas as colunas, 
apenas dos pais que possuem um ou mais filhos registrados na tabela Filho. */
SELECT * FROM Pai WHERE Cod_Pai IN (SELECT Cod_Pai FROM Filho);

/* Exemplo 4: Suponha que você precisasse obter da tabela Pai todas as colunas, 
apenas dos pais que não possuem um ou mais filhos registrados na tabela Filho. */
SELECT * FROM Pai WHERE Cod_Pai NOT IN (SELECT Cod_Pai FROM Filho);


/* Exemplo 5: Obter todos os pais que possuem pelo menos um filho registrado na tabela filho. */
SELECT * FROM Pai Where EXISTS (SELECT Cod_Pai FROM Filho WHERE Filho.Cod_Pai = Pai.Cod_Pai); /*Subquery correlacionada*/

SELECT * FROM Pai Where cod_pai IN (SELECT Cod_Pai FROM Filho); /* Subquery não correlacionada*/


/* Exemplo 6: Para apresentar todos os dados da tabela Pai e a quantidade de filhos que cada 
pai possui, existem duas possibilidades: */
SELECT *, (SELECT count(Cod_Pai) FROM Filho WHERE Filho.Cod_Pai = Pai.Cod_Pai ) As Qtd_Filho FROM Pai; /*Subquery correlacionada*/

SELECT Pai.Cod_Pai, Pai.Nome_Pai, Count(Filho.Cod_Pai) AS Qtd_Filho FROM Pai LEFT JOIN Filho  ON (Pai.Cod_Pai = Filho.Cod_Pai ) Group By Pai.Cod_Pai, Pai.Nome_Pai; /*Left Join com Group By e a função Count() */



/* 3.Dê o código para:
Exibir todos os dados do pai mais novo. */
Select * from Pai where idade_pai in(Select min(idade_pai) from Pai);

/* Exibir todos os dados dos pais que possuem filhas.  */
Select * from Pai where Cod_Pai in(Select Cod_Pai from Filho where Sexo_Filho = "F");

/* Exibir todos os dados dos pais que possuem a idade abaixo da idade média de todos os pais. */
Select * from Pai where Idade_Pai < (Select avg(Idade_Pai) from Pai);

/* Arthur Oliveira Silva 2Ano MTEC DS Guarulhos */