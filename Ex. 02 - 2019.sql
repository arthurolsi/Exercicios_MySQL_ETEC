/* Atividade realizada em 2019 */

create database escola;
use escola;

create table if not exists Curso(
cod_curso int(11) not null auto_increment,
nome varchar(50) not null,
prereq varchar(30) not null,
carga_horaria int(8) not null,
valor double not null,
primary key(cod_curso));

create table if not exists Turma(
cod_turma int(11) not null auto_increment,
turno int(10) not null,
data_ini date not null,
data_final date not null,
qtd_vagas int(11) not null,
primary key(cod_turma));

create table if not exists Aluno(
cod_aluno int(11) not null auto_increment,
cpf varchar(20) not null,
rg varchar(20) not null,
nome_aluno varchar(50) not null,
endereco varchar(50),
primary key(cod_aluno));

create table if not exists Matricula(
cod_matricula int(11) not null auto_increment,
data_matri date not null,
forma_de_pag varchar(20) not null,
numero_matri int(20) not null,
primary key(cod_matricula));

INSERT INTO `escola`.`curso` (`cod_curso`, `nome`, `prereq`, `carga_horaria`, `valor`) VALUES ('1', 'Logistica', 'Visao', '5', '100');
INSERT INTO `escola`.`curso` (`nome`, `prereq`, `carga_horaria`, `valor`) VALUES ('Administracao', 'RH', '5', '150');
INSERT INTO `escola`.`curso` (`nome`, `prereq`, `carga_horaria`, `valor`) VALUES ('Desenvolvimento de Sis', 'Computador', '5', '150');
INSERT INTO `escola`.`curso` (`nome`, `prereq`, `carga_horaria`, `valor`) VALUES ('Enfermagem', 'Feridos', '20', '1000');
INSERT INTO `escola`.`curso` (`nome`, `prereq`, `carga_horaria`, `valor`) VALUES ('Agricultor', 'Agrotoxico', '5', '35');

INSERT INTO `escola`.`aluno` (`cod_aluno`, `cpf`, `rg`, `nome_aluno`, `endereco`) VALUES ('1', '00667617000', '299133692', 'Azhe', 'Av Pinhoca');
INSERT INTO `escola`.`aluno` (`cpf`, `rg`, `nome_aluno`, `endereco`) VALUES ('317.923.640-08', '312292302', 'Guathen', 'Av Gasosa');
INSERT INTO `escola`.`aluno` (`cpf`, `rg`, `nome_aluno`, `endereco`) VALUES ('444.833.590-96', '188631604', 'Hioercu', 'Rua Narrua');
INSERT INTO `escola`.`aluno` (`cpf`, `rg`, `nome_aluno`, `endereco`) VALUES ('706.111.480-05', '180285063', 'Anil', 'Rua Feijoada');
INSERT INTO `escola`.`aluno` (`cpf`, `rg`, `nome_aluno`, `endereco`) VALUES ('252.683.960-21', '491172485', 'Sorien', 'Rua Dedada');

INSERT INTO `escola`.`matricula` (`cod_matricula`, `data_matri`, `forma_de_pag`, `numero_matri`) VALUES ('1', '2003-05-13', 'Dinheiro', '201901');
INSERT INTO `escola`.`matricula` (`data_matri`, `forma_de_pag`, `numero_matri`) VALUES ('2002-12-16', 'Credito', '201902');
INSERT INTO `escola`.`matricula` (`data_matri`, `forma_de_pag`, `numero_matri`) VALUES ('2000-03-30', 'Dinheiro', '201903');
INSERT INTO `escola`.`matricula` (`data_matri`, `forma_de_pag`, `numero_matri`) VALUES ('1999-06-18', 'Credito', '201904');
INSERT INTO `escola`.`matricula` (`data_matri`, `forma_de_pag`, `numero_matri`) VALUES ('1997-08-13', 'Dinheiro', '201905');

INSERT INTO `escola`.`turma` (`cod_turma`, `turno`, `data_ini`, `data_final`, `qtd_vagas`) VALUES ('1', '01', '2019-12-12', '2022-10-18', '40');
INSERT INTO `escola`.`turma` (`cod_turma`, `turno`, `data_ini`, `data_final`, `qtd_vagas`) VALUES ('2', '01', '2019-12-12', '2022-10-18', '40');
INSERT INTO `escola`.`turma` (`cod_turma`, `turno`, `data_ini`, `data_final`, `qtd_vagas`) VALUES ('3', '01', '2019-12-12', '2022-10-18', '80');
INSERT INTO `escola`.`turma` (`cod_turma`, `turno`, `data_ini`, `data_final`, `qtd_vagas`) VALUES ('4', '02', '2019-12-12', '2022-10-18', '40');
INSERT INTO `escola`.`turma` (`cod_turma`, `turno`, `data_ini`, `data_final`, `qtd_vagas`) VALUES ('5', '03', '2019-12-12', '2022-10-18', '80');


Delimiter $$
create procedure NomeCurso(agaraga int(50)) 
		select concat ('O curso com esse ID é:', ' ', nome)
		as cod_curso from curso
        where  cod_curso = agaraga;
end $$ 

call NomeCurso(1);

Delimiter $$
create procedure TudoCurso(motorista int(50)) 
		select concat ('A ficha técnica desse curso é: ', ' ', nome, ' - Tendo: ', prereq, ' - Durando: ', carga_horaria, ' - Custando: ', valor)
        as cod_curso from curso
        where  cod_curso = motorista;
end $$ 

call TudoCurso(3);

delete from Curso where cod_curso = 1;

delete from Turma where cod_turma = 1;

delete from aluno where cod_aluno = 1;

Delimiter $$
create procedure TudoTurma(oi int(50)) 
		select concat ('A ficha técnica dessa turma é: ', ' ', turno, ' - Tendo inicio em: ', data_ini, ' - Acabanco em: ', data_final, ' - Com este número de vagas: ', qtd_vagas)
        as cod_turma from turma
        where  cod_turma = oi;
end $$ 

call TudoTurma(2);

Delimiter $$
create procedure TudoAluno(tchau int(50)) 
		select concat ('A ficha técnica desse aluno é: ', ' ', cpf, ' - Rg : ', rg, ' - Seu nome é: ', nome_aluno, ' - Que mora em: ', endereco)
        as cod_aluno from aluno
        where  cod_aluno = tchau;
end $$ 

call TudoAluno(2);

Delimiter $$
create procedure NomeMatricula(hehe int(50)) 
		select concat ('A matricula com esse ID é:', ' ', numero_matri)
		as cod_matricula from matricula
        where  cod_matricula = hehe;
end $$ 

call NomeMatricula(4);

Delimiter $$
create procedure NomeAluno(pipi int(50)) 
		select concat ('O aluno com esse ID é:', ' ', nome_aluno)
		as cod_aluno from aluno
        where  cod_aluno = pipi;
end $$ 

call NomeAluno(4);