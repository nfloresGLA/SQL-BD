USE `laboratorio`;

INSERT INTO `laboratorio`.`facturas` VALUES ('A', '28', '14', '335', '2021-03-18', '1589.50');
INSERT INTO `laboratorio`.`facturas` VALUES ('A', '39', '26', '157', '2021-04-12', '979.75');
INSERT INTO `laboratorio`.`facturas` VALUES ('B', '8', '17', '95', '2021-04-25', '513.35');
INSERT INTO `laboratorio`.`facturas` VALUES ('B', '12', '5', '411', '2021-05-03', '2385.70');
INSERT INTO `laboratorio`.`facturas` VALUES ('B', '19', '50', '157', '2021-05-26', '979.75');

SELECT * FROM facturas;

INSERT INTO `laboratorio`.`articulos` VALUES ('95', 'Webcam con Microfono Plug & Play', '513.35', '39');
INSERT INTO `laboratorio`.`articulos` VALUES ('157', 'Apple Airpods Pro', '979.75', '152');
INSERT INTO `laboratorio`.`articulos` VALUES ('335', 'Lavasecarropas Automatico Samsung', '1589.50', '12');
INSERT INTO `laboratorio`.`articulos` VALUES ('411', 'Gloria Trevi / Gloria / CD + DVD', '2385.70', '2');

SELECT * FROM articulos;

INSERT INTO `laboratorio`.`clientes` VALUES ('5', 'Santiago', 'Gonzalez', '23-24582359-9', 'Uriburu 558 - 7°A', 'VIP');
INSERT INTO `laboratorio`.`clientes` VALUES ('14', 'Gloria', 'Fernandez', '23-35965852-5', 'Constitucion 323', 'GBA');
INSERT INTO `laboratorio`.`clientes` VALUES ('17', 'Gonzalo', 'Lopez', '23-33587416-0', 'Arias 2624', 'GBA');
INSERT INTO `laboratorio`.`clientes` VALUES ('26', 'Carlos', 'Garcia', '23-42321230-9', 'Pasteur 322 - 2°C', 'VIP');
INSERT INTO `laboratorio`.`clientes` VALUES ('50', 'Micaela', 'Altieri', '23-22885566-5', 'Santamarina 1255', 'GBA');

SELECT * FROM clientes;

# ------------------------------ MODULO 4 ------------------------------ #

CREATE TABLE varones
SELECT * FROM nacimientos n
WHERE n.sexo = "MASCULINO";

CREATE TABLE mujeres
SELECT * FROM nacimientos n
WHERE n.sexo = "FEMENINO";

CREATE TABLE indeterminados
SELECT * FROM nacimientos n
WHERE n.sexo = "INDETERMINADO";

DROP TABLE NACIMIENTOS;