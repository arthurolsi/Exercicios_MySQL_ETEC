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
('Maria dos Santos Fêrreira', '1981-06-15', 'Rua das Flores', 123, '1º andar', '07852-560', 'Centro', 'São Paulo', 'SP', '123.456.789-20', 'F'),
('João Fernando Alves', '1983-02-12', 'Avenida Celeste', 325, 'Casa 2', '02545-963', 'JD Palmira', 'São Paulo', 'SP', '968.856.652-96', 'M'),
('Mário Gomes Santos', '1973-03-11', 'Avenida Aurora', 785, 'Casa 3', '02125-452', 'Boa Esperança', 'Rio de Janeiro', 'RJ', '756.541.622-97', 'M'),
('Mariana Cassio Álmeida', '2000-04-02', 'Rua Camargo', 12, 'Apto 3', '12445-923', 'Bom Sucesso', 'Recife', 'PE', '448.116.362-16', 'F'),
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

/*-------------------------------------------------Atividade para 21/07/2020 Função Remove Acentos ------------------------------------------*/

# Script da Function Remove Acentos:

/* "Ä Å Á Â À Ã ä á â à ã É Ê Ë È é ê ë è Í Î Ï Ì í î ï ì Ö Ó Ô Ò Õ ö ó ô ò õ Ü Ú Û ü ú û ù Ç ç ";
           "AAAAAAaaaaaEEEEeeeeIIIIiiiiOOOOOoooooUUUuuuuCc"; */

Delimiter $$
Create function SuperRemovedorAcento(texto varchar(50))
returns varchar(50)
deterministic
begin
set
texto = replace (texto, "Ä", "A"),
texto = replace (texto, "ä", "a"),

texto = replace (texto, "Å", "A"),

texto = replace (texto, "Á", "A"),
texto = replace (texto, "á", "a"),

texto = replace (texto, "Â", "A"),
texto = replace (texto, "â", "a"),

texto = replace (texto, "À", "A"),
texto = replace (texto, "à", "a"),

texto = replace (texto, "Ã", "A"),
texto = replace (texto, "ã", "a"),

texto = replace (texto, "É", "E"),
texto = replace (texto, "é", "e"),

texto = replace (texto, "Ê", "E"),
texto = replace (texto, "ê", "e"),

texto = replace (texto, "Ë", "E"),
texto = replace (texto, "ë", "e"),

texto = replace (texto, "È", "E"),
texto = replace (texto, "è", "e"),

texto = replace (texto, "Í", "I"),
texto = replace (texto, "í", "i"),

texto = replace (texto, "Î", "I"),
texto = replace (texto, "î", "i"),

texto = replace (texto, "Ï", "I"),
texto = replace (texto, "ï", "i"),

texto = replace (texto, "Ì", "I"),
texto = replace (texto, "ì", "i"),

texto = replace (texto, "Ö", "O"),
texto = replace (texto, "ö", "o"),

texto = replace (texto, "Ó", "O"),
texto = replace (texto, "ó", "o"),

texto = replace (texto, "Ô", "O"),
texto = replace (texto, "ô", "o"),

texto = replace (texto, "Ò", "O"),
texto = replace (texto, "ò", "o"),

texto = replace (texto, "Õ", "O"),
texto = replace (texto, "ô", "o"),

texto = replace (texto, "Ü", "U"),
texto = replace (texto, "ü", "u"),

texto = replace (texto, "Ú", "U"),
texto = replace (texto, "ú", "u"),

texto = replace (texto, "Û", "U"),
texto = replace (texto, "û", "u"),

texto = replace (texto, "Ç", "C"),
texto = replace (texto, "ç", "c");

return texto;
end;
$$


Select codCliente, SuperRemovedorAcento(nomeCliente) as "Sem acentuação" from tbCliente;
$$ 

# Arthur Oliveira Silva 2Ano Mtec DS Guarulhos