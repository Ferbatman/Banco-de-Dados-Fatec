#A)
select nome, idade from vendedor;

#B)
select v.codigo, v.salario
from vendedor as v inner join pedido as p on v.codigo = p.codigo_ven;

#B) Quais vendedores que NÃO tem pedido
select codigo, salario from vendedor 
where codigo not in (select codigo_ven from pedido);

#C)
select p.numero, v.nome
from pedido as p inner join vendedor as v on p.codigo_ven = v.codigo
inner join cliente as c on p.codigo_cli = c.codigo
where c.tipo = "Indústria";

#D)
select p.quantidade, v.idade, c.tipo
from pedido as p inner join vendedor as v on p.codigo_ven = v.codigo
inner join cliente as c on p.codigo_cli = c.codigo
where v.nome = "João";

#E)
select distinct cidade from cliente;

select cidade from cliente group by cidade;

#F)
select max(idade) from vendedor;

#G
select avg(salario) as MediaSalario from vendedor;

#H
select codigo_ven, count(*) as Qnd_Pedido
from pedido
group by codigo_ven;