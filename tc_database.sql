-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: tc_database
-- ------------------------------------------------------
-- Server version	8.0.39

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `id_categoria` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Joyería'),(2,'Cerámica'),(3,'Textiles'),(4,'Madera');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comunidad`
--

DROP TABLE IF EXISTS `comunidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comunidad` (
  `id_comunidad` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `departamento` varchar(100) NOT NULL,
  `provincia` varchar(100) NOT NULL,
  `municipio` varchar(100) NOT NULL,
  `pdf_url` varchar(500) NOT NULL,
  PRIMARY KEY (`id_comunidad`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comunidad`
--

LOCK TABLES `comunidad` WRITE;
/*!40000 ALTER TABLE `comunidad` DISABLE KEYS */;
INSERT INTO `comunidad` VALUES (12,'Turuni','La Paz','Loayza','Sapahaqui','/uploads/1727269766718-846799452.pdf'),(13,'aaaaaaa','bbbbbbbb','ccccc','ddddddd','/uploads/1727293120719-325472140.pdf'),(15,'saf','fff','aasa','canijo','/uploads/1727877037504-772242031.pdf'),(16,'Juacho','Potosi','Proc','Laika','/uploads/1728011217183-286633507.pdf');
/*!40000 ALTER TABLE `comunidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elaboracion`
--

DROP TABLE IF EXISTS `elaboracion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elaboracion` (
  `id_elaboracion` int NOT NULL AUTO_INCREMENT,
  `tipo` varchar(255) NOT NULL,
  PRIMARY KEY (`id_elaboracion`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elaboracion`
--

LOCK TABLES `elaboracion` WRITE;
/*!40000 ALTER TABLE `elaboracion` DISABLE KEYS */;
INSERT INTO `elaboracion` VALUES (1,'Hecho a mano'),(2,'Técnicas mixtas'),(3,'Personalizado');
/*!40000 ALTER TABLE `elaboracion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresa`
--

DROP TABLE IF EXISTS `empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empresa` (
  `id_empresa` int NOT NULL AUTO_INCREMENT,
  `nombre_empresa` varchar(100) NOT NULL,
  `tipo_empresa` varchar(50) NOT NULL,
  `numero_NIT` varchar(20) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `departamento` varchar(100) NOT NULL,
  `id_encargado` int NOT NULL,
  `correo_empresa` varchar(100) NOT NULL,
  PRIMARY KEY (`id_empresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa`
--

LOCK TABLES `empresa` WRITE;
/*!40000 ALTER TABLE `empresa` DISABLE KEYS */;
/*!40000 ALTER TABLE `empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventario`
--

DROP TABLE IF EXISTS `inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventario` (
  `id_inventario` int NOT NULL AUTO_INCREMENT,
  `cantidad` int NOT NULL,
  `id_comunidad` int DEFAULT NULL,
  PRIMARY KEY (`id_inventario`),
  KEY `id_comunidad` (`id_comunidad`),
  CONSTRAINT `inventario_ibfk_1` FOREIGN KEY (`id_comunidad`) REFERENCES `comunidad` (`id_comunidad`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventario`
--

LOCK TABLES `inventario` WRITE;
/*!40000 ALTER TABLE `inventario` DISABLE KEYS */;
INSERT INTO `inventario` VALUES (1,5,16),(2,5,16),(3,5,16),(4,5,16),(5,5,16),(6,5,16),(7,5,16),(8,5,16),(9,5,16),(10,5,16),(11,5,16),(12,2,15),(13,2,15),(14,2,15),(15,2,15),(16,2,15),(17,2,15),(18,78,15),(19,78,15),(20,23232,15);
/*!40000 ALTER TABLE `inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persona` (
  `id_persona` int NOT NULL AUTO_INCREMENT,
  `ci` varchar(20) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `paterno` varchar(50) NOT NULL,
  `materno` varchar(50) NOT NULL,
  `fecha_nac` date DEFAULT NULL,
  `direccion` varchar(100) NOT NULL,
  `telefono` int DEFAULT '0',
  PRIMARY KEY (`id_persona`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES (1,'12345678','Juan','Perez','Gomez','1990-01-01','Calle Falsa 123',0),(2,'87654321','Maria','Lopez','Martinez','1985-05-15','Avenida Siempre Viva 456',0),(3,'11223344','Carlos','Garcia','Rodriguez','1992-07-20','Calle Luna 789',0),(4,'44332211','Ana','Fernandez','Sanchez','1988-03-30','Calle Sol 101',0),(5,'55667788','Luis','Martinez','Diaz','1995-12-10','Avenida Estrella 202',0),(6,'88776655','Elena','Gonzalez','Ramirez','1993-09-25','Calle Cometa 303',0),(7,'99887766','Jose','Hernandez','Torres','1987-11-05','Avenida Meteoro 404',0),(8,'66778899','Laura','Ruiz','Vargas','1991-02-14','Calle Planeta 505',0),(9,'77665544','Miguel','Jimenez','Morales','1989-06-18','Avenida Galaxia 606',0),(10,'33445566','Sofia','Navarro','Ortiz','1994-08-22','Calle Universo 707',0),(11,'12345678','Juan','Perez','Gomez','1993-09-25','Calle Falsa 123',0),(12,'12345678','Juan','Perez','Gomez','1990-01-01','Calle Falsa 123',0),(13,'12345678','Juan','Perez','Gomez','1990-01-01','Calle Falsa 123',0),(14,'12345678','Juan','Perez','Gomez',NULL,'Calle Falsa 123',0),(15,'12345678','Juan','Perez','Gomez',NULL,'Calle Falsa 123',0),(16,'12345678','Juan','Perez','Gomez',NULL,'Calle Falsa 123',0),(17,'12345678','Juan','Perez','Gomez',NULL,'Calle Falsa 123',0),(18,'12345678','Juan','Perez','Gomez',NULL,'Calle Falsa 123',0),(19,'12345678','Juan','Perez','Gomez',NULL,'Calle Falsa 123',0),(20,'12345678','Juan','Perez','Gomez',NULL,'Calle Falsa 123',0),(21,'12345678','Juan','Perez','Gomez',NULL,'Calle Falsa 123',0),(22,'12345678','Juan','Perez','Gomez',NULL,'Calle Falsa 123',0),(23,'12345678','Juan','Perez','Gomez',NULL,'Calle Falsa 123',0),(24,'12345678','Juan','Perez','Gomez',NULL,'Calle Falsa 123',0),(25,'12345678','Juan','Perez','Gomez',NULL,'Calle Falsa 123',0),(26,'87654321','Maria','Lopez','Fernandez',NULL,'Avenida Siempre Viva 742',0),(27,'10848854','Augusto Fabian','Rios','Choque','2001-08-22','Bolivia',0),(28,'10848854','Frank','Rios','ERT','2001-08-22','Bolivia',0),(29,'10848854','Frank','Rios','ERT','2001-08-22','Bolivia',0),(30,'322323','asdfas','asdfa','asdfa','2024-09-10','asdfasdf',0),(31,'322323','Frank','Plazo','Lopez','2024-09-18','Calle del gato',0),(32,'11111111','panchooooo','paso','peres','2024-09-11','Juana azurduy',6775844),(33,'12341234','capitano','french','froy','2024-10-16','un lugar',2232321),(34,'2222222','user','user','user','2024-10-10','user direccion',123411),(35,'555555','frank','cuesta','selva','2024-10-09','jungla',123434343),(36,'11111111','pancho','villa','cueca','2024-10-14','las lomas',383838),(37,'888888','hals','jalsjdf','jlkajsdkfjaks','2002-02-28','ajsdl;fakj;sfldkaj',48484848);
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `id_producto` int NOT NULL AUTO_INCREMENT,
  `id_categoria` int NOT NULL,
  `nombre_producto` varchar(255) NOT NULL,
  `descripcion` text NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `fotos` json NOT NULL,
  `id_elaboracion` int NOT NULL,
  `id_promo` int DEFAULT NULL,
  `id_usuario` int NOT NULL,
  `id_inventario` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_producto`),
  KEY `id_categoria` (`id_categoria`),
  KEY `id_elaboracion` (`id_elaboracion`),
  KEY `id_promo` (`id_promo`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_inventario` (`id_inventario`),
  CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `producto_ibfk_2` FOREIGN KEY (`id_elaboracion`) REFERENCES `elaboracion` (`id_elaboracion`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `producto_ibfk_3` FOREIGN KEY (`id_promo`) REFERENCES `promo` (`id_promo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `producto_ibfk_4` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `producto_ibfk_5` FOREIGN KEY (`id_inventario`) REFERENCES `inventario` (`id_inventario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (2,2,'Jarrones  pro','unos jarrones muy pro',12.00,'[\"uploads/fotos/1728313382680-830466098-IMG_20240928_201701.jpg\", \"uploads/fotos/1728313382691-886626903-IMG_20240928_201823.jpg\", \"uploads/fotos/1728313382702-537761420-IMG_20240928_201639.jpg\", \"uploads/fotos/1728313382707-830411166-IMG_20240928_201728.jpg\"]',1,NULL,21,11,'2024-10-07 15:03:02','2024-10-08 01:27:51'),(3,1,'dfdfd','fhsshhsshhjhj',34.00,'[\"uploads/fotos/1728348073482-328041503-Â¿CÃ³mo-y-dÃ³nde-comprar-productos-artesanales-de-la-mejor-calidad.jpg\", \"uploads/fotos/1728348073482-202833094-images (1).jpeg\", \"uploads/fotos/1728348073482-799790940-istockphoto-1405315769-612x612.jpg\", \"uploads/fotos/1728348073483-790717388-istockphoto-1309646840-612x612.jpg\"]',2,NULL,21,12,'2024-10-08 00:41:13','2024-10-08 01:27:51'),(4,1,'dfdfd','fhsshhsshhjhj',34.00,'[\"uploads/fotos/1728348073477-665452237-Â¿CÃ³mo-y-dÃ³nde-comprar-productos-artesanales-de-la-mejor-calidad.jpg\", \"uploads/fotos/1728348073477-486325017-images (1).jpeg\", \"uploads/fotos/1728348073478-965683237-istockphoto-1405315769-612x612.jpg\", \"uploads/fotos/1728348073478-189532248-istockphoto-1309646840-612x612.jpg\"]',2,NULL,21,13,'2024-10-08 00:41:13','2024-10-08 01:27:51'),(5,2,'dfdfd','dsHJHJHJHJb',4.00,'[\"uploads/fotos/1728351231861-991462528-IMG_20240928_201701.jpg\", \"uploads/fotos/1728351231878-681892080-IMG_20240928_201823.jpg\", \"uploads/fotos/1728351231893-243970823-IMG_20240928_201639.jpg\", \"uploads/fotos/1728351231906-564997945-IMG_20240928_201728.jpg\"]',2,NULL,21,14,'2024-10-08 01:33:51','2024-10-08 01:33:51'),(6,2,'dfdfd','dsHJHJHJHJb',4.00,'[\"uploads/fotos/1728351231857-802304301-IMG_20240928_201701.jpg\", \"uploads/fotos/1728351231877-34225490-IMG_20240928_201823.jpg\", \"uploads/fotos/1728351231895-910587487-IMG_20240928_201639.jpg\", \"uploads/fotos/1728351231907-384749425-IMG_20240928_201728.jpg\"]',2,NULL,21,15,'2024-10-08 01:33:51','2024-10-08 01:33:51'),(7,2,'dfdfd','sdhshhssashshshshfgdfgsdfgsdf',4.00,'[\"uploads/fotos/1728351380699-889521280-IMG_20240928_201701.jpg\", \"uploads/fotos/1728351380715-444779818-IMG_20240928_201823.jpg\", \"uploads/fotos/1728351380732-422160657-IMG_20240928_201639.jpg\", \"uploads/fotos/1728351380743-380062303-IMG_20240928_201728.jpg\"]',3,NULL,21,17,'2024-10-08 01:36:20','2024-10-08 01:36:20'),(8,2,'dfdfd','sdhshhssashshshshfgdfgsdfgsdf',4.00,'[\"uploads/fotos/1728351380695-106579058-IMG_20240928_201701.jpg\", \"uploads/fotos/1728351380715-369325495-IMG_20240928_201823.jpg\", \"uploads/fotos/1728351380732-629153559-IMG_20240928_201639.jpg\", \"uploads/fotos/1728351380743-47139978-IMG_20240928_201728.jpg\"]',3,NULL,21,16,'2024-10-08 01:36:20','2024-10-08 01:36:20'),(9,2,'asdflaslf','ddddddddddddddddd',3.00,'[\"uploads/fotos/1728352862250-981687689-imgg1.jpg\", \"uploads/fotos/1728352862251-19208006-imgg2.jpeg\", \"uploads/fotos/1728352862252-562601261-imgg3.jpg\", \"uploads/fotos/1728352862252-541248455-imgg4.jpg\"]',2,NULL,21,18,'2024-10-08 02:01:02','2024-10-08 02:01:02'),(10,2,'asdflaslf','ddddddddddddddddd',3.00,'[\"uploads/fotos/1728352862254-677542772-imgg1.jpg\", \"uploads/fotos/1728352862254-995949369-imgg2.jpeg\", \"uploads/fotos/1728352862254-630626553-imgg3.jpg\", \"uploads/fotos/1728352862255-198641232-imgg4.jpg\"]',2,NULL,21,19,'2024-10-08 02:01:02','2024-10-08 02:10:44'),(11,2,'asdflaslf','loooooooooooooooool',3.00,'[\"uploads/fotos/1728353727708-740357549-imgg1.jpg\", \"uploads/fotos/1728353727708-523536353-imgg2.jpeg\", \"uploads/fotos/1728353727709-17366916-imgg3.jpg\", \"uploads/fotos/1728353727710-683972618-imgg4.jpg\"]',1,NULL,21,20,'2024-10-08 02:15:27','2024-10-08 02:15:27');
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promo`
--

DROP TABLE IF EXISTS `promo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promo` (
  `id_promo` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) NOT NULL,
  `descuento` decimal(5,2) NOT NULL,
  PRIMARY KEY (`id_promo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promo`
--

LOCK TABLES `promo` WRITE;
/*!40000 ALTER TABLE `promo` DISABLE KEYS */;
/*!40000 ALTER TABLE `promo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol` (
  `id_rol` int NOT NULL AUTO_INCREMENT,
  `nombre_rol` varchar(50) NOT NULL,
  PRIMARY KEY (`id_rol`),
  UNIQUE KEY `nombre_rol` (`nombre_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (3,'Artesano'),(2,'Comprador'),(1,'Encargado');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitud_art_com`
--

DROP TABLE IF EXISTS `solicitud_art_com`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solicitud_art_com` (
  `id_comunidad` int NOT NULL,
  `id_encargado` int NOT NULL,
  `id_solicitante` int NOT NULL,
  `mensaje` varchar(500) NOT NULL,
  `estado` varchar(45) NOT NULL DEFAULT 'invalido'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitud_art_com`
--

LOCK TABLES `solicitud_art_com` WRITE;
/*!40000 ALTER TABLE `solicitud_art_com` DISABLE KEYS */;
INSERT INTO `solicitud_art_com` VALUES (3,14,21,'Esto es una solicitud','invalido'),(13,14,21,'fdsgf','invalido'),(12,15,21,'HOLLLAAAA QUIERO UNIRME','invalido'),(12,15,21,'asdfasdfas','invalido'),(12,15,21,'Solicito unirme a la comunidad','encurso'),(14,16,21,'Quiero unirme a la comunidad','encurso'),(15,19,21,'Quiero unirme a la comunidad','aprobado'),(15,19,22,'Holas quiero unirme gente','aprobado'),(16,24,23,'Hola kease','aprobado');
/*!40000 ALTER TABLE `solicitud_art_com` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `fecha_reg` date DEFAULT NULL,
  `id_persona` int DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `username` (`username`),
  KEY `id_persona` (`id_persona`),
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id_persona`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'admin1','password1','2024-09-11',1,NULL),(2,'admin2','password2','2024-09-11',2,NULL),(3,'comprador1','password3','2024-09-11',3,NULL),(4,'comprador2','password4','2024-09-11',4,NULL),(5,'comprador3','password5','2024-09-11',5,NULL),(6,'comprador4','password6','2024-09-11',6,NULL),(7,'artesano1','password7','2024-09-11',7,NULL),(8,'artesano2','password8','2024-09-11',8,NULL),(9,'artesano3','password9','2024-09-11',9,NULL),(10,'artesano4','password10','2024-09-11',10,NULL),(11,'juanp','password123',NULL,23,NULL),(13,'marial','$2b$10$0C1SwWsRlGOmTqik3tGVsOb1.xDu8ZkNV.igL2eFdHOg7Rl80YmB.',NULL,26,NULL),(14,'sphinx2001','$2b$10$2CQ9entTd1M0ELjLOFMceO8wVD.KDURl7.jxz33ZYh1g7y.TwCTHa','2024-09-18',27,'algo@gmail.com'),(15,'willly','$2b$10$hT2X7M3.9e1ZBERGBOm3NOnmVv2wowy4Hljp8Oy1cUif3ADVfUB0.','2024-09-18',28,'fav6519@gmail.com'),(16,'asasasaws','$2b$10$tm/R9C4szy7GHv8aJ1Qe8uTDcuQsuZqHW/odqBAH1LsYFjCqudzse','2024-09-18',29,'fav6519@gmail.com'),(17,'asdfasdfasd','$2b$10$OLXhKgJTsQY/VkRLJqVPt.jxRL8F8Qo4us64At32Rxn3ERFcarCWy','2024-09-19',30,'sasdf@dfd'),(18,'panchito','$2b$10$ioMlNSYfDmfHXHzPo2GE/u1vS3VkbAC2gFRoFDsnYQTFK/UzE9ujK','2024-09-24',31,'augustooverlord@gmail.com'),(19,'manager1','$2b$10$i1dPDHW4wndxYpbi2e9FE.UzOUmDQQan2qNrDJ6FRiotmDZTiDdtq','2024-09-26',32,'fav6519@gmail.com'),(20,'manager2','$2b$10$fLGjncqCP3xcIYPD8dkkQetn5CimVUzL/OBZYSaqVtBS98VD0K14C','2024-10-02',33,'augustooverlord@gmail.com'),(21,'artesano5','$2b$10$5N4JU4I8HjuSwXY.Vd1cnuLlTKGoutVTg8J46X4/GGfDe/pghrsya','2024-10-02',34,'augustooverlord@gmail.com'),(22,'frankcuesta','$2b$10$gVHSxK5H48y8ZQwnzHcRzOOMdK5T/qdSLMAKghP1UKcBJF4hJA5oa','2024-10-03',35,'alt@gmail.com'),(23,'artesano6','$2b$10$8cJB9ZPT6MpJbIaVT6nrNeNEADsOIpxl9.QFEt9Aux4.QrmYujFHq','2024-10-03',36,'ghj@mil.com'),(24,'manager3','$2b$10$NNH4jqhwpOx3qgsXF1.ey.cgg5cmNgfKZVuS9YXFIajJDVcZTiyUS','2024-10-03',37,'falco@ddd.com');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_comunidad`
--

DROP TABLE IF EXISTS `usuario_comunidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_comunidad` (
  `id_usuario` int DEFAULT NULL,
  `id_comunidad` int DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  KEY `id_usuario` (`id_usuario`),
  KEY `id_comunidad` (`id_comunidad`),
  CONSTRAINT `usuario_comunidad_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `usuario_comunidad_ibfk_2` FOREIGN KEY (`id_comunidad`) REFERENCES `comunidad` (`id_comunidad`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_comunidad`
--

LOCK TABLES `usuario_comunidad` WRITE;
/*!40000 ALTER TABLE `usuario_comunidad` DISABLE KEYS */;
INSERT INTO `usuario_comunidad` VALUES (15,12,'encargado'),(14,13,'encargado'),(19,15,'encargado'),(21,15,'artesano'),(22,15,'artesano'),(24,16,'encargado'),(23,16,'artesano');
/*!40000 ALTER TABLE `usuario_comunidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_rol`
--

DROP TABLE IF EXISTS `usuario_rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_rol` (
  `id_usuario` int NOT NULL,
  `id_rol` int NOT NULL,
  PRIMARY KEY (`id_usuario`,`id_rol`),
  KEY `id_rol` (`id_rol`),
  CONSTRAINT `usuario_rol_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `usuario_rol_ibfk_2` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id_rol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_rol`
--

LOCK TABLES `usuario_rol` WRITE;
/*!40000 ALTER TABLE `usuario_rol` DISABLE KEYS */;
INSERT INTO `usuario_rol` VALUES (1,1),(2,1),(14,1),(15,1),(16,1),(17,1),(19,1),(20,1),(24,1),(3,2),(4,2),(5,2),(6,2),(7,3),(8,3),(9,3),(10,3),(18,3),(21,3),(22,3),(23,3);
/*!40000 ALTER TABLE `usuario_rol` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-09 22:38:48
