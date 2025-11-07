--Tabla videojuegos

create table videojuegos(
	codigo int not null,
	nombre varchar(100) not null,
	descripcion varchar(300),
	valoracion int,
	constraint videojuegos_pk primary key (codigo)
)

insert into videojuegos (codigo,nombre,descripcion,valoracion)
values (301,'Roblox','Plataforma interactiva',5)

insert into videojuegos (codigo,nombre,descripcion,valoracion)
values (302,'Candy','Plataforma de Adultos',4)

insert into videojuegos (codigo,nombre,descripcion,valoracion)
values (303,'Minicraft','Plataforma Mixta',3)

insert into videojuegos (codigo,nombre,descripcion,valoracion)
values (304,'NFS','Alta Velocidad',5)

insert into videojuegos (codigo,nombre,descripcion,valoracion)
values (305,'LOL','Plataforma interactiva',5)

insert into videojuegos (codigo,nombre)
values (306,'Final Fantasy VII Rebirth')

insert into videojuegos (codigo,nombre)
values (307,'Star Wars Outlaws')

insert into videojuegos (codigo,nombre)
values (308,'Baldurs Gate 3')

select * from videojuegos where nombre like 'C%'
select * from videojuegos where valoracion between '9' and '10'
select * from videojuegos where descripcion is null

update videojuegos set descripcion = 'Mejor Punteado'
where  valoracion > '9'

delete from videojuegos where valoracion < 7