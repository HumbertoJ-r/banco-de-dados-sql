use hospital_senac_humberto;

/*TODOS OS DADOS E O VALOR MÉDIO DAS CONSULTAS DO ANO DE 2020 REALIAZADAS SEM CONVÊNIO.*/

SELECT * ,
(select avg(valor) as media from consulta  WHERE year(data) in ('2020') and id_convenio is null)as media
from consulta
where year(data) in ('2020');

/*TODOS OS DADOS E O VALOR MÉDIO DAS CONSULTAS DO ANO DE 2020 REALIZADAS POR CONVÊNIO*/
SELECT * ,
(select avg(valor) as media from consulta  WHERE year(data) in ('2020') and id_convenio is not null)as media
from consulta
where year(data) in ('2020');


/*CONSULTA PARA VERIFICAR INFORMAÇÕES DA COLUNA INTERNACAO.*/
select * from internacao

/*ALTERAÇÃO DA TABELA INTERNACAO COLUNA DATA_PREVIA PARA EXECUTAR A PESQUISA.*/
update internacao set data_previa = '2017-01-06' where idinternacao = '17';
update internacao set data_previa = '2018-02-05' where idinternacao = '18';
update internacao set data_previa = '2019-03-18' where idinternacao = '19';
update internacao set data_previa = '2020-04-10' where idinternacao = '20';
update internacao set data_previa = '2021-02-10' where idinternacao = '21';
update internacao set data_previa = '2022-06-29' where idinternacao = '22';
update internacao set data_previa = '2022-07-26' where idinternacao = '23';
update internacao set data_previa = '2021-08-22' where idinternacao = '24';

/*TODOS OS DADOS DAS INTERNAÇÕES QUE TIVERAM DATA DE ALTA MAIOR QUE A DATA PRECISTA PARA A ALTA*/
select * from internacao where data_previa > data_alta;

/*RECEITUÁRIO COMPLETO DA PRIMEIRA CONSULTA REGISTRADA COM RECEITUÁRIO ASSOCIADO.*/
select * from receita where id_consulta=(select min(id_consulta) from receita);

/*CONSULTA PARA VERIFICAR INFORMAÇÕES DAS TABELAS RECEITA E CONSULTA.*/
select * from receita;
select * from consulta;

/*ATUALIZAÇÃO DA TABELA RECEITA COLUNA ID_CONSULTA PARA EXECUTAR A PESQUISA.*/
update receita set id_consulta = '58' where idreceital = '1';
update receita set id_consulta = '59' where idreceital = '2';
update receita set id_consulta = '60' where idreceital = '3';
update receita set id_consulta = '61' where idreceital = '4';
update receita set id_consulta = '62' where idreceital = '5';

/*TODOS OS DADOS DA CONSULTA DE MAIOR VALOR E TAMBÉM DA DE MENOR VALOR (AMBAS AS CONSULTAS NÃO FORAM REALIZADAS SOB CONVÊNIO).*/
SELECT * FROM consulta WHERE valor=(SELECT max(valor)from consulta) or valor=(select min(valor)from consulta);

/*TODOS OS DADOS DAS INTERNAÇÕES EM SEUS RESPECTIVOS QUARTOS, CALCULANDO O TOTAL DA INTERNAÇÃO A PARTIR DO VALOR DE DIÁRIA DO QUARTO E O NÚMERO DE DIAS ENTRE A ENTRADA E A ALTA.*/
SELECT internacao.*, datediff(internacao.data_alta,internacao.data_entrada) as quant_dias, 
(datediff(internacao.data_alta,internacao.data_entrada)* tipo_quarto.valor_diaria) as valor_total
from internacao join quarto
on internacao.id_quarto=quarto.idquarto
join tipo_quarto on quarto.id_tipo_quarto=tipo_quarto.idtipo_quarto;

/* CONSULTA DAS TABELAS TIPO_QUARTO E QUARTO PARA VERIFICAR INFORMAÇÕES*/
select * from tipo_quarto;
select * from quarto;

/*ALTERAÇÃO NA TABELA QUARTO COLUNA ID_TIPO_QUARTO PARA EXECUTAR A PESQUISA*/
update quarto set id_tipo_quarto = 1 where idquarto = 1;
update quarto set id_tipo_quarto = 2 where idquarto = 2;
update quarto set id_tipo_quarto = 3 where idquarto = 3;
update internacao set data_entrada = '2021-01-06' where idinternacao = '21';

/*DATA, PROCEDIMENTO E NÚMERO DE QUARTO DE INTERNAÇÕES EM QUARTOS DO TIPO "APARTAMENTO”.*/
select internacao.data_entrada, internacao.data_previa, internacao.data_alta,internacao.procedimento, quarto.numero
from internacao join quarto on internacao.id_quarto=quarto.idquarto and quarto.id_tipo_quarto=1;

/*NOME DO PACIENTE, DATA DA CONSULTA E ESPECIALIDADE DE TODAS AS CONSULTAS EM QUE OS PACIENTES ERAM MENORES DE 18 ANOS NA DATA DA CONSULTA E CUJA ESPECIALIDADE NÃO SEJA "PEDIATRIA", ORDENANDO POR DATA DE REALIZAÇÃO DA CONSULTA.*/
select pacientes.nome,consulta.data,especialidade.nome, timestampdiff(YEAR,pacientes.data_nascimento,consulta.data) as idade
from pacientes join consulta on consulta.id_pacientes=pacientes.idpacientes
join especialidade on consulta.id_espe=especialidade.idespecialidade
where ((timestampdiff(YEAR,pacientes.data_nascimento,consulta.data) < 18) AND (especialidade.idespecialidade<>1))
order by data;

