-- MySQL dump 10.13  Distrib 5.7.30, for Linux (x86_64)
--
-- Host: localhost    Database: fichas
-- ------------------------------------------------------
-- Server version	5.7.30-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `administradores`
--

DROP TABLE IF EXISTS `administradores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administradores` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `administradores_user_id_foreign` (`user_id`),
  CONSTRAINT `administradores_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administradores`
--

LOCK TABLES `administradores` WRITE;
/*!40000 ALTER TABLE `administradores` DISABLE KEYS */;
INSERT INTO `administradores` VALUES (1,1,NULL,'2020-06-02 12:19:29','2020-06-02 12:19:29');
/*!40000 ALTER TABLE `administradores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agencias`
--

DROP TABLE IF EXISTS `agencias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agencias` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `direccion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `habilitado` tinyint(1) NOT NULL DEFAULT '1',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agencias`
--

LOCK TABLES `agencias` WRITE;
/*!40000 ALTER TABLE `agencias` DISABLE KEYS */;
/*!40000 ALTER TABLE `agencias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `articulos`
--

DROP TABLE IF EXISTS `articulos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articulos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `normativa_id` int(10) unsigned NOT NULL,
  `numero` int(10) unsigned NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `inciso` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `articulos_normativa_id_foreign` (`normativa_id`),
  CONSTRAINT `articulos_normativa_id_foreign` FOREIGN KEY (`normativa_id`) REFERENCES `normativas` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articulos`
--

LOCK TABLES `articulos` WRITE;
/*!40000 ALTER TABLE `articulos` DISABLE KEYS */;
/*!40000 ALTER TABLE `articulos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asignacion_categorias`
--

DROP TABLE IF EXISTS `asignacion_categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asignacion_categorias` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ventanilla_id` int(10) unsigned NOT NULL,
  `categoria_id` int(10) unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `asignacion_categorias_ventanilla_id_foreign` (`ventanilla_id`),
  KEY `asignacion_categorias_categoria_id_foreign` (`categoria_id`),
  CONSTRAINT `asignacion_categorias_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`) ON DELETE CASCADE,
  CONSTRAINT `asignacion_categorias_ventanilla_id_foreign` FOREIGN KEY (`ventanilla_id`) REFERENCES `ventanillas` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asignacion_categorias`
--

LOCK TABLES `asignacion_categorias` WRITE;
/*!40000 ALTER TABLE `asignacion_categorias` DISABLE KEYS */;
INSERT INTO `asignacion_categorias` VALUES (1,1,1,NULL,'2020-06-02 12:38:57','2020-06-02 12:38:57'),(2,1,3,NULL,'2020-06-02 12:39:05','2020-06-02 12:39:05'),(3,1,5,NULL,'2020-06-02 12:39:12','2020-06-02 12:39:12'),(4,1,2,NULL,'2020-06-02 12:39:20','2020-06-02 12:39:20');
/*!40000 ALTER TABLE `asignacion_categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asignacion_ventanillas`
--

DROP TABLE IF EXISTS `asignacion_ventanillas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asignacion_ventanillas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ventanilla_id` int(10) unsigned NOT NULL,
  `cajero_id` int(10) unsigned NOT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `asignacion_ventanillas_ventanilla_id_foreign` (`ventanilla_id`),
  KEY `asignacion_ventanillas_cajero_id_foreign` (`cajero_id`),
  CONSTRAINT `asignacion_ventanillas_cajero_id_foreign` FOREIGN KEY (`cajero_id`) REFERENCES `cajeros` (`id`) ON DELETE CASCADE,
  CONSTRAINT `asignacion_ventanillas_ventanilla_id_foreign` FOREIGN KEY (`ventanilla_id`) REFERENCES `ventanillas` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asignacion_ventanillas`
--

LOCK TABLES `asignacion_ventanillas` WRITE;
/*!40000 ALTER TABLE `asignacion_ventanillas` DISABLE KEYS */;
/*!40000 ALTER TABLE `asignacion_ventanillas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cajeros`
--

DROP TABLE IF EXISTS `cajeros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cajeros` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cajeros_user_id_foreign` (`user_id`),
  CONSTRAINT `cajeros_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cajeros`
--

LOCK TABLES `cajeros` WRITE;
/*!40000 ALTER TABLE `cajeros` DISABLE KEYS */;
INSERT INTO `cajeros` VALUES (1,2,NULL,'2020-06-02 12:20:19','2020-06-02 12:20:19'),(2,3,NULL,'2020-06-02 12:22:26','2020-06-02 12:22:26');
/*!40000 ALTER TABLE `cajeros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria_tramites`
--

DROP TABLE IF EXISTS `categoria_tramites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria_tramites` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tipo_tramite_id` int(10) unsigned NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `duracion_horas` int(10) unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categoria_tramites_tipo_tramite_id_foreign` (`tipo_tramite_id`),
  CONSTRAINT `categoria_tramites_tipo_tramite_id_foreign` FOREIGN KEY (`tipo_tramite_id`) REFERENCES `tipo_tramites` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_tramites`
--

LOCK TABLES `categoria_tramites` WRITE;
/*!40000 ALTER TABLE `categoria_tramites` DISABLE KEYS */;
/*!40000 ALTER TABLE `categoria_tramites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorias` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `acronimo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prioridad` int(10) unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'TRÁMITES','T',1,NULL,'2020-06-02 12:28:56','2020-06-02 12:28:56'),(2,'PRIORITARIA','A',10,NULL,'2020-06-02 12:30:33','2020-06-02 12:30:33'),(3,'OFICIAL DE REGISTRO CIVIL','O',1,NULL,'2020-06-02 12:31:02','2020-06-02 12:31:02'),(4,'INSCRIPCIONES PADRÓN ELECTORAL','I',1,NULL,'2020-06-02 12:31:26','2020-06-02 12:31:26'),(5,'ACTUALIZACIÓN PADRÓN ELECTORAL','E',1,NULL,'2020-06-02 12:38:06','2020-06-02 12:38:06');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comunicadores`
--

DROP TABLE IF EXISTS `comunicadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comunicadores` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comunicadores_user_id_foreign` (`user_id`),
  CONSTRAINT `comunicadores_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comunicadores`
--

LOCK TABLES `comunicadores` WRITE;
/*!40000 ALTER TABLE `comunicadores` DISABLE KEYS */;
/*!40000 ALTER TABLE `comunicadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalles`
--

DROP TABLE IF EXISTS `detalles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(10) unsigned NOT NULL,
  `articulo_id` int(10) unsigned NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion_adicional` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `detalles_item_id_foreign` (`item_id`),
  KEY `detalles_articulo_id_foreign` (`articulo_id`),
  CONSTRAINT `detalles_articulo_id_foreign` FOREIGN KEY (`articulo_id`) REFERENCES `articulos` (`id`) ON DELETE CASCADE,
  CONSTRAINT `detalles_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalles`
--

LOCK TABLES `detalles` WRITE;
/*!40000 ALTER TABLE `detalles` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `examples`
--

DROP TABLE IF EXISTS `examples`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `examples` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombres` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `edad` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `examples`
--

LOCK TABLES `examples` WRITE;
/*!40000 ALTER TABLE `examples` DISABLE KEYS */;
/*!40000 ALTER TABLE `examples` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fichas`
--

DROP TABLE IF EXISTS `fichas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fichas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `categoria_id` int(10) unsigned NOT NULL,
  `numero` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado_ficha` enum('espera','selectivo','expiracion','ventanilla','atendido') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'espera',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fichas_categoria_id_foreign` (`categoria_id`),
  CONSTRAINT `fichas_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fichas`
--

LOCK TABLES `fichas` WRITE;
/*!40000 ALTER TABLE `fichas` DISABLE KEYS */;
/*!40000 ALTER TABLE `fichas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inscritos`
--

DROP TABLE IF EXISTS `inscritos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inscritos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombres` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellidos` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inscritos`
--

LOCK TABLES `inscritos` WRITE;
/*!40000 ALTER TABLE `inscritos` DISABLE KEYS */;
/*!40000 ALTER TABLE `inscritos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tramite_id` int(10) unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `items_tramite_id_foreign` (`tramite_id`),
  CONSTRAINT `items_tramite_id_foreign` FOREIGN KEY (`tramite_id`) REFERENCES `tramites` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (26,'2014_10_12_000000_create_users_table',1),(27,'2017_08_09_210415_create_noticias_table',1),(28,'2017_08_14_192056_create_agencias_table',1),(29,'2017_08_14_192230_create_categorias_table',1),(30,'2017_08_14_201251_create_fichas_table',1),(31,'2017_08_14_201734_create_tipo_tramites_table',1),(32,'2017_08_14_201856_create_cajeros_table',1),(33,'2017_08_20_194043_create_videos_table',1),(34,'2017_08_21_215613_create_comunicadors_table',1),(35,'2017_08_21_220635_create_administradors_table',1),(36,'2017_08_24_182314_create_ventanillas_table',1),(37,'2017_08_25_093558_create_asignacion_ventanillas_table',1),(38,'2017_08_25_213155_create_asignacion_categorias_table',1),(39,'2017_08_29_180257_create_solicitud_autorizacions_table',1),(40,'2017_08_29_183626_create_categoria_tramites_table',1),(41,'2017_08_29_184909_create_solicitantes_table',1),(42,'2017_08_30_201921_create_tramites_table',1),(43,'2017_08_30_211109_create_partidas_table',1),(44,'2017_08_31_144740_create_normativas_table',1),(45,'2017_08_31_145320_create_articulos_table',1),(46,'2017_08_31_153109_create_items_table',1),(47,'2017_08_31_153916_create_detalles_table',1),(48,'2017_08_31_154904_create_recepcion_tramites_table',1),(49,'2017_09_03_113443_create_examples_table',1),(50,'2017_09_05_202025_create_inscritos_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `normativas`
--

DROP TABLE IF EXISTS `normativas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `normativas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `codigo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vigente` tinyint(1) NOT NULL DEFAULT '1',
  `fecha_baja` date DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `normativas`
--

LOCK TABLES `normativas` WRITE;
/*!40000 ALTER TABLE `normativas` DISABLE KEYS */;
/*!40000 ALTER TABLE `normativas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `noticias`
--

DROP TABLE IF EXISTS `noticias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `noticias` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `habilitado` tinyint(1) NOT NULL DEFAULT '1',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `noticias`
--

LOCK TABLES `noticias` WRITE;
/*!40000 ALTER TABLE `noticias` DISABLE KEYS */;
/*!40000 ALTER TABLE `noticias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partidas`
--

DROP TABLE IF EXISTS `partidas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `partidas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tramite_id` int(10) unsigned NOT NULL,
  `num_registro` int(10) unsigned NOT NULL,
  `orc` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `libro` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `num_partida` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_inscripcion` date NOT NULL,
  `departamento` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado_partida` enum('cancelar','vigente','igualar') COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `partidas_tramite_id_foreign` (`tramite_id`),
  CONSTRAINT `partidas_tramite_id_foreign` FOREIGN KEY (`tramite_id`) REFERENCES `tramites` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partidas`
--

LOCK TABLES `partidas` WRITE;
/*!40000 ALTER TABLE `partidas` DISABLE KEYS */;
/*!40000 ALTER TABLE `partidas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recepcion_tramites`
--

DROP TABLE IF EXISTS `recepcion_tramites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recepcion_tramites` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ventanilla_id` int(10) unsigned NOT NULL,
  `tramite_id` int(10) unsigned NOT NULL,
  `estado_tramite` enum('procesando','derivado','concluido') COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `recepcion_tramites_ventanilla_id_foreign` (`ventanilla_id`),
  KEY `recepcion_tramites_tramite_id_foreign` (`tramite_id`),
  CONSTRAINT `recepcion_tramites_tramite_id_foreign` FOREIGN KEY (`tramite_id`) REFERENCES `tramites` (`id`) ON DELETE CASCADE,
  CONSTRAINT `recepcion_tramites_ventanilla_id_foreign` FOREIGN KEY (`ventanilla_id`) REFERENCES `ventanillas` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recepcion_tramites`
--

LOCK TABLES `recepcion_tramites` WRITE;
/*!40000 ALTER TABLE `recepcion_tramites` DISABLE KEYS */;
/*!40000 ALTER TABLE `recepcion_tramites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitantes`
--

DROP TABLE IF EXISTS `solicitantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `solicitantes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombres` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellidos` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `celular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `carnet` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitantes`
--

LOCK TABLES `solicitantes` WRITE;
/*!40000 ALTER TABLE `solicitantes` DISABLE KEYS */;
/*!40000 ALTER TABLE `solicitantes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitud_autorizaciones`
--

DROP TABLE IF EXISTS `solicitud_autorizaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `solicitud_autorizaciones` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rectificacion` tinyint(1) NOT NULL DEFAULT '0',
  `complementacion` tinyint(1) NOT NULL DEFAULT '0',
  `ratificacion` tinyint(1) NOT NULL DEFAULT '0',
  `cambio` tinyint(1) NOT NULL DEFAULT '0',
  `cancelacion` tinyint(1) NOT NULL DEFAULT '0',
  `reposicion` tinyint(1) NOT NULL DEFAULT '0',
  `traspaso` tinyint(1) NOT NULL DEFAULT '0',
  `num_partida_fecha_inscripcion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `inscrito_esposo_fallecido` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lugar_nacimiento` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `padre` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `complemento_apellido_convencional` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otros_datos_correccion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitud_autorizaciones`
--

LOCK TABLES `solicitud_autorizaciones` WRITE;
/*!40000 ALTER TABLE `solicitud_autorizaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `solicitud_autorizaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_tramites`
--

DROP TABLE IF EXISTS `tipo_tramites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_tramites` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_tramites`
--

LOCK TABLES `tipo_tramites` WRITE;
/*!40000 ALTER TABLE `tipo_tramites` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_tramites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tramites`
--

DROP TABLE IF EXISTS `tramites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tramites` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ficha_id` int(10) unsigned NOT NULL,
  `categoria_tramite_id` int(10) unsigned NOT NULL,
  `cajero_id` int(10) unsigned NOT NULL,
  `solicitud_autorizacion_id` int(10) unsigned NOT NULL,
  `glosa` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `fecha_elaboracion` date NOT NULL DEFAULT '2020-06-02',
  `fecha_aceptacion` date NOT NULL DEFAULT '2020-06-02',
  `con_prueba` tinyint(1) NOT NULL DEFAULT '0',
  `entregado` tinyint(1) NOT NULL DEFAULT '0',
  `parentesco` enum('interesado','familiar','apoderado') COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tramites_ficha_id_foreign` (`ficha_id`),
  KEY `tramites_categoria_tramite_id_foreign` (`categoria_tramite_id`),
  KEY `tramites_cajero_id_foreign` (`cajero_id`),
  KEY `tramites_solicitud_autorizacion_id_foreign` (`solicitud_autorizacion_id`),
  CONSTRAINT `tramites_cajero_id_foreign` FOREIGN KEY (`cajero_id`) REFERENCES `cajeros` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tramites_categoria_tramite_id_foreign` FOREIGN KEY (`categoria_tramite_id`) REFERENCES `categoria_tramites` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tramites_ficha_id_foreign` FOREIGN KEY (`ficha_id`) REFERENCES `fichas` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tramites_solicitud_autorizacion_id_foreign` FOREIGN KEY (`solicitud_autorizacion_id`) REFERENCES `solicitud_autorizaciones` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tramites`
--

LOCK TABLES `tramites` WRITE;
/*!40000 ALTER TABLE `tramites` DISABLE KEYS */;
/*!40000 ALTER TABLE `tramites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cuenta` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombres` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellidos` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `carnet` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `celular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'franco.mamani','$2y$10$gT19rHNdeXQT5aZ9gvQE2.7lz7LMAzFRIgOh4nPuyh7JWMwWSXwn6','Franco Jesus','Mamani Pozo','7275047','76137653','administrador',1,NULL,'2020-06-02 12:19:29','2020-06-02 12:19:29'),(2,'cajero1','$2y$10$lE5akclUAato9ROg82s8NOOH.FkJs7mIn65WHC2EXDCq8mqQRxjQ2','Iver','Mamani','123456789','123456789','cajero',1,NULL,'2020-06-02 12:20:19','2020-06-02 12:20:19'),(3,'cajero2','$2y$10$nP6m83mdN34jXUqeT6mtEebAwXosRsb7qj0unMGHOsWNUFW9kr/5C','MILENKA LORNA','MORALES','123456789','123456789','cajero',1,NULL,'2020-06-02 12:22:26','2020-06-02 12:22:26');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventanillas`
--

DROP TABLE IF EXISTS `ventanillas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ventanillas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `numero` int(10) unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventanillas`
--

LOCK TABLES `ventanillas` WRITE;
/*!40000 ALTER TABLE `ventanillas` DISABLE KEYS */;
INSERT INTO `ventanillas` VALUES (1,1,NULL,'2020-06-02 12:32:11','2020-06-02 12:32:11'),(2,2,NULL,'2020-06-02 12:32:13','2020-06-02 12:32:13'),(3,3,NULL,'2020-06-02 12:32:15','2020-06-02 12:32:15'),(4,4,NULL,'2020-06-02 12:32:17','2020-06-02 12:32:17'),(5,5,NULL,'2020-06-02 12:32:19','2020-06-02 12:32:19'),(6,6,NULL,'2020-06-02 12:32:22','2020-06-02 12:32:22'),(7,7,NULL,'2020-06-02 12:32:24','2020-06-02 12:32:24'),(8,8,NULL,'2020-06-02 12:32:25','2020-06-02 12:32:25');
/*!40000 ALTER TABLE `ventanillas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `videos`
--

DROP TABLE IF EXISTS `videos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `videos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `habilitado` tinyint(1) NOT NULL DEFAULT '1',
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `rol` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videos`
--

LOCK TABLES `videos` WRITE;
/*!40000 ALTER TABLE `videos` DISABLE KEYS */;
/*!40000 ALTER TABLE `videos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-02 16:49:35
