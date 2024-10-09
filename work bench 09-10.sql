-- Exibir as bases de dados 
show databases;
-- apagar a base de dados;
drop database pizzaria;
-- Criar base de dados (database)
create database if not exists pizzaria;
-- utilizar a base de dados 
use pizzaria;
-- criar tabelas clientes
create table if not exists clientes(
id int not null auto_increment primary key,
nome varchar(30),
telefone varchar(14),
logradouro varchar(30),
numero int,
complemento varchar(30),
bairro varchar(30),
referencia varchar(30)
);
-- tabela de pizzas 
create table if not exists pizzas (
id int not null auto_increment primary key,
nome varchar(30),
descricao varchar(100),
valor decimal(15,2)
);
-- exibir tabelas 
show tables;
-- apagar a tabela 
drop table if exists pedidos;
-- pedidos
create table if not exists pedidos (
id int not null auto_increment primary key,
cliente_id integer,
data datetime,
valor decimal(15,2)
);
alter table pedidos add foreign key (cliente_id) references clientes (id);
-- exibir a estrutura da tabela
describe pedidos;
-- Tabela ITEM_PEDIDO
CREATE TABLE Itens_pedido (
pedido_id INTEGER,
pizza_id INTEGER,
quantidade int,
valor DECIMAL(15,2),
primary key (pedido_id, pizza_id),
FOREIGN KEY (pizza_id)
REFERENCES pizzas (id),
FOREIGN KEY (pedido_id)
REFERENCES pedidos (id)
);
INSERT INTO clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia)
VALUES  ('(11) 1111-1111', 'Alexandre Santos', 'Rua das Palmeiras', 111, 
NULL, 'Bela Vista', 'Em frente a escola');
-- apagar coluna da tabela 
-- alter table clientes drop telefone;
-- adicionar uma coluna 
-- alter table clientes add tell numeric(15);
-- alterar o tipo de dados de um campo da tabela 
-- alter table clientes modify tell varchar(14);
-- alterar o tipo de dados e nome da tabela
-- alter table clientes change tell telefone varchar(14);
INSERT INTO clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia)
VALUES ('(22) 2222-2222', 'Bruna Dantas', 'Rua das Rosas', 222, 
NULL, 'Cantareira',NULL);
INSERT INTO clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia)
VALUES ('(33) 3333-3333', 'Bruno Vieira', 'Rua das Avencas', 333, 
NULL, 'Bela Vista',NULL);
INSERT INTO clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia)
VALUES ('(44) 4444-4444', 'Giulia Silva', 'Rua das Cravos', 444, 
NULL, 'Cantareira', 'Esquina do Mercado');
INSERT INTO clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia)
VALUES ('(55) 5555-5555', 'José Silva', 'Rua das Acácias', 555, 
NULL, 'Bela Vista',NULL);
INSERT INTO clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia)
VALUES ('(66) 6666-6666', 'Laura Madureira', 'Rua das Gardências', 666, 
NULL, 'Cantareira',NULL);
update clientes set telefone = '(11) 1111-1111' where id = 1;
select * from clientes;
insert into pizzas (nome, valor)
values ('Provolone', 17),
('Portuguesa', 15),
('4 Queijos', 20),
('Calabresa', 17);
insert into pizzas (nome) values ('Escaroola');
alter table pizzas modify valor decimal (15,2) default 99;
insert into pizzas (nome) values ('Moda da Casa');
insert into pedidos (id, cliente_id, data, valor)
values(1, 1, '2016-12-15 20:30:00' , 32),
(2, 2, '2016-12-15 20:38:00', 40.00),
(3, 3, '2016-12-15 20:59:00', 22),
(4, 1, '2016-12-17 22:00:00', 42),
(5, 2, '2016-12-18 19:00:00', 45),
(6, 3, '2016-12-18 21:12:00', 44),
(7, 4, '2016-12-19 22:22:00', 72),
(8, 6, '2016-12-19 22:26:00', 34.0);
select * from pedidos;
insert into itens_pedido (pedido_id, pizza_id, quantidade, valor)
values (1, 1, 1, 15.00),
(1, 4, 1, 17.00),
(2, 3, 2, 40.00),
(3, 5, 1, 22.00),
(4, 3, 1, 20.00),
(4, 5, 1, 22.00),
(5, 1, 3, 45.00),
(6, 5, 2, 44.00),
(7, 1, 2, 30.00),
(7, 3, 1, 20.00),
(7, 5, 1, 22.00),
(8, 4, 2, 34.00);
select * from itens_pedido;
/*
select [distinct] <colunas>
from <tabelas>
[where condição]alter
[group by <coluna>]
[having <condição>]alter
[order by <coluna>];
*/
-- apagar coluna da tabela 
-- alter table clientes drop telefone;
-- adicionar uma coluna 
-- alter table clientes add tell numeric(15);
-- alterar o tipo de dados de um campo da tabela 
-- alter table clientes modify tell varchar(14);
-- alterar o tipo de dados e nome da tabela
-- alter table clientes change tell telefone varchar(14);
-- selecionar todos os valores 
select * from pizzas;
select valor, id, nome from pizzas;
-- A sequencia das colunas podem ser alteradas
select valor, id, nome from pizzas;
-- nome da coluna exibindo na resposta do comando pode ser alterado com a cláusula AS
select id as codigo, nome, valor as 'Valor R$' from pizzas;
-- operações aritiméticas
select 10 + 3, 10 - 3, 10 / 3, 10 * 3;
select 10 + 3 as SOMA, 10 - 3 as SUBTRACAO, 10 / 3 as 'Divisão', 10 * 3 as Multiplicacão;
select id, nome, valor, valor as '+10%' from pizzas;
select *, ((valor*10)/100) + valor as '+10%' from pizzas;

