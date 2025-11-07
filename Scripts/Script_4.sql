--Tabla registro_entrada

drop table registro_entrada

create table registro_entrada(
	codigo_registro int not null,
	cedula_empleado char(10) not null,
	fecha date not null,
	hora time not null,
	constraint registro_entrada_pk primary key(codigo_registro)
)

insert into registro_entrada (codigo_registro,cedula_empleado,fecha,hora)
values (201,'1234567890','11/6/1990','17:32')

insert into registro_entrada (codigo_registro,cedula_empleado,fecha,hora)
values (202,'1234567891','11/6/1990','17:33')

insert into registro_entrada (codigo_registro,cedula_empleado,fecha,hora)
values (203,'1234567892','11/6/1990','17:34')

insert into registro_entrada (codigo_registro,cedula_empleado,fecha,hora)
values (204,'1234567893','11/6/1990','17:35')

insert into registro_entrada (codigo_registro,cedula_empleado,fecha,hora)
values (205,'1234567894','11/6/1990','17:36')

insert into registro_entrada (codigo_registro,cedula_empleado,fecha,hora)
values (206,'1234567895','11/6/1990','17:37')

insert into registro_entrada (codigo_registro,cedula_empleado,fecha,hora)
values (207,'1234567896','11/6/1990','17:38')

insert into registro_entrada (codigo_registro,cedula_empleado,fecha,hora)
values (208,'1234567897','11/6/1990','17:39')

insert into registro_entrada (codigo_registro,cedula_empleado,fecha,hora)
values (209,'1234567898','11/6/1990','17:40')

insert into registro_entrada (codigo_registro,cedula_empleado,fecha,hora)
values (200,'1234567899','11/6/1990','17:41')

select cedula_empleado,fecha,hora from registro_entrada
select * from registro_entrada where hora between '7:00' and '14:00'
select * from registro_entrada where hora > '8:00'



