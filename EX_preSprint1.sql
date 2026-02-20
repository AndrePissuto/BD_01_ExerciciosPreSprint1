create database game_store;

create table jogo(
	id int primary key auto_increment,
    nome varchar(30),
    diretor varchar(30),
    genero varchar(30),
    lancamento date,
    nota decimal(3,1),
    quantidade int
);

alter table jogo add constraint chkNota check(nota >= 0 and nota <= 10);
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


