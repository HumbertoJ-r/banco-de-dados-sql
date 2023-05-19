insert into medico (nome) values

select * from medico;

insert into especialidade (especialidade) values

select * from especialidade;

insert into pacientes (nome, data_nascimento, endereco, telefone, email, cpf, rg) values
select * from pacientes;

insert into especialidade_medico (id_medico, id_especialidade) values

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

select * from medico;
select * from especialidade;
select * from consulta;
select * from enfermeiro;

insert into enfermeiro (nome, cpf, cre) values

select * from receita;
insert into receita (medicamentos) values


select * from quarto;

insert into quarto (numero) values


select * from tipo_quarto;
alter table tipo_quarto change column descriao descricao varchar (45) null;
insert into tipo_quarto (descricao, valor_diaria) values


select * from pacientes;
select * from medico;
update pacientes set id_convenio =  where idpacientes = ;
select * from especialidade_medico;
insert into especialidade_medico (id_medico, id_especialidade) values


select * from consulta;

update consulta set id_espe = , id_convenio = , id_receita =  where idconsulta = ;
update consulta set id_espe = , id_convenio = , id_receita =  where idconsulta = ;
update consulta set id_espe = , id_convenio = , id_receita =  where idconsulta = ;
update consulta set id_espe = , id_convenio = , id_receita =  where idconsulta = ;
update consulta set id_espe = , id_receita =  where idconsulta = ;
update consulta set id_espe =   where idconsulta = ;
update consulta set id_espe =   where idconsulta = ;
update consulta set id_espe =   where idconsulta = ;
update consulta set id_espe =   where idconsulta = ;
update consulta set id_espe =   where idconsulta = ;
update consulta set id_espe =   where idconsulta = ;
update consulta set id_espe =   where idconsulta = ;
update consulta set id_espe =   where idconsulta = ;
update consulta set id_espe =   where idconsulta = ;

select * from internacao

insert into internacao (data_entrada, data_alta, procedimento, id_quarto, id_medico, id_pacientes) values


select * from internacao_enfermeiro;
select * from internacao
select * from quarto
select * from enfermeiro 
insert into internacao_enfermeiro (id_internacao, id_enfermeiro) values
