-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: localhost    Database: tecnologico
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `alumnos`
--

DROP TABLE IF EXISTS `alumnos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `alumnos` (
  `no_control` varchar(10) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido_pat` varchar(50) DEFAULT NULL,
  `apellido_mat` varchar(50) DEFAULT NULL,
  `fecha_nac` date DEFAULT NULL,
  `calle` varchar(50) DEFAULT NULL,
  `no_casa` varchar(12) DEFAULT NULL,
  `col` varchar(50) DEFAULT NULL,
  `codigo_postal` varchar(10) DEFAULT NULL,
  `tel` varchar(12) DEFAULT NULL,
  `tel_1` varchar(12) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `id_carrera` int(11) DEFAULT NULL,
  PRIMARY KEY (`no_control`),
  KEY `id_carrera` (`id_carrera`),
  CONSTRAINT `alumnos_ibfk_1` FOREIGN KEY (`id_carrera`) REFERENCES `carreras` (`id_carrera`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumnos`
--

LOCK TABLES `alumnos` WRITE;
/*!40000 ALTER TABLE `alumnos` DISABLE KEYS */;
INSERT INTO `alumnos` VALUES ('16550517','Jesus','Morales','Gomez','1997-07-12','campo del sol','3245','mordor','1134','4354675','614344768','jesus@hotmail.com',1),('16550545','Jessica','Mora','Alderete','1998-07-12','campo de las flores','5476','comarca','1256','4354523','61445637','jessica@hotmail.com',3);
/*!40000 ALTER TABLE `alumnos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calificaciones`
--

DROP TABLE IF EXISTS `calificaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `calificaciones` (
  `id_calif` int(11) NOT NULL AUTO_INCREMENT,
  `no_control` varchar(10) DEFAULT NULL,
  `periodo` enum('enero-junio','agosto-diciembre') DEFAULT NULL,
  PRIMARY KEY (`id_calif`),
  KEY `no_control` (`no_control`),
  CONSTRAINT `calificaciones_ibfk_1` FOREIGN KEY (`no_control`) REFERENCES `alumnos` (`no_control`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calificaciones`
--

LOCK TABLES `calificaciones` WRITE;
/*!40000 ALTER TABLE `calificaciones` DISABLE KEYS */;
INSERT INTO `calificaciones` VALUES (1,'16550517','agosto-diciembre'),(2,'16550545','agosto-diciembre');
/*!40000 ALTER TABLE `calificaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carreras`
--

DROP TABLE IF EXISTS `carreras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `carreras` (
  `id_carrera` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_carrera` varchar(50) DEFAULT NULL,
  `num_semestres` int(11) DEFAULT NULL,
  `creditos` int(11) DEFAULT NULL,
  `area` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_carrera`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carreras`
--

LOCK TABLES `carreras` WRITE;
/*!40000 ALTER TABLE `carreras` DISABLE KEYS */;
INSERT INTO `carreras` VALUES (1,'Sistemas',10,125,'Sistemas'),(2,'Administracion',9,110,'Administracion'),(3,'Arquitectura',10,130,'Arquitectura'),(4,'Industrial',10,115,'Industrial');
/*!40000 ALTER TABLE `carreras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_calificaciones`
--

DROP TABLE IF EXISTS `detalle_calificaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `detalle_calificaciones` (
  `id_detalle` int(11) NOT NULL AUTO_INCREMENT,
  `id_calif` int(11) DEFAULT NULL,
  `id_materia` int(11) DEFAULT NULL,
  `calif_final` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_detalle`),
  KEY `id_calif` (`id_calif`),
  KEY `id_materia` (`id_materia`),
  CONSTRAINT `detalle_calificaciones_ibfk_1` FOREIGN KEY (`id_calif`) REFERENCES `calificaciones` (`id_calif`) ON UPDATE CASCADE,
  CONSTRAINT `detalle_calificaciones_ibfk_2` FOREIGN KEY (`id_materia`) REFERENCES `materias` (`id_materia`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_calificaciones`
--

LOCK TABLES `detalle_calificaciones` WRITE;
/*!40000 ALTER TABLE `detalle_calificaciones` DISABLE KEYS */;
INSERT INTO `detalle_calificaciones` VALUES (1,1,1,98),(2,2,2,99);
/*!40000 ALTER TABLE `detalle_calificaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_horario`
--

DROP TABLE IF EXISTS `detalle_horario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `detalle_horario` (
  `id_detalle` int(11) NOT NULL AUTO_INCREMENT,
  `id_materia` int(11) DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `salon` varchar(4) DEFAULT NULL,
  `id_horario` int(11) DEFAULT NULL,
  `id_empleado` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id_detalle`),
  KEY `id_materia` (`id_materia`),
  KEY `id_horario` (`id_horario`),
  KEY `id_empleado` (`id_empleado`),
  CONSTRAINT `detalle_horario_ibfk_1` FOREIGN KEY (`id_materia`) REFERENCES `materias` (`id_materia`) ON UPDATE CASCADE,
  CONSTRAINT `detalle_horario_ibfk_2` FOREIGN KEY (`id_horario`) REFERENCES `horario` (`id_horario`) ON UPDATE CASCADE,
  CONSTRAINT `detalle_horario_ibfk_3` FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`id_empleado`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_horario`
--

LOCK TABLES `detalle_horario` WRITE;
/*!40000 ALTER TABLE `detalle_horario` DISABLE KEYS */;
INSERT INTO `detalle_horario` VALUES (1,1,'05:00:00','F3',1,NULL),(2,2,'02:00:00','F5',2,NULL);
/*!40000 ALTER TABLE `detalle_horario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `empleado` (
  `id_empleado` varchar(10) NOT NULL,
  `id_puesto` int(11) DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido_pat` varchar(50) DEFAULT NULL,
  `apellido_mat` varchar(50) DEFAULT NULL,
  `carrera` varchar(50) DEFAULT NULL,
  `maestria` varchar(50) DEFAULT NULL,
  `doctorado` varchar(50) DEFAULT NULL,
  `calle` varchar(50) DEFAULT NULL,
  `no_casa` varchar(10) DEFAULT NULL,
  `col` varchar(50) DEFAULT NULL,
  `fecha_nac` date DEFAULT NULL,
  `tel` varchar(12) DEFAULT NULL,
  `tel_1` varchar(12) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `rfc` varchar(13) DEFAULT NULL,
  `sexo` enum('M','H') DEFAULT NULL,
  PRIMARY KEY (`id_empleado`),
  KEY `id_puesto` (`id_puesto`),
  CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`id_puesto`) REFERENCES `puestos` (`id_puesto`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES ('C4382',3,'Jaime','Pera','Hernandez',NULL,NULL,NULL,'Nueva Fe','7908','Centro','1970-02-01','456767','6145476','jaime@hotmail.com','JPH7024','H'),('M146',1,'Juan','Martinez','Lima','Sistemas','Redes','Dis Moviles','Mirador','2354','Mirador','1975-08-29','4988089','6142547689','juan@hotmail.com','JML75','H'),('M254',1,'Maria','Nara','Perea','Administracion','Administracion','Administracion','Bella','6542','Campos','1974-08-29','496589','61456476','maria@hotmail.com','GHF64','M');
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funciones`
--

DROP TABLE IF EXISTS `funciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `funciones` (
  `id_funcion` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `presupuesto` float DEFAULT NULL,
  PRIMARY KEY (`id_funcion`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funciones`
--

LOCK TABLES `funciones` WRITE;
/*!40000 ALTER TABLE `funciones` DISABLE KEYS */;
INSERT INTO `funciones` VALUES (1,'Educacion',3000),(2,'Soporte',2200),(3,'Limpieza',850);
/*!40000 ALTER TABLE `funciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horario`
--

DROP TABLE IF EXISTS `horario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `horario` (
  `id_horario` int(11) NOT NULL AUTO_INCREMENT,
  `no_control` varchar(50) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  PRIMARY KEY (`id_horario`),
  KEY `no_control` (`no_control`),
  CONSTRAINT `horario_ibfk_1` FOREIGN KEY (`no_control`) REFERENCES `alumnos` (`no_control`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horario`
--

LOCK TABLES `horario` WRITE;
/*!40000 ALTER TABLE `horario` DISABLE KEYS */;
INSERT INTO `horario` VALUES (1,'16550517','2018-09-13'),(2,'16550545','2018-09-14');
/*!40000 ALTER TABLE `horario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `info_tec`
--

DROP TABLE IF EXISTS `info_tec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `info_tec` (
  `clave` varchar(20) NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `calle` varchar(50) DEFAULT NULL,
  `numero` varchar(10) DEFAULT NULL,
  `col` varchar(50) DEFAULT NULL,
  `codigo_postal` varchar(12) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`clave`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `info_tec`
--

LOCK TABLES `info_tec` WRITE;
/*!40000 ALTER TABLE `info_tec` DISABLE KEYS */;
INSERT INTO `info_tec` VALUES ('1','Instituto Tecnologico de Chihuahua 2','Av.Las Industrias','1101','Complejo Industrial','31130','tec2.@hotmail.com');
/*!40000 ALTER TABLE `info_tec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materias`
--

DROP TABLE IF EXISTS `materias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `materias` (
  `id_materia` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `hp` int(11) DEFAULT NULL,
  `ht` int(11) DEFAULT NULL,
  `creditos` int(11) DEFAULT NULL,
  `id_carrera` int(11) DEFAULT NULL,
  `semestre` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_materia`),
  KEY `id_carrera` (`id_carrera`),
  CONSTRAINT `materias_ibfk_1` FOREIGN KEY (`id_carrera`) REFERENCES `carreras` (`id_carrera`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materias`
--

LOCK TABLES `materias` WRITE;
/*!40000 ALTER TABLE `materias` DISABLE KEYS */;
INSERT INTO `materias` VALUES (1,'Arquitectura de Computadoras',30,30,5,1,5),(2,'Dibujo',40,30,6,3,3),(3,'Materiales',30,30,5,4,6);
/*!40000 ALTER TABLE `materias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `puestos`
--

DROP TABLE IF EXISTS `puestos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `puestos` (
  `id_puesto` int(11) NOT NULL AUTO_INCREMENT,
  `id_funcion` int(11) DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_puesto`),
  KEY `id_funcion` (`id_funcion`),
  CONSTRAINT `puestos_ibfk_1` FOREIGN KEY (`id_funcion`) REFERENCES `funciones` (`id_funcion`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puestos`
--

LOCK TABLES `puestos` WRITE;
/*!40000 ALTER TABLE `puestos` DISABLE KEYS */;
INSERT INTO `puestos` VALUES (1,1,'Profesor'),(2,2,'Soporte Tecnico'),(3,3,'Conserje');
/*!40000 ALTER TABLE `puestos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-09-30 21:59:48
