/* Atividade realizada em 2020 */

create database bdEncomendas2;
use bdEncomendas2;


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
('Lurdes de Souza', '1980-04-06', 'Rua das Rosas', 25, 'Casa 3', '02258-456', 'Pimentões', 'Cuibá', 'MT', '116.226.156-78', 'F'),
('Samara Vieira', '1987-04-08', 'Rua Florinda', 27, 'Casa 6', '01124-456', 'Pimentões', 'Cuibá', 'MT', '116.123.156-77', 'F');


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


/* ------------------------------ TRABALHO PROCEDURE (inicio 23/09/2020) -----------------------------------------------*/


/* A) Criar uma Stored Procedure para inserir as categorias de produto, mas não aceite categorias duplicadas. Informar que já existe */

Delimiter $$

Create procedure SP_InsereCategoria(NomeCategoria varchar (30))
BEGIN
	if exists (Select nomeCategoriaProduto from tbCategoriaProduto where nomeCategoriaProduto = NomeCategoria)
    then Select 'Essa categoria ja foi cadastrada' as "Aviso";
    
    else 
    Insert into tbCategoriaProduto (nomeCategoriaProduto) values (NomeCategoria);
    Select Concat("Categoria: ", NomeCategoria, ' Cadastrada com sucesso!') as "Aviso";
    
    end if;


END $$
Delimiter ;

Call SP_InsereCategoria("Doces Especiais");
Select * from tbCategoriaProduto;

/* B) Criar uma Stored Procedure para inserir os produtos abaixo, sendo que, a procedure deverá 
antes de inserir verificar se o nome do produto já existe, evitando assim que um produto seja duplicado: */


Delimiter $$

Create procedure SP_InsereProduto(Nome varchar (30), Preco decimal(10,2), Codigo int)
BEGIN
	if exists (Select nomeProduto from tbProduto where nomeProduto = Nome)
    then Select 'Esse produto já foi cadastrado' as "Aviso";
    
    else 
    Insert into tbProduto (nomeProduto, precoKiloProduto, codCategoriaProduto) values (Nome, Preco, Codigo);
    Select Concat("Produto: ", Nome, ' Cadastrado com sucesso!') as "Aviso";
    
    end if;

END $$
Delimiter ;

Call SP_InsereProduto("Bolo de nutella", 45, 5);
Select * from tbProduto;



/* C) Criar uma stored procedure para alterar o preço do produto.  */

Delimiter $$

Create procedure SP_MudaPreco(Nome varchar(30), Preco decimal(10,2))
BEGIN
	if exists(Select nomeProduto from tbProduto where nomeProduto = Nome)
	then update tbproduto set precokiloproduto = Preco where nomeproduto = Nome; 
    Select Concat("Valor do produto: ", Nome, ' Alterado com sucesso!') as "Aviso";
    
    else 
    Select Concat("Produto: ", Nome, ' não existe!') as "Aviso";
    
    end if;

END $$
Delimiter ; 


Call SP_MudaPreco("Bolo de nutella", 30); 


/* D) Criar uma stored procedure para cadastrar os clientes .

Verificar pelo CPF se o cliente já existe. 

Caso já exista emitir a mensagem: “Cliente cpf XXXXX já cadastrado” */

Delimiter $$

create procedure SP_CadastraCliente(Nome varchar(30), Nascimento date, Rua varchar(40), NumCasa smallint, Complemento varchar(20), CEP char(9), Bairro varchar(40), Cidade varchar(40), EstadoUF char(2), CPF char(14), Sexo char(1))
BEGIN
	if exists (Select cpfCliente from tbCliente where cpfCliente = CPF)
    then select Concat( "Cliente com o CPF ", CPF, " já cadastrado") as "Aviso"; 
    
    else
    Insert into tbCliente (nomeCliente, dataNascimentoCliente, ruaCliente, numCasaCliente, complemento, cepCliente, bairroCliente, cidadeCliente, estadoCliente, cpfCliente, sexoCliente)
    VALUES (Nome, Nascimento, Rua, NumCasa, Complemento, CEP, Bairro, Cidade, EstadoUF, CPF, Sexo);
    
    Select Concat(Nome, " cadastrado(a) com sucesso!") as "Aviso";
    end if;
END $$
Delimiter ;

Call SP_CadastraCliente ("James Stark", "1984-08-15", "Avenida Valli", 057, "Portão azul", "26636-885", "Jd BairroD", "Guarulhos", "SP", "258.368.449-21", "M");
# Esse cliente será excluido posteriormente na procedure de excluir
Select * from tbCliente;



