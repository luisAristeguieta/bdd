-- Se modifica tabla transacciones: 

delete from transacciones;

alter table transacciones
add constraint transacciones_pk primary key (codigo);

-- agrega valores a transacciones: 

insert into transacciones (codigo,numero_cuenta,monto,tipo,fecha,hora)
values (1,'22001',200,'C','2025-06-11','08:10');    -- código=1 + tipo C + rango

insert into transacciones (codigo,numero_cuenta,monto,tipo,fecha,hora)
values (2,'22002',300,'C','2025-06-11','08:20');    -- tipo C + rango

insert into transacciones (codigo,numero_cuenta,monto,tipo,fecha,hora)
values (3,'22003',400,'C','2025-06-11','08:30');    -- tipo C + rango

insert into transacciones (codigo,numero_cuenta,monto,tipo,fecha,hora)
values (4,'12345',250,'D','2025-06-11','08:40');

insert into transacciones (codigo,numero_cuenta,monto,tipo,fecha,hora)
values (5,'12346',500,'D','2025-06-11','08:50');

insert into transacciones (codigo,numero_cuenta,monto,tipo,fecha,hora)
values (6,'12347',150,'C','2025-06-11','09:00');

insert into transacciones (codigo,numero_cuenta,monto,tipo,fecha,hora)
values (7,'12348',900,'D','2025-06-11','09:10');

insert into transacciones (codigo,numero_cuenta,monto,tipo,fecha,hora)
values (8,'12349',750,'C','2025-06-11','09:20');

insert into transacciones (codigo,numero_cuenta,monto,tipo,fecha,hora)
values (9,'12340',600,'D','2025-06-11','09:30');

insert into transacciones (codigo,numero_cuenta,monto,tipo,fecha,hora)
values (10,'12341',850,'C','2025-06-11','09:40');

select * from transacciones;

-- Se crea tabla banco: 

create table banco (
	codigo_banco int not null,
	codigo_transaccion int not null,
	detalle varchar(100),
	constraint banco_pk primary key (codigo_banco),
	constraint banco_transaccion_fk foreign key (codigo_transaccion)
		references transacciones(codigo)
);

-- Se agregan valores a banco: 

insert into banco (codigo_banco,codigo_transaccion,detalle)
values (501,1,'Transacción principal');

insert into banco (codigo_banco,codigo_transaccion,detalle)
values (502,2,'Pago de servicio');

insert into banco (codigo_banco,codigo_transaccion,detalle)
values (503,3,'Depósito en ventanilla');

insert into banco (codigo_banco,codigo_transaccion,detalle)
values (504,4,'Transferencia interna');

insert into banco (codigo_banco,codigo_transaccion,detalle)
values (505,5,'Compra con tarjeta');

select * from banco;

-- Se realizan validaciones o consiltas: 

select * from transacciones where tipo = 'C' and numero_cuenta between '22001' and '22004';
select * from transacciones where codigo = 1;


-- Consulta: transacciones de tipo ‘C’ cuyo numero de cuenta este  entre ‘22001’ y ‘22004’: 

select 
    tr.codigo,
    tr.numero_cuenta,
    tr.monto,
    tr.tipo,
    tr.fecha,
    tr.hora,
    ba.codigo_banco,
    ba.codigo_transaccion,
    ba.detalle
from 
    transacciones tr,
    banco ba
where 
    tr.codigo = ba.codigo_transaccion
    and tr.tipo = 'C'
    and tr.numero_cuenta between '22001' and '22004';
	


-- SubConsulta: transacciones cuyo cdigo corresponde al codigo de transacción del banco con codigo 1.

select
    tr.codigo,
    tr.numero_cuenta,
    tr.monto,
    tr.tipo,
    tr.fecha,
    tr.hora
from 
    transacciones tr
where 
    tr.codigo = (
        select 
            codigo_transaccion
        from 
            banco
        where 
            codigo_banco = 1
    );
	