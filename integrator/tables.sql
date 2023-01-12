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
	Nombre varchar(50),
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
	PRIMARY KEY (IDCliente)
)
ENGINE = InnoDB;

# show databases;
# show tables;

# DESCRIBE Clientes;
# DESCRIBE Articulos;
# DESCRIBE Facturas;

# drop table `laboratorio`.`Facturas`;
# drop table `laboratorio`.`Articulos`;
# drop table `laboratorio`.`Clientes`;

# ------------------------------ MODULO 2 ------------------------------ #

SELECT * FROM clientes_neptuno; # IDCliente, NombreCompania, Direccion, Ciudad, Pais

DESCRIBE clientes_neptuno;

ALTER TABLE clientes_neptuno
MODIFY COLUMN IDCliente varchar(5) PRIMARY KEY, # Modify = Modifica solamente el type o los parameters
MODIFY COLUMN NombreCompania varchar(100) NOT NULL,
MODIFY COLUMN Pais varchar(15) NOT NULL;

ALTER TABLE clientes RENAME Contactos;

SELECT * FROM contactos;

SELECT * FROM clientes; # COD_CLIENTE, EMPRESA, DIRECCION, CIUDAD, TELEFONO, RESPONSABLE

ALTER TABLE clientes
MODIFY COLUMN COD_CLIENTE varchar(7) PRIMARY KEY, # Modify = Modifica solamente el type o los parameters
MODIFY COLUMN EMPRESA varchar(100) NOT NULL,
MODIFY COLUMN CIUDAD varchar(25) NOT NULL,
MODIFY COLUMN TELEFONO INT UNSIGNED,
MODIFY COLUMN RESPONSABLE varchar(30);

DESCRIBE clientes;

SELECT * FROM pedidos; # NUMERO_PEDIDO, CODIGO_CLIENTE, FECHA_PEDIDO, FORMA_PAGO, ENVIADO

DESCRIBE pedidos;

ALTER TABLE pedidos
MODIFY COLUMN NUMERO_PEDIDO INT PRIMARY KEY, # Modify = Modifica solamente el type o los parameters
MODIFY COLUMN CODIGO_CLIENTE varchar(7) NOT NULL,
MODIFY COLUMN FECHA_PEDIDO DATE NOT NULL,
MODIFY COLUMN FORMA_PAGO ENUM("APLAZADO", "CONTADO", "TARJETA"),
MODIFY COLUMN ENVIADO ENUM ("SI", "NO");

SELECT * FROM productos; # COD_PRODUCTO, SECCION, NOMBRE, IMPORTADO, ORIGEN, DIA, MES, ANO

DESCRIBE productos;

ALTER TABLE productos
MODIFY COLUMN COD_PRODUCTO INT PRIMARY KEY, # Modify = Modifica solamente el type o los parameters
MODIFY COLUMN SECCION varchar(20) NOT NULL,
MODIFY COLUMN NOMBRE varchar(40) NOT NULL,
MODIFY COLUMN IMPORTADO ENUM("VERDADERO", "FALSO"),
MODIFY COLUMN ORIGEN varchar(25),
MODIFY COLUMN DIA int UNSIGNED NOT NULL,
MODIFY COLUMN MES int UNSIGNED NOT NULL,
MODIFY COLUMN ANO int UNSIGNED NOT NULL;

DESCRIBE nacimientos;
DESCRIBE pedidos_neptuno;
DESCRIBE empleados;
DESCRIBE productos_neptuno;
DESCRIBE proveedores;