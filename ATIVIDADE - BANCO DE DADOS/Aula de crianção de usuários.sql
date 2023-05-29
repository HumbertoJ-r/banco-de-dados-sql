-- Comando para criar um usuário e senha --
create user 'teste1'@'localhost' identified by '';

-- Comando para pesquisar todos os usuários e seus privilegios --
select * from mysql.user;

-- Comando para apagar um usuário --
drop user 'teste1'@'localhost';

create user 'teste2'@'localhost' identified by '';

-- Comando para pesquisa apenas o local e usuário --
select host, user from mysql.user;

drop user 'teste2'@'localhost';
select host, user from mysql.user;

-- Comdando para dar todos os privilegios para o usuário -- 
grant all privileges on *.* to 'teste'@'localhost';

-- Comdando para confirmar os privilegios dado ao usuário --
flush privileges;
select * from mysql.user;

create user 'teste2'@'localhost' identified by '';

-- Comando para selecionar os privilegios aos usuários --
grant create, select, insert, update on *.* to 'teste2'@'localhost';
flush privileges;
select * from mysql.user;

-- comando utilizado para verificar os privilégios e quem deu esses privilérios para o usuário --
show grants for 'teste2'@'localhost';

-- Comando para remover todos os privilegios do usuário --
revoke all privileges on *.* from 'teste'@'localhost';
flush privileges;
show grants for 'teste'@'localhost';

-- Comando para criar roles (Roles são grupos de usuários para determinadas funções e privilégios) --
create role 'app_developer', 'app_read', 'app_write';

-- Comando para criar um bando de dados --
create database app_db;

-- Comando para usar e/ou selecionar o banco de dados --
use app_db;

grant all on app_db.* to 'app_desenvolvedor';