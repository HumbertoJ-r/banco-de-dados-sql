use hospital_senac_humberto

insert into medico (nome) values
('Gael Milheiro Lemes'),
('Gisela Espinosa'), 
('Nelson Anjos Palmeira'),
('Ezequiel Pestana Henriques'),
('Tito Carqueijeiro'), 
('Fabiano Gomide');
select * from medico;

insert into especialidade (especialidade) values
('pediatria'),
('clinico geral'),
('gastroenterologia'), 
('demartologia'),
('alergista'),
('obstetra'), 
('cardiologista');
select * from especialidade;

insert into pacientes (nome, data_nascimento, endereco, telefone, email, cpf, rg) values
('Karine Macena Porciuncula','1970-10-11','rua flores, 10 apto 10','(69) 3752-5488','karinemacena@google.com.br','861.324.473-09','00.000.000-1'),
('Zilda Gomide Osorio','1990-8-27','Avenida Japao, 50', '(97)2810-2734','zildagomide@goolge.com','628.769-780-67','00.000.000-2' ),
('Fabricio Norões Xavier','1981-1-15','Rua Albieri, 480','(79) 2718-0264','fabricionoroes@google.com.br','808.142.790-23','00.000.000-3'), 
('Cesar Sitima Faria','1972-3-22','Travessa A, 89', '(61) 3019-1483', 'cesarsitma@google.com.br','209.249.870-30','00.000.000-4' ),
('Silvana Fartaria Nazario', '1964-2-13', 'Rua das Rosas, 80, apto 200', '(82)2433-7762','silvanafartaria@gmail.com','386.037.378-61','00.000.000-5'),
('Evandro Trindade Bouca','1980-9-12','Avenida Santos, 90','(86) 3368-4812','evandrofartaria@gmail.com','386.037.378-62','00.000.000-6'), 
('Ivo Brandao Palos','1980-10-14','Rua Alamo, 180,', '(54)3941-4795', 'ivofartaria@gmail.com','386.037.378-63','00.000.000-7'),
('Armindo Moreira Azevedo','1979-6-30','Avenida Chateaubriand, 150', '(69) 2537-6076', 'armindofartaria@gmail.com','386.037.378-64','00.000.000-8'),
('Mark Festas Santana','1973-5-19', 'Rua Flores, 670', '(83)3272-8326','markfartaria@gmail.com','386.037.378-65','00.000.000-9'), 
('Helton Espinosa','1989-8-31','Avenida das Aguas, 600', '(63)3230-5071', 'heltonfartaria@gmail.com','386.037.378-66','00.000.001-0');
select * from pacientes;

alter table pacientes modify column cpf varchar(45) not null;
alter table especialidade change column especialidade nome varchar(45);

select * from  especialidade;
alter table especialidade_medico modify column id int not null first;
alter table especialidade_medico add primary key (id);


use hospital_senac_humberto
create table especialidade_medico
(
id int not null auto_increment,
id_medico int,
id_especialidade int,
primary key (id),
foreign key (id_medico) references medico (idmedico),
foreign key (id_especialidade) references especialidade (idespecialidade)
);

select g.nome, d.nome, a.id  from medico g
join especialidade_medico a
on g.idmedico = a.id_medico
join especialidade d
on d.idespecialidade = a.id_especialidade
order by g.nome;
 
alter table consulta add foreign key (id_esp_medico) references especialidade_medico (id); 
alter table consulta change date data date null;

select e.nome, a.idconsulta from consulta a
join especialidade b
on a.idconsulta = b.idespecialidade
join convenio c 
on dconsulta = c.idconvenio
join medico d
on a.idconsulta = d.idmedico
join pacientes e 
on a.idconsulta = e.idpacientes;

select * from consulta;
select * from especialidade_medico;
select * from medico;
select * from especialidade;

select * from receita;
alter table receita change column consulta_idconsulta id_consulta int null;
alter table consulta add foreign key (id_receita) references receita (idreceital);
alter table internacao change column quarto_idquarto id_quarto int null;
alter table internacao change column medico_idmedico id_medico int null;
alter table internacao change column pacientes_idpacientes id_pacientes int null;
alter table internacao_enfermeiro change column internacao_idinternacao id_internacao int null;
alter table internacao_enfermeiro change column enfermeiro_idenfermeiro id_enfermeiro int null;
alter table internacao_enfermeiro add column id int not null auto_increment first;
alter table pacientes change column convenio_idconvenio id_convenio int null;
alter table quarto change column tipo_quarto_idtipo_quarto id_tipo_quarto int null;
select * from internacao_enfermeiro;
alter table internacao_enfermeiro add column id int;
drop table internacao_enfermeiro;
create table internacao_enfermeiro
(
id int not null auto_increment,
id_internacao int null,
id_enfermeiro int null,
primary key (id),
foreign key (id_enfermeiro) references enfermeiro (idenfermeiro),
foreign key (id_internacao) references internacao (idinternacao)
);

