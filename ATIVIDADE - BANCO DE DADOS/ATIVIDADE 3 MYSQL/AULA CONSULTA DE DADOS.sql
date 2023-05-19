use super;
create table produtos 
ALTER TABLE prdoutos RENAME TO produtos;

(
idProduto int not null auto_increment,
nomeProduto varchar (200),
categoriaProduto varchar (200),
valorVendaProduto double (9,2),
quantidadeProduto int, 
primary key (idProduto)
);

select * from produtoscategoriaProduto
alter table produtos modify column categoriaProduto varchar(200) null;


insert into produtos (nomeProduto, categoriaProduto, valorProduto, quantidadeProduto) values
('Refrigerante','Bebidas','5.50','300'),
('Arroz 5Kg','Mercearia','8.50','100'),
('Feijão','Mercearia','6.50','800'),
('Detergente','Limpeza','2.10','100'),
('Leite','Laticínios','2.70','600'),
('Bolacha recheada','null','1.50','200'),
('Leite Condensado','Mercearia','4.50','500');

select * from produtos where nomeProduto = 'Leite'
select nomeProduto, valorProduto from produtos where nomeProduto = 'Leite'
select nomeProduto, categoriaProduto, valorProduto from produtos where categoriaProduto <> 'Mercearia'
select * from produtos where valorProduto = 1.50 and quantidadeProduto = 200
select * from produtos where categoriaProduto = 'limpeza' or valorProduto = 5.50
select * from produtos where (categoriaProduto = 'limpeza' or categoriaProduto = 'mercearia') and valorProduto = 6.50
select * from produtos where not categoriaProduto = 'mercearia'
select * from produtos where quantidadeProduto >= 300
select * from produtos where valorProduto <= 5
select * from produtos where categoriaProduto in ('limpeza', 'bebidas', 'laticínios')
select * from produtos where categoriaProduto not in ('limpeza', 'bebidas', 'laticínios')
select nomeProduto, valorProduto from produtos where nomeProduto like '%leite%'
select * from produtos where idProduto = 10
select * from produtos where categoriaProduto is not null
select * from produtos where categoriaProduto is null
select nomeProduto, categoriaProduto, valorProduto from produtos where categoriaProduto <> 'mercearia' or categoriaProduto is null
select nomeProduto AS nome, valorProduto as valor from produtos
select (valorProduto*quantidadeProduto) as valor_total from produtos 
select (quantidadeProduto/valorProduto) as valor_total from produtos
select (quantidadeProduto-valorProduto) as valor_subtracao from produtos
select (quantidadeProduto+valorProduto) as valor_soma from produtos
select * from produtos order by nomeProduto
select * from produtos order by nomeProduto desc
select * from produtos order by categoriaProduto, nomeProduto desc
select count(nomeProduto) from produtos where nomeProduto like '%leite%'
select avg(valorProduto) from produtos 
select sum(quantidadeProduto) from produtos 
select min(valorProduto) from produtos 
select max(valorProduto) from produtos 
select min(nomeProduto) from produtos 
select max(nomeProduto) from produtos 

create table vendas 
(
IdVenda int auto_increment,
idProduto int,
quantidadeVenda int,
valorVendido double (9,2),
dataVenda date,
Primary key (idVenda)
);

insert into Vendas (idProduto, quantidadeVenda, valorVendido, dataVenda) values
('9','10','8.50','2022-12-31'), 
('9','15','8.50','2022-01-01'),
('8','3','5.50','2022-01-15');

select * from produtos 
select * from VENDAS

select * from produtos where valorProduto = (select max(valorproduto) from produtos)
select * from produtos where valorProduto <> (select max(valorproduto) from produtos)
select nomeproduto from produtos where idProduto in (select idproduto from vendas)

select p.nomeproduto, 
(select sum(v.quantidadeVenda * v.valorVendido)
from vendas as v where v.idproduto=P.idproduto)
as total_vendido
from produtos as p

create table funcionario
(
idfuncionario int(11) auto_increment,
nomefuncionario varchar(200),
cpffuncionario varchar(11),
cidadefuncionario varchar(200),
primary key (idfuncionario)
);

create table fornecedor
(
idfornecedor int(11) auto_increment,
nomefornecedor varchar(200),
cnpjfornecedor varchar(14),
primary key (idfornecedor)
);

