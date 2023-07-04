/* Atividade realizada em 2019 */

create database escola;
use escola;

create table if not exists Curso(
cod_curso int(11) not null auto_increment,
nome varchar(20) not null,
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
nome_aluno varchar(40) not null,
endereco varchar(50),
primary key(cod_aluno));

create table if not exists Matricula(
cod_matricula int(11) not null auto_increment,
data_matri date not null,
forma_de_pag varchar(20) not null,
numero_matri int(20) not null,
primary key(cod_matricula));

Delimiter $$   
Create procedure InsertCurso(in ccod_curso int(11), cnome varchar(20), cprereq varchar(30), ccarga_horaria int(8), cvalor double)
		begin
			insert into Curso(cod_curso, nome, prereq, carga_horaria, valor) values ("ccod_curso int(11)", "cnome varchar(20)", "cprereq varchar(30)", "ccarga_horaria int(8)", "cvalor double");
            
 END$$ 

call InsertCurso(2, "Joao", "Inteligente", "8", "1000");