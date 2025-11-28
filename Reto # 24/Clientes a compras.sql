
-- Se elimina la base antigua para adaptarlo a las nuevas solicitudes y practicar: 
delete from clientes;

-- Se crea tabla clientes (Tabla Padre): 

create table clientes (
    cedula char(10) not null,
    nombre varchar(50) not null,
    apellido varchar(50) not null,
    constraint clientes_pkey primary key (cedula)
);

-- Se crea tabla compras (Tabla Hija): 
create table compras (
    id_compras int not null,
    cedula char(10) not null,
    fecha_compra date not null,
    monto decimal(10,2) not null,
    constraint compras_pk primary key (id_compras),
    constraint compras_cedula_fk foreign key (cedula) -- Se agrega directamente en tabla de "hijo" donde el foreign key sin agreagar el paso de alteracion.
        references clientes(cedula)
);

-- Insertas clientes nuevos: 

insert into clientes (cedula,nombre,apellido)
values (1701234567,'Luis','Jimenez');

insert into clientes (cedula,nombre,apellido)
values (1709876543,'Maria','Guerra');

insert into clientes (cedula,nombre,apellido)
values (1707771234,'Carlos','Lopez');

insert into clientes (cedula,nombre,apellido)
values (0905566770,'Ana','Perez');

insert into clientes (cedula,nombre,apellido)
values (1712347098,'Monica','Salazar');

insert into clientes (cedula,nombre,apellido)
values (0904561278,'Jose','Martinez');

insert into clientes (cedula,nombre,apellido)
values (1700234567,'Lucia','Romero');

insert into clientes (cedula,nombre,apellido)
values (0909988776,'Pedro','Suarez');

insert into clientes (cedula,nombre,apellido)
values (1703311775,'Elena','Vega');

insert into clientes (cedula,nombre,apellido)
values (0904400771,'Jorge','Mendoza');

-- Se visualiza clientes: 
select * from clientes

-- Inserta compras: 

insert into compras (id_compras,cedula,fecha_compra,monto)
values (014,1701234567,'2023/01/10',150.50);

insert into compras (id_compras,cedula,fecha_compra,monto)
values (015,1709876543,'2023/02/12',250.00);

insert into compras (id_compras,cedula,fecha_compra,monto)
values (016,1707771234,'2023/03/05',300.25);

insert into compras (id_compras,cedula,fecha_compra,monto)
values (017,0905566770,'2023/03/20',120.00);

insert into compras (id_compras,cedula,fecha_compra,monto)
values (018,1712347098,'2023/04/01',500.00);

insert into compras (id_compras,cedula,fecha_compra,monto)
values (019,0904561278,'2023/05/17',220.75);

insert into compras (id_compras,cedula,fecha_compra,monto)
values (020,1700234567,'2023/06/01',145.99);

insert into compras (id_compras,cedula,fecha_compra,monto)
values (021,0909988776,'2023/07/14',380.10);

insert into compras (id_compras,cedula,fecha_compra,monto)
values (022,1703311775,'2023/08/05',199.90);

insert into compras (id_compras,cedula,fecha_compra,monto)
values (023,0904400771,'2023/09/01',600.00);

---- Se visualiza compras: 
select * from compras

-- Se realiza consultas: 
select * from clientes where cedula like '%7%'; -- Que tenga 7 en la columna cedula.
select c.id_compras, c.fecha_compra, c.monto from compras c join clientes cl on c.cedula = cl.cedula where cl.nombre = 'Monica';

-- Consultas:

select 
    cl.nombre,
    cl.apellido
from 
    clientes cl
where 
    cl.cedula like '%7%';

-- Subconsultas:

select 
    cl.cedula,
    cl.nombre,
    cl.apellido
from 
    clientes cl
where 
    cl.cedula = (
        select 
            cedula
        from 
            clientes
        where 
            nombre = 'Monica'
    );
	