--Tabla Estudiantes

create table Estudiantes(
	cedula char(10) not null,
	nombre varchar(50) not null,
	apellido varchar(50) not null,
	email varchar(50) not null,
	fecha_nacimiento date,
	constraint Estudiantes_pk primary key (cedula)
)

insert into Estudiantes (cedula,nombre,apellido,email,fecha_nacimiento)
values ('1234567890','Albert','Garcia','albertg@gmail.com','11/6/1990')

insert into Estudiantes (cedula,nombre,apellido,email,fecha_nacimiento)
values ('1234567891','Mario','Navarrete','correo2@gmail.com','10/7/1991')

insert into Estudiantes (cedula,nombre,apellido,email,fecha_nacimiento)
values ('1234567892','Jose','Garcia','correo3@gmail.com','9/8/1993')

insert into Estudiantes (cedula,nombre,apellido,email,fecha_nacimiento)
values ('1234567893','Amanda','Changaluisa','correo4@gmail.com','8/9/1994')

insert into Estudiantes (cedula,nombre,apellido,email,fecha_nacimiento)
values ('1234567894','Liam','Alonzo','correo5@gmail.com','7/10/1995')

insert into Estudiantes (cedula,nombre,apellido,email,fecha_nacimiento)
values ('1234567895','Estefania','Orellana','correo3@gmail.com','6/11/1996')

insert into Estudiantes (cedula,nombre,apellido,email,fecha_nacimiento)
values ('1234567896','Justin','Gonzalez','correo6@gmail.com','5/12/1997')

insert into Estudiantes (cedula,nombre,apellido,email,fecha_nacimiento)
values ('1234567897','Luis','Bustamente','correo7@gmail.com','4/1/1998')

select * from Estudiantes

select nombre,cedula from Estudiantescedula 
select nombre from Estudiantes where cedula = '17'
select nombre,apellido from Estudiantes where nombre like 'A%'

update Estudiantes set apellido = 'Hernandez' where cedula like '17%'