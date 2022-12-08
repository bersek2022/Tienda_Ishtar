/*
 Navicat Premium Data Transfer

 Source Server         : prueba
 Source Server Type    : MySQL
 Source Server Version : 100406
 Source Host           : localhost:33065
 Source Schema         : consulta_1

 Target Server Type    : MySQL
 Target Server Version : 100406
 File Encoding         : 65001

 Date: 07/12/2022 16:27:42
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;
create database consulta_1;
use consulta_1;
-- ----------------------------
-- Table structure for categoria
-- ----------------------------
DROP TABLE IF EXISTS `categoria`;
CREATE TABLE `categoria`  (
  `id_categoria` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `imagen` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id_categoria`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of categoria
-- ----------------------------
INSERT INTO `categoria` VALUES (1, 'Celulares', 'img/calulares.jpg');
INSERT INTO `categoria` VALUES (2, 'Laptop', 'img/laptops.jpg');
INSERT INTO `categoria` VALUES (3, 'Impresoras', 'img/impresoras.jpg');
INSERT INTO `categoria` VALUES (4, 'Cocina', 'img/cocina.jpg');
INSERT INTO `categoria` VALUES (5, 'Refrigeradores', 'img/refrigerador.jpg');
INSERT INTO `categoria` VALUES (6, 'Televisores', 'img/televisores.jpg');
INSERT INTO `categoria` VALUES (7, 'Lavadoras', 'img/lavadora.jpg');
INSERT INTO `categoria` VALUES (8, 'Camaras', 'img/microondas.jpg');
INSERT INTO `categoria` VALUES (9, 'Accesorios', 'img/accesorios.jpg');

-- ----------------------------
-- Table structure for clientes
-- ----------------------------
DROP TABLE IF EXISTS `clientes`;
CREATE TABLE `clientes`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `apellido` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ci` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `correo` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `telefono` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `direccion` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ci`(`ci`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of clientes
-- ----------------------------
INSERT INTO `clientes` VALUES (1, 'Marcos', 'Asencio', '987564231', 'MarcosA@gmail.com', '785269348', 'Calle Union', 'marcos');
INSERT INTO `clientes` VALUES (2, 'Ana', 'Miranda', '4548497', 'anamir@gmail.com', '698574527', 'calle mercado ', 'anamir');
INSERT INTO `clientes` VALUES (7, 'maria ', 'zepeda', '10005679', 'maria_A@gmail.com', '825478957', 'av. 6 de marzo', 'maria');

-- ----------------------------
-- Table structure for detalle_compra
-- ----------------------------
DROP TABLE IF EXISTS `detalle_compra`;
CREATE TABLE `detalle_compra`  (
  `id_detalle` int(10) NOT NULL AUTO_INCREMENT,
  `id_factura` int(10) NULL DEFAULT NULL,
  `id_producto` int(10) NULL DEFAULT NULL,
  `cantidad` int(20) NULL DEFAULT NULL,
  `precio` float NULL DEFAULT NULL,
  PRIMARY KEY (`id_detalle`) USING BTREE,
  INDEX `num_factura`(`id_factura`) USING BTREE,
  INDEX `id_producto`(`id_producto`) USING BTREE,
  CONSTRAINT `detalle_compra_ibfk_1` FOREIGN KEY (`id_factura`) REFERENCES `facturacion` (`id_factura`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `detalle_compra_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for facturacion
-- ----------------------------
DROP TABLE IF EXISTS `facturacion`;
CREATE TABLE `facturacion`  (
  `id_factura` int(10) NOT NULL AUTO_INCREMENT,
  `id_cliente` int(10) NULL DEFAULT NULL,
  `fecha` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `direccion` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `localidad` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `region` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `codigo_postal` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `observaciones` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `modo_pago` int(10) NULL DEFAULT NULL,
  `Titular_tarjeta` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `numero_tarjeta` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id_factura`) USING BTREE,
  INDEX `modo_pago`(`modo_pago`) USING BTREE,
  INDEX `id_cliente`(`id_cliente`) USING BTREE,
  CONSTRAINT `facturacion_ibfk_1` FOREIGN KEY (`modo_pago`) REFERENCES `modo_pago` (`id_pago`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `facturacion_ibfk_2` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for modo_pago
-- ----------------------------
DROP TABLE IF EXISTS `modo_pago`;
CREATE TABLE `modo_pago`  (
  `id_pago` int(10) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id_pago`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of modo_pago
-- ----------------------------
INSERT INTO `modo_pago` VALUES (1, 'Tarjeta De Credito');
INSERT INTO `modo_pago` VALUES (3, 'Transferencia Bancaria');
INSERT INTO `modo_pago` VALUES (5, 'Acredito');

-- ----------------------------
-- Table structure for pedidos
-- ----------------------------
DROP TABLE IF EXISTS `pedidos`;
CREATE TABLE `pedidos`  (
  `id_pedido` int(10) NOT NULL AUTO_INCREMENT,
  `num_factura` int(10) NULL DEFAULT NULL,
  PRIMARY KEY (`id_pedido`) USING BTREE,
  INDEX `num_factura`(`num_factura`) USING BTREE,
  CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`num_factura`) REFERENCES `facturacion` (`id_factura`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for productos
-- ----------------------------
DROP TABLE IF EXISTS `productos`;
CREATE TABLE `productos`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nombre_producto` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `imagen_1` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `imagen_2` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `precio` double NULL DEFAULT NULL,
  `descripcion` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `marca` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `stock` int(100) NULL DEFAULT NULL,
  `estado` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_proveedores` int(50) NULL DEFAULT NULL,
  `id_categoria` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_proveedores`(`id_proveedores`) USING BTREE,
  INDEX `for_cat`(`id_categoria`) USING BTREE,
  CONSTRAINT `for_cat` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_proveedores`) REFERENCES `proveedores` (`id_proveedor`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of productos
-- ----------------------------
INSERT INTO `productos` VALUES (2, 'Aspiradora EINHELL', 'img/aspiradora EINHELL.jpg', 'img/Aspiradora EINHELL2.jpg', 469, 'El aspirador seco y hÃºmedo TC-VC 1820 S ', 'EINHELL', 25, 'promocion', 3, 9);
INSERT INTO `productos` VALUES (3, 'aspiradora inalambrica 18v MAKITA', 'img/aspiradora inalambrica 18v MAKITA.jpg', 'img/aspiradora inalambrica USB.jpg', 999.5, 'aspiradora inalambrica\r\n', 'Makita', 55, 'disponible', 3, 9);
INSERT INTO `productos` VALUES (4, 'Equipo-de-sonido-lg', 'img/Equipo-de-sonido-lg-ok55-500w_20030.jpg', 'img/Equipo-De-Sonido-Parlantes-PC-TV-40w-Bluetooth-Usb-Sd-Rca-Aux.jpg', 695.6, 'Equipo de sonido LG OK55 \r\n', 'LG', 9, 'disponible', 4, 9);
INSERT INTO `productos` VALUES (5, 'Cocina de piso 76', 'img/imagen 1.1.jpeg', 'img/imagen 1.jpeg', 995.6, 'Cocina de piso 76 acero inoxidable\r\n', 'Tramontina', 0, 'agotado', 4, 4);
INSERT INTO `productos` VALUES (6, 'Cocina de piso 76 ambe', 'img/imagen 2.1.jpeg', 'img/imagen 2.jpeg', 1500, 'Cocina de piso 76 Silver mabe acero inoxidable\r\n', 'Silver', 5, 'promocion', 3, 4);
INSERT INTO `productos` VALUES (7, 'Cocina de piso 55cm', 'img/imagen 3.1.jpeg', 'img/imagen 3.jpeg', 1350.2, 'Cocina de piso 76 Gris mabe\r\n', 'Mabe', 2, 'disponible', 3, 4);

-- ----------------------------
-- Table structure for proveedores
-- ----------------------------
DROP TABLE IF EXISTS `proveedores`;
CREATE TABLE `proveedores`  (
  `id_proveedor` int(10) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `telefono` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `direccion` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cantidad` int(15) NULL DEFAULT NULL,
  `precio` float(11, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`id_proveedor`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of proveedores
-- ----------------------------
INSERT INTO `proveedores` VALUES (1, 'Samsug Bolivia', '80011151651', 'Av.arce', 500, 50000.00);
INSERT INTO `proveedores` VALUES (3, 'Xiaomi', '987456213', 'Santa Cruz', 1000, 20000.00);
INSERT INTO `proveedores` VALUES (4, 'Bosch', '8001658655', 'Cochabamba', 5000, 20000.00);
INSERT INTO `proveedores` VALUES (5, 'Calzar Bolivia', '89659352', 'avenida bolivia', 100, 1200.00);

-- ----------------------------
-- Table structure for usuarios
-- ----------------------------
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `apellido` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ci` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `correo` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `telefono` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of usuarios
-- ----------------------------
INSERT INTO `usuarios` VALUES (7, 'Steve', 'jobs', '10005678', 'steve@gmail.com', '7986542', 'Bolivia');
INSERT INTO `usuarios` VALUES (8, 'Susana', 'Cruz Laura', '10005654', 'susan_demon@gmail.com', '6205855855', 'Gerente');
INSERT INTO `usuarios` VALUES (9, 'ejemplo', 'ejemplo', '9879879', 'principal@gmail.com', '222222222', 'admin');

-- ----------------------------
-- Procedure structure for insertCategoria
-- ----------------------------
DROP PROCEDURE IF EXISTS `insertCategoria`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertCategoria`(IN `_descripcion` VARCHAR(50), IN `_imagen` VARCHAR(500))
BEGIN
INSERT INTO categoria(descripcion,imagen)VALUE (_descripcion, _imagen);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for insertProductos
-- ----------------------------
DROP PROCEDURE IF EXISTS `insertProductos`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertProductos`(IN `_nombre_producto` VARCHAR(100), IN `_imagen_1` VARCHAR(200), IN `_imagen_2` VARCHAR(200), IN `_precio` FLOAT(50), IN `_descripcion` VARCHAR(50), IN `_marca` VARCHAR(50), IN `_stock` INT(10), IN `_estado` VARCHAR(50), IN `_id_proveedores` INT(50), IN `_id_categoria` INT(21))
BEGIN
INSERT INTO productos(nombre_producto ,imagen_1,imagen_2,precio,descripcion,marca,stock, estado,id_proveedores, id_categoria)VALUE (_nombre_producto , _imagen_1,_imagen_2,_precio,_descripcion,_marca,_stock, _estado,_id_proveedores, _id_categoria);
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
