create database if not exists Locadora;
use Locadora;

CREATE TABLE if not exists `genero` (
  `Cod_gen` int(11) NOT NULL AUTO_INCREMENT,
  `Gen_Filme` varchar(30) NOT NULL,
  `Val_Loca` double NOT NULL,
  PRIMARY KEY (`Cod_gen`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

CREATE TABLE if not exists `filmes` (
  `cod_filme` int(11) NOT NULL AUTO_INCREMENT,
  `titulo_filme` varchar(30) NOT NULL,
  `atorprin_filme` varchar(30) NOT NULL,
  `Cod_gen` int(11) DEFAULT NULL,
  `anodecri_filme` varchar(4) NOT NULL,
  `diretor_filme` varchar(20) NOT NULL,
  `resumo_filme` longtext NOT NULL,
  `datadocad_filme` datetime NOT NULL,
  `qtd_filme` numeric(20),
  PRIMARY KEY (`cod_filme`),
  KEY `Cod_gen_idx` (`Cod_gen`),
  CONSTRAINT `Cod_gen` FOREIGN KEY (`Cod_gen`) REFERENCES `genero` (`Cod_gen`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;

INSERT INTO `locadora`.`genero` (`Cod_gen`, `Gen_Filme`, `Val_Loca`) VALUES ('1', 'Aventura', '2.50');
INSERT INTO `locadora`.`genero` (`Cod_gen`, `Gen_Filme`, `Val_Loca`) VALUES ('2', 'Comedia', '3.0');
INSERT INTO `locadora`.`genero` (`Cod_gen`, `Gen_Filme`, `Val_Loca`) VALUES ('3', 'Romance', '2.50');
INSERT INTO `locadora`.`genero` (`Cod_gen`, `Gen_Filme`, `Val_Loca`) VALUES ('4', 'Infantil', '3.0');
INSERT INTO `locadora`.`genero` (`Cod_gen`, `Gen_Filme`, `Val_Loca`) VALUES ('5', 'Guerra', '3.0');
INSERT INTO `locadora`.`genero` (`Cod_gen`, `Gen_Filme`, `Val_Loca`) VALUES ('6', 'Suspense', '2.50');
INSERT INTO `locadora`.`genero` (`Cod_gen`, `Gen_Filme`, `Val_Loca`) VALUES ('7', 'ficcao', '3.0');
INSERT INTO `locadora`.`genero` (`Cod_gen`, `Gen_Filme`, `Val_Loca`) VALUES ('8', 'Terror', '2.50');
INSERT INTO `locadora`.`genero` (`Cod_gen`, `Gen_Filme`, `Val_Loca`) VALUES ('9', 'Documentario', '2.50');
INSERT INTO `locadora`.`genero` (`Cod_gen`, `Gen_Filme`, `Val_Loca`) VALUES ('10', 'Musical', '3.0');

INSERT INTO `locadora`.`filmes` (`cod_filme`, `titulo_filme`, `atorprin_filme`, `Cod_gen`, `anodecri_filme`, `diretor_filme`, `resumo_filme`, `datadocad_filme`, `qtd_filme`) VALUES ('11', 'Transformers', 'Shia LaBeouf', '1', '2007', 'Michael Bay', 'O destino da humanidade está em jogo quando duas raças de robôs, os Autobots e os vilões Decepticons, chegam à Terra. Os robôs possuem a capacidade de se transformarem em diferentes objetos mecânicos enquanto buscam a chave do poder supremo com a ajuda do jovem Sam.', '2019-12-01 12:23:24' , '10');
INSERT INTO `locadora`.`filmes` (`cod_filme`, `titulo_filme`, `atorprin_filme`, `Cod_gen`, `anodecri_filme`, `diretor_filme`, `resumo_filme`, `datadocad_filme`, `qtd_filme`) VALUES ('12', 'Era do Gelo', 'Animação', '2', '2002', 'Chris Wedge', 'Vinte mil anos atrás, num mundo coberto de gelo, o mamute Manfred e a preguiça Sid resgatam um bebê humano órfão. Agora, os dois vão enfrentar muitas aventuras até devolver o filhote de gente à sua tribo, que migrou para um novo acampamento.', '2019-12-01 14:47:58' , '20');
INSERT INTO `locadora`.`filmes` (`cod_filme`, `titulo_filme`, `atorprin_filme`, `Cod_gen`, `anodecri_filme`, `diretor_filme`, `resumo_filme`, `datadocad_filme`, `qtd_filme`) VALUES ('13', 'Hitman', 'Agente', '3', '2007', 'Xavier Gens', 'Assassino profissional, conhecido como Agente 47, se envolve em uma perigosa conspiração política. Ele foge pela Europa oriental, com a esperança de descobrir quem o traiu, mas, antes, têm que fugir de militares russos e da Interpol.', '2019-12-01 17:15:30' , '30');
INSERT INTO `locadora`.`filmes` (`cod_filme`, `titulo_filme`, `atorprin_filme`, `Cod_gen`, `anodecri_filme`, `diretor_filme`, `resumo_filme`, `datadocad_filme`, `qtd_filme`) VALUES ('14', 'Assassins Creed', 'Ezio', '4', '2016', 'Justin Kurzel', 'Cal Lynch revive as aventuras do guerreiro Aguilar, seu ancestral espanhol do século XV. Dotado de novos conhecimentos e incríveis habilidades, ele volta aos dias de hoje pronto para enfrentar a poderosa organização dos Templários.', '2019-12-01 17:15:30' , '40');
INSERT INTO `locadora`.`filmes` (`cod_filme`, `titulo_filme`, `atorprin_filme`, `Cod_gen`, `anodecri_filme`, `diretor_filme`, `resumo_filme`, `datadocad_filme`, `qtd_filme`) VALUES ('15', 'Velozes e Furiosos', 'Vin Diesel', '5', '2001', 'Rob Cohen', 'Brian O\'Conner é um policial que se infiltra no submundo dos rachas de rua para investigar uma série de furtos. Enquanto tenta ganhar o respeito e a confiança do líder Dom Toretto, ele corre o risco de ser desmascarado.', '2019-12-01 14:47:58' , '50');
INSERT INTO `locadora`.`filmes` (`cod_filme`, `titulo_filme`, `atorprin_filme`, `Cod_gen`, `anodecri_filme`, `diretor_filme`, `resumo_filme`, `datadocad_filme`, `qtd_filme`) VALUES ('16', 'Hunger Games', 'Katniss ', '6', '2012', 'Gary Ross', 'Na região antigamente conhecida como América do Norte, a Capital de Panem controla 12 distritos e os força a escolher um garoto e uma garota, conhecidos como tributos, para competir em um evento anual televisionado. Todos os cidadãos assistem aos temidos jogos, no qual os jovens lutam até a morte, de modo que apenas um saia vitorioso. A jovem Katniss Everdeen, do Distrito 12, confia na habilidade de caça e na destreza com o arco, além dos instintos aguçados, nesta competição mortal.', '2019-12-01 12:23:24' , '60');
INSERT INTO `locadora`.`filmes` (`cod_filme`, `titulo_filme`, `atorprin_filme`, `Cod_gen`, `anodecri_filme`, `diretor_filme`, `resumo_filme`, `datadocad_filme`, `qtd_filme`) VALUES ('17', 'O Assassinato', 'Hercules Poirot', '7', '2017', 'Kenneth Branagh', 'Ocorre um assassinato em um luxuoso trem. O famoso detetive Hercule Poirot, que também estava a bordo, precisa correr contra o tempo para resolver o caso.', '2019-12-01 11:15:47' , '70');
INSERT INTO `locadora`.`filmes` (`cod_filme`, `titulo_filme`, `atorprin_filme`, `Cod_gen`, `anodecri_filme`, `diretor_filme`, `resumo_filme`, `datadocad_filme`, `qtd_filme`) VALUES ('18', 'Polar', 'MADS MIKKELSEN', '8', '2019', 'Jonas Akêrlund', 'Um assassino prestes a se aposentar precisa adiar a boa vida quando seu chefe ganancioso envia um bando de matadores jovens e cruéis para exterminá-lo.', '2019-12-01 13:48:51' , '80');
INSERT INTO `locadora`.`filmes` (`cod_filme`, `titulo_filme`, `atorprin_filme`, `Cod_gen`, `anodecri_filme`, `diretor_filme`, `resumo_filme`, `datadocad_filme`, `qtd_filme`) VALUES ('19', 'Coringa', 'Heath Ledger', '9', '2008', 'Christopher Nolan', 'Com a ajuda de Jim Gordon e Harvey Dent, Batman tem mantido a ordem na cidade de Gotham. Mas um jovem e anárquico criminoso conhecido como Coringa ganha força e decide instaurar um verdadeiro caos na cidade. O justiceiro será testado psicologicamente e fisicamente como nunca fora antes em um confronto bastante pessoal. Cabe a Batman encontrar uma maneira de deter o sádico vilão antes que mais vidas sejam perdidas.', '2019-12-01 11:15:47' , '90');
INSERT INTO `locadora`.`filmes` (`cod_filme`, `titulo_filme`, `atorprin_filme`, `Cod_gen`, `anodecri_filme`, `diretor_filme`, `resumo_filme`, `datadocad_filme`, `qtd_filme`) VALUES ('20', 'Deadpool', 'Ryan Reynolds', '10', '2016', 'Tim Miller', 'Wade Wilson é um ex-agente especial que passou a trabalhar como mercenário. Seu mundo é destruído quando um cientista maligno o tortura e o desfigura completamente. O experimento brutal transforma Wade em Deadpool, que ganha poderes especiais de cura e uma força aprimorada. Com a ajuda de aliados poderosos e um senso de humor mais desbocado e cínico do que nunca, o irreverente anti-herói usa habilidades e métodos violentos para se vingar do homem que quase acabou com a sua vida.', '2019-12-01 13:48:51' , '100');

describe filmes;
describe genero;

alter table filmes change  diretor_filme produtor_filme varchar(20) not null;

describe filmes;
describe genero;

update genero set Val_Loca = 3.0 where Cod_Gen = 1;

select produtor_filme from filmes
where cod_gen = '3'
order by anodecri_filme;

select produtor_filme from filmes
where cod_gen ='3'
order by produtor_filme asc;

select produtor_filme from filmes
where cod_gen ='3'
order by produtor_filme desc;

select produtor_filme, cod_gen
from filmes
where cod_gen='3'
order by produtor_filme desc,
cod_gen asc;

select * from filmes where cod_gen='3'
and anodecri_filme > 2001;

select filmes.Cod_gen,
genero.Cod_gen
from filmes, genero
where filmes.Cod_gen = genero.Cod_gen
and filmes.cod_gen ='3';

select titulo_filme, atorprin_filme from filmes where
cod_gen in('3');

select titulo_filme, atorprin_filme from filmes where cod_gen = 1 or cod_gen =3;

select titulo_filme, atorprin_filme
from filmes
where cod_gen not in ('1','3');

select distinct produtor_filme
		from filmes
        order by cod_gen;
        
select count(distinct produtor_filme)
		from filmes
        where cod_gen = '1';
        
select titulo_filme from filmes
where qtd_filme 
between 40 and 80;

select count(distinct produtor_filme) from filmes where cod_gen = '3';

select titulo_filme from filmes where qtd_filme between 20 and 80;

create procedure VerGenero(VarCatiorro char)
		select concat ('Romance é o COD...', cod_gen)
        as cod_gen from filmes
        where cod_gen = VarCatiorro;
        
call VerGenero(3);

/* Criar Procedure */

create procedure VerFilmes(VarCorno int(11))
		select concat ('O ator do filme é...', atorprin_filme)
        as atorprin_filme from filmes
        where cod_filme = VarCorno;
        
/* Chamar Procedure */
        
call VerFilmes (11);

drop procedure VerFilmes;

Delimiter $$   
Create procedure ListarFilmes(in opcao INTEGER)
		begin
			if opcao = '1' then
				select * from filmes where cod_gen = '1' ;
			else 
           if opcao = '2' then
				select * from filmes where cod_gen = '2';
			else 
            select * from filmes;
            end if;
				end if;
            
end $$ 

call ListarFilmes (1);
call ListarFilmes (2);

create view v_produtor as select
		titulo_filme, produtor_filme from filmes;
        
create view v_ano as select
		titulo_filme, anodecri_filme from filmes;
        
        /* 1° */

Delimiter $$  
create procedure ConcatFilmes(varAtiv int(11))
		select concat ('Os filmes do ano que você digitar no call será ', titulo_filme)
        as titulo_filme from filmes
        where  anodecri_filme = varAtiv;
end $$ 

drop procedure ConcatFilmes;
        
call ConcatFilmes(2007);

		/* 2° */
/*Ele diz que dá erro mas está certo Colladoooooooo*/
Delimiter $$  
create procedure DadosFilmes(varAtivo int(11))
		select concat ('A ficha técnica desse filme é ', titulo_filme,' ', atorprin_filme, ' ', produtor_filme, ' ', resumo_filme, ' ', datadocad_filme, ' ', qtd_filme)
		as filme from filmes
        where  anodecri_filme = varAtivo;
end $$ 
        
drop procedure DadosFilmes;
        
call DadosFilmes(2007);

create view v_tap 
as select titulo_filme, anodecri_filme, produtor_filme 
from filmes ;

create view gen_v
as select Gen_Filme, Val_Loca
from genero;

select * from v_tap;

select Gen_Filme from gen_v;



select * from filmes;


        


        