/* funcoes de agregaçãoptimize
*conhecidas como funções estatísticas, as funções de agregação obtêm informação sobre conjuntos de linhas especificados.
* AVG(coluna) média dos valores das colunas.
* COUNT numero de linhas
* MAX (coluna) maior valor da coluna.
* MIN (coluna) Menor valor da coluna.
* SUM (coluna) soma dos valores da coluna
*/

select count(*) from pizzas;
-- contar quantas pizzas
select count(nome) from pizzas;
select count(valor) from pizzas;

-- Qual é a média de preço das pizzass?
select avg(valor) as media from pizzas;
select avg(valor) as media from pizzas where nome like '%esa';

-- Qual é o valor da pizza mais cara do da pizzaria ?
select max(valor) as 'maior valor' from pizzas;
--  Qual é o valor  pizza mais barata do cardápio da oizzaria ?
select min(valor) as 'menor valor' from pizzas;
--  Qual é o valor total do pedido numero 7 ?
select  sum(valor) from  itens_pedido where pedido_id = 7;
select pedido_id as pedido, sum(valor) as 'valor pedido' from itens_pedido group by pedido_id;
select * from itens_pedido;	

select pedido_id as pedido, sum(valor) as 'valor pedido',
 sum(quantidade) as 'qtde pizzas',
 avg(valor) as media,
 sum(valor) / sum(quantidade) as 'valor medio'
 from itens_pedido
group by pedido_id;

select * from itens_pedido;

-- INNER JOIN: Retorna registros quando há pelo menos uma correspondências em ambas as tabelas.

select clientes.id as id_cliente, nome, telefone, pedidos.id as pedido, valor from clientes
inner join pedidos on pedidos.cliente_id = clientes.id;

select * from clientes;
select * from pedidos;


-- LEFT JOIN ou(LEFT OUTER JOIN): Retorna todos os registros da tabela da esquerda
-- (primeira tabela mencionada) e os registros correspondentes da tabela da direita 
-- (segunda tabela mencionada).

select clientes.id as id_cliente, nome, telefone, pedidos.id as pedido, valor from clientes
left join pedidos on pedidos.cliente_id = clientes.id;

select clientes.id as id_cliente, nome, telefone, pedidos.id as pedido, valor from clientes
right join pedidos on pedidos.cliente_id = clientes.id;

insert into pedidos(id, data, valor) values (9, '2024-10-02', 0);

-- Quantidade de pedido(s) realizado(s) por cliente, exibir nome do cliente e quantidade de pedidos realizados
select nome,count(pedidos.id) from clientes
left join pedidos on clientes.id = pedidos.cliente_id 
group by nome, telefone;

select sum(valor) from  itens_pedido;

-- 1
select clientes.nome, pedidos.id from pedidos
 inner join clientes on pedidos.cliente_id = clientes.id;
 
  select * from clientes;
 
 select * from pedidos;
 
 -- 2
	
select id, count(id) as 'total de pedidos' from pedidos;

 
 -- 3
 select pedidos.id as pedido, pedidos.data, clientes.nome from pedidos
 inner join clientes on pedidos.cliente_id = clientes.id
 where pedidos.data > '2016-12-15';
 
 -- 4
 select sum(quantidade) as total_pizzas, count(pedidos.id) as total_pedido from itens_pedido 
inner join pedidos on itens_pedido.pedido_id = pedidos.id
inner join clientes on pedidos.cliente_id = clientes.id
where clientes.nome = 'Alexandre Santos';


-- 5
select clientes.nome, pedidos.id from pedidos
left join clientes on pedidos.cliente_id = clientes.id;


-- 6
select sum(valor) from  itens_pedido;


-- 7



-- 8
select  clientes.nome, pedidos.id as pedido, pedidos.data, pedidos.valor from clientes
inner join pedidos on pedidos.cliente_id = clientes.id
where pedidos.data between '2016-12-01' and '2016-12-31 23:59:59';

-- 9
select avg(valor) as media from pizzas;

-- 10
select cliente_id, clientes.nome, sum(pedidos.valor) as valor_total, count(pedidos.id) as total_pedidos from pedidos
left join clientes on clientes.id = pedidos.cliente_id
group by clientes.id, clientes.nome;

-- 11
select max(valor) as 'maior valor' from pizzas;

-- 12
select min(valor) as 'menor valor' from pizzas;


-- 13
select cliente_id, clientes.pedidos, sum(pedidos.valor) as valor_total, count(pedidos.id) as total_pedidos from pedidos
left join clientes on clientes.id = pedidos.cliente_id;



-- 15
select count(distinct pedido_id) as total_pedidos, avg(quantidade) as media_pizzas from itens_pedido;


-- 16
select sum(quantidade) as total_pizzas, count(pedidos.id) as total_pedido from itens_pedido 
inner join pedidos on itens_pedido.pedido_id = pedidos.id
inner join clientes on pedidos.cliente_id = clientes.id
where clientes.nome = 'Bruna Dantas';











