/* Atividade realizada em 2019 */

use Locadora;

CREATE TABLE `genero` (
  `Cod_gen` int(11) NOT NULL AUTO_INCREMENT,
  `Gen_Filme` varchar(30) NOT NULL,
  `Val_Loca` double NOT NULL,
  PRIMARY KEY (`Cod_gen`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

CREATE TABLE `filmes` (
  `cod_filme` int(11) NOT NULL AUTO_INCREMENT,
  `titulo_filme` varchar(30) NOT NULL,
  `atorprin_filme` varchar(30) NOT NULL,
  `Cod_gen` int(11) DEFAULT NULL,
  `anodecri_filme` varchar(4) NOT NULL,
  `diretor_filme` varchar(20) NOT NULL,
  `resumo_filme` longtext NOT NULL,
  `datadocad_filme` datetime NOT NULL,
  PRIMARY KEY (`cod_filme`),
  KEY `Cod_gen_idx` (`Cod_gen`),
  CONSTRAINT `Cod_gen` FOREIGN KEY (`Cod_gen`) REFERENCES `genero` (`Cod_gen`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;

INSERT INTO `locadora`.`filmes` (`cod_filme`, `titulo_filme`, `atorprin_filme`, `Cod_gen`, `anodecri_filme`, `produtor_filme`, `resumo_filme`, `datadocad_filme`) VALUES ('1', 'Transformers', 'Eu', '1', '2011', 'Ana Liu', 'Bom', '2009-12-12 13:13:13');
INSERT INTO `locadora`.`filmes` (`cod_filme`, `titulo_filme`, `atorprin_filme`, `Cod_gen`, `anodecri_filme`, `produtor_filme`, `resumo_filme`, `datadocad_filme`) VALUES ('2', 'Vingadores', 'Alan', '2', '2011', 'lee', 'Ruim', '2009-12-12 13:13:13');
INSERT INTO `locadora`.`filmes` (`cod_filme`, `titulo_filme`, `atorprin_filme`, `Cod_gen`, `anodecri_filme`, `produtor_filme`, `resumo_filme`, `datadocad_filme`) VALUES ('3', 'A era do gelo', 'Via', '3', '2011', 'Stan', 'Bom', '2009-12-12 13:13:13');
INSERT INTO `locadora`.`filmes` (`cod_filme`, `titulo_filme`, `atorprin_filme`, `Cod_gen`, `anodecri_filme`, `produtor_filme`, `resumo_filme`, `datadocad_filme`) VALUES ('4', 'Rambo', 'Ana', '4', '2011', 'Tony', 'Ruim', '2009-12-12 13:13:13');
INSERT INTO `locadora`.`filmes` (`cod_filme`, `titulo_filme`, `atorprin_filme`, `Cod_gen`, `anodecri_filme`, `produtor_filme`, `resumo_filme`, `datadocad_filme`) VALUES ('5', 'Kung fu Panda', 'Luisa', '5', '2011', 'Jon', 'Bom', '2009-12-12 13:13:13');
INSERT INTO `locadora`.`filmes` (`cod_filme`, `titulo_filme`, `atorprin_filme`, `Cod_gen`, `anodecri_filme`, `produtor_filme`, `resumo_filme`, `datadocad_filme`) VALUES ('6', 'Game of thrones', 'Rafael', '6', '2011', 'Arthur', 'Ruim', '2009-12-12 13:13:13');
INSERT INTO `locadora`.`filmes` (`cod_filme`, `titulo_filme`, `atorprin_filme`, `Cod_gen`, `anodecri_filme`, `produtor_filme`, `resumo_filme`, `datadocad_filme`) VALUES ('7', 'Rampage', 'Carlos', '7', '2011', 'Goiaba', 'Bom', '2009-12-12 13:13:13');
INSERT INTO `locadora`.`filmes` (`cod_filme`, `titulo_filme`, `atorprin_filme`, `Cod_gen`, `anodecri_filme`, `produtor_filme`, `resumo_filme`, `datadocad_filme`) VALUES ('8', 'Ultron', 'Lais', '8', '2011', 'Liucca', 'Bom', '2009-12-12 13:13:13');
INSERT INTO `locadora`.`filmes` (`cod_filme`, `titulo_filme`, `atorprin_filme`, `Cod_gen`, `anodecri_filme`, `produtor_filme`, `resumo_filme`, `datadocad_filme`) VALUES ('9', 'A grande familia', 'Joao', '9', '2011', 'Marcello', 'Ruim', '2009-12-12 13:13:13');
INSERT INTO `locadora`.`filmes` (`cod_filme`, `titulo_filme`, `atorprin_filme`, `Cod_gen`, `anodecri_filme`, `produtor_filme`, `resumo_filme`, `datadocad_filme`) VALUES ('10', 'A grande Muralha', 'Jonas', '10', '2011', 'Renam', 'Bom', '2009-12-12 13:13:13');


describe Genero "Tipos diferente, outros estilos de filmes";
describe filmes "Uma lista geral de varios filmes";

alter table filmes change diretor_filme produtor_filme VARCHAR(20) NOT NULL; 

DESCRIBE filmes "Tipos diferente, varios estilos de filmes";
describe genero "Uma lista geral de 10 filmes";


