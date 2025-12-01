-- Script de creacion:

-- Crea tabla usuario con indicaciones: 

create table usuario (
	cedula char(5),
	nombre varchar(25) not null,
	apellido varchar(25) not null,
	tipo_cuenta VARCHAR (20),
	limite_credito DECIMAL(10,5),
	constraint usuario_pk primary key (cedula)
)

-- Inserta valores en tabla usuario (10):

insert into usuario (cedula,nombre,apellido,tipo_cuenta,limite_credito)
values (54320,'Luis','Jimenez','Ahorros',1000);

insert into usuario (cedula,nombre,apellido,tipo_cuenta,limite_credito)
values (54321,'Maria','Guerra','Corriente',500);

insert into usuario (cedula,nombre,apellido,tipo_cuenta,limite_credito)
values (54322,'Carlos','Lopez','Ahorros',800);

insert into usuario (cedula,nombre,apellido,tipo_cuenta,limite_credito)
values (54323,'Ana','Perez','Corriente',300);

insert into usuario (cedula,nombre,apellido,tipo_cuenta,limite_credito)
values (54324,'Jose','Martinez','Ahorros',1200);

insert into usuario (cedula,nombre,apellido,tipo_cuenta,limite_credito)
values (54325,'Lucia','Romero','Ahorros',900);

insert into usuario (cedula,nombre,apellido,tipo_cuenta,limite_credito)
values (54326,'Pedro','Suarez','Corriente',400);

insert into usuario (cedula,nombre,apellido,tipo_cuenta,limite_credito)
values (54327,'Elena','Vega','Ahorros',1500);

insert into usuario (cedula,nombre,apellido,tipo_cuenta,limite_credito)
values (54328,'Jorge','Mendoza','Corriente',700);

insert into usuario (cedula,nombre,apellido,tipo_cuenta,limite_credito)
values (54329,'Sofia','Rios','Ahorros',600);


-- Elimina datos existente de la tabla cuenta: 

delete from cuentas

-- Creacion de la llave foreign key asignando la cedula de la tabla usuario con cedula_propietario de la tabla cuentas 

alter table cuentas
-- tabla principal (MUCHOS) "autos"
add constraint numero_cuenta_usuario_fk
--agrega constraint TABLA + _ + tabla secundari + _ fk
foreign key (cedula_propietario)
--Colummna de la tabla principal
references usuario(cedula)
--Colummna de la tabla secundaria

-- Inserta 10 cuentas con el rango y valores entre 100 y 1000: 

insert into cuentas (numero_cuenta,cedula_propietario,fecha_creacion,saldo)
values (12340,54320,'08/21/2022',100);

insert into cuentas (numero_cuenta,cedula_propietario,fecha_creacion,saldo)
values (12341,54321,'09/10/2022',200);

insert into cuentas (numero_cuenta,cedula_propietario,fecha_creacion,saldo)
values (12342,54322,'10/05/2022',300);

insert into cuentas (numero_cuenta,cedula_propietario,fecha_creacion,saldo)
values (12343,54323,'12/01/2022',400);

insert into cuentas (numero_cuenta,cedula_propietario,fecha_creacion,saldo)
values (12344,54324,'01/15/2023',500);

insert into cuentas (numero_cuenta,cedula_propietario,fecha_creacion,saldo)
values (12345,54325,'03/20/2023',600);

insert into cuentas (numero_cuenta,cedula_propietario,fecha_creacion,saldo)
values (12346,54326,'05/02/2023',700);

insert into cuentas (numero_cuenta,cedula_propietario,fecha_creacion,saldo)
values (12347,54327,'06/18/2023',800);

insert into cuentas (numero_cuenta,cedula_propietario,fecha_creacion,saldo)
values (12348,54328,'08/30/2023',900);

insert into cuentas (numero_cuenta,cedula_propietario,fecha_creacion,saldo)
values (12349,54329,'09/21/2023',1000);

-- Verifica tablas con nuevos datos: 

select * from usuario;
select * from cuentas;

-- Visualiza rango y valores: 

select numero_cuenta, fecha_creacion, saldo from cuentas where fecha_creacion between '2022-08-21' and '2023-09-21'
and saldo between money(100) and money(1000);

-- Realizar consultas: 

-- Obtener los números de cuenta y nombres de usuarios con saldo entre $100 y $1000: 

select 
    cu.numero_cuenta,
    us.nombre
from 
    cuentas cu,
    usuario us
where
    cu.cedula_propietario = us.cedula
    and cu.saldo between money(100) and money(1000);

	
-- SubConsultas: Cuentas y Usuarios por fecha de creación (2022-09-21 a 2023-09-21)

select 
    cu.numero_cuenta,
    cu.fecha_creacion,
    cu.saldo,
    us.cedula,
    us.nombre,
    us.apellido
from 
    cuentas cu,
    usuario us
where
    cu.cedula_propietario = us.cedula
    and cu.fecha_creacion in (
        select 
            fecha_creacion
        from 
            cuentas
        where 
            fecha_creacion between '2022-09-21' and '2023-09-21'
    );


-- Funcion de agregacion 1 con la consulta de la cedula: 

select 
    AVG(cast(cu.saldo as numeric)) as saldo_promedio
from 
    cuentas cu
where 
    cu.cedula_propietario = '54321';


-- -- Funcion de agregacion 2: 

select 
    us.tipo_cuenta,
    count(*) as total_cuentas
from 
    cuentas cu,
    usuario us
where
    cu.cedula_propietario = us.cedula
group by 
    us.tipo_cuenta;


