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

SELECT * FROM nacimientos; 
# SEXO, FECHA, TIPO_PARTO, ATENC_PART, LOCAL_PART, SEMANAS, PESO, TALLA, EDAD_PADRE, 
# NIVEL_PADRE, OCUPA_P, EDAD_MADRE, ESTADO_CIVIL_MADRE, COMUNA, URBA_RURAL, 
# HIJOS_VIVOS, HIJOS_FALLECIDOS, HIJOS_TOTAL, NACIONALIDAD, ESTABLECIMIENTO

SELECT * FROM nacimientos n
WHERE n.nacionalidad IN ("Extranjera");

SELECT * FROM nacimientos n
WHERE n.edad_madre < 18
GROUP BY n.EDAD_MADRE ASC;  

SELECT * FROM nacimientos n
WHERE n.edad_madre = n.edad_padre;

SELECT * FROM nacimientos n
WHERE (n.edad_padre - n.edad_madre) > 40;

SELECT * FROM clientes_neptuno n
WHERE n.pais = "Argentina";

SELECT * FROM clientes_neptuno n
WHERE n.pais != "Argentina"
ORDER BY n.pais ASC;

SELECT * FROM nacimientos n
WHERE n.semanas < 20
ORDER BY n.semanas DESC;

SELECT * FROM nacimientos n
WHERE n.sexo = "Femenino" AND n.edad_madre > 40;

SELECT * FROM clientes_neptuno n
WHERE n.pais IN ("Argentina", "Brasil", "Venezuela")
ORDER BY n.pais ASC, n.ciudad ASC;

SELECT * FROM nacimientos n
WHERE n.semanas >= 20 AND n.semanas <= 25
ORDER BY n.semanas ASC;

SELECT * FROM nacimientos n
WHERE n.comuna IN (1101, 3201, 5605, 8108, 9204, 13120, 15202)
ORDER BY n.comuna ASC;

SELECT * FROM clientes_neptuno n
WHERE n.IDCliente LIKE "C%";

SELECT * FROM clientes_neptuno n
WHERE n.ciudad LIKE "B%" AND n.ciudad LIKE "_____";

SELECT * FROM nacimientos n
WHERE n.HIJOS_TOTAL > 10
ORDER BY n.HIJOS_TOTAL ASC;

# ------------------------------ MODULO 3 ------------------------------ #

SELECT cp.IDCliente, cp.nombrecompania, concat(cp.direccion," - ", cp.ciudad," - ", cp.pais) AS `Ubicacion`
FROM clientes_neptuno cp; # IDCliente, NombreCompania, Direccion, Ciudad, Pais

SELECT cp.IDCliente, cp.nombrecompania, concat_ws(" - ", cp.direccion, cp.ciudad, cp.pais) AS `Ubicacion`
FROM clientes_neptuno cp; # IDCliente, NombreCompania, Direccion, Ciudad, 

SELECT cp.IDCliente, upper(cp.nombrecompania) AS `empresa`, concat_ws(" - ", cp.direccion, cp.ciudad, cp.pais) AS `Ubicacion`
FROM clientes_neptuno cp;

SELECT lower(cp.IDCliente) AS `CODIGO` , upper(cp.nombrecompania) AS `empresa`, concat_ws(" - ", cp.direccion, cp.ciudad, cp.pais) AS `Ubicacion`
FROM clientes_neptuno cp;

SELECT n.fecha, LEFT(n.sexo, 1) as `sexo`, LEFT(n.tipo_parto, 1) AS `TIPO` FROM nacimientos n;

SELECT upper(concat(LEFT(c.ciudad, 1), LEFT(c.PAIS, 1), RIGHT(c.pais, 2))) AS `CODIGO` FROM clientes_neptuno c;

SELECT n.fecha, LEFT(n.sexo, 1) AS `sexo`, LEFT(n.tipo_parto, 1) AS `TIPO`, replace(n.nacionalidad, "Chilena", "Ciudadana") AS `Nacionalidad`
FROM nacimientos n;

SELECT * FROM PEDIDOS_NEPTUNO pn
WHERE year(pn.fechapedido) = 1997;

SELECT * FROM PEDIDOS_NEPTUNO pn
WHERE pn.fechapedido BETWEEN "1997-08-01" AND "1997-09-31";

SELECT * FROM PEDIDOS_NEPTUNO pn
WHERE DAY(pn.fechapedido) = 1;

SELECT pn.fechapedido, timestampdiff(DAY, pn.fechapedido, NOW()) AS `DIAS TRANSCURRIDOS`, dayname(pn.fechapedido) as `DIA`
FROM PEDIDOS_NEPTUNO pn
GROUP BY pn.fechapedido;

SELECT pn.fechapedido, timestampdiff(DAY, pn.fechapedido, NOW()) AS `DIAS TRANSCURRIDOS`, dayname(pn.fechapedido) as `DIA`,
dayofyear(pn.fechapedido) as `DIA DEL AÑO`
FROM PEDIDOS_NEPTUNO pn
GROUP BY pn.fechapedido;

SELECT pn.fechapedido, timestampdiff(DAY, pn.fechapedido, NOW()) AS `DIAS TRANSCURRIDOS`, dayname(pn.fechapedido) as `DIA`,
dayofyear(pn.fechapedido) AS `DIA DEL AÑO`, month(pn.fechapedido) AS `MES`
FROM PEDIDOS_NEPTUNO pn
GROUP BY pn.fechapedido;

