-- Se crea tablas habitaciones, huespedes, reservas: 

create table habitaciones (
    habitacion_numero int not null,
    precio numeric(10,2) not null,
    piso int not null,
    capacidad int  not null,
    constraint habitaciones_pk primary key (habitacion_numero)
);

create table huespedes (
    id  int not null,
    nombres varchar(50) not null,
    apellidos varchar(50) not null,
    telefono varchar(20) not null,
    email varchar(80 not null,
    constraint huespedes_pk primary key (id)
);

create table reservas (
    fecha_ingreso date not null,
    fecha_salida date not null,
    habitacion int not null,
    huesped_id int not null,
    constraint reservas_hab_fk foreign key (habitacion)
        references habitaciones(habitacion_numero),
    constraint reservas_huesped_fk foreign key (huesped_id)
        references huespedes(id)
);

-- Se agregan valores: 

insert into habitaciones values
 (1,40.0,4,4),
 (2,20.0,4,2),
 (3,40.0,4,4),
 (4,40.0,3,4),
 (5,20.0,3,2),
 (6,20.0,3,2),
 (7,20.0,2,2),
 (8,20.0,2,2),
 (9,20.0,2,2),
 (10,15.0,1,1),
 (11,15.0,1,1),
 (12,15.0,1,1);

insert into huespedes values
 (1,'Ricardo','Montero','0980658774','Ricmontero@gmail.com'),
 (2,'Sofía','Martinez','09887563205','Sofimar@gmail.com'),
 (3,'Yamilteh','Guami','0998763298','YAMGUAM@gmail.com'),
 (4,'Esther','Contreras','0995783602','Esthcontro@gmail.com'),
 (5,'Wiliam','Mantilla','09858796320','wmANTILLA@gmail.com'),
 (6,'Carmen','Noguera','0995876321','Cnoguera@gmail.com'),
 (7,'Anika','Jimenez','0978965432','AniJimenez@gmail.com'),
 (8,'Belen','Orejuela','0996365748','BOrejuela@gmail.com'),
 (9,'Diana','Monroy','0987963214','DianaMroy@gmail.com'),
 (10,'Bryan','Moncada','0986325741','BrMoncada@gmail.com');


insert into reservas values
('2023-05-11','2023-05-12',2,10),
('2023-05-11','2023-05-12',2,9),
('2023-06-22','2023-06-23',1,1),
('2023-06-22','2023-06-23',1,2),
('2023-06-22','2023-06-23',1,3),
('2023-06-22','2023-06-23',1,4),
('2023-01-01','2023-01-02',12,5),
('2023-08-11','2023-08-12',11,6),
('2023-05-11','2023-05-12',10,7),
('2023-05-11','2023-05-12',9,8);



-- Se realizan consultas y subConsultas: 

-- Consulta 1: numero de habitacion, nombres y apellidos de los huespedes
select
    h.habitacion_numero,
    hu.nombres,
    hu.apellidos
from
    habitaciones h
    join reservas r on h.habitacion_numero = r.habitacion
    join huespedes hu on hu.id = r.huesped_id;

-- Subconsulta 1 : huespedes que se hospedaron en la habitación 2
select
    nombres,
    apellidos
from
    huespedes
where
    id in (
        select huesped_id
        from reservas
        where habitacion = 2
    );

-- Funcion de agregacion 1: cantidad de huespedes por habitacion
select
    h.habitacion_numero,
    count(r.huesped_id) as total_huespedes
from
    habitaciones h
    join reservas r on h.habitacion_numero = r.habitacion
group by
    h.habitacion_numero;

-- Consulta 2 numero de habitación, piso, nombres y apellidos de los huespedes solo habitaciones del piso 4

select
    h.habitacion_numero,
    h.piso,
    hu.nombres,
    hu.apellidos
from
    habitaciones h,
    reservas r,
    huespedes hu
where
    h.habitacion_numero = r.habitacion
    and hu.id = r.huesped_id
    and h.piso = 4;
	
-- Subconsulta 2 nombres y apellidos de los huespedes que se hospedaron en la habitacion 3:
select
    hu.nombres,
    hu.apellidos
from
    huespedes hu
where
    hu.id in (
        select
            r.huesped_id
        from
            reservas r
        where
            r.habitacion = 3
	);
			
-- Función de agregacion 2 numero de habitacion y promedio de huesped_id en la tabla reservas agrupado por nimero de habitacion:

select
    h.habitacion_numero,
    AVG(r.huesped_id) as promedio_huesped_id
from
    habitaciones h,
    reservas r
where
    h.habitacion_numero = r.habitacion
group by
    h.habitacion_numero;

-- Consulta 3 Numero de habitacion, nombres y apellidos de los huespedes: 

select 
    ha.habitacion_numero,
    hu.nombres,
    hu.apellidos
from 
    habitaciones ha,
    reservas re,
    huespedes hu
where
    ha.habitacion_numero = re.habitacion
    and hu.id = re.huesped_id;

-- Subconsulta 3 Nombres y apellidos de los huespedes cuya reserva es de la habitación 4: 

select 
    hu.nombres,
    hu.apellidos
from 
    huespedes hu
where 
    hu.id in (
        select 
            re.huesped_id
        from 
            reservas re
        where 
            re.habitacion = 4
    );

-- Funcion de agregacion 3 Numero de habitacion y suma del precio_por_noche (total recaudado por habitacion): 

select 
    ha.habitacion_numero,
    sum(ha.precio) as total_recaudado
from 
    habitaciones ha,
    reservas re
where
    ha.habitacion_numero = re.habitacion
group by
    ha.habitacion_numero;
