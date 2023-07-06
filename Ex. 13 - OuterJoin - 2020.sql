/* Atividade realizada em 2020 */

create database JuncaoExterna;
use JuncaoExterna;

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


/* 1 - O que são junções externas?

A junção externa é basicamente uma junção que não precisa que os registros de uma tabela
sejam equivalentes na outra. Ela exibe os resultados em uma pseudo tabela, apresentando 
subdivisões, podendo escolher entre a tabela da esquerda direita ou ambas.


2 - Explique com suas palavras o que faz a junção do tipo Left Outer Join.

Ela basicamente pega todos os dados da primeira tabela escrita (a da esquerda) e os agrupa
em uma pseudo tabela mesmo que não existam dados correspondentes na tabela da direita, nesse 
caso, o campo será mostrado como null.


3 - Explique com suas palavras o que faz a junção do tipo Right Outer Join.

Sua função é quase a mesma que a Left outer join, a diferença é que ao inves dele agrupar 
todos os dados da tabela da esquerda com a direita, ele agrupa os da direita com os dados da 
esquerda, mesmo aqueles que não têm relação, nesse caso os campos também serão mostrados como null.


4 - Forneça o script da aula usando Left e  Right outer Join.

1 - Cliente e Profissão (Left) */

Select * from cliente Left Outer Join profissao on Cliente.cod_profissao = Profissao.cod_profissao;


/* 2 - Cliente e Profissão (Right) */

Select * from cliente Right Outer Join profissao on Profissao.cod_profissao = Cliente.cod_profissao;


/* 3 - Cliente e Pedido (Left) */

Select * from cliente Left Outer Join pedido on Cliente.cod_cliente = Pedido.cod_cliente;


/* 4 - Cliente e Pedido (Right) */

Select * from pedido Right Outer Join cliente on Pedido.cod_cliente = Cliente.cod_cliente; 

/* Arthur Oliveira Silva 2Ano MTEC DS Guarulhos */