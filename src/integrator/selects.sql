USE `laboratorio`;

-- ============================== MODULO 2 ==============================

SELECT *
FROM clientes_neptuno;
# IDCliente, NombreCompania, Direccion, Ciudad, Pais

SELECT cp.NombreCompania, cp.Ciudad, cp.Pais
FROM clientes_neptuno cp;

SELECT cp.NombreCompania, cp.Ciudad, cp.Pais
FROM clientes_neptuno cp
ORDER BY cp.Pais ASC;

SELECT cp.NombreCompania, cp.Ciudad, cp.Pais
FROM clientes_neptuno cp
ORDER BY cp.Pais ASC, cp.Ciudad ASC;

SELECT cp.NombreCompania, cp.Ciudad, cp.Pais
FROM clientes_neptuno cp
ORDER BY cp.Pais ASC
LIMIT 10;

SELECT cp.NombreCompania, cp.Ciudad, cp.Pais
FROM clientes_neptuno cp
ORDER BY cp.Pais ASC
LIMIT 10, 5;

SELECT *
FROM nacimientos;
# SEXO, FECHA, TIPO_PARTO, ATENC_PART, LOCAL_PART, SEMANAS, PESO, TALLA, EDAD_PADRE,
# NIVEL_PADRE, OCUPA_P, EDAD_MADRE, ESTADO_CIVIL_MADRE, COMUNA, URBA_RURAL,
# HIJOS_VIVOS, HIJOS_FALLECIDOS, HIJOS_TOTAL, NACIONALIDAD, ESTABLECIMIENTO

SELECT *
FROM nacimientos n
WHERE n.nacionalidad IN ('Extranjera');

SELECT *
FROM nacimientos n
WHERE n.edad_madre < 18
ORDER BY n.edad_madre ASC;

SELECT *
FROM nacimientos n
WHERE n.edad_madre = n.edad_padre;

SELECT *
FROM nacimientos n
WHERE (n.edad_padre - n.edad_madre) > 40;

SELECT *
FROM clientes_neptuno n
WHERE n.Pais = 'Argentina';

SELECT *
FROM clientes_neptuno n
WHERE n.Pais <> 'Argentina'
ORDER BY n.Pais ASC;

SELECT *
FROM nacimientos n
WHERE n.semanas < 20
ORDER BY n.semanas DESC;

SELECT *
FROM nacimientos n
WHERE n.sexo = 'Femenino'
  AND n.edad_madre > 40;

SELECT *
FROM clientes_neptuno n
WHERE n.Pais IN ('Argentina', 'Brasil', 'Venezuela')
ORDER BY n.Pais ASC, n.Ciudad ASC;

SELECT *
FROM nacimientos n
WHERE n.semanas BETWEEN 20 AND 25
ORDER BY n.semanas ASC;

SELECT *
FROM nacimientos n
WHERE n.comuna IN (1101, 3201, 5605, 8108, 9204, 13120, 15202)
ORDER BY n.comuna ASC;

SELECT *
FROM clientes_neptuno n
WHERE n.IDCliente LIKE 'C%';

SELECT *
FROM clientes_neptuno n
WHERE n.Ciudad LIKE 'B%'
  AND n.Ciudad LIKE '_____';

SELECT *
FROM nacimientos n
WHERE n.HIJOS_TOTAL > 10
ORDER BY n.HIJOS_TOTAL ASC;

-- ============================== MODULO 3 ==============================

SELECT
    cp.IDCliente,
    cp.NombreCompania,
    CONCAT(cp.Direccion, ' - ', cp.Ciudad, ' - ', cp.Pais) AS `Ubicacion`
FROM clientes_neptuno cp;
# IDCliente, NombreCompania, Direccion, Ciudad, Pais

SELECT
    cp.IDCliente,
    cp.NombreCompania,
    CONCAT_WS(' - ', cp.Direccion, cp.Ciudad, cp.Pais) AS `Ubicacion`
FROM clientes_neptuno cp;

