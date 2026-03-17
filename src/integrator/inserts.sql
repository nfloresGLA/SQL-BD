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

SELECT * FROM `articulos`;

INSERT INTO `laboratorio`.`clientes`
(`idCliente`, `nombre`, `apellido`, `cuit`, `direccion`, `categoria`)
VALUES
('5', 'Santiago', 'Gonzalez', '23-24582359-9', 'Uriburu 558 - 7°A', 'VIP'),
('14', 'Gloria', 'Fernandez', '23-35965852-5', 'Constitucion 323', 'GBA'),
('17', 'Gonzalo', 'Lopez', '23-33587416-0', 'Arias 2624', 'GBA'),
('26', 'Carlos', 'Garcia', '23-42321230-9', 'Pasteur 322 - 2°C', 'VIP'),
('50', 'Micaela', 'Altieri', '23-22885566-5', 'Santamarina 1255', 'GBA');

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