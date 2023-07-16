/* Atividade realizada em 2020 */

# 1 Crie uma visão “vw_Preço_Baixo” que exiba o código, nome do curso e o valor do curso de todos os cursos que tenha preco inferior ao preço médio.
Create view vw_PrecoBaixo2 as
Select * from tbCurso
where valorCurso <(Select avg(valorCurso) from tbCurso);

Select * from vw_PrecoBaixo2 order by ValorCurso;


# 2 Usando a visão “vw_ Preço_Baixo”, mostre todos os cursos classificados por carga horária.
Select * from vw_PrecoBaixo2 order by cargahorariacurso desc;


# 3 Crie uma visão “vw_ Alunos_Turma” que exiba a turma e a quantidade de alunos por turma.
create view vw_Alunos_Turma as
select tbturma.nomeTurma, count(*) as quantidade
from tbturma inner join tbmatricula
on tbturma.codturma=tbmatricula.codturma
group by nometurma;

select * from vw_Alunos_Turma;


# 4 Usando a visão “vw_ Alunos_Turma” exiba a turma com maior número de alunos.

select * from vw_Alunos_Turma where quantidade >= (select max(quantidade) from vw_Alunos_Turma);


# 5 Crie uma visão “vw_ Turma_Curso" que exiba o curso e a quantidade de turmas.
Create view vw_Turma_Curso as
Select tbCurso.nomeCurso, count(*) as Quantidade_turmas
from tbCurso inner join tbTurma
on tbCurso.codCurso = tbTurma.codCurso
group by nomeCurso;

Select * from vw_Turma_Curso;


# 6 Usando a visão “vw_ Turma_Curso exiba o curso com menor número de turmas.

Select * from vw_Turma_Curso where Quantidade_turmas = (Select min(Quantidade_turmas) from vw_Turma_Curso);


# Arthur Oliveira Silva 2Ano Mtec DS Guarulhos