/* E) Criar via stored procedure, fazendo as verificações abaixo:

No momento da encomenda o cliente irá fornecer o seu codigo. Caso ele não tenha sido cadastrado enviar a mensagem 
“não foi possível efetivar a encomenda pois o cliente xxxx não está cadastrado”

Verificar se a data da encomenda não é menor do que a data atual. Caso seja enviar a mensagem “não é possível efetuar 
uma encomenda numa data anterior à data atual”

Caso tudo esteja correto, efetuar a encomenda e emitir a mensagem: “Encomenda XXX para  o cliente YYY efetuada com sucesso” 
sendo que no lugar de XXX deverá aparecer o número da encomenda e no YYY deverá aparecer o nome do cliente; */

Delimiter $$

create procedure SP_CriarEncomenda(DataDAEncomenda date, CodigoCliente int, ValorTotal decimal (10,2), DataEntrega date)

BEGIN
	
		if not exists(Select codCliente from tbcliente where codCliente = CodigoCliente)
        then Select concat('Cliente não encontrado. Código ', CodigoCliente , ' não está cadastrado!') AS Aviso;
        
        else if (DataDAEncomenda < curdate())
        then Select "não é possível efetuar uma encomenda numa data anterior à data atual" as "Aviso";
        
		else 
			Insert into tbEncomenda (dataEncomenda, codCliente, valorTotalEncomenda, dataEntregaEncomenda)
			VALUES (DataDAEncomenda, CodigoCliente, ValorTotal, DataEntrega);
            Set @codEncomenda := (Select last_insert_id());
            Set @nomeCliente := (Select nomeCliente from tbcliente where codCliente = CodigoCliente);
			Select concat('Encomenda: ', @codEncomenda, ' para o cliente: ' , @nomeCliente, ' cadastrada com sucesso!') as "Aviso";	
				
		end if;
		end if;
END $$
Delimiter ;

Call SP_CriarEncomenda('2020-10-22', "6", "650.50", "2020-10-28");
Select * from tbEncomenda;



/* F) Criar uma Stored procedure, para que sejam inseridos os itens da encomenda conforme tabela a seguir.  

Lembrando que não podemos adicionar caso o CodEncomenda não exista. E também caso o produto não conste no banco de dados */

Delimiter $$

Create procedure Sp_InsereItens(codigoEncomenda int, codigoProduto int, quant decimal(10,2), sub_total decimal(10,2))
 BEGIN

	 if not exists (select codEncomenda from tbEncomenda where codEncomenda = codigoEncomenda) then

	 SELECT concat('Esse código de encomenda não existe! ', codigoEncomenda) as mensagem;
	 else if not exists (select codProduto from tbproduto where codProduto = codigoProduto) then
	 SELECT concat('Esse código de produto não existe! ', codigoProduto) as mensagem;

	 else
	 insert into itensEncomenda(codEncomenda, codProduto, quantidade, subTotal)
	 VALUES(codigoEncomenda, codigoProduto, quant, sub_Total);
	 SELECT concat('Item ', codigoProduto, ' cadastrado na encomenda ', codigoEncomenda , ' com sucesso!') as mensagem;

	 END IF;
	 end if;
 
END $$
Delimiter ;

Call SP_InsereItens(6, 13, 5, "225.0");
Select * from ItensEncomenda;


/* G) Criar uma procedure para excluir clientes pelo CPF sendo que: 

1-	Caso o cliente possua encomendas emitir a mensagem “Impossível remover esse 
cliente pois o cliente XXXXX possui encomendas; onde XXXXX é o nome do cliente.

2-	Caso o cliente não possua encomendas realizar a remoção e emitir a mensagem 
“Cliente XXXX removido com sucesso”, onde XXXX é o nome do cliente;*/

Delimiter $$

Create procedure SP_ExcluirCliente(CPF char(14))
BEGIN
SET @NomeCliente := (Select nomeCliente from tbCliente where cpfCliente = CPF);
SET @CodCliente := (Select codCliente from tbCliente where cpfCliente = CPF);

	if exists (Select * from tbEncomenda where codCliente = @CodCliente)
    then Select concat("Não é possível remover pois ", @NomeCliente, " possui encomendas") as "Aviso";
    
    else
    delete from tbCliente where codCliente = @CodCliente;
	Select concat("Cliente ", @NomeCliente, " removido com sucesso") as "Aviso";
    
    end if;

END $$
Delimiter ;

Call SP_ExcluirCliente("258.368.449-21");
Select * from tbCliente;

# Arthur Oliveira Silva 2Ano Mtec DS Guarulhos