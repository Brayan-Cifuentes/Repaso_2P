create database otra;

use otra;

create table Articulo(
	ID_Articulo varchar(10) primary key,
    Nombre_Articulo varchar(35)
) engine = InnoDB default char set=latin1;

create table Ciudad(
	ID_Ciudad varchar(10) primary key,
    Nombre varchar(35)
) engine = InnoDB default char set=latin1;

create table Cliente(
	ID_Cliente varchar(10) primary key,
    Nombre varchar(35)
) engine = InnoDB default char set=latin1;

create table Factura_Encabezado(
	ID_Orden varchar(10),
    ID_Cliente varchar(10),
    ID_Ciudad varchar(10),
    Fecha date,
    
    primary key (ID_Orden, ID_Cliente, ID_Ciudad),
    
    -- Foraneas
    foreign key (ID_Cliente) references Cliente(ID_Cliente),
    foreign key (ID_Ciudad) references Ciudad(ID_Ciudad)
) engine = InnoDB default char set=latin1;

create table Factura_Detalle(
	ID_Orden varchar(10),
    ID_Articulo varchar(10),
    Cantidad int,
    Precio float,
    
    primary key (ID_Orden, ID_Articulo),
    
    foreign key (ID_Orden) references Factura_Encabezado(ID_Orden),
    foreign key (ID_Articulo) references Articulo(ID_Articulo)
    
) engine = InnoDB default char set=latin1;