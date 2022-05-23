# a.	Nome do município, número da zona e número da seção eleitoral, ordenar por nome do município e número da zona

select m.nome as nome_municipio, z.num as numero_zona, s.num as numero_secao
from municipio as m inner join zona as z on m.cod = z.cod_m
	inner join secao as s on z.num = s.num_z
order by nome_municipio, numero_zona;

#b.	Nome do município e quantidade de zonas eleitorais possui cada município

select m.nome, count(*) as qtd_zonas
from municipio as m inner join zona as z on m.cod = z.cod_m
group by m.nome;

#c.	Número da zona e quantidade de seções possui cada zona eleitoral do município de “Presidente Prudente”

select z.num, count(*) as qtd_secoes
from municipio as m inner join zona as z on m.cod = z.cod_m
	inner join secao as s on z.num = s.num_z
where m.nome = "Presidente Prudente"
group by z.num;

#d.	Nome do município que inicie com “Pres”

select nome from municipio where nome like "Pres%";

#e.	Nome dos municípios e nome dos candidatos a prefeito, ordenar por nome do município

select m.nome as nome_municipio, c.nome as nome_candidato
from municipio as m inner join candidato as c on m.cod = c.cod_m
where c.cargo = "Prefeito"
order by nome_municipio;

#f.	Nome dos candidatos a vereador e o nome do partido que eles estão vinculados

select c.nome as candidato_vereador, p.nome as partido_vinculado
from candidato as c inner join partido as p on c.cod_p = p.cod
where c.cargo = "Vereador";

#g.	Nome dos candidatos a prefeito e a quantidade de votos deles

select c.nome as candidato_prefeito, count(*) as qtd_votos
from candidato as c inner join voto as v on v.cod_c = c.cod
where c.cargo = "Prefeito"
group by v.cod_c;

#h.	Sigla dos partidos políticos e a quantidade de votos deles

select p.sigla as partido_politico, count(*) as qtd_votos
from candidato as c inner join partido as p on c.cod_p = p.cod
	inner join voto as v on v.cod_c = c.cod
group by partido_politico;

#i.	Quantidade total de votos da eleição

select max(cod) as total_votos from voto;

#j.	Nome dos candidatos e a quantidade de votos deles, ordenar por quantidade de votos decrescente

select c.nome as nome_candidato, count(*) as qtd_votos
from candidato as c inner join voto as v on v.cod_c = c.cod
group by nome_candidato
order by qtd_votos desc;

#k.	Nome do eleitor, nome do município, número da zona e número da seção, ordenar pelo código do município

select e.nome as nome_eleitor, m.nome as nome_municipio, z.num as numero_zona, s.num as numero_secao
from municipio as m inner join zona as z on m.cod = z.cod_m
	inner join secao as s on z.num = s.num_z
    inner join eleitor as e on s.num = e.num_s
order by m.cod;