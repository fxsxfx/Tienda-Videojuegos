-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: tiendavideojuegos
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `carritocompras`
--

DROP TABLE IF EXISTS `carritocompras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carritocompras` (
  `carrito_cve` int(11) NOT NULL AUTO_INCREMENT,
  `user_cve` int(11) NOT NULL,
  `carrito_fecha` datetime NOT NULL DEFAULT current_timestamp(),
  `carrito_estado` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`carrito_cve`),
  KEY `fk_carritocompras_usuario` (`user_cve`),
  CONSTRAINT `fk_carritocompras_usuario` FOREIGN KEY (`user_cve`) REFERENCES `usuario` (`user_cve`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carritocompras`
--

LOCK TABLES `carritocompras` WRITE;
/*!40000 ALTER TABLE `carritocompras` DISABLE KEYS */;
/*!40000 ALTER TABLE `carritocompras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria` (
  `cat_cve` int(11) NOT NULL AUTO_INCREMENT,
  `cat_nombre` varchar(100) NOT NULL,
  `cat_descripcion` varchar(255) DEFAULT NULL,
  `cat_fecha` datetime NOT NULL DEFAULT current_timestamp(),
  `cat_estado` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`cat_cve`),
  UNIQUE KEY `uq_categoria_nombre` (`cat_nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientelealtad`
--

DROP TABLE IF EXISTS `clientelealtad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientelealtad` (
  `cliealt_cve` int(11) NOT NULL AUTO_INCREMENT,
  `user_cve` int(11) NOT NULL,
  `cliealt_numero` varchar(50) NOT NULL,
  `cliealt_puntos` int(11) NOT NULL DEFAULT 0,
  `cliealt_nivel` enum('Bronce','Plata','Oro','Platino') NOT NULL DEFAULT 'Bronce',
  `cliealt_fecha` datetime NOT NULL DEFAULT current_timestamp(),
  `cliealt_estado` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`cliealt_cve`),
  UNIQUE KEY `uq_clientelealtad_numero` (`cliealt_numero`),
  KEY `fk_clientelealtad_usuario` (`user_cve`),
  CONSTRAINT `fk_clientelealtad_usuario` FOREIGN KEY (`user_cve`) REFERENCES `usuario` (`user_cve`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientelealtad`
--

LOCK TABLES `clientelealtad` WRITE;
/*!40000 ALTER TABLE `clientelealtad` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientelealtad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_carrito`
--

DROP TABLE IF EXISTS `detalle_carrito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalle_carrito` (
  `detcar_cve` int(11) NOT NULL AUTO_INCREMENT,
  `carrito_cve` int(11) NOT NULL,
  `prod_cve` int(11) NOT NULL,
  `detcar_cantidad` int(11) NOT NULL DEFAULT 1,
  `detcar_precio` decimal(10,2) NOT NULL,
  `detcar_subtotal` decimal(10,2) NOT NULL,
  `detcar_estado` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`detcar_cve`),
  KEY `fk_detcar_carrito` (`carrito_cve`),
  KEY `fk_detcar_producto` (`prod_cve`),
  CONSTRAINT `fk_detcar_carrito` FOREIGN KEY (`carrito_cve`) REFERENCES `carritocompras` (`carrito_cve`) ON UPDATE CASCADE,
  CONSTRAINT `fk_detcar_producto` FOREIGN KEY (`prod_cve`) REFERENCES `producto` (`prod_cve`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_carrito`
--

LOCK TABLES `detalle_carrito` WRITE;
/*!40000 ALTER TABLE `detalle_carrito` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_carrito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_inventario`
--

DROP TABLE IF EXISTS `detalle_inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalle_inventario` (
  `detinv_cve` int(11) NOT NULL AUTO_INCREMENT,
  `inv_cve` int(11) NOT NULL,
  `detinv_fecha` datetime NOT NULL DEFAULT current_timestamp(),
  `detinv_cantidad` int(11) NOT NULL,
  `detinv_tipo` enum('entrada','salida') NOT NULL,
  `detinv_motivo` varchar(255) DEFAULT NULL,
  `detinv_estado` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`detinv_cve`),
  KEY `fk_detalle_inventario_inventario` (`inv_cve`),
  CONSTRAINT `fk_detalle_inventario_inventario` FOREIGN KEY (`inv_cve`) REFERENCES `inventario` (`inv_cve`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_inventario`
--

LOCK TABLES `detalle_inventario` WRITE;
/*!40000 ALTER TABLE `detalle_inventario` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_pedido`
--

DROP TABLE IF EXISTS `detalle_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalle_pedido` (
  `detped_cve` int(11) NOT NULL AUTO_INCREMENT,
  `pedido_cve` int(11) NOT NULL,
  `prod_cve` int(11) NOT NULL,
  `detped_cantidad` int(11) NOT NULL DEFAULT 1,
  `detped_precio` decimal(10,2) NOT NULL,
  `detped_subtotal` decimal(10,2) NOT NULL,
  `detped_estado` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`detped_cve`),
  KEY `fk_detalle_pedido_pedido` (`pedido_cve`),
  KEY `fk_detalle_pedido_producto` (`prod_cve`),
  CONSTRAINT `fk_detalle_pedido_pedido` FOREIGN KEY (`pedido_cve`) REFERENCES `pedido` (`pedido_cve`) ON UPDATE CASCADE,
  CONSTRAINT `fk_detalle_pedido_producto` FOREIGN KEY (`prod_cve`) REFERENCES `producto` (`prod_cve`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_pedido`
--

LOCK TABLES `detalle_pedido` WRITE;
/*!40000 ALTER TABLE `detalle_pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventario`
--

DROP TABLE IF EXISTS `inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventario` (
  `inv_cve` int(11) NOT NULL AUTO_INCREMENT,
  `prod_cve` int(11) NOT NULL,
  `inv_cantidad` int(11) NOT NULL DEFAULT 0,
  `inv_fecha` datetime NOT NULL DEFAULT current_timestamp(),
  `inv_estado` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`inv_cve`),
  KEY `fk_inventario_producto` (`prod_cve`),
  CONSTRAINT `fk_inventario_producto` FOREIGN KEY (`prod_cve`) REFERENCES `producto` (`prod_cve`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventario`
--

LOCK TABLES `inventario` WRITE;
/*!40000 ALTER TABLE `inventario` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedido` (
  `pedido_cve` int(11) NOT NULL AUTO_INCREMENT,
  `user_cve` int(11) NOT NULL,
  `pedido_fecha` datetime NOT NULL DEFAULT current_timestamp(),
  `pedido_total` decimal(10,2) NOT NULL DEFAULT 0.00,
  `pedido_estado` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`pedido_cve`),
  KEY `fk_pedido_usuario` (`user_cve`),
  CONSTRAINT `fk_pedido_usuario` FOREIGN KEY (`user_cve`) REFERENCES `usuario` (`user_cve`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producto` (
  `prod_cve` int(11) NOT NULL AUTO_INCREMENT,
  `prod_nombre` varchar(100) NOT NULL,
  `prod_descripcion` text DEFAULT NULL,
  `prod_precio` decimal(10,2) NOT NULL DEFAULT 0.00,
  `cat_cve` int(11) NOT NULL,
  `prov_cve` int(11) NOT NULL,
  `prod_fecha` datetime NOT NULL DEFAULT current_timestamp(),
  `prod_estado` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`prod_cve`),
  UNIQUE KEY `uq_producto_nombre` (`prod_nombre`),
  KEY `fk_producto_categoria` (`cat_cve`),
  KEY `fk_producto_proveedor` (`prov_cve`),
  CONSTRAINT `fk_producto_categoria` FOREIGN KEY (`cat_cve`) REFERENCES `categoria` (`cat_cve`) ON UPDATE CASCADE,
  CONSTRAINT `fk_producto_proveedor` FOREIGN KEY (`prov_cve`) REFERENCES `proveedor` (`prov_cve`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proveedor` (
  `prov_cve` int(11) NOT NULL AUTO_INCREMENT,
  `prov_nombre` varchar(100) NOT NULL,
  `prov_contacto` varchar(100) DEFAULT NULL,
  `prov_telefono` varchar(20) DEFAULT NULL,
  `prov_email` varchar(100) NOT NULL,
  `prov_direccion` varchar(255) DEFAULT NULL,
  `prov_fecha` datetime NOT NULL DEFAULT current_timestamp(),
  `prov_estado` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`prov_cve`),
  UNIQUE KEY `uq_proveedor_email` (`prov_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `user_cve` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) NOT NULL,
  `user_fullname` varchar(100) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `user_pass` varchar(255) NOT NULL,
  `user_type` enum('cliente','admin','cajero') NOT NULL,
  `user_date` datetime NOT NULL DEFAULT current_timestamp(),
  `user_state` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`user_cve`),
  UNIQUE KEY `uq_usuario_user_name` (`user_name`),
  UNIQUE KEY `uq_usuario_user_email` (`user_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-04 23:48:20
