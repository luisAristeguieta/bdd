-- Se crea las tablas: ciudad, municipio, proyecto, proyecto_municipio 

create table ciudad (
    id int  not null,
    nombre varchar(50) not null,
    constraint ciudad_pk primary key (id)
);

create table municipio (
    id int not null,
    nombre varchar(100) not null,
    ciudad_id int not null,
    constraint municipio_pk primary key (id),
    constraint municipio_ciudad_fk foreign key (ciudad_id)
        references ciudad(id)
);

create table proyecto (
    id  int not null,
    proyecto varchar(150) not null,
    monto numeric(12,3) not null,
    fecha_inicio date not null,
    fecha_fin date  not null,
    constraint proyecto_pk primary key (id)
);

create table proyecto_municipio (
    proyecto_id  int not null,
    municipio_id int not null,
    constraint proyecto_municipio_pk primary key (proyecto_id, municipio_id),
    constraint proyecto_municipio_proy_fk foreign key (proyecto_id)
        references proyecto(id),
    constraint proyecto_municipio_muni_fk foreign key (municipio_id)
        references municipio(id)
);

-- Se agregan valores: 

insert into ciudad values
 (1,'Quito'),
 (2,'Ambato'),
 (3,'Guayaquil'),
 (4,'Machala'),
 (5,'Manta'),
 (6,'Loja'),
 (7,'Otavalo'),
 (8,'Cuenca'),
 (9,'Latacunga'),
 (10,'Tena');

insert into municipio values
 (1,'GAD MUNICIPAL QUITO',1),
 (2,'GAD MUNICIPAL DE CUENCA',8),
 (3,'GAD MUNICIPALIDAD DE AMBATO',2),
 (4,'MUNICIPALIDAD DE MACAHALA ',4),
 (5,'MUNIUCIPIO DE GUAYAQUIL',3),
 (6,'MUNICIPIO DE OTAVALO',7),
 (7,'MUNICIPIO DE LOJA',6),
 (8,'MUNICIPIO DE MANTA',5),
 (9,'MUNICIPIO DE LATACUNGA',9),
 (10,'MUNICIPIO DE TENA',10);

insert into proyecto values
 (1,'Proyectos de Gestión Ambiental',9543.327,'10/02/2022','10/02/2023'),
 (2,'Proyectos en Fomento y Desarrollo Productivo',26553.264,'2022/06/25/','2022/08/10'),
 (3,'Proyectos en Cambio Climático',1292.194,'01/02/2021','10/12/2023');

insert into proyecto_municipio values
 (1,5),
 (3,5),
 (1,2),
 (2,1),
 (1,4),
 (2,9),
 (1,10),
 (3,6),
 (1,3),
 (2,7);


-- Se realizan consultas y subConsultas: 

-- Consulta 1: nombre del municipio y nombre del proyecto
select
    m.nombre as municipio,
    p.proyecto as nombre_proyecto
from
    municipio m
    join proyecto_municipio pm on m.id = pm.municipio_id
    join proyecto p on p.id = pm.proyecto_id;

-- Subconsulta 2: proyectos que pertenecen al municipio con id = 1
select
    p.proyecto
from
    proyecto p
where
    p.id in (
        select proyecto_id
        from proyecto_municipio
        where municipio_id = 1
    );

-- Funcion de agregacion 1 : cantidad de proyectos por municipio
select
    m.nombre as municipio,
    count(pm.proyecto_id) as total_proyectos
from
    municipio m
    join proyecto_municipio pm on m.id = pm.municipio_id
group by
    m.nombre;

-- Consulta 2 solo municipios que contengan "GAD" en el nombre:

select
    m.nombre   as municipio,
    p.proyecto as nombre_proyecto
from
    municipio m,
    proyecto_municipio pm,
    proyecto p
where
    m.id = pm.municipio_id
    and p.id = pm.proyecto_id
    and m.nombre like '%GAD%';
	
-- Funcion de agregacion 2 Nombre del municipio y mínimo proyecto_id en proyecto_municipio, agrupado por municipio: 

select
    m.nombre as municipio,
    min(pm.proyecto_id) as min_proyecto_id
from
    municipio m,
    proyecto_municipio pm
where
    m.id = pm.municipio_id
group by
    m.nombre;

-- Consulta 3 Nombre del municipio y nombre de la ciudad: 

select
    m.nombre as municipio,
    c.nombre as ciudad
from
    municipio m,
    ciudad c
where
    m.ciudad_id = c.id;

-- SubConsulta 3 Proyectos cuyo id esta en los proyecto_id de proyecto_municipio donde municipio_id = 3

select
    p.proyecto
from
    proyecto p
where
    p.id in (
        select
            pm.proyecto_id
        from
            proyecto_municipio pm
        where
            pm.municipio_id = 3
    );
	
-- Funcion de agregacion 3 Nombre del municipio y máximo proyecto_id en proyecto_municipio, agrupado por municipio: 

select
    m.nombre  as municipio,
    max(pm.proyecto_id) as max_proyecto_id
from
    municipio m,
    proyecto_municipio pm
where
    m.id = pm.municipio_id
group by
    m.nombre;