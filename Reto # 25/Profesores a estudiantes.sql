-- Se Crea tabla profesores: 

create table profesores(
    codigo int not null,
    nombre varchar(50) not null,
    constraint profesores_pk primary key (codigo)
);

-- Se Inserta valores a tabla profesores: 

insert into profesores (codigo,nombre)
values (101,'Francisco');

insert into profesores (codigo,nombre)
values (102,'Maria');

insert into profesores (codigo,nombre)
values (103,'Carolina');

insert into profesores (codigo,nombre)
values (104,'Daniel');

insert into profesores (codigo,nombre)
values (105,'Fernando');

insert into profesores (codigo,nombre)
values (106,'Lucia');

insert into profesores (codigo,nombre)
values (107,'Roberto');

insert into profesores (codigo,nombre)
values (108,'Sofia');

insert into profesores (codigo,nombre)
values (109,'Jorge');

insert into profesores (codigo,nombre)
values (110,'Camila');

select * from profesores

-- Se elimina datos de estudiantes y se agrega y altera columna de la tabla estudiantes para agregar el fk: 
delete from Estudiantes;

alter table estudiantes
add column codigo_profesor int;

alter table estudiantes
add constraint estudiantes_profesor_fk
foreign key (codigo_profesor)
references profesores(codigo);

-- Se agrega valores a tabla Estudiantes y adapta nuevos valores con consultas:

insert into estudiantes (cedula,nombre,apellido,email,fecha_nacimiento,codigo_profesor)
values ('1701234567','Albert','Garcia','albertg@gmail.com','1990-11-06',101);

insert into estudiantes (cedula,nombre,apellido,email,fecha_nacimiento,codigo_profesor)
values ('1709876543','Mario','Navarrete','correo2@gmail.com','1991-10-07',102);

insert into estudiantes (cedula,nombre,apellido,email,fecha_nacimiento,codigo_profesor)
values ('1707771234','Jose','Garcia','correo3@gmail.com','1993-09-08',103);

insert into estudiantes (cedula,nombre,apellido,email,fecha_nacimiento,codigo_profesor)
values ('0905566770','Amanda','Changaluisa','correo4@gmail.com','1994-08-09',104);

insert into estudiantes (cedula,nombre,apellido,email,fecha_nacimiento,codigo_profesor)
values ('1712347098','Liam','Alonzo','correo5@gmail.com','1995-07-10',105);

insert into estudiantes (cedula,nombre,apellido,email,fecha_nacimiento,codigo_profesor)
values ('0904561278','Estefania','Orellana','correo3@gmail.com','1996-06-11',106);

insert into estudiantes (cedula,nombre,apellido,email,fecha_nacimiento,codigo_profesor)
values ('1700234567','Justin','Gonzalez','correo6@gmail.com','1997-05-12',107);

insert into estudiantes (cedula,nombre,apellido,email,fecha_nacimiento,codigo_profesor)
values ('0909988776','Luis','Bustamante','correo7@gmail.com','1998-04-01',108);

insert into estudiantes (cedula,nombre,apellido,email,fecha_nacimiento,codigo_profesor)
values ('1703311775','Elena','Vega','correo8@gmail.com','1992-03-22',109);

insert into estudiantes (cedula,nombre,apellido,email,fecha_nacimiento,codigo_profesor)
values ('0904400771','Jorge','Mendoza','correo9@gmail.com','1993-02-15',110);

-- Se muestran tablas:
select * from profesores;
select * from estudiantes;

-- Se realizan consultas: 

select * from estudiantes where apellido ilike '%n%';
select * from profesores where nombre = 'Francisco';


-- Consulta: Obtener el código de profesor con todos los nombres y apellidos de los estudiantes cuyo apellido contiene la letra 'n'

select 
    pr.codigo,
    es.nombre,
    es.apellido
from 
    estudiantes es,
    profesores pr
where 
    es.codigo_profesor = pr.codigo
    and es.apellido like '%n%';


-- SubConsulta: Obtener todos los estudiantes cuyo código de profesor corresponde al profesor cuyo nombre es "Francisco"

select 
    es.cedula,
    es.nombre,
    es.apellido,
    es.codigo_profesor
from 
    estudiantes es
where 
    es.codigo_profesor = (
        select 
            codigo
        from 
            profesores
        where 
            nombre = 'Francisco'
    );

--Funcion de agregacion 1: 

select
    pr.codigo,
    count(*) as total_estudiantes
from 
    estudiantes es,
    profesores pr
where 
    es.codigo_profesor = pr.codigo
group by 
    pr.codigo;

-- Funcion de agregacion 2: 

select 
    ROUND(AVG(EXTRACT(YEAR FROM CURRENT_DATE) - 
               EXTRACT(YEAR FROM es.fecha_nacimiento)), 0)
           as edad_promedio
from 
    estudiantes es;
