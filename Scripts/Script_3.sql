--Tabla Estudiantes

create table Estudiantes(
	cedula char(10) not null,
	nombre varchar(50) not null,
	apellido varchar(50) not null,
	email varchar(50) not null,
	fecha_nacimiento date,
	constraint Estudiantes_pk primary key (cedula)
)