SELECT
    cp.IDCliente,
    UPPER(cp.NombreCompania) AS `Empresa`,
    CONCAT_WS(' - ', cp.Direccion, cp.Ciudad, cp.Pais) AS `Ubicacion`
FROM clientes_neptuno cp;

SELECT
    LOWER(cp.IDCliente) AS `CODIGO`,
    UPPER(cp.NombreCompania) AS `Empresa`,
    CONCAT_WS(' - ', cp.Direccion, cp.Ciudad, cp.Pais) AS `Ubicacion`
FROM clientes_neptuno cp;

SELECT
    n.fecha,
    LEFT(n.sexo, 1) AS `sexo`,
    LEFT(n.tipo_parto, 1) AS `TIPO`
FROM nacimientos n;

SELECT
    UPPER(CONCAT(LEFT(c.Ciudad, 1), LEFT(c.Pais, 1), RIGHT(c.Pais, 2))) AS `CODIGO`
FROM clientes_neptuno c;

SELECT
    n.fecha,
    LEFT(n.sexo, 1) AS `sexo`,
    LEFT(n.tipo_parto, 1) AS `TIPO`,
    REPLACE(n.nacionalidad, 'Chilena', 'Ciudadana') AS `Nacionalidad`
FROM nacimientos n;

SELECT *
FROM pedidos_neptuno pn
WHERE YEAR(pn.fechapedido) = 1997;

SELECT *
FROM pedidos_neptuno pn
WHERE pn.fechapedido BETWEEN '1997-08-01' AND '1997-09-30';

SELECT *
FROM pedidos_neptuno pn
WHERE DAY(pn.fechapedido) = 1;

SELECT
    pn.fechapedido,
    TIMESTAMPDIFF(DAY, pn.fechapedido, NOW()) AS `DIAS TRANSCURRIDOS`,
    DAYNAME(pn.fechapedido) AS `DIA`
FROM pedidos_neptuno pn
GROUP BY pn.fechapedido;

SELECT
    pn.fechapedido,
    TIMESTAMPDIFF(DAY, pn.fechapedido, NOW()) AS `DIAS TRANSCURRIDOS`,
    DAYNAME(pn.fechapedido) AS `DIA`,
    DAYOFYEAR(pn.fechapedido) AS `DIA DEL AÑO`
FROM pedidos_neptuno pn
GROUP BY pn.fechapedido;

SELECT
    pn.fechapedido,
    TIMESTAMPDIFF(DAY, pn.fechapedido, NOW()) AS `DIAS TRANSCURRIDOS`,
    DAYNAME(pn.fechapedido) AS `DIA`,
    DAYOFYEAR(pn.fechapedido) AS `DIA DEL AÑO`,
    MONTH(pn.fechapedido) AS `MES`
FROM pedidos_neptuno pn
GROUP BY pn.fechapedido;

SELECT
    pn.fechapedido,
    TIMESTAMPDIFF(DAY, pn.fechapedido, NOW()) AS `DIAS TRANSCURRIDOS`,
    DAYNAME(pn.fechapedido) AS `DIA`,
    DAYOFYEAR(pn.fechapedido) AS `DIA DEL AÑO`,
    MONTH(pn.fechapedido) AS `MES`,
    DATE_ADD(pn.fechapedido, INTERVAL 30 DAY) AS `PRIMER VENCIMIENTO`
FROM pedidos_neptuno pn
GROUP BY pn.fechapedido;

SELECT
    pn.fechapedido,
    TIMESTAMPDIFF(DAY, pn.fechapedido, NOW()) AS `DIAS TRANSCURRIDOS`,
    DAYNAME(pn.fechapedido) AS `DIA`,
    DAYOFYEAR(pn.fechapedido) AS `DIA DEL AÑO`,
    MONTH(pn.fechapedido) AS `MES`,
    DATE_ADD(pn.fechapedido, INTERVAL 30 DAY) AS `PRIMER VENCIMIENTO`,
    DATE_ADD(pn.fechapedido, INTERVAL 2 MONTH) AS `SEGUNDO VENCIMIENTO`
