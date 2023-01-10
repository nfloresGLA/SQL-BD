CREATE SCHEMA laboratorio;
USE `laboratorio`;

CREATE TABLE IF NOT EXISTS `laboratorio`.`Facturas` (
	Letra char not null,
	Numero int not null,
	IDCliente int,
	IDArticulo int,
	Fecha date,
	Monto double unsigned, # unsigned = Solo valores positivos
	PRIMARY KEY (Letra, Numero)
) 
ENGINE = InnoDB; # Motor de almacenamiento transaccional (ACID)

CREATE TABLE IF NOT EXISTS `laboratorio`.`Articulos` (
	IDArticulo int not null auto_increment,
	Nombre varchar(30),
	Precio double unsigned not null,
	Stock int unsigned not null,
	PRIMARY KEY (IDArticulo)
)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `laboratorio`.`Clientes` (
	IDCliente int not null auto_increment,
	Nombre varchar(30) not null,
	Apellido varchar(30) not null,
	CUIT varchar(16) unique,
	Direccion varchar(50),
	Observaciones varchar(225),
	PRIMARY KEY (ClienteID)
)
ENGINE = InnoDB;

# show databases;
# show tables;

# DESCRIBE Clientes;
# DESCRIBE Articulos;
# DESCRIBE Facturas;

drop table `laboratorio`.`Facturas`;
drop table `laboratorio`.`Articulos`;
drop table `laboratorio`.`Clientes`;
