-- Se crea tabla plataformas (Tabla Hija) fk:

create table plataformas(
    id_plataforma int not null,
    nombre_plataforma varchar(50) not null,
    codigo_videojuego int not null,
    constraint plataformas_pk primary key (id_plataforma),
    constraint plataformas_codigo_videojuego_fk -- Se agrega FK aca.
        foreign key (codigo_videojuego)
        references videojuegos(codigo)
);

-- Se modifica tabla videojuegos, se limpia y se agregan valores: 
delete from videojuegos;

insert into videojuegos (codigo,nombre,descripcion,valoracion)
values (401,'God of War','Juego de acción basado en Guerra mitológica',5);  

insert into videojuegos (codigo,nombre,descripcion,valoracion)
values (402,'Call of Duty','Videojuego de Guerra moderna',5);              

insert into videojuegos (codigo,nombre,descripcion,valoracion)
values (403,'Destiny','Disparos y exploración espacial',4);               

insert into videojuegos (codigo,nombre,descripcion,valoracion)
values (404,'Dark Souls','Juego de aventura y combate',5);     

insert into videojuegos (codigo,nombre,descripcion,valoracion)
values (405,'Crash Bandicoot','Aventura clásica de plataformas',4); 

insert into videojuegos (codigo,nombre,descripcion,valoracion)
values (406,'Gears of War','Juego de Guerra futurista',5); 

insert into videojuegos (codigo,nombre,descripcion,valoracion)
values (407,'Mario Kart','Juego de carreras',4);

insert into videojuegos (codigo,nombre,descripcion,valoracion)
values (408,'Zelda Breath of the Wild','Aventura y exploración',5);

insert into videojuegos (codigo,nombre,descripcion,valoracion)
values (409,'Fortnite','Acción y supervivencia',3);

insert into videojuegos (codigo,nombre,descripcion,valoracion)
values (410,'Baldurs Gate 3','Rol y estrategia con combate',5);

-- Se agregan valores a plataformas: 

insert into plataformas (id_plataforma,nombre_plataforma,codigo_videojuego)
values (501,'PlayStation 5',401);

insert into plataformas (id_plataforma,nombre_plataforma,codigo_videojuego)
values (502,'PlayStation 4',401);

insert into plataformas (id_plataforma,nombre_plataforma,codigo_videojuego)
values (503,'Xbox Series X',402);

insert into plataformas (id_plataforma,nombre_plataforma,codigo_videojuego)
values (504,'PC',402);

insert into plataformas (id_plataforma,nombre_plataforma,codigo_videojuego)
values (505,'PS5',403);

insert into plataformas (id_plataforma,nombre_plataforma,codigo_videojuego)
values (506,'Xbox One',404);

insert into plataformas (id_plataforma,nombre_plataforma,codigo_videojuego)
values (507,'Nintendo Switch',407);

insert into plataformas (id_plataforma,nombre_plataforma,codigo_videojuego)
values (508,'PC',408);

insert into plataformas (id_plataforma,nombre_plataforma,codigo_videojuego)
values (509,'PC',409);

insert into plataformas (id_plataforma,nombre_plataforma,codigo_videojuego)
values (510,'PS5',410);

-- Realiza consultas planteadas: 

select * from videojuegos where descripcion ilike '%guerra%';
select * from videojuegos where nombre like 'C%' or nombre like 'D%';

-- Se actuliza y ajusta para mostrar algun resultado
update videojuegos set valoracion = 9
where nombre in ('Call of Duty','Dark Souls','Crash Bandicoot','Gears of War');

insert into videojuegos (codigo,nombre,descripcion,valoracion)
values (411,'God of War','Juego de acción basado en Guerra mitológica',5);


-- CONSULTA :nombre, descripción, valoración y nombre de plataforma de videojuegos cuya descripción contiene 'Guerra' y valoración > 7
-- O cuyo nombre comienza con 'C' y valoración > 8 y comienza con ‘D’
select
    vi.codigo,
    vi.nombre,
    vi.descripcion,
    vi.valoracion,
    pl.id_plataforma,
    pl.nombre_plataforma,
    pl.codigo_videojuego
from
    videojuegos vi,
    plataformas pl
where
    vi.codigo = pl.codigo_videojuego
    and (
            (vi.descripcion like '%Guerra%' and vi.valoracion > 7)
         or (vi.nombre like 'C%' and vi.valoracion > 8)
         or (vi.nombre like 'D%' and vi.valoracion > 8)
        );

-- Subconsulta: plataformas donde el codigo de videojuego coincida con el videojuego "God of war"

select
    pl.id_plataforma,
    pl.nombre_plataforma,
    pl.codigo_videojuego
from
    plataformas pl
where
    pl.codigo_videojuego = (
        select
            codigo
        from
            videojuegos
        where
            nombre = 'God of war' -- No se va a mostrar algo porque se registra la palabra en mayuscula
    );

-- Funcion de agregacion 1: 

select
    codigo_videojuego,
    count(*) as total_plataformas
from 
    plataformas
group by 
    codigo_videojuego;

-- Funcion de agregacion 2: 

select 
    ROUND(AVG(valoracion), 2) as valoracion_promedio
from 
    videojuegos;