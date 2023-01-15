# ------------------------------ MODULO 4 ------------------------------ #

USE `laboratorio`;

SET SQL_SAFE_UPDATES = 0;

DROP TABLE NACIMIENTOS;

SELECT * FROM CLIENTES_NEPTUNO cn
WHERE cn.pais = "ESTADOS UNIDOS";

UPDATE CLIENTES_NEPTUNO cn
SET cn.pais = "USA"
WHERE cn.pais = "ESTADOS UNIDOS";

SELECT cn.pais FROM CLIENTES_NEPTUNO cn;

UPDATE CLIENTES_NEPTUNO cn
SET cn.nombrecompania = upper(cn.nombrecompania);

SELECT cn.nombrecompania FROM CLIENTES_NEPTUNO cn;

UPDATE CLIENTES_NEPTUNO cn
SET cn.ciudad = upper(cn.ciudad),
cn.pais = upper(cn.pais);

SELECT cn.ciudad, cn.pais FROM CLIENTES_NEPTUNO cn;

SELECT * FROM empleados;

ALTER TABLE empleados
ADD COLUMN nombre_empleado varchar(30) AFTER IDEMPLEADO;

UPDATE empleados
SET nombre_empleado = CONCAT(apellidos, ', ', nombre);

ALTER TABLE empleados 
DROP COLUMN apellidos, 
DROP COLUMN nombre;

ALTER TABLE clientes 
ADD tipo VARCHAR(3);

UPDATE clientes 
SET tipo = 'VIP' 
WHERE ciudad = 'MADRID';

ALTER TABLE clientes MODIFY telefono VARCHAR(20);

UPDATE clientes 
SET telefono = CONCAT('+34-', telefono) 
WHERE telefono IS NOT NULL;

ALTER TABLE productos 
ADD fecha DATE;

UPDATE productos 
SET fecha = CONCAT(ANO, '-', MES, '-', DIA);

ALTER TABLE productos 
DROP DIA, 
DROP MES,
DROP ANO;

UPDATE productos 
SET ORIGEN = 'ESPAÑA' 
WHERE ORIGEN = 'ESPANA';

ALTER TABLE productos_neptuno 
MODIFY suspendido VARCHAR(2);

UPDATE productos_neptuno 
SET suspendido = IF(suspendido = '0', 'NO', 'SI');

UPDATE productos_neptuno 
SET preciounidad = ROUND(preciounidad * 1.1, 2);

UPDATE proveedores 
SET region = NULL 
WHERE region = '';

UPDATE clientes 
SET ciudad = 
CONCAT(UPPER(LEFT(ciudad, 1)), LOWER(SUBSTRING(ciudad, 2, LENGTH(ciudad))));






