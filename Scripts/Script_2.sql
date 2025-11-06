--Tabla Cuentas

create table cuentas (
	numero_cuenta char(5) not null,
	cedula_propietario char(5) not null,
	fecha_creacion date,
	saldo money not null,
	constraint cuentas_pk primary key (numero_cuenta)
)

insert into cuentas (numero_cuenta,cedula_propietario,fecha_creacion,saldo)
values (12345,54321,'11/6/2025',200)

insert into cuentas (numero_cuenta,cedula_propietario,fecha_creacion,saldo)
values (12346,54322,'11/6/2025',300)

insert into cuentas (numero_cuenta,cedula_propietario,fecha_creacion,saldo)
values (12347,54321,'11/6/2025',400)

insert into cuentas (numero_cuenta,cedula_propietario,fecha_creacion,saldo)
values (12348,54320,'11/6/2025',500)

insert into cuentas (numero_cuenta,cedula_propietario,fecha_creacion,saldo)
values (12349,54329,'11/6/2025',600)

insert into cuentas (numero_cuenta,cedula_propietario,saldo)
values (12340,54329,700)

insert into cuentas (numero_cuenta,cedula_propietario,saldo)
values (12341,54320,800)

insert into cuentas (numero_cuenta,cedula_propietario,saldo)
values (12342,54328,900)

insert into cuentas (numero_cuenta,cedula_propietario,saldo)
values (12343,54327,1000)

insert into cuentas (numero_cuenta,cedula_propietario,saldo)
values (12344,54326,1100)

select * from cuentas
