--Tabla Productos

create table productos (
	codigo int not null,
	nombre varchar(50) not null,
	descripcion varchar(200),
	precio money not null,
	stock int not null,
	constraint productos_pk primary key (codigo)
)

insert into productos (codigo,nombre,descripcion,precio,stock)
values (101,'Aguacate','Precio por Kg',2.6,50)

insert into productos (codigo,nombre,descripcion,precio,stock)
values (102,'Tomates','Precio por Kg',1.5,100)

insert into productos (codigo,nombre,descripcion,precio,stock)
values (103,'Cebollas','Precio por Kg',1.3,90)

insert into productos (codigo,nombre,descripcion,precio,stock)
values (104,'Esparragos','Precio por Kg',3.5,20)

insert into productos (codigo,nombre,descripcion,precio,stock)
values (105,'Champinones','Precio por Kg',4.5,10)

insert into productos (codigo, nombre,precio,stock)
values (106,'Pimientos',1.5,30)

insert into productos (codigo, nombre,precio,stock)
values (107,'Calabacin',1.9,40)

insert into productos (codigo, nombre,precio,stock)
values (108,'Papas',1,60)

select * from productos

select * from productos where nombre like 'Q%'
select * from productos where descripcion is null
select * from productos where precio between '2' and '3'

update productos set stock = 0 where descripcion is null
delete from productos where descripcion is null

select * from productos where stock = 10 and precio < money(10)
select nombre,stock from productos where nombre like '%m%' or descripcion like '% %'
select nombre from productos where descripcion is null or stock = 0