insert into fornecedor 
(nomefornecedor, cnpjfornecedor) values
('Brasil Alimentos','10000000000101'), 
('Laticínios Norte Minas','20000000000102'), 
('Alimentos do Centro-Oeste','30000000000103');

create table marca
(
idmarca int(11) auto_increment,
nomemarca varchar(200),
primary key(idmarca)
);

insert into marca (nomemarca) values
('Cereais do bom'),
('Bebidas do Brasil'),
('Doce Brasil');

alter table produtos add idfornecedor int;
alter table produtos add constraint fk_forncedor 
foreign key (idfornecedor) references fornecedor(idfornecedor);
alter table produtos add idmarca int;
alter table produtos add constraint fk_fornecedor
foreign key (idmarca) references marca (idmarca);

select * from produtos

update produtos set idfornecedor = 3, idmarca = 2 where idproduto = 8;
update produtos set idfornecedor = 1, idmarca = 1 where idproduto = 9;
update produtos set idfornecedor = 1, idmarca = 1 where idproduto = 10;
update produtos set idfornecedor = 3, idmarca = 1 where idproduto = 11;
update produtos set idfornecedor = 2, idmarca = 3 where idproduto = 12;
update produtos set idfornecedor = 3, idmarca = 3 where idproduto = 13;
update produtos set idfornecedor = 2, idmarca = 3 where idproduto = 14;

select produtos.nomeproduto, produtos.valorproduto, marca.nomemarca
from produtos, marca where produtos.idmarca = marca.idmarca

select p.nomeproduto, p.valorproduto, m.nomemarca
from produtos as p, marca as m where p.idmarca = m.idmarca

select p.nomeproduto, m.nomemarca, f.nomefornecedor, p.valorproduto
from produtos as p, marca as m, fornecedor as f
where p.idmarca = m.idmarca and p.idfornecedor = f.idfornecedor

select p.nomeproduto, p.valorproduto, m.nomemarca
from produtos as p join marca as m on p.idmarca=m.idmarca

select p.nomeproduto, m.nomemarca, f.nomefornecedor, p.valorproduto
from produtos as p join marca as m on p.idmarca = m.idmarca
join fornecedor as f on p.idfornecedor = f.idfornecedor

select p.nomeproduto, p.valorproduto, m.nomemarca
from produtos as p inner join marca as m on p.idmarca=m.idmarca
where p.categoriaproduto='mercearia'order by p.nomeproduto

select a.idproduto, a.nomeproduto, sum(v.quantidadevenda*v.valorvendido)
AS TOTALVENDIDO from produtos a left join vendas v
on a.idproduto = v.idproduto group by a.idproduto

select a.idproduto, a.nomeproduto, sum(v.quantidadevenda*v.valorvendido)
as totalvendido from produtos a right join vendas v
on a.idproduto = v.idproduto group by a.idproduto

insert into funcionario (nomefuncionario, cpffuncionario, cidadefuncionario) values
('João do Santos','10000000001','São Paulo'),
('Maria da Silva','20000000002','Rio de Janeiro'),
('Ana Maria','30000000003','Brasília'),
('Brasil Alimentos','40000000004','Cuiaba');

select nomefuncionario from funcionario union
select nomefornecedor from fornecedor order by nomefuncionario

select nomefuncionario from funcionario
union all select nomefornecedor from fornecedor
order by nomefuncionario

select categoriaproduto, nomeproduto
from produtos group by categoriaproduto 

select categoriaproduto, count(*) from produtos group by categoriaproduto

select categoriaproduto, min(valorproduto), max(valorproduto), avg(valorproduto),
count(*) from produtos group by categoriaproduto

select categoriaproduto, sum(quantidadeproduto) from produtos group by categoriaproduto

select categoriaproduto, count(*) from produtos group by categoriaproduto having count(*) > 1

select a.categoriaproduto, count(*), sum(b.quantidadevenda*b.valorvendido)
as totalvendido from produtos a inner join vendas b on 
(a.idproduto=b.idproduto) group by a.categoriaproduto

select year(b.datavenda), count(*), sum(b.quantidadevenda*b.valorvendido)
as totalvendido from produtos a inner join vendas b on 
(a.idproduto=b.idproduto) group by year(b.datavenda)

select categoriaproduto from produtos group by categoriaproduto

select distinct(categoriaproduto) from produtos