FROM pedidos_neptuno pn
GROUP BY pn.fechapedido;

SELECT
    pn.cargo,
    ROUND((pn.cargo * 0.21), 2) AS `IVA`
FROM pedidos_neptuno pn
GROUP BY pn.cargo
ORDER BY pn.cargo DESC;

SELECT
    pn.cargo,
    ROUND(SUM(pn.cargo * 1.21), 2) AS `NETO A PAGAR`
FROM pedidos_neptuno pn
GROUP BY pn.cargo
ORDER BY pn.cargo DESC;

SELECT
    pn.cargo,
    ROUND(SUM(pn.cargo * 1.21), 2) AS `NETO A PAGAR`,
    FLOOR(ROUND(SUM(pn.cargo * 1.21), 2)) AS `REDONDEO A FAVOR CLIENTE`
FROM pedidos_neptuno pn
GROUP BY pn.cargo
ORDER BY pn.cargo DESC;

SELECT
    pn.cargo,
    ROUND(SUM(pn.cargo * 1.21), 2) AS `NETO A PAGAR`,
    FLOOR(ROUND(SUM(pn.cargo * 1.21), 2)) AS `REDONDEO A FAVOR CLIENTE`,
    CEIL(ROUND(SUM(pn.cargo * 1.21), 2)) AS `REDONDEO A FAVOR EMPRESA`
FROM pedidos_neptuno pn
GROUP BY pn.cargo
ORDER BY pn.cargo DESC;

SELECT COUNT(*)
FROM pedidos_neptuno pn;

SELECT COUNT(*) AS `ENTREGAS SPEEDY`
FROM pedidos_neptuno pn
WHERE pn.transportista = 'SPEEDY EXPRESS';

SELECT COUNT(*) AS `VENTAS`
FROM pedidos_neptuno pn
WHERE pn.empleado LIKE 'C%';

SELECT ROUND(AVG(pn.preciounidad), 2) AS `PROMEDIO`
FROM productos_neptuno pn;

SELECT ROUND(MIN(pn.preciounidad), 2) AS `PRECIO MAS BAJO`
FROM productos_neptuno pn;

SELECT ROUND(MAX(pn.preciounidad), 2) AS `PRECIO MAS ALTO`
FROM productos_neptuno pn;

SELECT
    pn.nombrecategoria,
    ROUND(AVG(pn.preciounidad), 2) AS `PRECIO PROMEDIO`
FROM productos_neptuno pn
GROUP BY pn.nombrecategoria;

SELECT
    np.transportista,
    COUNT(*) AS `Entregas`
FROM pedidos_neptuno np
GROUP BY np.transportista;

SELECT
    n.sexo,
    COUNT(*) AS `NACIMIENTOS`
FROM nacimientos n
GROUP BY n.sexo;

SELECT
    pn.nombrecompania AS `CLIENTE`,
    ROUND(SUM(pn.cargo), 2) AS `TOTAL GASTOS`
FROM pedidos_neptuno pn
GROUP BY pn.nombrecompania;

SELECT
    p.seccion,
    COUNT(*) AS `CANTIDAD DE PRODUCTOS`
FROM productos p;
# COD_PRODUCTO, SECCION, NOMBRE, IMPORTADO, ORIGEN, DIA, MES, ANO

SELECT
    YEAR(pn.fechapedido) AS `AÑO`,
    MONTHNAME(pn.fechapedido) AS `MES`,
    COUNT(*) AS `VENTAS`
FROM pedidos_neptuno pn
GROUP BY YEAR(pn.fechapedido), MONTH(pn.fechapedido), MONTHNAME(pn.fechapedido)
ORDER BY YEAR(pn.fechapedido), MONTH(pn.fechapedido);

SELECT *
FROM pedidos_neptuno pn;
# IdPedido, NombreCompania, Empleado, FechaPedido, Transportista, Cargo

