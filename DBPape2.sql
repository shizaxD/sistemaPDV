create database conexion;

use conexion;

create user 'carlos'@'localhost' identified by '1998';
grant all privileges on * . * to 'carlos'@'localhost';

create table Personal(
DNI int(5) unsigned not null auto_increment,
Pass varchar(10) not null,
Nombre varchar(10) not null,
ApellidoP varchar(10) not null,
ApellidoM varchar (10) not null,
Puesto varchar(10) not null,
RFC varchar(10) not null,
Telefono int not null,
Direccion varchar(20),
NSS varchar(10),
Email varchar(10),
FechaNacimiento date not null,
primary key (DNI)
);

create table Articulos(
CodigoArt int not null,
Nombre varchar(10) not null,
PrecioFinal float not null,
PrecioNeto float not null,
Existencia int not null,
primary key (CodigoArt)
);

create table Existencia(
Cantidad int not null,
CodigoArt int not null,
IdSucursal int not null,
foreign key (CodigoArt) references Articulos(CodigoArt),
foreign key (IdSucursal) references Sucursal(IdSucursal),
primary key (Cantidad)
);

create table Sucursal(
IdSucursal int not null,
NombreSucursal varchar(10) not null,
Direccion varchar(20) not null,
primary key (IdSucursal)
);

create table Clientes(
CodigoCl int not null,
Nombre varchar(10) not null,
ApellidoP_Cliente varchar(10) not null,
ApellidoM_Cliente varchar(10) not null,
Email varchar(10) not null,
RFC varchar(15) not null,
primary key (CodigoCl)
);

create table Proveedores(
CodigoPro int not null,
Nombre varchar(10)not null,
Direccion varchar(10)not null,
Telefono int not null,
Email varchar(10)not null,
primary key (CodigoPro)
);

/*create table Factura(
CodigoFac int,
CodigoCl int,

);*/

/*create table Caja(
num_caja int,
nombre_caja varchar(10),

);*/

/*create table Corte(
Num_cortedecaja int not null,
Turno varchar(10) not null,
Cajero varchar(10) not null,
Fecha_Apertura date not null,
Fecha_Cierre date not null,
primary key (Num_cortecaja)
);*/

create table Compra(
NumCompra int not null,
CodigoArt int not null,
PagoTotal float not null,
primary key (NumCompra),
foreign key (CodigoArt) references Articulos(CodigoArt)
);


delimiter //
create procedure create_user (
in xnombre varchar(50),
in xcorreo varchar(50),
out msg varchar (30))
begin

declare msg varchar (30);
DECLARE EXIT HANDLER FOR SQLEXCEPTION
 BEGIN
 SHOW ERRORS LIMIT 1;
-- RESIGNAL;
 ROLLBACK;
 END; 

DECLARE EXIT HANDLER FOR SQLWARNING
 BEGIN
 SHOW WARNINGS LIMIT 1;
-- RESIGNAL;
 ROLLBACK;
 END;

start transaction;
if exists (select * from Personal where Nombre like xnombre) then
set msg = 'YA EXISTE';

else

insert into Personal(nombre,correo)
 values (xnombre, xcorreo);
set msg = 'alta existosa';
end if;

select msg;

commit;
end; //
