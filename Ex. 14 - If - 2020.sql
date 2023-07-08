/* Atividade realizada em 2020 */

create database bdEscola;
use bdEscola;

create table tbAluno(	
 codAluno int primary key auto_increment,
 nomeAluno varchar(40),
 dataNascimentoAluno datetime,
 rgAluno varchar(15),
 naturalidadeAluno varchar(02)	
);

create table tbCurso(	
 codCurso int primary key auto_increment,
 nomeCurso varchar(15),
 cargahorariaCurso int,
 valorCurso decimal(10,2)	
);

create table tbTurma(	
 codTurma int primary key auto_increment,
 nomeTurma varchar(20),
 codCurso int,
 horarioTurma time,
 foreign key(codCurso) references tbCurso(codCurso)
);

create table tbMatricula(	 
codMatricula int primary key auto_increment,
dataMatricula date,
codAluno int,
codTurma int, 
foreign key (codAluno) references tbAluno(codAluno), 
foreign key (CodTurma) references tbTurma(codTurma)	
);


INSERT INTO tbAluno
( nomeAluno , dataNascimentoAluno, rgAluno, naturalidadeAluno)

  VALUES
		('Paulo Santos', '2000-03-10','82.292.122-0','SP'),
        ('Maria da Gloria', '1999-10-03','45.233.123-0','SP'),
        ('Perla Nogueira Silva', '1998-01-11','23.533.211-9','SP'),
        ('Gilson Barros Silva', '1995-09-11','34.221.111-x', 'PE'),
        ('Mariana Barbosa Santos','2001-07-1','54.222.122-9','RJ');



INSERT INTO tbCurso
  (nomeCurso , cargahorariaCurso , valorCurso)
   VALUES
		  ('Inglês',2000,356.00),
          ('Francês',2000,450.00),
          ('Alemão',3000,478.00) ,
          ('Espanhol',3000,600.00);  


INSERT INTO tbTurma 
  (nomeTurma , codCurso, horarioTurma)

   VALUES
		('1IA', 1,'12:00:00'),
          ('1IB', 1, '18:00:00'),
          ('1FA',2,'19:00:00'),
          ('1FB',2,'15:00:00'),
          ('1AA',3,'18:00:00'),
          ('1AB',3,'19:00:00'),
          ('1EA',4,'19:00:00');

INSERT INTO tbMatricula  
  (dataMatricula, codAluno,codTurma)
    VALUES
		  ('2019/03/10',1,1),
          ('2019/04/05',2,1),
          ('2019/03/05',3,2),
          ('2019/03/03',1,3),
          ('2019/07/05',4,2),
          ('2019/05/07',4,3),
          ('2019/06/06',5,1),
          ('2019/05/05',5,3);
          


/*----------------------------------------------------------------Aula 10-06-2020----------------------------------------------------------------------
Treinando IF, Exemplos da atividade do Slide referente a aula do dia 10-06-2020, atividade para o dia 17-06-2020 */

# Acrescente 3 alunos menores de idade

INSERT INTO tbAluno ( nomeAluno , dataNascimentoAluno, rgAluno, naturalidadeAluno)

  VALUES
		('João Ante', '2005-04-11','80.272.132-7','MT'),
        ('Maria Fernanda', '2006-05-03','75.758.123-0','SP'),
        ('Eduarda Fernanda', '2006-01-10','77.573.281-6','SP');



#1 Usando a tabela tbCurso. Exibir curso longo, médio ou curto. 

Select nomeCurso as "Nome do Curso", cargahorariaCurso as "Carga Horária do Curso",
 if(cargahorariaCurso <= "2000", "Curso curto",
 if (cargahorariaCurso <= "3000", "Curso Médio",
 "Curso Longo")) as "Categoria de Curso" from tbCurso;



#2 Usando a tabela tbTurma. Exibir curso matutino, vespertino ou noturno.

Select nomeTurma as "Nome da Turma", horarioTurma as "Horario da Turma",
if((hour(horarioTurma) >= 18), "Curso Noturno",
if((hour(horarioTurma) > 12), "Curso Vesputino",
"Curso Matutino")) as "Periodo Curso" from tbTurma;



#3 Usando a tabela tbAluno. Exibir aluno maior de idade ou menor de idade.

SET @AnoAtual := current_date();

Select nomeAluno as "Nome do Aluno", dataNascimentoAluno as "Data de Nascimento do aluno",
if((Year(dataNascimentoAluno) <= @AnoAtual -18),
"Aluno maior de idade", "Aluno menor de Idade")
as "Idade do Aluno" from tbAluno;

/* Criei a variavel AnoAtual, ela é igual ao ano em que estamos, depois subtrai
18 anos. Se a data de nascimento do aluno for menor que o resultado, ele é maior
de idade, senão, é menor. 

Arthur Oliveira Silva 2° Ano MTEC DS Guarulhos SP */