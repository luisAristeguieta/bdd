--Tabla transacciones

create table transacciones (
	codigo int not null,
	numero_cuenta char(5) not null,
	monto money not null,
	tipo char(1) not null, 
	fecha date not null,
	hora time not null
)

insert into transacciones (codigo,numero_cuenta,monto,tipo,fecha,hora)
values (401,'12345',200,'C','11/6/2025','17:42')

insert into transacciones (codigo,numero_cuenta,monto,tipo,fecha,hora)
values (402,'12346',300,'D','11/6/2025','17:43')

insert into transacciones (codigo,numero_cuenta,monto,tipo,fecha,hora)
values (403,'12347',400,'C','11/6/2025','17:44')

insert into transacciones (codigo,numero_cuenta,monto,tipo,fecha,hora)
values (404,'12348',500,'D','11/6/2025','17:45')

insert into transacciones (codigo,numero_cuenta,monto,tipo,fecha,hora)
values (405,'12349',600,'C','11/6/2025','17:46')

insert into transacciones (codigo,numero_cuenta,monto,tipo,fecha,hora)
values (406,'12340',700,'D','11/6/2025','17:47')

insert into transacciones (codigo,numero_cuenta,monto,tipo,fecha,hora)
values (407,'12342',800,'C','11/6/2025','17:48')

insert into transacciones (codigo,numero_cuenta,monto,tipo,fecha,hora)
values (408,'12342',900,'D','11/6/2025','17:49')

insert into transacciones (codigo,numero_cuenta,monto,tipo,fecha,hora)
values (409,'12343',100,'C','11/6/2025','17:50')

insert into transacciones (codigo,numero_cuenta,monto,tipo,fecha,hora)
values (400,'12344',250,'C','11/6/2025','17:51')

select * from transacciones where tipo ='D'
select * from transacciones where monto between '200' and '2000'
select codigo,monto,tipo,fecha from transacciones where fecha is not null

update transacciones set tipo ='T'
where  monto > money(100) and monto < money(500) 
and fecha between '2025/09/01' and '2025/09/30' 
and hora between '14:00' and '20:00'

delete from transacciones where hora between '14:00' and '20:00'
and fecha between '2025/08/01' and '2025/08/31' 

select * from transacciones where (tipo like 'C%') and (numero_cuenta between '22004' and '222001')

select * from transacciones where (tipo like 'D%') 
and (numero_cuenta between '22007' and '22010')
and (fecha = '2025/05/25')

select * from transacciones where (codigo >= 1 and codigo <= 5 ) 
and (numero_cuenta ='22002' or numero_cuenta = '22004')
and (fecha = '2025/05/26' or fecha ='2025/05/29')

