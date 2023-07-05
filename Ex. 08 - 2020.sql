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

 

select * from filho;

SELECT * FROM Pai WHERE Idade_Pai = (Select Max(Idade_Pai) FROM Pai); /* Mostra o Pai mais velho */

SELECT * FROM Pai WHERE EXISTS (SELECT Cod_Pai FROM Filho WHERE Filho.Cod_Pai = Pai.Cod_Pai); /* Pulei algumas, achar depois */

SELECT * ,(SELECT count(Cod_Pai) FROM Filho WHERE Filho.Cod_Pai = Pai.Cod_Pai ) As Qtd_Filho FROM Pai;

SELECT Pai.Cod_Pai, Pai.Nome_Pai, Count(Filho.Cod_Pai) AS Qtd_Filho FROM Pai LEFT JOIN Filho  ON (Pai.Cod_Pai = Filho.Cod_Pai ) Group By Pai.Cod_Pai, Pai.Nome_Pai;

