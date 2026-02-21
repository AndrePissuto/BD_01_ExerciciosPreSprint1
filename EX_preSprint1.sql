/*Ex 1*/
create database game_store;
use game_store;

create table jogo(
	id int primary key auto_increment,
    nome varchar(30),
    diretor varchar(30),
    genero varchar(30),
    lancamento date,
    nota decimal(3,1),
    quantidade int
);

alter table jogo add constraint chkQuantidade check(quantidade >= 0);

insert into jogo values 
(default, 'calda', 'pedro', 'tiro', '6767-12-31', 09.3 , 00),
(default, 'teclas', 'carlos', 'terror', '2010-11-10', 10, 90),
(default, 'em busca do teams', 'agnaldo', 'exploracao', '2000-07-14', 08, 61),
(default, 'helpme', 'claudia', 'tiro', '2004-04-16', 05.5, 67),
(default, 'ff', 'julia', 'terror', '1994-09-01', 07, 100);

insert into jogo value (default, 'teste', 'teste', 'teste', '0001-01-01', 10, 0);

alter table jogo add column midia varchar(7), add constraint chkMidia check(midia = 'Fisica'  or midia = 'Digital');

update jogo set midia = 'Digital' where id = 6;
update jogo set midia = 'Fisica' where id = 7;
update jogo set midia = 'Fisica' where id = 8;
update jogo set midia = 'Digital' where id = 9;
update jogo set midia = 'Digital' where id = 10;
update jogo set midia = 'Fisica' where id = 11;

select * from jogo;

select * from jogo where lancamento > '2015-01-01';

select * from jogo where nome like '%a%' and midia = 'Fisica';

select * from jogo where diretor not like '%e%';

alter table jogo add constraint chkNota check(nota >= 0 and nota <= 10);

select * from jogo where genero = 'tiro' and quantidade > 0;

delete from jogo where quantidade = 0;

alter table jogo rename column diretor to criador;

/*Ex 2*/

create database olimpiedas;
use olimpiedas;

create table esporte(
	id int primary key auto_increment,
    nome varchar(40),
    categoria varchar(20),
    numJogadores int,
    estreia date,
    paisOrigem varchar(30)
);

alter table esporte add constraint chkCategoria check(categoria = 'Individual' or categoria = 'Coletivo');

insert into esporte values 
(default, 'Futebol', 'Coletivo', 11, '1863-10-26', 'Inglaterra'),
(default, 'Basquete', 'Coletivo', 5, '1891-12-21', 'Estados Unidos'),
(default, 'Tênis', 'Individual', 1, '1873-01-01', 'Inglaterra'),
(default, 'Vôlei', 'Coletivo', 6, '1895-02-09', 'Estados Unidos'),
(default, 'Handebol', 'Coletivo', 7, '1917-01-01', 'Alemanha');

alter table esporte add column popularidade decimal(3,1);

alter table esporte  add constraint chkPopularidade check(popularidade >= 0 and popularidade <= 10);

desc esporte;

update esporte set popularidade = 10 where id = 1;
update esporte set popularidade = 10 where id = 2;
update esporte set popularidade = 6.5 where id = 3;
update esporte set popularidade = 7 where id = 4;
update esporte set popularidade = 5.5 where id = 5;

select * from esporte order by popularidade;

select * from esporte where estreia >= '2000-01-01';

update esporte set estreia = '1897-04-06' where id = 1;
update esporte set estreia = '1897-04-06' where id = 3;
update esporte set estreia = '1897-04-06' where id = 4;
update esporte set estreia = '1897-04-06' where id = 2;

alter table esporte add constraint chkEstreia check(estreia >= '1896-04-06' and estreia <= '2026-02-20');

alter table esporte drop constraint  chkCategoria;

select * from esporte where nome like '_a%';

select * from esporte where numJogadores >= 4 and numJogadores <= 11;

delete from esporte where id in (1,3,5);

select * from esporte