SELECT
    ROUND(SUM(pn.cargo), 2) AS `TOTAL FACTURADO`,
    ROUND(AVG(pn.cargo), 2) AS `PROMEDIO DE FACTURACION`,
    ROUND(MAX(pn.cargo), 2) AS `MEJOR VENTA`,
    ROUND(MIN(pn.cargo), 2) AS `PEOR VENTA`,
    COUNT(pn.cargo) AS `CANTIDAD DE VENTAS`
FROM pedidos_neptuno pn
GROUP BY pn.empleado;

-- ============================== MODULO 4 ==============================

SELECT COUNT(*)
FROM varones;

SELECT COUNT(*)
FROM mujeres;

SELECT COUNT(*)
FROM indeterminados;

SELECT *
FROM empleados;

SELECT *
FROM clientes;

SELECT *
FROM productos;

SELECT *
FROM productos_neptuno;

SELECT *
FROM proveedores;

SELECT *
FROM productos_suspendidos;

-- ============================== MODULO 5 ==============================

SELECT *
FROM productos_neptuno np
WHERE np.preciounidad > (
    SELECT ROUND(AVG(pn.preciounidad), 2)
    FROM productos_neptuno pn
)
ORDER BY np.nombreproducto;

SELECT *
FROM productos_neptuno np
WHERE np.preciounidad > (
    SELECT MAX(ps.preciounidad)
    FROM productos_suspendidos ps
)
ORDER BY np.preciounidad DESC;

SELECT *
FROM varones v
WHERE v.semanas < (
    SELECT MIN(i.semanas)
    FROM indeterminados i
);

SELECT *
FROM productos_neptuno np
WHERE np.nombreproducto LIKE CONCAT(
    (
        SELECT LEFT(e.nombre_empleado, 1)
        FROM empleados e
        WHERE e.idempleado = 8
    ),
    '%'
)
ORDER BY np.nombreproducto ASC;

SELECT *
FROM productos_neptuno np
WHERE np.idproveedor = (
    SELECT MAX(p.idproveedor)
    FROM proveedores p
)
ORDER BY np.nombreproducto ASC;

SELECT *
FROM productos_neptuno np
WHERE np.nombrecategoria = 'BEBIDAS'
  AND np.preciounidad > (
      SELECT MAX(pn.preciounidad)
      FROM productos_neptuno pn
      WHERE pn.nombrecategoria = 'CONDIMENTOS'
  );

SELECT *
FROM mujeres m
WHERE m.edad_madre > (
    SELECT MAX(v.edad_madre)
    FROM varones v
);

SELECT *
FROM clientes_neptuno cn
WHERE cn.nombrecompania IN (
    SELECT pn.nombrecompania
    FROM pedidos_neptuno pn
    WHERE pn.cargo > 500
);

SELECT
    np.idcliente,
    np.nombrecompania,
    np.ciudad,
    np.pais,
    CASE
        WHEN np.pais IN ('Mexico', 'Canada', 'USA') THEN 'America del norte'
        WHEN np.pais IN ('Argentina', 'Brasil', 'Venezuela') THEN 'America del sur'
        ELSE 'Europa'
    END AS `Continente`
FROM clientes_neptuno np
ORDER BY `Continente` ASC, np.pais;

SELECT
    pn.idpedido,
    pn.nombrecompania,
    pn.fechapedido,
    pn.cargo,
    CASE
        WHEN pn.cargo > 700 THEN 'EXCELENTE'
        WHEN pn.cargo BETWEEN 500 AND 700 THEN 'MUY BUENO'
        WHEN pn.cargo BETWEEN 250 AND 500 THEN 'BUENO'
        WHEN pn.cargo BETWEEN 50 AND 250 THEN 'REGULAR'
        WHEN pn.cargo < 50 THEN 'MALO'
    END AS `EVALUACION`
FROM pedidos_neptuno pn
ORDER BY pn.cargo DESC;

