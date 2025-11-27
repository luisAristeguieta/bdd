-- Creaciones de tablas: 

create table persona (
	cedula char(10) not null,
	nombre varchar(50) not null,
	apellido varchar(50) not null,
	estatura decimal(10,2),
	fecha_nacimiento date not null,
	hora_nacimiento time,
	cantidad_ahorrada money,
	numero_hijos int,
	constraint persona_pk primary key (cedula)
);

create table prestamo (
	cedula char(10) not null,
	monto money not null,
	fecha_prestamo date not null,
	hora_prestamo time not null,
	garante varchar(40),
	constraint prestamo_pk primary key (cedula),
	constraint prestamo_cedula_fk foreign key (cedula)
		references persona(cedula)
);


-- Se insertar valore a tabla presona: 

insert into persona (cedula,nombre,apellido,estatura,fecha_nacimiento,hora_nacimiento,cantidad_ahorrada,numero_hijos)
values ('1701234567','Albert','Garcia',1.75,'1990-11-06','08:15',500.00,1);

insert into persona (cedula,nombre,apellido,estatura,fecha_nacimiento,hora_nacimiento,cantidad_ahorrada,numero_hijos)
values ('1709876543','Mario','Navarrete',1.80,'1991-10-07','09:20',300.00,2);

insert into persona (cedula,nombre,apellido,estatura,fecha_nacimiento,hora_nacimiento,cantidad_ahorrada,numero_hijos)
values ('1707771234','Jose','Garcia',1.70,'1993-09-08','10:05',150.00,0);

insert into persona (cedula,nombre,apellido,estatura,fecha_nacimiento,hora_nacimiento,cantidad_ahorrada,numero_hijos)
values ('0905566770','Amanda','Changaluisa',1.65,'1994-08-09','07:45',800.00,3);

insert into persona (cedula,nombre,apellido,estatura,fecha_nacimiento,hora_nacimiento,cantidad_ahorrada,numero_hijos)
values ('1712347098','Liam','Alonzo',1.78,'1995-07-10','06:30',1000.00,1);

insert into persona (cedula,nombre,apellido,estatura,fecha_nacimiento,hora_nacimiento,cantidad_ahorrada,numero_hijos)
values ('0904561278','Estefania','Orellana',1.68,'1996-06-11','11:10',1200.00,0);

insert into persona (cedula,nombre,apellido,estatura,fecha_nacimiento,hora_nacimiento,cantidad_ahorrada,numero_hijos)
values ('1700234567','Justin','Gonzalez',1.82,'1997-05-12','09:00',600.00,2);

insert into persona (cedula,nombre,apellido,estatura,fecha_nacimiento,hora_nacimiento,cantidad_ahorrada,numero_hijos)
values ('0909988776','Luis','Bustamante',1.76,'1998-04-01','08:50',400.00,1);

insert into persona (cedula,nombre,apellido,estatura,fecha_nacimiento,hora_nacimiento,cantidad_ahorrada,numero_hijos)
values ('1703311775','Elena','Vega',1.60,'1992-03-22','05:55',900.00,0);

insert into persona (cedula,nombre,apellido,estatura,fecha_nacimiento,hora_nacimiento,cantidad_ahorrada,numero_hijos)
values ('1709990001','Sean','Martinez',1.83,'1993-02-15','07:20',700.00,1);


select * from persona;

-- Se inserta valoes a pretamos: 

insert into prestamo (cedula,monto,fecha_prestamo,hora_prestamo,garante)
values ('1701234567',200.00,'2023-01-10','09:00','Mario Navarrete');

insert into prestamo (cedula,monto,fecha_prestamo,hora_prestamo,garante)
values ('1709876543',950.00,'2023-02-05','10:15','Albert Garcia');

insert into prestamo (cedula,monto,fecha_prestamo,hora_prestamo,garante)
values ('1707771234',1100.00,'2023-03-01','11:30','Amanda Changaluisa');

insert into prestamo (cedula,monto,fecha_prestamo,hora_prestamo,garante)
values ('0905566770',500.00,'2023-03-20','08:45','Liam Alonzo');

insert into prestamo (cedula,monto,fecha_prestamo,hora_prestamo,garante)
values ('1712347098',300.00,'2023-04-10','12:00','Estefania Orellana');

insert into prestamo (cedula,monto,fecha_prestamo,hora_prestamo,garante)
values ('0904561278',90.00,'2023-05-02','13:10','Justin Gonzalez');

insert into prestamo (cedula,monto,fecha_prestamo,hora_prestamo,garante)
values ('1700234567',750.00,'2023-06-15','09:20','Luis Bustamante');

insert into prestamo (cedula,monto,fecha_prestamo,hora_prestamo,garante)
values ('0909988776',1000.00,'2023-07-01','10:05','Elena Vega');

insert into prestamo (cedula,monto,fecha_prestamo,hora_prestamo,garante)
values ('1703311775',50.00,'2023-07-20','11:40','Sean Martinez'); 

insert into prestamo (cedula,monto,fecha_prestamo,hora_prestamo,garante)
values ('1709990001',600.00,'2023-08-05','08:30','Albert Garcia');


select * from prestamo;


-- Se realizan validaciones: 

select * from prestamo where monto between money(100) and money(1000);
select * from persona where nombre = 'Sean';