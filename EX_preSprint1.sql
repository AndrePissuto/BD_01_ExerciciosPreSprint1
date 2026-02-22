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

select * from esporte;

/*Ex 3*/

create database desenho;
use desenho;

create table animacao(
	id int primary key auto_increment,
	titulo varchar(50),
    lancamento date,
    EmissoraOriginal varchar(50),
    classificacao int,
    stts varchar(15),
    nota decimal(2,1)
) auto_increment = 10;

alter table animacao add constraint chkLancamento check(lancamento <= '2026-02-21');
alter table animacao add constraint chkClassificacao check(classificacao = 0 or classificacao = 10 or classificacao = 12 or classificacao = 14 or classificacao = 16 or classificacao = 18);
alter table animacao add constraint chkNota check(nota >= 0 and nota <= 5);

insert into animacao values 
(default, 'Hora de aventura', '2010-04-05', 'Cartoon Network', 12, 'finalizado', 5.0),
(default, 'apenas um show', '2010-09-06', 'Cartoon network', 12, 'finalizado', 5.0),
(default, 'Coragem o cão covarde', '1999-11-12', 'Cartoon network', 10, 'finalizado', 3.5),
(default, 'Du, Dudu e Edu', '1999-01-04', 'Cartoon network', 10, 'finalizado', 3.5);

select * from animacao;

select * from animacao where classificacao <= 14;

select * from animacao where emissoraOriginal = 'Cartoon network';

alter table animacao add constraint chkStatus check(stts = 'exibindo' or stts = 'finalizado' or stts = 'cancelado');

update animacao set stts = 'finalizado' where id = 1; 
update animacao set stts = 'finalizado' where id = 2;

delete from animacao where id = 12;

select * from animacao where titulo like 'h%';

alter table animacao drop constraint chkClassificacao;

alter table animacao rename column classificacao to classificacaoIndicativa;

alter table animacao add constraint chkClassificacao check(classificacaoIndicativa = 0 or classificacaoIndicativa= 10 or classificacaoIndicativa= 12 or classificacaoIndicativa = 14 or classificacaoIndicativa= 16 or classificacaoIndicativa= 18);

update animacao set lancamento = '2026-02-21', nota = 1 where id = 11;

truncate animacao;

alter table animacao drop constraint chkStatus;

/*Ex 4*/

create database estoque;
use estoque;

create table MisteriosSA(
 id int primary key,
 nome varchar(50),
 dtCompra date,
 preco decimal(6,2),
 peso int,
 dtRetirada date
);

select * from misteriossa;

insert into misteriossa values
(1, 'Caixa Misteriosa Pequena', '2026-01-10', 89.90, 2000, null),
(2, 'Kit Enigma Premium', '2026-01-15', 199.50, 5000, null),
(3, 'Pacote Surpresa Gold', '2026-01-20', 349.99, 8000, null),
(4, 'Maleta Secreta Deluxe', '2026-02-01', 499.00, 12000, null),
(5, 'Biscoito Scooby', '2026-02-05', 129.75, 3000, null);

select nome, dtCompra, dtRetirada, id from misteriossa order by dtcompra;

update misteriossa set dtRetirada = now() where nome = 'Biscoito Scooby';

alter table  misteriossa rename column id to idComida;

update misteriossa set nome = 'Biscoito Scooby' where idComida = 1;
update misteriossa set nome = 'Cachorro-quente' where idComida = 2;
update misteriossa set nome = 'Biscoito Scooby' where idComida = 3;
update misteriossa set nome = 'Cachorro-quente' where idComida = 4;
update misteriossa set nome = 'Biscoito Scooby' where idComida = 5;

alter table misteriossa add constraint chkNome check(nome = 'Biscoito Scooby' or nome = 'Cachorro-quente');

select idComida, nome, dtCompra as 'data da compra', preco, peso, dtRetirada as 'data da retirada' from misteriossa;

select * from misteriossa where dtCompra < '2024-06-25';

select * from misteriossa where preco >= 30.50;

truncate misteriossa;

/*Ex 5*/

create database vingadores;
use vingadores;

create table heroi(
	id int primary key auto_increment,
    nome varchar(45),
    versao varchar(45),
    habilidade varchar(45) unique not null,
    altura int
);

insert into heroi values
(default, 'Homem-Aranha', 'Homem-Aranha: Sem Volta Para Casa', 'Sentido Aranha', 178),
(default, 'Batman', 'Batman: O Cavaleiro das Trevas', 'Intelecto Estratégico', 188),
(default, 'Superman', 'O Homem de Aço', 'Super Força', 191),
(default, 'Mulher-Maravilha', 'Mulher-Maravilha', 'Laço da Verdade', 183),
(default, 'Flash', 'The Flash', 'Super Velocidade', 180);

alter table heroi add column regeneracao boolean;

alter table heroi modify column versao varchar(100);

delete from heroi where id = 3;

insert into heroi values (default, 'tarzan', 'Tarzan', 'Pendurar em arvores', 190, false);

select * from heroi where nome like 'H%' or nome like 'C%';

select * from heroi where nome not like '%a%';

select nome from heroi where altura > 190;

select * from heroi where altura > 180 order by nome desc;

truncate heroi;