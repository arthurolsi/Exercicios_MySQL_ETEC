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


/*-------------------------------------------------------Exercicios para o dia 03/07/2020----------------------------------------------------------

1 - Criar os scripts dos exemplos. */

create function fn_teste(a decimal(10,2), b int ) 
returns int
deterministic
return a*b;

select fn_teste(3.5,4) as Resultado;


select nomeCurso, fn_teste(valorCurso, 2) as 'Dobro' from tbCurso;


CREATE FUNCTION fn_verPreco (a SMALLINT)
RETURNS VARCHAR(60)
deterministic
RETURN
(SELECT CONCAT('O preço do Curso ', nomeCurso, ' é ', valorCurso)
FROM tbcurso WHERE codCurso = a);

SELECT fn_verPreço(7);


Create Function fc_RetornaAluno (codigo smallint) 
RETURNS varchar(40) 
deterministic
RETURN
(Select concat(nomeAluno , " *** " , rgAluno) 
FROM tbAluno WHERE codAluno=codigo); 



SELECT CodAluno, nomeAluno, fc_RetornaAluno(codAluno)as 'minha função' from tbAluno; 



CREATE FUNCTION fn_Periodo ( x time) 
RETURNS text 
deterministic
Return 
IF(hour(x) >= 18, "Noturno", IF(hour(x) >= 12, "Vespertino", "Matutino"));

select fn_Periodo ("15:50")as "teste";



select nomeTurma, horarioTurma, fn_Periodo(horarioTurma)as 'teste' from tbturma;


# 2 - Crie uma função que informada uma data da matrícula , retorne o dia da semana. */

CREATE FUNCTION fn_DiaMatricula( xDATA date)
RETURNS varchar(50)
deterministic
return
(case (weekday(xDATA))
when  "0" then "Segunda-Feira"
when  "1" then "Terça-Feira"
when  "2" then "Quarta-feira"
when  "3" then "Quinta feira"
when  "4" then "Sexta-feira"
when  "5" then "Sábado"
else "Domingo"
end );

select codMatricula as "Código da Matricula", 
dataMatricula as "Data da Matricula" ,fn_DiaMatricula(dataMatricula) as "Dia da semana" 
from tbMatricula;



# 3 - Crie uma função que de acordo com a carga horária do curso exiba curso rápido ou curso extenso. (Rápido menos de 1000 horas).

CREATE FUNCTION fn_CargaH (CargaHoraria int)
RETURNS text 
deterministic
Return 
 if(CargaHoraria <= "1000", "Curso rápido", "Curso Extenso");
 
Select fn_CargaH(2000) as "Resultado";


# 4 - Crie uma função que de acordo com o valor do curso exiba  curso caro ou curso barato. (Curso caro acima de 400).


CREATE FUNCTION fn_Valor (Valor decimal(10,2))
RETURNS text 
deterministic
Return 
 if(Valor <= "400", "Curso barato", "Curso caro");
 
Select fn_Valor(300) as "Resultado";


# Arthur Oliveira Silva 2Ano Mtec DS Guarulhos