--Tabla registro_entrada

create table registro_entrada(
	codigo_registro int not null,
	cedula_empleado char(10) not null,
	fecha date not null,
	hora time not null,
	constraint registro_entrada_pk primary key(codigo_registro)
)