/* Atividade realizada em 2020 */

create database bdCaixa;
use bdCaixa;

CREATE TABLE tbCaixa(	
codCaixa int primary key auto_increment,
 data_op	DATE,
 saldoInicial DECIMAL(10,2),
 saldoFinal DECIMAL(10,2));

CREATE TABLE tbVenda(	
codVenda int primary key auto_increment,
 data_venda DATE,
 valor	DECIMAL(10,2));

INSERT INTO tbCaixa(data_op, saldoInicial, saldoFinal)
VALUES ('2020/10/28', 100, 100);

Select * from tbCaixa;

Delimiter $$
CREATE TRIGGER tgr_VendasSaldo AFTER INSERT
ON tbVenda
FOR EACH ROW
BEGIN    
UPDATE tbCaixa SET saldoFinal = saldoFinal + NEW.valor WHERE data_op =  NEW.data_venda;
END $$
Delimiter ;

INSERT INTO tbVenda(data_venda, valor)
VALUES ('2020/10/28', 50);


Delimiter $$
CREATE TRIGGER tgr_VendaDelete AFTER DELETE
ON tbVenda
FOR EACH ROW
BEGIN    
UPDATE tbCaixa SET saldoFinal = saldoFinal - OLD.valor
WHERE data_op = OLD.data_venda;
END $$
Delimiter ;

Delete from tbVenda where codVenda = 4;

Select * from tbVenda;