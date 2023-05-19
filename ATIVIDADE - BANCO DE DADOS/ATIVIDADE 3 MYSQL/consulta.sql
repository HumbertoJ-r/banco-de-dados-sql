select * from consulta
use hospital_senac_humberto

select consulta.data from consulta
select idconsulta, data, id_convenio from consulta order by id_convenio;


select avg(valor) from consulta where data >= '2020-01-01' and data < '2021-01-01' and id_convenio is null;
select avg(valor) from consulta where data >= '2020-01-01' and data < '2021-01-01' and id_convenio is not null;

select * from consulta where data >= '2020-01-01' and data < '2021-01-01' 

SELECT * (select avg(valor) as media from consulta  WHERE year(data_consulta) in ('2020') and convenio_id is null)as media
from consulta
where year(data_consulta) in ('2020');

update consulta set data = '2020-03-22' where idconsulta = 66