SELECT pn.fechapedido, timestampdiff(DAY, pn.fechapedido, NOW()) AS `DIAS TRANSCURRIDOS`, dayname(pn.fechapedido) as `DIA`,
dayofyear(pn.fechapedido) AS `DIA DEL AÑO`, month(pn.fechapedido) AS `MES`,
DATE_ADD(pn.fechapedido, interval 30 day) AS `PRIMER VENCIMIENTO`
FROM PEDIDOS_NEPTUNO pn
GROUP BY pn.fechapedido;

SELECT pn.fechapedido, timestampdiff(DAY, pn.fechapedido, NOW()) AS `DIAS TRANSCURRIDOS`, dayname(pn.fechapedido) as `DIA`,
dayofyear(pn.fechapedido) AS `DIA DEL AÑO`, month(pn.fechapedido) AS `MES`,
DATE_ADD(pn.fechapedido, interval 30 DAY) AS `PRIMER VENCIMIENTO`,
DATE_ADD(pn.fechapedido, interval 2 MONTH) AS `SEGUNDO VENCIMIENTO`
FROM PEDIDOS_NEPTUNO pn
GROUP BY pn.fechapedido;

SELECT pn.cargo, ROUND((pn.cargo * 0.21), 2) AS `IVA` FROM PEDIDOS_NEPTUNO pn
GROUP BY pn.cargo
ORDER BY pn.cargo DESC;

SELECT pn.cargo, ROUND(sum(pn.cargo * 1.21), 2) AS `NETO A PAGAR` FROM PEDIDOS_NEPTUNO pn
GROUP BY pn.cargo
ORDER BY pn.cargo DESC;

SELECT pn.cargo, ROUND(sum(pn.cargo * 1.21), 2) AS `NETO A PAGAR`, FLOOR(ROUND(sum(pn.cargo * 1.21), 2)) AS `REDONDEO A FAVOR CLIENTE`
FROM PEDIDOS_NEPTUNO pn
GROUP BY pn.cargo
ORDER BY pn.cargo DESC;

SELECT pn.cargo, ROUND(sum(pn.cargo * 1.21), 2) AS `NETO A PAGAR`,
FLOOR(ROUND(sum(pn.cargo * 1.21), 2)) AS `REDONDEO A FAVOR CLIENTE`, # FLOOR = REDONDEA PARA ABAJO
CEIL(ROUND(sum(pn.cargo * 1.21), 2)) AS `REDONDEO A FAVOR EMPRESA` # CEIL = REDEONDEA PARA ARRIBA
FROM PEDIDOS_NEPTUNO pn
GROUP BY pn.cargo
ORDER BY pn.cargo DESC;

SELECT COUNT(*) FROM PEDIDOS_NEPTUNO pn;

SELECT COUNT(*) AS `ENTREGAS SPEEDY` FROM PEDIDOS_NEPTUNO pn
WHERE pn.transportista = "SPEEDY EXPRESS";

SELECT COUNT(*) AS `VENTAS` FROM PEDIDOS_NEPTUNO pn
WHERE pn.empleado LIKE "C%";

SELECT ROUND(AVG(pn.preciounidad), 2) AS `PROMEDIO`FROM PRODUCTOS_NEPTUNO pn;
SELECT ROUND(MIN(pn.preciounidad), 2) AS `PRECIO MAS BAJO`FROM PRODUCTOS_NEPTUNO pn;
SELECT ROUND(MAX(pn.preciounidad), 2) AS `PRECIO MAS ALTO`FROM PRODUCTOS_NEPTUNO pn;

SELECT pn.nombrecategoria, ROUND(MAX(pn.preciounidad), 2) AS `PRECIO PROMEDIO`FROM PRODUCTOS_NEPTUNO pn
GROUP BY pn.nombrecategoria;

SELECT np.transportista, COUNT(*) AS `Entregas` FROM PEDIDOS_NEPTUNO np
GROUP BY np.transportista;

SELECT n.sexo, COUNT(*) AS `NACIMIENTOS` FROM NACIMIENTOS n
GROUP BY n.sexo; 

SELECT pn.nombrecompania AS `CLIENTE`, ROUND(sum(pn.cargo), 2) AS `TOTAL GASTOS` FROM PEDIDOS_NEPTUNO pn
GROUP BY pn.nombrecompania;

SELECT p.seccion, COUNT(*) AS `CANTIDAD DE PRODUCTOS` FROM PRODUCTOS p # COD_PRODUCTO, SECCION, NOMBRE, IMPORTADO, ORIGEN, DIA, MES, ANO
GROUP BY p.seccion;

SELECT year(pn.fechapedido) AS `AÑO`, monthname(pn.fechapedido) AS `MES`, COUNT(*) AS `VENTAS`
FROM pedidos_neptuno pn
GROUP BY AÑO, MES
ORDER BY AÑO, MONTH(pn.fechapedido);

SELECT * FROM PEDIDOS_NEPTUNO pn; # IdPedido, NombreCompania, Empleado, FechaPedido, Transportista, Cargo
SELECT * FROM PEDIDOS_NEPTUNO; # IdPedido, NombreCompania, Empleado, FechaPedido, Transportista, Cargo

SELECT ROUND(sum(pn.cargo), 2) AS `TOTAL FACTURADO`,
ROUND(AVG(pn.cargo), 2) AS `PROMEDIO DE FACTURACION`,
ROUND(MAX(pn.cargo), 2) AS `MEJOR VENTA`
FROM PEDIDOS_NEPTUNO pn
GROUP BY pn.empleado;