SELECT
    pn.idproducto,
    pn.nombreproducto,
    pn.nombrecategoria,
    pn.preciounidad,
    CASE
        WHEN pn.preciounidad > 100 THEN 'DELUXE'
        WHEN pn.preciounidad BETWEEN 10 AND 100 THEN 'REGULAR'
        WHEN pn.preciounidad < 10 THEN 'ECONOMICO'
    END AS `TIPO`
FROM productos_neptuno pn
ORDER BY pn.preciounidad DESC;

SELECT *
FROM varones
UNION
SELECT *
FROM mujeres
UNION
SELECT *
FROM indeterminados;

SELECT *
FROM varones
WHERE MONTH(fecha) = 9
  AND semanas > 40
  AND nacionalidad = 'Chilena'
  AND estado_civil_madre = 'Casada'
UNION
SELECT *
FROM mujeres
WHERE MONTH(fecha) = 9
  AND semanas > 40
  AND nacionalidad = 'Chilena'
  AND estado_civil_madre = 'Casada'
UNION
SELECT *
FROM indeterminados
WHERE MONTH(fecha) = 9
  AND semanas > 40
  AND nacionalidad = 'Chilena'
  AND estado_civil_madre = 'Casada';

SELECT *, 'A LA VENTA' AS `condicion`
FROM productos_neptuno
WHERE preciounidad > 80
UNION
SELECT *, 'SUSPENDIDO' AS `condicion`
FROM productos_suspendidos
WHERE preciounidad > 80
ORDER BY nombreproducto ASC;

SELECT *
FROM productos_neptuno
WHERE nombrecategoria = 'BEBIDAS'
UNION
SELECT *
FROM productos_suspendidos
WHERE nombrecategoria = 'BEBIDAS'
ORDER BY nombreproducto ASC;

SELECT *
FROM productos_neptuno
WHERE nombrecategoria = 'BEBIDAS'
UNION ALL
SELECT *
FROM productos_suspendidos
WHERE nombrecategoria = 'BEBIDAS'
ORDER BY nombreproducto ASC;

SELECT *
FROM equipos;
# equipo

SELECT *
FROM equipos e1
CROSS JOIN equipos e2
WHERE e1.equipo <> e2.equipo
ORDER BY e1.equipo;

# IdProveedor, NombreContacto, CargoContacto, Direccion, Ciudad, Region, Pais = PROVEEDORES
# IdProducto, NombreProducto, NombreContacto, NombreCategoria, PrecioUnidad, suspendido, IdProveedor = PRODUCTOS NEPTUNO

SELECT
    p.nombrecontacto,
    pn.idproducto,
    pn.nombreproducto,
    pn.preciounidad
FROM proveedores p
INNER JOIN productos_neptuno pn
    ON pn.idproveedor = p.idproveedor;

SELECT
    p.nombrecontacto,
    pn.idproducto,
    pn.nombreproducto,
    pn.preciounidad
FROM proveedores p,
     productos_neptuno pn
WHERE pn.idproveedor = p.idproveedor;

# COD_CLIENTE, EMPRESA, DIRECCION, CIUDAD, telefono, RESPONSABLE, tipo = CLIENTES
# NUMERO_PEDIDO, CODIGO_CLIENTE, FECHA_PEDIDO, FORMA_PAGO, ENVIADO = PEDIDOS

SELECT
    c.empresa,
    p.numero_pedido,
    p.fecha_pedido,
    p.forma_pago
FROM clientes c
INNER JOIN pedidos p
    ON p.codigo_cliente = c.cod_cliente
ORDER BY c.empresa ASC;

SELECT
    c.empresa,
    p.numero_pedido,
    p.fecha_pedido,
    p.forma_pago
FROM clientes c
LEFT JOIN pedidos p
    ON p.codigo_cliente = c.cod_cliente
WHERE p.numero_pedido IS NULL
ORDER BY c.empresa ASC;

SELECT
    c.empresa
FROM clientes c
LEFT JOIN pedidos p
    ON p.codigo_cliente = c.cod_cliente
