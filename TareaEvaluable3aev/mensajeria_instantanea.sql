-- MySQL dump 10.13  Distrib 8.1.0, for Win64 (x86_64)
--
-- Host: localhost    Database: mensajeria_instantanea
-- ------------------------------------------------------
-- Server version	8.1.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `amistad`
--

DROP TABLE IF EXISTS `amistad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `amistad` (
  `id_usuario` int NOT NULL,
  `id_usuario_amigo` int NOT NULL,
  `acepta_solicitud_SI_NO` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`,`id_usuario_amigo`),
  KEY `id_usuario_amigo` (`id_usuario_amigo`),
  CONSTRAINT `amistad_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `amistad_ibfk_2` FOREIGN KEY (`id_usuario_amigo`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amistad`
--

LOCK TABLES `amistad` WRITE;
/*!40000 ALTER TABLE `amistad` DISABLE KEYS */;
/*!40000 ALTER TABLE `amistad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `envio_mensajes`
--

DROP TABLE IF EXISTS `envio_mensajes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `envio_mensajes` (
  `id_mensaje` int NOT NULL,
  `id_usuario_destino` int NOT NULL,
  `id_grupo_destino` int NOT NULL,
  `fecha_envio` date DEFAULT NULL,
  `leidoSINO` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_mensaje`,`id_usuario_destino`,`id_grupo_destino`),
  KEY `id_usuario_destino` (`id_usuario_destino`),
  KEY `id_grupo_destino` (`id_grupo_destino`),
  CONSTRAINT `envio_mensajes_ibfk_1` FOREIGN KEY (`id_mensaje`) REFERENCES `mensajes` (`id`),
  CONSTRAINT `envio_mensajes_ibfk_2` FOREIGN KEY (`id_usuario_destino`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `envio_mensajes_ibfk_3` FOREIGN KEY (`id_grupo_destino`) REFERENCES `grupos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `envio_mensajes`
--

LOCK TABLES `envio_mensajes` WRITE;
/*!40000 ALTER TABLE `envio_mensajes` DISABLE KEYS */;
/*!40000 ALTER TABLE `envio_mensajes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupos`
--

DROP TABLE IF EXISTS `grupos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grupos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupos`
--

LOCK TABLES `grupos` WRITE;
/*!40000 ALTER TABLE `grupos` DISABLE KEYS */;
/*!40000 ALTER TABLE `grupos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mensajes`
--

DROP TABLE IF EXISTS `mensajes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mensajes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_usuario_emisor` int DEFAULT NULL,
  `cuerpo_mensaje` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_usuario_emisor` (`id_usuario_emisor`),
  CONSTRAINT `mensajes_ibfk_1` FOREIGN KEY (`id_usuario_emisor`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mensajes`
--

LOCK TABLES `mensajes` WRITE;
/*!40000 ALTER TABLE `mensajes` DISABLE KEYS */;
/*!40000 ALTER TABLE `mensajes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `contraseña` char(10) DEFAULT NULL,
  `fecha_cumpleanios` date DEFAULT NULL,
  `nickname` varchar(20) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `estado` enum('en linea','desconectado','ocupado','disponible') DEFAULT NULL,
  `fecha_creacion` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios_pertenecen_grupos`
--

DROP TABLE IF EXISTS `usuarios_pertenecen_grupos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios_pertenecen_grupos` (
  `id_usuario` int NOT NULL,
  `id_grupo` int NOT NULL,
  `fecha_ingreso` date DEFAULT NULL,
  PRIMARY KEY (`id_usuario`,`id_grupo`),
  KEY `id_grupo` (`id_grupo`),
  CONSTRAINT `usuarios_pertenecen_grupos_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `usuarios_pertenecen_grupos_ibfk_2` FOREIGN KEY (`id_grupo`) REFERENCES `grupos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios_pertenecen_grupos`
--

LOCK TABLES `usuarios_pertenecen_grupos` WRITE;
/*!40000 ALTER TABLE `usuarios_pertenecen_grupos` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarios_pertenecen_grupos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-15 19:27:42
