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
select * from tbCategoriaProduto;


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
select * from tbProduto;


# Cadastrar 05 Clientes ----->
insert into tbCliente(nomeCliente, dataNascimentoCliente, ruaCliente, numCasaCliente, complemento, cepCliente, bairroCliente, cidadeCliente, estadoCliente, cpfCliente, sexoCliente)
values
('Maria dos Santos Ferreira', '1981-06-15', 'Rua das Flores', 123, '1º andar', '07852-560', 'Centro', 'São Paulo', 'SP', '123.456.789-20', 'F'),
('João Fernando Alves', '1983-02-12', 'Avenida Celeste', 325, 'Casa 2', '02545-963', 'JD Palmira', 'São Paulo', 'SP', '968.856.652-96', 'M'),
('Mario Gomes Santos', '1973-03-11', 'Avenida Aurora', 785, 'Casa 3', '02125-452', 'Boa Esperança', 'Rio de Janeiro', 'RJ', '756.541.622-97', 'M'),
('Mariana Cassio Almeida', '2000-04-02', 'Rua Camargo', 12, 'Apto 3', '12445-923', 'Bom Sucesso', 'Recife', 'PE', '448.116.362-16', 'F'),
('Lurdes de Souza', '1980-04-06', 'Rua das Rosas', 25, 'Casa 3', '02258-456', 'Pimentões', 'Cuibá', 'MT', '116.226.156-78', 'F');
select * from tbCliente;


# Inserir 05 Encomendas ----->
insert into tbEncomenda (dataEncomenda, codCliente, valorTotalEncomenda, dataEntregaEncomenda)
values
('2020-07-20', 1, 204, '2020-07-26'),
('2020-07-30', 2, 585, '2020-08-04'),
('2020-08-03', 3, 180, '2020-08-08'),
('2020-08-10', 4, 500, '2020-08-16'),
('2020-08-13', 5, 301, '2020-08-19');
select * from tbEncomenda;


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
select * from ItensEncomenda;

/* Arthur Oliveira Silva 2Ano Mtec DS Guarulhos - Atividade para 17/07/2020 -----------------------------------------------------*/

/* 1 -- Criar uma função que dado o CPF do cliente, seja exibido suas informações: Nome, endereço e número da casa. */

Create function fn_BuscaPorCPF(CPF char(14))
RETURNS text 
deterministic
Return
(Select concat("Nome: ", nomeCliente, " -- Endereço: ", ruaCliente, " -- Número: ", numCasaCliente, " -- Bairro: ", bairroCliente, " -- CEP: ", cepCliente, " -- Cidade: ", cidadeCliente, " -- Estado: ", estadoCliente)
from tbCliente where CPF = cpfCliente);

Select fn_BuscaPorCPF("123.456.789-20") as "Dados do cliente referênte ao CPF informado";


/* 2 -- Criar uma função que dado o código do probuto, seja exibido os dados: nome do produto e preço. */

Create function fn_BuscaPorCod(COD_P int)
RETURNS text 
deterministic
Return
(Select concat("Nome do produto: ", nomeProduto, " -- Preço do produto: ", precoKiloProduto, " reais.") from tbProduto where COD_P = codProduto);

Select fn_BuscaPorCod(1) as "Dados do produto referêntes ao código informado";


/* 3 -- Criar uma função que retorne o dia da semana da venda (no formato segunda, terça, etc) ao lado
do código da venda, valor total da venda e sua data. */

CREATE FUNCTION fn_informacoesVenda( X date)
RETURNS longtext
deterministic
return(
select group_concat("Codigo: ", codEncomenda, " || Valor Total: ", valorTotalEncomenda, " || Data: ", dataEncomenda, 
case (dayofweek(X))
when  "0" then " || Dia: Segunda-Feira"
when  "1" then " || Dia: Terça-Feira"
when  "2" then " || Dia: Quarta-feira"
when  "3" then " || Dia: Quinta feira"
when  "4" then " || Dia: Sexta-feira"
when  "5" then " || Dia: Sábado"
else "Domingo"
end
) from tbEncomenda where X = dataEncomenda );

select fn_informacoesVenda("2020-08-03") as "Informações das vendas usando DATE"; 

/* Arthur Oliveira Silva 2Ano Mtec DS Guarulhos */