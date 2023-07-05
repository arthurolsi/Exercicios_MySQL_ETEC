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
          
/* Mostrar todos os dados do curso mais barato */    
Select * from tbcurso where valorCurso in (Select min(valorCurso) from tbcurso);


/* Mostrar todos os dados do curso mais caro. */
Select * from tbcurso where valorCurso in (Select max(valorCurso) from tbcurso);


/* Mostrar o nome da turma e horário da turma que começa mais cedo. */
Select nomeTurma, horarioTurma from tbturma where horarioTurma in(Select min(horarioTurma) from tbturma);


/* Mostrar cursos que custam acima do valor médio. */
Select * from tbcurso where valorCurso > (select avg (valorCurso) from tbcurso);


/* Mostrar a matrícula mais recente */
Select * from tbmatricula where codMatricula in(Select max(codMatricula) from tbmatricula);

/* ARTHUR OLIVEIRA SILVA 2 ANO, MTEC DS GUARULHOS */