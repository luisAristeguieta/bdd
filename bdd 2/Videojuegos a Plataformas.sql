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
