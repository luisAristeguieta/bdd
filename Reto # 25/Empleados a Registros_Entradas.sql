-- Se crea table empleado: 

create table empleado(
	codigo_empleado int not null,
	nombre varchar(25) not null,
	fecha date not null,
	hora time not null,
	constraint empleado_pk primary key (codigo_empleado)
);

-- Se inserta valores a tabla de emplados: 

insert into empleado (codigo_empleado,nombre,fecha,hora)
values (2201,'Carlos','2023-08-01','08:00');

insert into empleado (codigo_empleado,nombre,fecha,hora)
values (2202,'Laura','2023-08-02','08:30');

insert into empleado (codigo_empleado,nombre,fecha,hora)
values (2203,'Miguel','2023-08-03','09:00');

insert into empleado (codigo_empleado,nombre,fecha,hora)
values (2204,'Ana','2023-08-04','09:30');

insert into empleado (codigo_empleado,nombre,fecha,hora)
values (2205,'Sofia','2023-08-05','10:00');

-- Se modifica tabla registro_entradas y asiga fk: 
delete from registro_entrada;

alter table registro_entrada
add column codigo_empleado int;

alter table registro_entrada
alter column codigo_empleado set not null;

alter table registro_entrada
add constraint registro_entrada_codigo_empleado_fk
foreign key (codigo_empleado)
references empleado(codigo_empleado);

-- Se agregan valores a registro_entrada:

insert into registro_entrada (codigo_registro,cedula_empleado,fecha,hora,codigo_empleado)
values (201,'1701234567','2023-08-01','08:05',2201);

insert into registro_entrada (codigo_registro,cedula_empleado,fecha,hora,codigo_empleado)
values (202,'1709876543','2023-08-10','08:30',2202);

insert into registro_entrada (codigo_registro,cedula_empleado,fecha,hora,codigo_empleado)
values (203,'1707771234','2023-09-01','09:00',2203);

insert into registro_entrada (codigo_registro,cedula_empleado,fecha,hora,codigo_empleado)
values (204,'0905566770','2023-09-15','09:15',2204);

insert into registro_entrada (codigo_registro,cedula_empleado,fecha,hora,codigo_empleado)
values (205,'1712347098','2023-10-01','10:00',2205);

insert into registro_entrada (codigo_registro,cedula_empleado,fecha,hora,codigo_empleado)
values (206,'0904561278','2023-10-20','10:30',2201);

insert into registro_entrada (codigo_registro,cedula_empleado,fecha,hora,codigo_empleado)
values (207,'1700234567','2023-11-05','11:00',2202);

insert into registro_entrada (codigo_registro,cedula_empleado,fecha,hora,codigo_empleado)
values (208,'0909988776','2023-11-18','11:30',2203);

insert into registro_entrada (codigo_registro,cedula_empleado,fecha,hora,codigo_empleado)
values (209,'1703311775','2023-12-01','12:15',2204);

insert into registro_entrada (codigo_registro,cedula_empleado,fecha,hora,codigo_empleado)
values (210,'0904400771','2023-12-20','12:45',2205);

-- Se realizan consultas: 
select * from registro_entrada where fecha between '2023-08-01' and '2023-12-31'
  and hora between '08:00' and '13:00';
select * from registro_entrada where codigo_empleado = 2201;


-- Ajusta para mostrar subconsulta:

insert into registro_entrada (codigo_registro,cedula_empleado,fecha,hora,codigo_empleado)
values (211,'2201','2023-10-10','10:00',2201);

-- Consulta: cédula del empleado, fecha y el nombre de los empleados cuyos registros de entrada segun ejercicio: 

select 
    re.cedula_empleado,
    re.fecha,
    em.nombre
from 
    registro_entrada re,
    empleado em
where
    re.codigo_empleado = em.codigo_empleado
    and (
            (re.fecha between '2023-08-01' and '2023-08-31')
         or (re.cedula_empleado like '%17%' and re.hora between '08:00' and '12:00')
         or (re.fecha between '2023-10-06' and '2023-10-20'
             and re.cedula_empleado like '%08%'
             and re.hora between '09:00' and '13:00')
        );

--SubConsulta: 

select
    em.codigo_empleado,
    em.nombre,
    em.fecha,
    em.hora
from 
    empleado em
where 
    em.codigo_empleado = (
        select 
            re.codigo_empleado
        from 
            registro_entrada re
        where 
            re.cedula_empleado = '2201'
    );

-- Funcion de agregacion 1: 

select
    codigo_empleado,
    count(*) as total_registros
from 
    registro_entrada
group by 
    codigo_empleado;

-- Funcion de agregacion 2: 

select
    MIN(fecha) as fecha_minima,
    MAX(fecha) as fecha_maxima
from 
    registro_entrada;