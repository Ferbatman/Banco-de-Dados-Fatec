# Exercício 18
#a)

select nome, idade from aluno;

#b)

select * from aluno
where idade > 18;

#c)

select nome, codigo_cur
from aluno, matricula
where codigo = codigo_alu and codigo_cur = 1;

#d)

select c.nome, horario
from aluno as a, matricula as m, curso as c
where a.codigo = codigo_alu and c.codigo = codigo_cur and a.nome = "Pedro Costa";

#e)

select a.nome 
from aluno as a inner join matricula as m on a.codigo = m.codigo_cur
where m.codigo_cur = 2 or m.codigo_cur = 3;