/* Atividade realizada em 2020 */

create database Juncao;
use Juncao;

CREATE TABLE Profissao ( 
Cod_Profissao INT NOT NULL AUTO_INCREMENT, 
Nome_Profissao VARCHAR (60) NOT NULL, 
PRIMARY KEY (Cod_Profissao) ); 

CREATE TABLE Cliente (
Cod_Cliente INT NOT NULL AUTO_INCREMENT,
Nome_Cliente VARCHAR (60) NOT NULL,
Data_Nascimento DATE,
Telefone CHAR (9),
Cod_Profissao INT,
PRIMARY KEY (Cod_Cliente) ,
FOREIGN KEY (Cod_Profissao)
REFERENCES Profissao(Cod_Profissao));

CREATE TABLE Pedido (
Num_Pedido INT NOT NULL AUTO_INCREMENT,
Cod_Cliente int,
Total_Pedido decimal (10,2),
PRIMARY KEY (Num_Pedido) ,
FOREIGN KEY (Cod_Cliente)
REFERENCES Cliente(Cod_Cliente));

INSERT INTO Profissao (Nome_Profissao) VALUES ('Programador');
INSERT INTO Profissao (Nome_Profissao) VALUES ('Analista de BD');
INSERT INTO Profissao (Nome_Profissao) VALUES ('Suporte');
INSERT INTO Profissao (Nome_Profissao) VALUES ('Estagiario');

INSERT INTO Cliente (Nome_Cliente, Data_Nascimento, Telefone, Cod_Profissao)  VALUES ('João Pereira','1980-09-20','3456-7890',1);
INSERT INTO Cliente (Nome_Cliente, Data_Nascimento, Telefone, Cod_Profissao)  VALUES ('Maria Barros','1972-01-22','3456-7891',2);
INSERT INTO Cliente (Nome_Cliente, Data_Nascimento, Telefone, Cod_Profissao) VALUES ('José Mendes','1983-04-29','3456-7892',3);
INSERT INTO Cliente (Nome_Cliente, Data_Nascimento, Telefone) VALUES ('Rogerio Cavalcante','1990-01-12','3456-7894');
 
INSERT INTO Pedido (Num_Pedido, Cod_Cliente, Total_Pedido) VALUES (203, 1, 800);
INSERT INTO Pedido (Num_Pedido, Cod_Cliente, Total_Pedido) VALUES (204,2, 900);
INSERT INTO Pedido (Num_Pedido, Cod_Cliente, Total_Pedido) VALUES (205, 3, 1200);


/* 1 - O que são Junções 

É uma cláusula que é usada para combinar dados que vieram de duas ou mais
tabelas relacionadas de um banco de dados. Ela basicamente cria uma pseudo 
tabela com os dados das outras tabelas, além disso, as junções são semelhantes
aos conjuntos numéricos da matemática. */

/* 2 - Dê a sintaxe de uma junção simples entre 2 tabelas.

SELECT Tabela.Campo, SegundaTabela.SegeundoCampo FROM Tabela INNER JOIN SegundaTabela ON Campo = SegundoCampo; */


/* Dê o código Join para: 
1 - Exibir nome do cliente e nome da profissao */
Select Cliente.Nome_Cliente, Profissao.Nome_Profissao from Cliente Inner Join Profissao on Profissao.Cod_Profissao = Cliente.Cod_Profissao; 


/* 2 - Exibir o numero do pedido e o nome do cliente */
Select Pedido.num_Pedido, Cliente.Nome_Cliente from Pedido Inner Join Cliente on Pedido.cod_Cliente = Cliente.Cod_Cliente; 


/* 3 - Exibir o numero do pedido, nome do cliente e o nome da profissão */
Select Pedido.num_Pedido, Cliente.Nome_Cliente, Profissao.Nome_Profissao from Pedido Inner Join Cliente on Pedido.cod_Cliente = Cliente.cod_Cliente Inner Join Profissao on Profissao.cod_Profissao = Cliente.Cod_Profissao; 


/* 4 - Exibir o numero do pedido e o nome da profissao */
Select Pedido.num_Pedido, Profissao.Nome_Profissao from Pedido Inner Join Cliente Inner Join Profissao on Cliente.Cod_Profissao = Profissao.Cod_Profissao; 


/* 5 - Cadastre mais 2 Clientes que sejam Programadores */

INSERT INTO Cliente (Nome_Cliente, Data_Nascimento, Telefone, Cod_Profissao)  VALUES ('Renato Araujo','1970-08-19','3625-8596',1);
INSERT INTO Cliente (Nome_Cliente, Data_Nascimento, Telefone, Cod_Profissao)  VALUES ('Marta Araujo','1971-02-18','7425-8523',1);


/* 6 - Cadastre mais 2 pedidos para esses clientes */

INSERT INTO Pedido (Num_Pedido, Cod_Cliente, Total_Pedido) VALUES (206, 5, 10000);
INSERT INTO Pedido (Num_Pedido, Cod_Cliente, Total_Pedido) VALUES (207,6, 20000);


/* 7 - Exibir total de pedidos de programadores (Exibindo o Total e o nome da Profissão) */
Select profissao.Nome_Profissao,pedido.Total_pedido from pedido Inner Join profissao Inner Join cliente on pedido.cod_cliente = cliente.cod_Cliente and cliente.Cod_profissao = profissao.cod_profissao and Profissao.cod_Profissao = "1";

/* Arthur Oliveira Silva 2Ano MTEC DS Guarulhos */