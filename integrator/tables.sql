CREATE SCHEMA laboratorio;
USE `laboratorio`;

CREATE TABLE IF NOT EXISTS `laboratorio`.`Facturas` (
	Letra char not null,
	Numero int not null,
	ClienteID int,
	ArticuloID int,
	Fecha date,
	Monto double,
	PRIMARY KEY (Letra, Numero)
) 
ENGINE = InnoDB; # Motor de almacenamiento transaccional (ACID)

CREATE TABLE IF NOT EXISTS `laboratorio`.`Articulos` (
	ArticuloID int not null auto_increment,
	Nombre varchar(25),
	Precio double,
	Stock int,
	PRIMARY KEY (articuloID)
)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `laboratorio`.`Clientes` (
	ClienteID int not null auto_increment,
	Nombre varchar(25),
	Apellido varchar(25),
	CUIT varchar(16) unique,
	Direccion varchar(50),
	Comentarios varchar(200),
	PRIMARY KEY (ClienteID)
)
ENGINE = InnoDB;

# show databases;
# show tables;

# DESCRIBE Clientes;
# DESCRIBE Articulos;
# DESCRIBE Facturas;