/*CONSULTA PARA VERIFICAR INFORMAÇÕES DAS TABELAS PACIENTES, ESPECIALIDADE E CONSULTA*/
select * from pacientes
select * from especialidade
select * from consulta 

/*ALTERAÇÃO DA TABELA PACIENTES COLUNA DATA_NASCIMENTO PARA EXECUTAR A PESQUISA*/
update pacientes set data_nascimento = '2010-10-11' where idpacientes = 11;
update pacientes set data_nascimento = '2009-08-27' where idpacientes = 12;
update pacientes set data_nascimento = '2008-01-15' where idpacientes = 13;

/*NOME DO PACIENTE, NOME MÉDICO, DATA DA INTERNAÇÃO E PROCEDIMENTOS DAS INTERNAÇÕES POR MÉDICOS DA ESPECIALIDADE “GASTROENTEROLOGIA”, QUE TENHAM ACONTECIDO EM “ENFERMARIA”.*/
select pacientes.nome as pacientes, medico.nome as medico, internacao.data_entrada as data_internacao ,internacao.procedimento as procedimento
from internacao join pacientes on internacao.id_pacientes=pacientes.idpacientes
join medico on internacao.id_medico=medico.idmedico
join especialidade_medico on medico.idmedico=especialidade_medico.id_medico
WHERE(especialidade_medico.id_especialidade=3 and internacao.id_quarto=2);

/*CONSULTA DAS TABELAS ESPECIALIDADE_MEDICO, TIPO_QUARTO, INTERNACAO, ESPECIALIDADE, MEDICO E PACIENTES, PARA VERIFICAR INFORMAÇÕES*/
select * from especialidade_medico;
select * from tipo_quarto;
select * from internacao;
select * from especialidade;
select * from medico;
select * from pacientes;

/*ALTERAÇÃO DA TABELA INTERNACAO COLUNA PROCEDIMENTO PARA REALIZAR A PESQUISA*/
update internacao set procedimento = 'Observacao' where idinternacao = 25;
update internacao set procedimento = 'Medicamentos' where idinternacao = 26;
update internacao set procedimento = 'Tratamento' where idinternacao = 27;

/*CONSULTA DE DADOS DAS TABELAS INTERNACAO E MEDICO*/
select * from internacao;
select * from medico;

/*MODIFICAÇÃO DA TABELA MEDICO INCLUINDO UMA COLUNA PARA REALIZAR PESQUISAR*/
alter table medico add column CRM varchar (45) null;

/*ALTERÇÃO DA TABELA MEDICO COLUNA CRM PARA REALIZAR A PESQUISA.*/
update medico set CRM = '12345-DF' WHERE idmedico = '1';
update medico set CRM = '67890-SP' WHERE idmedico = '2';
update medico set CRM = '54321-MG' WHERE idmedico = '3';
update medico set CRM = '09876-RJ' WHERE idmedico = '4';
update medico set CRM = '13579-BA' WHERE idmedico = '5';
update medico set CRM = '86420-PE' WHERE idmedico = '6';
update medico set CRM = '24680-AM' WHERE idmedico = '7';
update medico set CRM = '97531-CE' WHERE idmedico = '8';
update medico set CRM = '80235-PA' WHERE idmedico = '9';
update medico set CRM = '61728-SC' WHERE idmedico = '10';

/*OS NOMES DOS MÉDICOS, SEUS CRMS E A QUANTIDADE DE CONSULTAS QUE CADA UM REALIZOU.*/
select medico.nome, medico.crm, count(consulta.id_medico) as consultas
from medico left join consulta on consulta.id_medico=medico.idmedico
group by medico.idmedico;

/*OS NOMES, CRES E NÚMERO DE INTERNAÇÕES DE ENFERMEIROS QUE PARTICIPARAM DE MAIS DE UMA INTERNAÇÃO.*/
select enfermeiro.nome, enfermeiro.cre, count(internacao_enfermeiro.id_enfermeiro) as internações
from enfermeiro join internacao_enfermeiro on enfermeiro.idenfermeiro=internacao_enfermeiro.id_enfermeiro
where((select count(internacao_enfermeiro.id_enfermeiro) from internacao_enfermeiro) > 1)
group by enfermeiro.idenfermeiro order by internações;

/*CONSULTA DAS TABELAS INTERNACAO_ENFERMEIRO E ENFERMEIRO PARA VERIFICAR INFORMAÇÕES*/
select * from internacao_enfermeiro;
select * from enfermeiro;

/*TODAS AS INFORMAÇÕES DOS PACIENTES QUE TIVERAM MAIS DE UMA INTERNAÇÃO E O NUMERO TOTAL DE INTERNAÇOES*/
SELECT pacientes.*, count(internacao.id_pacientes) as num_internações
from pacientes join internacao on internacao.id_pacientes=pacientes.idpacientes
where((select count(internacao.id_pacientes) from internacao) > 1)
group by pacientes.idpacientes;