select * from convenio;
alter table convenio modify column nome_convenio varchar (45) null;
alter table convenio modify column cnpj varchar (45) null;
alter table convenio modify column carencia date null;
alter table convenio modify column carteira_convenio int null;

insert into convenio (nome_convenio, cnpj, carencia, carteira_convenio) values
('Mais Vida','96.120.685/0001-89','2022-10-17','1'),
('Cura Mais','51.372.623/0001-26','2016-11-20','2'),
('Paga Muito','93.619.527/0001-80','2015-12-30','3'),
('Cobra Cairo','76.964.645/0001-06','2014-06-14','4');

select * from medico;
select * from especialidade;
select * from consulta;
select * from enfermeiro;

insert into enfermeiro (nome, cpf, cre) values
('Antonio Carlos','715.060.950-38','34589'),
('Julia Santos','746.189.700-49','98790'),
('Larissa Ramos','658.561.480-10','56783'),
('Ricardo Lemos','632.187.310-11','78964'),
('Sebastian Vicente','870.801.840-53','12773'),
('Adriely Cardoso','237.391.780-14','34557');

select * from receita;
insert into receita (medicamentos) values
('xarope');

select * from quarto;

insert into quarto (numero) values
('1'), ('2'), ('3');

select * from tipo_quarto;
alter table tipo_quarto change column descriao descricao varchar (45) null;
insert into tipo_quarto (descricao, valor_diaria) values
('Quarto Dulpo','200'), ('Enfermaria','250'), ('Apartamento','300');

select * from pacientes;
select * from medico;
update pacientes set id_convenio = '4' where idpacientes = '11';
select * from especialidade_medico;
insert into especialidade_medico (id_medico, id_especialidade) values
('3', '7');

select * from consulta;

update consulta set id_espe = '1', id_convenio = '4', id_receita = '1' where idconsulta = '57';
update consulta set id_espe = '2', id_convenio = '3', id_receita = '2' where idconsulta = '58';
update consulta set id_espe = '4', id_convenio = '2', id_receita = '3' where idconsulta = '59';
update consulta set id_espe = '7', id_convenio = '1', id_receita = '4' where idconsulta = '60';
update consulta set id_espe = '2', id_receita = '5' where idconsulta = '61';
update consulta set id_espe = '3'  where idconsulta = '62';
update consulta set id_espe = '5'  where idconsulta = '63';
update consulta set id_espe = '6'  where idconsulta = '64';
update consulta set id_espe = '7'  where idconsulta = '65';
update consulta set id_espe = '3'  where idconsulta = '66';
update consulta set id_espe = '1'  where idconsulta = '67';
update consulta set id_espe = '2'  where idconsulta = '68';
update consulta set id_espe = '4'  where idconsulta = '69';
update consulta set id_espe = '7'  where idconsulta = '70';

select * from internacao

insert into internacao (data_entrada, data_alta, procedimento, id_quarto, id_medico, id_pacientes) values
('2017-1-2','2017-1-5','observacao','1','1','11'),
('2018-2-3','2018-2-10','cirugia','2','2','12'),
('2019-3-4','2019-3-17','medicacao','3','3','13'),
('2020-4-5','2020-4-11','observacao','1','4','14'),
('2021-5-6','2021-5-19','cirugia','2','5','15'),
('2022-6-7','2022-6-30','cirugia','3','6','16'),
('2022-7-8','2022-7-25','observacao','2','7','11'),
('2021-8-9','2021-8-23','medicacao','1','8','12');

select * from internacao_enfermeiro;
select * from internacao
select * from quarto
select * from enfermeiro 
insert into internacao_enfermeiro (id_internacao, id_enfermeiro) values
('17','1'),('18','2'),('19','3'),('20','4'),('21','5'),('22','6'),('23','1'),('24','2'),
('17','2'),('18','3'),('19','4'),('20','5'),('21','6'),('22','1'),('23','2'),('24','3');

alter table medico modify column em_atividade bool default 0;
select * from medico;
update medico set em_atividade = '1' where idmedico = 1;
update medico set em_atividade = '1' where idmedico = 2;
update medico set em_atividade = '1' where idmedico = 3;
update medico set em_atividade = '1' where idmedico = 4;
update medico set em_atividade = '1' where idmedico = 5;
update medico set em_atividade = '1' where idmedico = 6;
update medico set em_atividade = '1' where idmedico = 7;
update medico set em_atividade = '1' where idmedico = 8;

select * from quarto;
select * from tipo_quarto;
select * from internacao;
select * from consulta; 
select * from convenio;

update internacao set data_alta = '2018-02-06' where idinternacao = 18;
update internacao set data_alta = '2021-02-09' where idinternacao = 21;

delete from consulta where id_convenio = 4;
alter table consulta add constraint id_convenio foreign key (id_convenio) references convenio (idconvenio) on delete cascade;
