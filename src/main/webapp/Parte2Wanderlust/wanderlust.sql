drop database if exists wanderlust;
create database wanderlust;
use wanderlust;

create table asesorfinanciero(
UsuarioA int primary key not null,
Contra varchar(20),
Numte varchar(20),
Correoel varchar(20)
);

select*from asesorfinanciero;