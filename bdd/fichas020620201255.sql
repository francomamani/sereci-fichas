-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 02, 2020 at 04:54 PM
-- Server version: 8.0.18
-- PHP Version: 7.3.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fichas`
--

-- --------------------------------------------------------

--
-- Table structure for table `administradores`
--

CREATE TABLE `administradores` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `administradores`
--

INSERT INTO `administradores` (`id`, `user_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, '2020-06-02 12:19:29', '2020-06-02 12:19:29');

-- --------------------------------------------------------

--
-- Table structure for table `agencias`
--

CREATE TABLE `agencias` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `direccion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `habilitado` tinyint(1) NOT NULL DEFAULT '1',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `articulos`
--

CREATE TABLE `articulos` (
  `id` int(10) UNSIGNED NOT NULL,
  `normativa_id` int(10) UNSIGNED NOT NULL,
  `numero` int(10) UNSIGNED NOT NULL,
  `descripcion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `inciso` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `asignacion_categorias`
--

CREATE TABLE `asignacion_categorias` (
  `id` int(10) UNSIGNED NOT NULL,
  `ventanilla_id` int(10) UNSIGNED NOT NULL,
  `categoria_id` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `asignacion_categorias`
--

INSERT INTO `asignacion_categorias` (`id`, `ventanilla_id`, `categoria_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, '2020-06-02 12:38:57', '2020-06-02 12:38:57'),
(2, 1, 3, NULL, '2020-06-02 12:39:05', '2020-06-02 12:39:05'),
(3, 1, 5, NULL, '2020-06-02 12:39:12', '2020-06-02 12:39:12'),
(4, 1, 2, NULL, '2020-06-02 12:39:20', '2020-06-02 12:39:20');

-- --------------------------------------------------------

--
-- Table structure for table `asignacion_ventanillas`
--

CREATE TABLE `asignacion_ventanillas` (
  `id` int(10) UNSIGNED NOT NULL,
  `ventanilla_id` int(10) UNSIGNED NOT NULL,
  `cajero_id` int(10) UNSIGNED NOT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cajeros`
--

CREATE TABLE `cajeros` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cajeros`
--

INSERT INTO `cajeros` (`id`, `user_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 2, NULL, '2020-06-02 12:20:19', '2020-06-02 12:20:19'),
(2, 3, NULL, '2020-06-02 12:22:26', '2020-06-02 12:22:26');

-- --------------------------------------------------------

--
-- Table structure for table `categorias`
--

CREATE TABLE `categorias` (
  `id` int(10) UNSIGNED NOT NULL,
  `descripcion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `acronimo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `prioridad` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categorias`
--

INSERT INTO `categorias` (`id`, `descripcion`, `acronimo`, `prioridad`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'TRÁMITES', 'T', 1, NULL, '2020-06-02 12:28:56', '2020-06-02 12:28:56'),
(2, 'PRIORITARIA', 'A', 10, NULL, '2020-06-02 12:30:33', '2020-06-02 12:30:33'),
(3, 'OFICIAL DE REGISTRO CIVIL', 'O', 1, NULL, '2020-06-02 12:31:02', '2020-06-02 12:31:02'),
(4, 'INSCRIPCIONES PADRÓN ELECTORAL', 'I', 1, NULL, '2020-06-02 12:31:26', '2020-06-02 12:31:26'),
(5, 'ACTUALIZACIÓN PADRÓN ELECTORAL', 'E', 1, NULL, '2020-06-02 12:38:06', '2020-06-02 12:38:06');

-- --------------------------------------------------------

--
-- Table structure for table `categoria_tramites`
--

CREATE TABLE `categoria_tramites` (
  `id` int(10) UNSIGNED NOT NULL,
  `tipo_tramite_id` int(10) UNSIGNED NOT NULL,
  `descripcion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `duracion_horas` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `comunicadores`
--

CREATE TABLE `comunicadores` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `detalles`
--

CREATE TABLE `detalles` (
  `id` int(10) UNSIGNED NOT NULL,
  `item_id` int(10) UNSIGNED NOT NULL,
  `articulo_id` int(10) UNSIGNED NOT NULL,
  `descripcion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion_adicional` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `examples`
--

CREATE TABLE `examples` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombres` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `edad` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fichas`
--

CREATE TABLE `fichas` (
  `id` int(10) UNSIGNED NOT NULL,
  `categoria_id` int(10) UNSIGNED NOT NULL,
  `numero` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado_ficha` enum('espera','selectivo','expiracion','ventanilla','atendido') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'espera',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inscritos`
--

CREATE TABLE `inscritos` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombres` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellidos` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` int(10) UNSIGNED NOT NULL,
  `descripcion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tramite_id` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(26, '2014_10_12_000000_create_users_table', 1),
(27, '2017_08_09_210415_create_noticias_table', 1),
(28, '2017_08_14_192056_create_agencias_table', 1),
(29, '2017_08_14_192230_create_categorias_table', 1),
(30, '2017_08_14_201251_create_fichas_table', 1),
(31, '2017_08_14_201734_create_tipo_tramites_table', 1),
(32, '2017_08_14_201856_create_cajeros_table', 1),
(33, '2017_08_20_194043_create_videos_table', 1),
(34, '2017_08_21_215613_create_comunicadors_table', 1),
(35, '2017_08_21_220635_create_administradors_table', 1),
(36, '2017_08_24_182314_create_ventanillas_table', 1),
(37, '2017_08_25_093558_create_asignacion_ventanillas_table', 1),
(38, '2017_08_25_213155_create_asignacion_categorias_table', 1),
(39, '2017_08_29_180257_create_solicitud_autorizacions_table', 1),
(40, '2017_08_29_183626_create_categoria_tramites_table', 1),
(41, '2017_08_29_184909_create_solicitantes_table', 1),
(42, '2017_08_30_201921_create_tramites_table', 1),
(43, '2017_08_30_211109_create_partidas_table', 1),
(44, '2017_08_31_144740_create_normativas_table', 1),
(45, '2017_08_31_145320_create_articulos_table', 1),
(46, '2017_08_31_153109_create_items_table', 1),
(47, '2017_08_31_153916_create_detalles_table', 1),
(48, '2017_08_31_154904_create_recepcion_tramites_table', 1),
(49, '2017_09_03_113443_create_examples_table', 1),
(50, '2017_09_05_202025_create_inscritos_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `normativas`
--

CREATE TABLE `normativas` (
  `id` int(10) UNSIGNED NOT NULL,
  `codigo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `vigente` tinyint(1) NOT NULL DEFAULT '1',
  `fecha_baja` date DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `noticias`
--

CREATE TABLE `noticias` (
  `id` int(10) UNSIGNED NOT NULL,
  `descripcion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `habilitado` tinyint(1) NOT NULL DEFAULT '1',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `partidas`
--

CREATE TABLE `partidas` (
  `id` int(10) UNSIGNED NOT NULL,
  `tramite_id` int(10) UNSIGNED NOT NULL,
  `num_registro` int(10) UNSIGNED NOT NULL,
  `orc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `libro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `num_partida` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_inscripcion` date NOT NULL,
  `departamento` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado_partida` enum('cancelar','vigente','igualar') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `recepcion_tramites`
--

CREATE TABLE `recepcion_tramites` (
  `id` int(10) UNSIGNED NOT NULL,
  `ventanilla_id` int(10) UNSIGNED NOT NULL,
  `tramite_id` int(10) UNSIGNED NOT NULL,
  `estado_tramite` enum('procesando','derivado','concluido') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `solicitantes`
--

CREATE TABLE `solicitantes` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombres` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellidos` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `celular` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `carnet` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `solicitud_autorizaciones`
--

CREATE TABLE `solicitud_autorizaciones` (
  `id` int(10) UNSIGNED NOT NULL,
  `rectificacion` tinyint(1) NOT NULL DEFAULT '0',
  `complementacion` tinyint(1) NOT NULL DEFAULT '0',
  `ratificacion` tinyint(1) NOT NULL DEFAULT '0',
  `cambio` tinyint(1) NOT NULL DEFAULT '0',
  `cancelacion` tinyint(1) NOT NULL DEFAULT '0',
  `reposicion` tinyint(1) NOT NULL DEFAULT '0',
  `traspaso` tinyint(1) NOT NULL DEFAULT '0',
  `num_partida_fecha_inscripcion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `inscrito_esposo_fallecido` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lugar_nacimiento` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `padre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `complemento_apellido_convencional` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otros_datos_correccion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tipo_tramites`
--

CREATE TABLE `tipo_tramites` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tramites`
--

CREATE TABLE `tramites` (
  `id` int(10) UNSIGNED NOT NULL,
  `ficha_id` int(10) UNSIGNED NOT NULL,
  `categoria_tramite_id` int(10) UNSIGNED NOT NULL,
  `cajero_id` int(10) UNSIGNED NOT NULL,
  `solicitud_autorizacion_id` int(10) UNSIGNED NOT NULL,
  `glosa` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `fecha_elaboracion` date NOT NULL DEFAULT '2020-06-02',
  `fecha_aceptacion` date NOT NULL DEFAULT '2020-06-02',
  `con_prueba` tinyint(1) NOT NULL DEFAULT '0',
  `entregado` tinyint(1) NOT NULL DEFAULT '0',
  `parentesco` enum('interesado','familiar','apoderado') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `cuenta` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombres` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellidos` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `carnet` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `celular` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `cuenta`, `password`, `nombres`, `apellidos`, `carnet`, `celular`, `tipo`, `activo`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'franco.mamani', '$2y$10$gT19rHNdeXQT5aZ9gvQE2.7lz7LMAzFRIgOh4nPuyh7JWMwWSXwn6', 'Franco Jesus', 'Mamani Pozo', '7275047', '76137653', 'administrador', 1, NULL, '2020-06-02 12:19:29', '2020-06-02 12:19:29'),
(2, 'cajero1', '$2y$10$lE5akclUAato9ROg82s8NOOH.FkJs7mIn65WHC2EXDCq8mqQRxjQ2', 'Iver', 'Mamani', '123456789', '123456789', 'cajero', 1, NULL, '2020-06-02 12:20:19', '2020-06-02 12:20:19'),
(3, 'cajero2', '$2y$10$nP6m83mdN34jXUqeT6mtEebAwXosRsb7qj0unMGHOsWNUFW9kr/5C', 'MILENKA LORNA', 'MORALES', '123456789', '123456789', 'cajero', 1, NULL, '2020-06-02 12:22:26', '2020-06-02 12:22:26');

-- --------------------------------------------------------

--
-- Table structure for table `ventanillas`
--

CREATE TABLE `ventanillas` (
  `id` int(10) UNSIGNED NOT NULL,
  `numero` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ventanillas`
--

INSERT INTO `ventanillas` (`id`, `numero`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, '1', NULL, '2020-06-02 12:32:11', '2020-06-02 12:32:11'),
(2, '2', NULL, '2020-06-02 12:32:13', '2020-06-02 12:32:13'),
(3, '3', NULL, '2020-06-02 12:32:15', '2020-06-02 12:32:15'),
(4, '4', NULL, '2020-06-02 12:32:17', '2020-06-02 12:32:17'),
(5, '5', NULL, '2020-06-02 12:32:19', '2020-06-02 12:32:19'),
(6, '6', NULL, '2020-06-02 12:32:22', '2020-06-02 12:32:22'),
(7, '7', NULL, '2020-06-02 12:32:24', '2020-06-02 12:32:24'),
(8, '8', NULL, '2020-06-02 12:32:25', '2020-06-02 12:32:25');

-- --------------------------------------------------------

--
-- Table structure for table `videos`
--

CREATE TABLE `videos` (
  `id` int(10) UNSIGNED NOT NULL,
  `descripcion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `habilitado` tinyint(1) NOT NULL DEFAULT '1',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `rol` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `administradores`
--
ALTER TABLE `administradores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `administradores_user_id_foreign` (`user_id`);

--
-- Indexes for table `agencias`
--
ALTER TABLE `agencias`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `articulos`
--
ALTER TABLE `articulos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `articulos_normativa_id_foreign` (`normativa_id`);

--
-- Indexes for table `asignacion_categorias`
--
ALTER TABLE `asignacion_categorias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `asignacion_categorias_ventanilla_id_foreign` (`ventanilla_id`),
  ADD KEY `asignacion_categorias_categoria_id_foreign` (`categoria_id`);

--
-- Indexes for table `asignacion_ventanillas`
--
ALTER TABLE `asignacion_ventanillas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `asignacion_ventanillas_ventanilla_id_foreign` (`ventanilla_id`),
  ADD KEY `asignacion_ventanillas_cajero_id_foreign` (`cajero_id`);

--
-- Indexes for table `cajeros`
--
ALTER TABLE `cajeros`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cajeros_user_id_foreign` (`user_id`);

--
-- Indexes for table `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categoria_tramites`
--
ALTER TABLE `categoria_tramites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoria_tramites_tipo_tramite_id_foreign` (`tipo_tramite_id`);

--
-- Indexes for table `comunicadores`
--
ALTER TABLE `comunicadores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comunicadores_user_id_foreign` (`user_id`);

--
-- Indexes for table `detalles`
--
ALTER TABLE `detalles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `detalles_item_id_foreign` (`item_id`),
  ADD KEY `detalles_articulo_id_foreign` (`articulo_id`);

--
-- Indexes for table `examples`
--
ALTER TABLE `examples`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fichas`
--
ALTER TABLE `fichas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fichas_categoria_id_foreign` (`categoria_id`);

--
-- Indexes for table `inscritos`
--
ALTER TABLE `inscritos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `items_tramite_id_foreign` (`tramite_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `normativas`
--
ALTER TABLE `normativas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `noticias`
--
ALTER TABLE `noticias`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `partidas`
--
ALTER TABLE `partidas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `partidas_tramite_id_foreign` (`tramite_id`);

--
-- Indexes for table `recepcion_tramites`
--
ALTER TABLE `recepcion_tramites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recepcion_tramites_ventanilla_id_foreign` (`ventanilla_id`),
  ADD KEY `recepcion_tramites_tramite_id_foreign` (`tramite_id`);

--
-- Indexes for table `solicitantes`
--
ALTER TABLE `solicitantes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `solicitud_autorizaciones`
--
ALTER TABLE `solicitud_autorizaciones`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tipo_tramites`
--
ALTER TABLE `tipo_tramites`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tramites`
--
ALTER TABLE `tramites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tramites_ficha_id_foreign` (`ficha_id`),
  ADD KEY `tramites_categoria_tramite_id_foreign` (`categoria_tramite_id`),
  ADD KEY `tramites_cajero_id_foreign` (`cajero_id`),
  ADD KEY `tramites_solicitud_autorizacion_id_foreign` (`solicitud_autorizacion_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ventanillas`
--
ALTER TABLE `ventanillas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `administradores`
--
ALTER TABLE `administradores`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `agencias`
--
ALTER TABLE `agencias`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `articulos`
--
ALTER TABLE `articulos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `asignacion_categorias`
--
ALTER TABLE `asignacion_categorias`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `asignacion_ventanillas`
--
ALTER TABLE `asignacion_ventanillas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cajeros`
--
ALTER TABLE `cajeros`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `categoria_tramites`
--
ALTER TABLE `categoria_tramites`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `comunicadores`
--
ALTER TABLE `comunicadores`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `detalles`
--
ALTER TABLE `detalles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `examples`
--
ALTER TABLE `examples`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fichas`
--
ALTER TABLE `fichas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inscritos`
--
ALTER TABLE `inscritos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `normativas`
--
ALTER TABLE `normativas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `noticias`
--
ALTER TABLE `noticias`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `partidas`
--
ALTER TABLE `partidas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `recepcion_tramites`
--
ALTER TABLE `recepcion_tramites`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `solicitantes`
--
ALTER TABLE `solicitantes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `solicitud_autorizaciones`
--
ALTER TABLE `solicitud_autorizaciones`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tipo_tramites`
--
ALTER TABLE `tipo_tramites`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tramites`
--
ALTER TABLE `tramites`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ventanillas`
--
ALTER TABLE `ventanillas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `videos`
--
ALTER TABLE `videos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `administradores`
--
ALTER TABLE `administradores`
  ADD CONSTRAINT `administradores_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `articulos`
--
ALTER TABLE `articulos`
  ADD CONSTRAINT `articulos_normativa_id_foreign` FOREIGN KEY (`normativa_id`) REFERENCES `normativas` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `asignacion_categorias`
--
ALTER TABLE `asignacion_categorias`
  ADD CONSTRAINT `asignacion_categorias_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `asignacion_categorias_ventanilla_id_foreign` FOREIGN KEY (`ventanilla_id`) REFERENCES `ventanillas` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `asignacion_ventanillas`
--
ALTER TABLE `asignacion_ventanillas`
  ADD CONSTRAINT `asignacion_ventanillas_cajero_id_foreign` FOREIGN KEY (`cajero_id`) REFERENCES `cajeros` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `asignacion_ventanillas_ventanilla_id_foreign` FOREIGN KEY (`ventanilla_id`) REFERENCES `ventanillas` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cajeros`
--
ALTER TABLE `cajeros`
  ADD CONSTRAINT `cajeros_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categoria_tramites`
--
ALTER TABLE `categoria_tramites`
  ADD CONSTRAINT `categoria_tramites_tipo_tramite_id_foreign` FOREIGN KEY (`tipo_tramite_id`) REFERENCES `tipo_tramites` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `comunicadores`
--
ALTER TABLE `comunicadores`
  ADD CONSTRAINT `comunicadores_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `detalles`
--
ALTER TABLE `detalles`
  ADD CONSTRAINT `detalles_articulo_id_foreign` FOREIGN KEY (`articulo_id`) REFERENCES `articulos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `detalles_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fichas`
--
ALTER TABLE `fichas`
  ADD CONSTRAINT `fichas_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_tramite_id_foreign` FOREIGN KEY (`tramite_id`) REFERENCES `tramites` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `partidas`
--
ALTER TABLE `partidas`
  ADD CONSTRAINT `partidas_tramite_id_foreign` FOREIGN KEY (`tramite_id`) REFERENCES `tramites` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `recepcion_tramites`
--
ALTER TABLE `recepcion_tramites`
  ADD CONSTRAINT `recepcion_tramites_tramite_id_foreign` FOREIGN KEY (`tramite_id`) REFERENCES `tramites` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `recepcion_tramites_ventanilla_id_foreign` FOREIGN KEY (`ventanilla_id`) REFERENCES `ventanillas` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tramites`
--
ALTER TABLE `tramites`
  ADD CONSTRAINT `tramites_cajero_id_foreign` FOREIGN KEY (`cajero_id`) REFERENCES `cajeros` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tramites_categoria_tramite_id_foreign` FOREIGN KEY (`categoria_tramite_id`) REFERENCES `categoria_tramites` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tramites_ficha_id_foreign` FOREIGN KEY (`ficha_id`) REFERENCES `fichas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tramites_solicitud_autorizacion_id_foreign` FOREIGN KEY (`solicitud_autorizacion_id`) REFERENCES `solicitud_autorizaciones` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
