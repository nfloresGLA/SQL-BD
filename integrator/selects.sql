USE `laboratorio`;

SELECT * FROM clientes_neptuno; # IDCliente, NombreCompania, Direccion, Ciudad, Pais

SELECT cp.NombreCompania, cp.Ciudad, cp.Pais FROM clientes_neptuno cp;

SELECT cp.NombreCompania, cp.Ciudad, cp.Pais FROM clientes_neptuno cp
ORDER BY cp.pais ASC;

SELECT cp.NombreCompania, cp.Ciudad, cp.Pais FROM clientes_neptuno cp
ORDER BY cp.pais ASC, cp.Ciudad ASC;

SELECT cp.NombreCompania, cp.Ciudad, cp.Pais FROM clientes_neptuno cp
ORDER BY cp.pais ASC LIMIT 10;

SELECT cp.NombreCompania, cp.Ciudad, cp.Pais FROM clientes_neptuno cp
ORDER BY cp.pais ASC LIMIT 10, 5;