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
	Categoria varchar(20) default 'GENERAL',
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

# ------------------------------ MODULO 3 ------------------------------ #

DROP SCHEMA laboratorio; # PARA PODER REALIZAR EL BACKUP CORRESPONDIENTE

SHOW DATABASES; # compruebo si se genero la base de datos correctamente del BACKUP

USE `laboratorio`; # RE-confirmacion

# ------------------------------ MODULO 5 ------------------------------ #

CREATE TABLE equipos(
 equipo varchar(20) primary key
);

CREATE TABLE IF NOT EXISTS partidos(
 idPartido int auto_increment primary key,
 local_equipo varchar(20) not null,
 visitante_equipo varchar(20) not null,
 goles_local tinyint unsigned not null,
 goles_visitante tinyint unsigned not null,
 fecha_partido date not null,
 CONSTRAINT fk_partidos_local FOREIGN KEY (local_equipo) REFERENCES equipos(equipo),
 CONSTRAINT fk_partidos_visitante FOREIGN KEY (visitante_equipo) REFERENCES equipos(equipo)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS posiciones(
 equipo varchar(20) primary key,
 puntos tinyint unsigned default 0,
 partidos_jugados tinyint unsigned default 0,
 partidos_ganados tinyint unsigned default 0,
 partidos_empatados tinyint unsigned default 0,
 partidos_perdidos tinyint unsigned default 0,
 goles_favor tinyint unsigned default 0,
 goles_contra tinyint unsigned default 0,
 CONSTRAINT fk_posiciones_equipo FOREIGN KEY (equipo) REFERENCES equipos(equipo)
) ENGINE = InnoDB;

# Ejemplos de indices para consultas frecuentes
CREATE INDEX idx_facturas_fecha ON facturas(fecha);
CREATE INDEX idx_facturas_cliente ON facturas(idCliente);