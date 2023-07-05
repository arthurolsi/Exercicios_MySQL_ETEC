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
          


INSERT INTO tbAluno ( nomeAluno , dataNascimentoAluno, rgAluno, naturalidadeAluno)

  VALUES
		('João Ante', '2005-04-11','80.272.132-7','MT'),
        ('Maria Fernanda', '2006-05-03','75.758.123-0','SP'),
        ('Eduarda Fernanda', '2006-01-10','77.573.281-6','SP');
        
        # 3 Alunos menores de idade


/*---------------------------------------Tarefa para o dia 25-06-2020 CASE WHEN------------------------------------------------------*/


# 1 Tabela Aluno. Exibir Maior e menor de idade usando case.


select nomeAluno, dataNascimentoaluno,
case when TIMESTAMPDIFF(YEAR,dataNascimentoaluno,now(0)) >= 18 THEN "Maior de idade"
ELSE "Menor de Idade"
end as "Sobre Aluno" from tbAluno;



# 2 Tabela Curso. Mostrar o nome do curso ao lado da turma usando Case.


Select nomeTurma as "Nome da turma", case (codCurso)
when  "1" then "Inglês"
when  "2" then "Fracês"
when  "3" then "Alemão"
when  "4" then "Espanhol"
else "Outro"
end as "Nome do Curso" from tbTurma;



# 3 Tabela Matricula. Mostrar o dia da semana ao lado da data da matricula.


Select dataMatricula as "Data de matricula", case (WEEKDAY(dataMatricula))
when  "0" then "Segunda-Feira"
when  "1" then "Terça-Feira"
when  "2" then "Quarta-feira"
when  "3" then "Quinta feira"
when  "4" then "Sexta-feira"
when  "5" then "Sábado"
else "Domingo"
end as "Dia da semana" from tbMatricula;

# Anotação -- No weekday o zero é Segunda-feira

# Arthur Oliveira Silva 2Ano Mtec DS Guarulhos