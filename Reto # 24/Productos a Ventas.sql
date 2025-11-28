
--Crea tabla ventas con llave foreign key:

create table ventas (
    id_venta int not null,
    codigo_producto int not null,
    fecha_venta date not null,
    cantidad int,
    constraint ventas_pk primary key (id_venta),
    constraint ventas_codigo_producto_fk foreign key (codigo_producto) -- sin agregar la alteracion de la colummna colca foreign key fk
        references productos(codigo)
);

-- Se insertar valores a ventas: 

insert into ventas (id_venta,codigo_producto,fecha_venta,cantidad)
values (201,101,'2023/01/10',2);

insert into ventas (id_venta,codigo_producto,fecha_venta,cantidad)
values (202,102,'2023/01/12',5);  -- cantidad requerida

insert into ventas (id_venta,codigo_producto,fecha_venta,cantidad)
values (203,103,'2023/02/05',3);

insert into ventas (id_venta,codigo_producto,fecha_venta,cantidad)
values (204,104,'2023/02/20',1);

insert into ventas (id_venta,codigo_producto,fecha_venta,cantidad)
values (205,105,'2023/03/01',4);

insert into ventas (id_venta,codigo_producto,fecha_venta,cantidad)
values (206,106,'2023/03/10',2);

insert into ventas (id_venta,codigo_producto,fecha_venta,cantidad)
values (207,107,'2023/03/15',6);

insert into ventas (id_venta,codigo_producto,fecha_venta,cantidad)
values (208,108,'2023/04/01',3);

insert into ventas (id_venta,codigo_producto,fecha_venta,cantidad)
values (209,109,'2023/04/05',8);

insert into ventas (id_venta,codigo_producto,fecha_venta,cantidad)
values (210,110,'2023/04/10',7);

-- Se elimina tabla productos: 
delete from productos;

-- Se reagsina valores a producto: 

insert into productos (codigo,nombre,descripcion,precio,stock)
values (101,'Aguacate','Precio por Kg',2.6,50);

insert into productos (codigo,nombre,descripcion,precio,stock)
values (102,'Tomates','Precio por Kg',1.5,100);

insert into productos (codigo,nombre,descripcion,precio,stock)
values (103,'Cebollas','Precio por Kg',1.3,90);

insert into productos (codigo,nombre,descripcion,precio,stock)
values (104,'Esparragos','Precio por Kg',3.5,20);

insert into productos (codigo,nombre,descripcion,precio,stock)
values (105,'Champinones','Precio por Kg',4.5,10); 

insert into productos (codigo,nombre,precio,stock)
values (106,'Pimientos',1.5,30);

insert into productos (codigo,nombre,descripcion,precio,stock)
values (107,'Calabacin','Precio por Kg',1.9,40);

insert into productos (codigo,nombre,descripcion,precio,stock)
values (108,'Papas','Precio por Kg',1,60);

insert into productos (codigo,nombre,descripcion,precio,stock)
values (109,'Fresas','Precio por Kg',2.2,70);

insert into productos (codigo,nombre,descripcion,precio,stock)
values (110,'Mandarina','Precio por Kg',1.8,85);

-- Se muestra tablas
select * from productos;
select * from ventas;

-- Se realiza consultas planteadas: 
select * from productos where nombre ilike '%m%';
select * from productos where descripcion is null;
select * from ventas where cantidad = 5;


-- Consulta: nombre, stock y cantidad de productos y ventas cuyo nombre contiene la letra 'm'
select 
    pr.nombre,
    pr.stock,
    ve.cantidad
from 
    productos pr,
    ventas ve
where 
    pr.codigo = ve.codigo_producto
    and (
        pr.nombre ilike '%m%' 
        or pr.descripcion = '0'
    );

-- SubConsulta: Nombre y stock de los productos donde el codigo del producto corresponde a ventas cuya cantidad = 5.

select
    pr.nombre,
    pr.stock
from
    productos pr
where
    pr.codigo in (
        select 
            codigo_producto
        from 
            ventas
        where 
            cantidad = 5
    );