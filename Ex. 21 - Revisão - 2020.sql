/* Atividade realizada em 2020 */

create database bdEncomendas;
use bdEncomendas;


create table tbCategoriaProduto(
codCategoriaProduto int primary key auto_increment,
nomeCategoriaProduto varchar(30) not null
);


Create table tbproduto(
codProduto int primary key auto_increment,
nomeProduto varchar(30) not null,
precoKiloProduto decimal (10,2),
codCategoriaProduto int,
foreign key (codCategoriaProduto) references tbCategoriaProduto(codCategoriaProduto)
);


create table tbCliente(
codCliente int primary key auto_increment,
nomeCliente varchar(30) not null,
dataNascimentoCliente date,
ruaCliente varchar(40),
numCasaCliente smallint,
complemento varchar(20),
cepCliente char(9),
bairroCliente varchar(40),
cidadeCliente varchar(40),
estadoCliente char(2),
cpfCliente char(14) not null,
sexoCliente char(1)
);


create table tbEncomenda(
codEncomenda int primary key auto_increment,
dataEncomenda date not null,
codCliente int not null,
valorTotalEncomenda decimal (10,2) not null,
dataEntregaEncomenda date,
foreign key(codCliente) references tbCliente(codCliente)
);


create table ItensEncomenda(
codItensEncomenda int primary key auto_increment,
codEncomenda int not null,
codProduto int not null,
quantidade int not null,
subTotal decimal (10,2) not null,
foreign key(codEncomenda) references tbEncomenda(codEncomenda),
foreign key(codProduto) references tbProduto(codProduto)
);


# Cadastrar 04 Categorias ----->
insert into tbCategoriaProduto(nomeCategoriaProduto)
values 
('Bolo Festa'),
('Bolo Simples'),
('Torta'),
('Salgado');



# Cadastrar 12 Produtos ----->
insert into tbProduto(nomeProduto, precoKiloProduto, codCategoriaProduto)
values
('Bolo Floresta Negra', 42, 1),
('Bolo de Chocolate trufado', 50, 1),
('Bolo de Morango decorado', 30, 1),

('Bolo de Chocolate', 17, 2),
('Bolo de Cenoura', 45, 2),
('Bolo de Fubá', 25, 2),

('Torta de Palmito', 45, 3),
('Torta de Frango', 45, 3),
('Torta de Maça', 25 ,3),

('Coxinha de Frango', 25, 4),
('Kibe', 45, 4),
('Bolinho de Queijo', 25, 4);



# Cadastrar 05 Clientes ----->
insert into tbCliente(nomeCliente, dataNascimentoCliente, ruaCliente, numCasaCliente, complemento, cepCliente, bairroCliente, cidadeCliente, estadoCliente, cpfCliente, sexoCliente)
values
('Maria dos Santos Ferreira', '1981-06-15', 'Rua das Flores', 123, '1º andar', '07852-560', 'Centro', 'São Paulo', 'SP', '123.456.789-20', 'F'),
('João Fernando Alves', '1983-02-12', 'Avenida Celeste', 325, 'Casa 2', '02545-963', 'JD Palmira', 'São Paulo', 'SP', '968.856.652-96', 'M'),
('Mario Gomes Santos', '1973-03-11', 'Avenida Aurora', 785, 'Casa 3', '02125-452', 'Boa Esperança', 'Rio de Janeiro', 'RJ', '756.541.622-97', 'M'),
('Mariana Cassio Almeida', '2000-04-02', 'Rua Camargo', 12, 'Apto 3', '12445-923', 'Bom Sucesso', 'Recife', 'PE', '448.116.362-16', 'F'),
('Lurdes de Souza', '1980-04-06', 'Rua das Rosas', 25, 'Casa 3', '02258-456', 'Pimentões', 'Cuibá', 'MT', '116.226.156-78', 'F');



# Inserir 05 Encomendas ----->
insert into tbEncomenda (dataEncomenda, codCliente, valorTotalEncomenda, dataEntregaEncomenda)
values
('2020-07-20', 1, 204, '2020-07-26'),
('2020-07-30', 2, 585, '2020-08-04'),
('2020-08-03', 3, 180, '2020-08-08'),
('2020-08-10', 4, 500, '2020-08-16'),
('2020-08-13', 5, 301, '2020-08-19');



# Cadastrar 10 ItensEncomenda ----->
insert into ItensEncomenda(codEncomenda, codProduto, quantidade, subTotal)
values 
# Dois itens para cada encomenda
(1, 1, 2, 84),
(1, 3, 4, 120),

(2, 5, 6, 270),
(2, 7, 8, 315),

(3, 2, 3, 150),
(3, 3, 1, 30),

(4, 3, 10, 300),
(4, 6, 8, 200),

(5, 4, 3, 51),
(5, 10, 5, 250);



/* Atividade para 11-08-2020 -- Criar 2 exemplos de utilização de função de agregação com o banco de dados Bdencomendas */


# Exemplos com MAX -------------------

#Mostra a encomenda mais cara
Select max(valorTotalEncomenda) as "Encomenda mais cara" from tbEncomenda; 


 /* Mostra o nome e o preço do produto com o kg mais caro  */
Select nomeProduto as "Nome do produto",
 precoKiloProduto as "Preço do Kg" from tbproduto 
 where precoKiloProduto = (Select max(precoKiloProduto) from tbProduto); 


# Exemplos com MIN -------------------


#Mostra a quantidade de itens disponiveis, maior e menor preço por kilo
Select count(codProduto) as "Quantidades de Itens disponíveis", max(precoKiloProduto) 
as "Maior preço por Kilo", min(precoKiloProduto) 
as "Menor preço por Kilo" from tbproduto; 


/* Mostra a quantidade de pedidos e o menor preço entre elas */
Select count(codEncomenda) as "Némero de pedidos", min(valorTotalEncomenda) as "Menor preço entre encomendas registradas" from tbencomenda; 


# Exemplos com SUM -------------------

/* Mostra a quantidade de produtos e a soma do valor de 1kg de cada item */
Select count(nomeProduto) as "Quantidade de produtos disponiveis", SUM(precoKiloProduto) as "Soma do valor de 1kg de cada item" from tbProduto; 


/* Mostra o número de pedidos e o total em encomendas registradas */
Select count(codEncomenda) as "Némero de pedidos", SUM(valorTotalEncomenda) as "Total em R$ de encomendas" from tbEncomenda; 


# Exemplos com AVG -------------------


/* Mostra a média de preço do kilo dos bolos */
Select avg(precoKiloProduto) as "Média de preço por kilo" from tbproduto; 


#Mostra os que estão abaixo da média (34 reais) em ordem crescente
Create view vw_PrecoBaixo as
Select * from tbproduto
where precoKiloProduto <(Select avg(precoKiloProduto) from tbproduto);

Select * from vw_PrecoBaixo order by precoKiloProduto; 


# Exemplos com COUNT -------------------


# Exibe a quantidade de clientes cadastrados
Select count(codCliente) as "Quantidade de clientes cadastrados" from tbCliente; 


/* Mostra o número de encomendas e faz uma soma com os kg */
Select count(codItensEncomenda) as "Número de encomendas", SUM(quantidade) as "Quantidade em KG dessas encomendas" from itensencomenda; 



/* Arthur Oliveira Silva 2 Ano MtecDS Guarulhos */