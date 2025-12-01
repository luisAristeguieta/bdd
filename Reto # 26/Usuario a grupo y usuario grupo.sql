-- Creacion de tablas usuarios, grupo usuario_grupo: 

create table usuarios (
    id int not null,
    nombre varchar(50) not null,
    apellido varchar(50) not null,
    fecha_registro date not null,
    constraint usuarios_pk primary key (id)
);

create table grupo (
    id int not null,
    nombre varchar(50) not null,
    descripcion varchar(200),
    fecha_creacion date not null,
    constraint grupo_pk primary key (id)
);

create table usuario_grupo (
    us_id int not null,
    gr_id int not null,
    constraint usuario_grupo_pk primary key (us_id, gr_id),
    constraint usuario_grupo_us_fk foreign key (us_id)
        references usuarios(id),
    constraint usuario_grupo_gr_fk foreign key (gr_id)
        references grupo(id)
);

-- Se agregan valores a tablas recien creadas con el archivo adicionado y corrige error en formato de fecha: 

insert into usuarios values 
 (1,'Marilyn','Sagñay','05/11/2023'),
 (2,'Romel','Chamba','06/11/2023'),
 (3,'Mario','Guzñay','05/11/2023'),
 (4,'Johann','Domo','07/11/2023'),
 (5,'Monserrate','Vera','05/11/2023'),
 (6,'Lucio','Vargas','05/11/2023'),
 (7,'Martín','Arizaga','05/11/2023'),
 (8,'Fricson','Erazo','05/11/2023'),
 (9,'Jairo','Obando','05/11/2023'),
 (10,'Berni','Tomalá','05/11/2023');

insert into grupo values
(1,'Maternal 1','Grupo de maternal matutino','2020-03-08'),
(2,'Maternal 2','Grupo de maternal vespertino','2020-03-08'),
(3,'Maternal 3','Grupo de maternal nocturno','2020-03-08'),
(4,'Incial 1','Grupo de inicial matutino','2021-03-15'),
(5,'Incial 2','Grupo de inicial vespertino','2021-03-15'),
(6,'Incial 3','Grupo de inicial nocturno','2021-03-15'),
(7,'Incial intensivo','Grupo de inicial días sábados','2021-03-15'),
(8,'Maternal intensivo 1','Grupo de maternal matutino días sábados','2022-03-15'),
(9,'Maternal intensivo 2','Grupo de maternal vespertino días sábados','2022-03-15'),
(10,'Maternal intensivo 3','Grupo de maternal nocturno días sábados','2022-03-15');

insert into usuario_grupo values
 (1,8),
 (2,3),
 (3,8),
 (4,9),
 (5,1),
 (6,2),
 (7,8),
 (8,8),
 (9,10),
 (10,1);


-- Se realizan consultas: 

-- Consulta 1: nombre de usuario y nombre de grupo
select
    u.nombre as usuario,
    g.nombre as grupo
from
    usuarios u
    join usuario_grupo ug on u.id = ug.us_id
    join grupo g on g.id = ug.gr_id;

-- Subconsulta 1 : usuarios que pertenecen al grupo con id = 1
select
    nombre
from
    usuarios
where
    id in (
        select us_id
        from usuario_grupo
        where gr_id = 1
    );

-- Función de agregacion 1: cantidad de usuarios por grupo
select
    g.nombre as grupo,
    count(ug.us_id) as total_usuarios
from
    grupo g
    join usuario_grupo ug on g.id = ug.gr_id
group by
    g.nombre;

-- Consulta 2: Usuarios y grupos donde el nombre del grupo contenga “intensivo”

select
    u.nombre as usuario,
    g.nombre as grupo
from
    usuarios u
    join usuario_grupo ug on u.id = ug.us_id
    join grupo g on g.id = ug.gr_id
where
    g.nombre ilike '%intensivo%';

-- SubConsulta 2: Nombres de usuarios que pertenecen al grupo con gr_id = 2

select nombre
from usuarios
where id in (
    select us_id
    from usuario_grupo
    where gr_id = 2
);

-- Max y min: 

select
    g.nombre as grupo,
    max(ug.us_id) as mayor_usuario,
    min(ug.us_id) as menor_usuario
from
    grupo g
    join usuario_grupo ug on g.id = ug.gr_id
group by
    g.nombre;

-- Consulta 3:

select
    u.nombre        as usuario,
    g.fecha_creacion
from
    usuarios u,
    usuario_grupo ug,
    grupo g
where
    u.id = ug.us_id
    and g.id = ug.gr_id
    and g.fecha_creacion between '2020-03-08' and '2022-03-08';


-- SubConsulta 3:
select
    u.nombre
from
    usuarios u
where
    u.id in (
        select
            ug.us_id
        from
            usuario_grupo ug
        where
            ug.gr_id = 3
    );

-- Funcion de agregacion 3: 

select
    g.descripcion,
    count(ug.us_id) as total_usuarios
from
    grupo g,
    usuario_grupo ug
where
    g.id = ug.gr_id
    and g.descripcion like '%matutino%'
group by
    g.descripcion;
	