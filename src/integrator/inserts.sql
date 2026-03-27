USE `laboratorio`;

-- ============================== DATOS BASE ==============================

-- Primero tablas padre
INSERT INTO `laboratorio`.`articulos`
(`idArticulo`, `nombre`, `precio`, `stock`)
VALUES
('95', 'Webcam con Microfono Plug & Play', '513.35', '39'),
('157', 'Apple Airpods Pro', '979.75', '152'),
('335', 'Lavasecarropas Automatico Samsung', '1589.50', '12'),
('411', 'Gloria Trevi / Gloria / CD + DVD', '2385.70', '2');

INSERT INTO `laboratorio`.`articulos`
(`idArticulo`, `nombre`, `precio`, `stock`)
VALUES
('512', 'Mouse Gamer RGB', '45.99', '120'),
('620', 'Teclado Mecanico TKL', '89.50', '75'),
('721', 'Monitor 27 pulgadas IPS', '310.20', '28');

SELECT * FROM `articulos`;

INSERT INTO `laboratorio`.`clientes`
(`idCliente`, `nombre`, `apellido`, `cuit`, `direccion`, `categoria`)
VALUES
('5', 'Santiago', 'Gonzalez', '23-24582359-9', 'Uriburu 558 - 7°A', 'VIP'),
('14', 'Gloria', 'Fernandez', '23-35965852-5', 'Constitucion 323', 'GBA'),
('17', 'Gonzalo', 'Lopez', '23-33587416-0', 'Arias 2624', 'GBA'),
('26', 'Carlos', 'Garcia', '23-42321230-9', 'Pasteur 322 - 2°C', 'VIP'),
('50', 'Micaela', 'Altieri', '23-22885566-5', 'Santamarina 1255', 'GBA');

INSERT INTO `laboratorio`.`clientes`
(`idCliente`, `nombre`, `apellido`, `cuit`, `direccion`, `categoria`)
VALUES
('63', 'Lucia', 'Martinez', '27-30222111-3', 'Av. Rivadavia 1800', 'CORP'),
('64', 'Bruno', 'Vega', '20-31234567-4', 'Mitre 640', 'GENERAL'),
('65', 'Camila', 'Sosa', '27-28999111-8', 'Belgrano 404', 'VIP');

SELECT * FROM `clientes`;

-- Después tabla hija
INSERT INTO `laboratorio`.`facturas`
(`letra`, `numero`, `idCliente`, `idArticulo`, `fecha`, `monto`)
VALUES
('A', '28', '14', '335', '2021-03-18', '1589.50'),
('A', '39', '26', '157', '2021-04-12', '979.75'),
('B', '8', '17', '95', '2021-04-25', '513.35'),
('B', '12', '5', '411', '2021-05-03', '2385.70'),
('B', '19', '50', '157', '2021-05-26', '979.75');

INSERT INTO `laboratorio`.`facturas`
(`letra`, `numero`, `idCliente`, `idArticulo`, `fecha`, `monto`)
VALUES
('C', '1', '63', '620', '2021-06-01', '89.50'),
('C', '2', '64', '512', '2021-06-02', '45.99'),
('C', '3', '65', '721', '2021-06-02', '310.20'),
('C', '4', '63', '157', '2021-06-03', '979.75');

SELECT * FROM `facturas`;

-- ============================== MODULO 4 ==============================

DROP TABLE IF EXISTS `varones`;
CREATE TABLE `varones`
SELECT *
FROM `nacimientos` n
WHERE n.`sexo` = 'MASCULINO';

DROP TABLE IF EXISTS `mujeres`;
CREATE TABLE `mujeres`
SELECT *
FROM `nacimientos` n
WHERE n.`sexo` = 'FEMENINO';

DROP TABLE IF EXISTS `indeterminados`;
CREATE TABLE `indeterminados`
SELECT *
FROM `nacimientos` n
WHERE n.`sexo` = 'INDETERMINADO';

DROP TABLE IF EXISTS `productos_suspendidos`;
CREATE TABLE `productos_suspendidos`
SELECT
    `idproducto`,
    `nombreproducto`,
    `nombrecontacto`,
    `nombrecategoria`,
    `preciounidad`,
    `suspendido`,
    `idproveedor`
FROM `productos_neptuno`
WHERE `suspendido` = 'SI';

-- ============================== MODULO 5 ==============================

INSERT INTO `equipos`
VALUES
('ARGENTINA'),
('BRASIL'),
('PARAGUAY'),
('CHILE'),
('URUGUAY'),
('COLOMBIA'),
('ECUADOR'),
('PERU'),
('BOLIVIA'),
('VENEZUELA');

INSERT INTO `partidos`
(`local_equipo`, `visitante_equipo`, `goles_local`, `goles_visitante`, `fecha_partido`)
VALUES
('ARGENTINA', 'BRASIL', 1, 1, '2025-06-10'),
('URUGUAY', 'CHILE', 2, 0, '2025-06-11'),
('COLOMBIA', 'PERU', 3, 1, '2025-06-12'),
('ECUADOR', 'VENEZUELA', 2, 2, '2025-06-12');

INSERT INTO `posiciones`
(`equipo`, `puntos`, `partidos_jugados`, `partidos_ganados`, `partidos_empatados`, `partidos_perdidos`, `goles_favor`, `goles_contra`)
VALUES
('ARGENTINA', 1, 1, 0, 1, 0, 1, 1),
('BRASIL', 1, 1, 0, 1, 0, 1, 1),
('URUGUAY', 3, 1, 1, 0, 0, 2, 0),
('CHILE', 0, 1, 0, 0, 1, 0, 2);