WHERE p.numero_pedido IS NULL
ORDER BY c.empresa ASC;

SELECT *
FROM proveedores;
# IdProveedor, NombreContacto, CargoContacto, Direccion, Ciudad, Region, Pais

SELECT *
FROM productos_neptuno;
# IdProducto, NombreProducto, NombreContacto, NombreCategoria, PrecioUnidad, suspendido, IdProveedor

SELECT *
FROM proveedores p
LEFT JOIN productos_neptuno pn
    ON pn.idproveedor = p.idproveedor
WHERE pn.idproducto IS NULL;

SELECT *
FROM proveedores p
RIGHT JOIN productos_neptuno pn
    ON pn.idproveedor = p.idproveedor
WHERE p.idproveedor IS NULL;

-- ============================== EJEMPLOS EXTRA ============================== 

-- Top clientes con mayor facturacion total
SELECT
    pn.nombrecompania AS cliente,
    ROUND(SUM(pn.cargo), 2) AS total_facturado,
    COUNT(*) AS cantidad_pedidos
FROM pedidos_neptuno pn
GROUP BY pn.nombrecompania
ORDER BY total_facturado DESC
LIMIT 10;

-- Ticket promedio por transportista
SELECT
    pn.transportista,
    ROUND(AVG(pn.cargo), 2) AS ticket_promedio,
    ROUND(SUM(pn.cargo), 2) AS total_transportado
FROM pedidos_neptuno pn
GROUP BY pn.transportista
ORDER BY ticket_promedio DESC;

-- Productos activos mas caros por categoria
SELECT
    pn.nombrecategoria,
    MAX(pn.preciounidad) AS precio_maximo_activo
FROM productos_neptuno pn
WHERE pn.suspendido = 'NO'
GROUP BY pn.nombrecategoria
ORDER BY precio_maximo_activo DESC;

-- Distribucion de suspendidos por proveedor
SELECT
    pn.idproveedor,
    SUM(CASE WHEN pn.suspendido = 'SI' THEN 1 ELSE 0 END) AS suspendidos,
    SUM(CASE WHEN pn.suspendido = 'NO' THEN 1 ELSE 0 END) AS activos
FROM productos_neptuno pn
GROUP BY pn.idproveedor
ORDER BY suspendidos DESC, activos DESC;

-- Ranking simple de equipos por puntos y diferencia de gol
SELECT
    p.equipo,
    p.puntos,
    (p.goles_favor - p.goles_contra) AS diferencia_gol,
    p.partidos_jugados
FROM posiciones p
ORDER BY p.puntos DESC, diferencia_gol DESC, p.goles_favor DESC;

-- Historial de partidos con resultado textual
SELECT
    pa.fecha_partido,
    pa.local_equipo,
    pa.visitante_equipo,
    CONCAT(pa.goles_local, '-', pa.goles_visitante) AS marcador,
    CASE
        WHEN pa.goles_local > pa.goles_visitante THEN CONCAT('GANO ', pa.local_equipo)
        WHEN pa.goles_local < pa.goles_visitante THEN CONCAT('GANO ', pa.visitante_equipo)
        ELSE 'EMPATE'
    END AS resultado
FROM partidos pa
ORDER BY pa.fecha_partido ASC;

-- Clientes de Espana sin pedidos registrados
SELECT
    c.cod_cliente,
    c.empresa,
    c.ciudad
FROM clientes c
LEFT JOIN pedidos p
    ON p.codigo_cliente = c.cod_cliente
WHERE p.numero_pedido IS NULL
ORDER BY c.empresa;

-- Ventas acumuladas por anio con filtro de volumen
SELECT
    YEAR(pn.fechapedido) AS anio,
    ROUND(SUM(pn.cargo), 2) AS total_anual,
    COUNT(*) AS cantidad_pedidos
FROM pedidos_neptuno pn
GROUP BY YEAR(pn.fechapedido)
HAVING SUM(pn.cargo) > 10000
ORDER BY anio;