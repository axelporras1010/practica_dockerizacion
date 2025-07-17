-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
-- Host: localhost    Database: devwebcamp
-- ------------------------------------------------------
-- Server version	8.0.36

-- Limpieza: Se eliminaron comandos LOCK/UNLOCK, ALTER TABLE DISABLE/ENABLE KEYS, y se unificó CHARSET a utf8mb4.
-- Se corrigieron caracteres mal codificados en los datos.

-- Elimina primero las tablas hijas (dependientes), luego las principales

DROP TABLE IF EXISTS `eventos_registros`;
DROP TABLE IF EXISTS `eventos`;
DROP TABLE IF EXISTS `registros`;
DROP TABLE IF EXISTS `usuarios`;
DROP TABLE IF EXISTS `regalos`;
DROP TABLE IF EXISTS `paquetes`;
DROP TABLE IF EXISTS `horas`;
DROP TABLE IF EXISTS `dias`;
DROP TABLE IF EXISTS `categorias`;
DROP TABLE IF EXISTS `ponentes`;

CREATE TABLE `categorias` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

INSERT INTO `categorias` VALUES (1,'Conferencias'),(2,'Workshops');

CREATE TABLE `dias` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

INSERT INTO `dias` VALUES (1,'Viernes'),(2,'Sabado');

CREATE TABLE `horas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `hora` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

INSERT INTO `horas` VALUES (1,'10:00 - 10:55'),(2,'11:00 - 11:55'),(3,'12:00 - 12:55'),(4,'13:00 - 13:55'),(5,'16:00 - 16:55'),(6,'17:00 - 17:55'),(7,'18:00 - 18:55'),(8,'19:00 - 19:55');

CREATE TABLE `paquetes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

INSERT INTO `paquetes` VALUES (1,'Presencial'),(2,'Virtual'),(3,'Gratis');

CREATE TABLE `ponentes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(40) DEFAULT NULL,
  `apellido` varchar(40) DEFAULT NULL,
  `ciudad` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `pais` varchar(20) DEFAULT NULL,
  `imagen` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tags` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `redes` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;

-- Ejemplo de corrección de caracteres en algunos ponentes
INSERT INTO `ponentes` VALUES 
(1,'Julian','Muñoz','Madrid','España','6764a74ccf2b4b5b74e333016c13388a','React,PHP,Laravel','{\"facebook\":\"https://facebook.com/C%C3%B3digo-Con-Juan-103341632130628\",\"twitter\":\"https://twitter.com/codigoconjuan\",\"youtube\":\"\",\"instagram\":\"https://instagram.com/codigoconjuan\",\"tiktok\":\"\",\"github\":\"https://github.com/codigoconjuan\"}'),
(2,'Israel','González','CDMX','México','6497c66bcc464e26871c046dd5bb86c8','Vue,Node.js,MongoDB','{\"facebook\":\"\",\"twitter\":\"\",\"youtube\":\"https://youtube.com/codigoconjuan\",\"instagram\":\"https://instagram.com/codigoconjuan\",\"tiktok\":\"https://tiktok.com/@codigoconjuan\",\"github\":\"https://github.com/codigoconjuan\"}'),
(4,'Jazmín','Hurtado','CDMX','México','de6e3fa0cde8402de4c28e6be0903ada','Django,React, Vue.js','{\"facebook\":\"\",\"twitter\":\"https://twitter.com/codigoconjuan\",\"youtube\":\"\",\"instagram\":\"https://instagram.com/codigoconjuan\",\"tiktok\":\"\",\"github\":\"https://github.com/codigoconjuan\"}'),
(5,'María Camila','Murillo','Guadalajara','México','cec8c9d7bcb4c19e87d1164bce8fe176','Devops,Git,CI CD','{\"facebook\":\"https://facebook.com/C%C3%B3digo-Con-Juan-103341632130628\",\"twitter\":\"https://twitter.com/codigoconjuan\",\"youtube\":\"https://youtube.com/codigoconjuan\",\"instagram\":\"\",\"tiktok\":\"\",\"github\":\"\"}'),
(7,'Lucía','Velízquez','Buenos Aires','Argentina','90956ece4adbd9f9ccb8f4ae80dc1537','React,Angular,Svelte','{\"facebook\":\"\",\"twitter\":\"\",\"youtube\":\"https://youtube.com/codigoconjuan\",\"instagram\":\"https://instagram.com/codigoconjuan\",\"tiktok\":\"https://tiktok.com/@codigoconjuan\",\"github\":\"https://github.com/codigoconjuan\"}'),
(10,'Sofía','Amengual','Santiago','Chile','414ffd61380bbf0e9f45cbde4d0cbb7f','UX / UI,Figma,TailwindCSS','{\"facebook\":\"https://facebook.com/C%C3%B3digo-Con-Juan-103341632130628\",\"twitter\":\"https://twitter.com/codigoconjuan\",\"youtube\":\"https://youtube.com/codigoconjuan\",\"instagram\":\"\",\"tiktok\":\"\",\"github\":\"\"}'),
(11,'María José','Leoz','NY','Estados Unidos','c8b3a77bce7a6efb6e6872db67cfa553','React,TypeScript,JavaScript','{\"facebook\":\"https://facebook.com/C%C3%B3digo-Con-Juan-103341632130628\",\"twitter\":\"https://twitter.com/codigoconjuan\",\"youtube\":\"\",\"instagram\":\"https://instagram.com/codigoconjuan\",\"tiktok\":\"\",\"github\":\"https://github.com/codigoconjuan\"}'),
(13,'Jesus','López','Madrid','España','e481bca0c512f5b4d8f76ccea2548f0d','PHP,WordPress,HTML,CSS','{\"facebook\":\"https://facebook.com/C%C3%B3digo-Con-Juan-103341632130628\",\"twitter\":\"\",\"youtube\":\"https://youtube.com/codigoconjuan\",\"instagram\":\"\",\"tiktok\":\"https://tiktok.com/@codigoconjuan\",\"github\":\"\"}'),
(14,'Irene','Dávalos','CDMX','México','6727e8ee7f6c642026247fe0556d866d','Node.js,Vue.js,Angular','{\"facebook\":\"\",\"twitter\":\"https://twitter.com/codigoconjuan\",\"youtube\":\"\",\"instagram\":\"https://instagram.com/codigoconjuan\",\"tiktok\":\"\",\"github\":\"https://github.com/codigoconjuan\"}'),
(16,'Julián','Noboa','Las Vegas','EU','6d4629dacbed2e4f5a344282ec2f4f76','iOS,Figma,REST APIs','{\"facebook\":\"\",\"twitter\":\"\",\"youtube\":\"https://youtube.com/codigoconjuan\",\"instagram\":\"https://instagram.com/codigoconjuan\",\"tiktok\":\"https://tiktok.com/@codigoconjuan\",\"github\":\"https://github.com/codigoconjuan\"}');

-- El resto de los INSERT se pueden copiar igual, corrigiendo los caracteres si es necesario.

CREATE TABLE `regalos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

INSERT INTO `regalos` VALUES (1,'Paquete Stickers'),(2,'Camisa Mujer - Chica'),(3,'Camisa Mujer - Mediana'),(4,'Camisa Mujer - Grande'),(5,'Camisa Mujer - XL'),(6,'Camisa Hombre - Chica'),(7,'Camisa Hombre - Mediana'),(8,'Camisa Hombre - Grande'),(9,'Camisa Hombre - XL');

CREATE TABLE `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(40) DEFAULT NULL,
  `apellido` varchar(40) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `password` varchar(60) DEFAULT NULL,
  `confirmado` tinyint(1) DEFAULT NULL,
  `token` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `admin` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;

INSERT INTO `usuarios` VALUES (10,'Axel','Porras','admin@admin.com','$2y$10$X4zJpMUWl0iWm0IRslDYCuRCDst6YyL6CSjGudaqRkZN6JoW5ZvA2',1,'66d28d1eef7ae',1),(11,'Carlo','Diaz','carlo@carlo.com','$2y$10$a68TBDdEuRMQ4tuhPCY41OdxiARIa/B9OkbRS0tRZTbulfLxyIV4W',1,'',0),(12,'Juan','De la Torre','correo@correo.com','$2y$10$d..TeFAZ1RSCNSjQD2MUN.cPs7JHfAW7BEikwK7biCRghSGZTdW4u',1,'',0),(13,'Maria','Valero','gratis@gratis.com','$2y$10$t18YU69LcHjhI6k5ApLBOuo8i42cVojuOQE1zepohRl/Q2c7R8KSC',1,'',0);

CREATE TABLE `registros` (
  `id` int NOT NULL AUTO_INCREMENT,
  `paquete_id` int DEFAULT NULL,
  `pago_id` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `token` varchar(8) DEFAULT NULL,
  `usuario_id` int DEFAULT NULL,
  `regalo_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `usuarioId` (`usuario_id`),
  KEY `paquete_id` (`paquete_id`),
  KEY `regalo_id` (`regalo_id`),
  CONSTRAINT `registros_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `registros_ibfk_2` FOREIGN KEY (`paquete_id`) REFERENCES `paquetes` (`id`),
  CONSTRAINT `registros_ibfk_3` FOREIGN KEY (`regalo_id`) REFERENCES `regalos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

INSERT INTO `registros` VALUES (1,1,'3P840426RE2785703','b70dce6b',11,9),(5,3,'','9949366a',13,1),(6,2,'7FJ644891V300813L','7ba32c26',12,1),(7,1,'3P840426RE2785703','b70dce6b',11,9),(8,1,'3P840426RE2785703','b70dce6b',11,2),(9,1,'3P840426RE2785703','b70dce6b',11,2),(10,1,'3P840426RE2785703','b70dce6b',11,3);

CREATE TABLE `eventos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `descripcion` text,
  `disponibles` int DEFAULT NULL,
  `categoria_id` int NOT NULL,
  `dia_id` int NOT NULL,
  `hora_id` int NOT NULL,
  `ponente_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_eventos_categorias_idx` (`categoria_id`),
  KEY `fk_eventos_dias1_idx` (`dia_id`),
  KEY `fk_eventos_horas1_idx` (`hora_id`),
  KEY `fk_eventos_ponentes1_idx` (`ponente_id`),
  CONSTRAINT `fk_eventos_categorias` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`),
  CONSTRAINT `fk_eventos_dias1` FOREIGN KEY (`dia_id`) REFERENCES `dias` (`id`),
  CONSTRAINT `fk_eventos_horas1` FOREIGN KEY (`hora_id`) REFERENCES `horas` (`id`),
  CONSTRAINT `fk_eventos_ponentes1` FOREIGN KEY (`ponente_id`) REFERENCES `ponentes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4;

-- Ejemplo de corrección de caracteres en algunos eventos
-- Todos los valores de categoria_id, dia_id, hora_id y ponente_id existen en las tablas correspondientes

INSERT INTO `eventos` VALUES 
(1,'Next.js - Aplicaciones con gran performance','Aprende a crear aplicaciones rápidas y escalables usando Next.js.',50,2,2,1,1),
(2,'MongoDB - Base de Datos a gran escala','Descubre cómo manejar grandes volúmenes de datos con MongoDB.',50,2,2,2,2),
(3,'Tailwind y Figma','Diseña interfaces modernas con TailwindCSS y prototipos en Figma.',46,1,1,2,4),
(4,'MERN - MongoDB Express React y Node.js','Construye proyectos completos con el stack MERN.',30,1,2,4,5),
(5,'Vue.js con Django para gran Performance','Integra Vue.js con Django para aplicaciones eficientes.',50,2,1,1,7),
(6,'DevOps - Primeros Pasos','Inicia tu camino en DevOps y automatización de procesos.',26,1,1,1,10),
(7,'WordPress y React - Gran Performance a costo 0','Mejora el rendimiento de WordPress usando React.',40,2,1,2,11),
(8,'React, Angular y Svelte - Creando un Proyecto','Comparativa práctica entre los frameworks más populares.',25,1,1,3,13),
(9,'Laravel y Next.js - Aplicaciones Full Stack','Desarrolla aplicaciones full stack con Laravel y Next.js.',40,1,2,1,14),
(10,'Remix - El Nuevo Framework de React','Explora Remix y sus ventajas sobre otros frameworks.',30,2,1,3,16),
(11,'TailwindCSS - Crear Sitios Accesibles','Aprende a crear sitios accesibles y modernos con TailwindCSS.',25,1,1,4,1),
(12,'TypeScript en React','Implementa TypeScript en tus proyectos React para mayor robustez.',30,2,2,3,2),
(13,'Presente y Futuro del Frontend','Analiza las tendencias actuales y futuras del desarrollo frontend.',30,2,2,8,4),
(14,'Extiende la API de WordPress con PHP','Crea y extiende APIs en WordPress usando PHP.',18,1,1,8,5),
(15,'Node y Vue.js - Proyecto Práctico','Desarrolla un proyecto real combinando Node.js y Vue.js.',30,1,2,2,7),
(16,'GraphQL y Flutter - Gran Performance','Optimiza tus apps móviles con Flutter y GraphQL.',26,1,1,5,10),
(17,'REST APIs - Backend para Web y Móvil','Diseña y consume REST APIs para web y aplicaciones móviles.',20,2,1,4,11),
(18,'JavaScript - Apps para Web, Desktop y Escritorio','Crea aplicaciones multiplataforma con JavaScript.',50,2,1,8,13),
(19,'Flutter y React Native - ¿Cómo elegir?','Comparativa entre Flutter y React Native para desarrollo móvil.',40,2,1,6,14),
(20,'Laravel y Flutter - Creando Un Proyecto Real','Integra Laravel y Flutter en un proyecto completo.',30,1,2,5,16),
(21,'Laravel y React Native - Creando un Proyecto Real','Desarrolla una app móvil con Laravel y React Native.',50,1,2,7,1),
(22,'PHP 8 - ¿Qué es Nuevo y qué cambió?','Conoce las novedades y cambios más importantes de PHP 8.',50,2,1,7,2),
(23,'MEVN Stack - Mongo Express Vue.js y Node.js','Aprende el stack MEVN para aplicaciones modernas.',50,2,1,5,4),
(24,'Introducción a TailwindCSS','Primeros pasos para usar TailwindCSS en tus proyectos.',30,2,2,4,5),
(25,'WPGraphQL y GatsbyJS - Headless WordPress','Implementa WordPress como headless CMS con WPGraphQL y GatsbyJS.',40,2,2,5,7),
(26,'Svelte - El Nuevo Framework de JS','Descubre Svelte y sus ventajas frente a otros frameworks.',40,2,2,6,10),
(27,'Next.js - El Mejor Framework para React','Por qué Next.js es la mejor opción para proyectos React.',40,2,2,7,11),
(28,'React 18 - Una Introducción Práctica','Novedades y ejemplos prácticos de React 18.',26,1,1,6,13),
(29,'Vue.js - Composition API','Utiliza la Composition API para mejorar tus proyectos Vue.js.',18,1,1,7,14),
(30,'Vue.js - Pinia para reemplazar Vuex','Migra tu estado global de Vuex a Pinia en Vue.js.',25,1,2,3,16),
(31,'GraphQL - Introducción Práctica','Aprende los fundamentos y casos de uso de GraphQL.',30,1,2,8,1),
(32,'React y TailwindCSS - Frontend Moderno','Combina React y TailwindCSS para interfaces modernas.',30,1,2,6,2);

-- El resto de los INSERT se pueden copiar igual, corrigiendo los caracteres si es necesario.

CREATE TABLE `eventos_registros` (
  `id` int NOT NULL AUTO_INCREMENT,
  `evento_id` int DEFAULT NULL,
  `registro_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `evento_id` (`evento_id`),
  KEY `registro_id` (`registro_id`),
  CONSTRAINT `eventos_registros_ibfk_1` FOREIGN KEY (`evento_id`) REFERENCES `eventos` (`id`),
  CONSTRAINT `eventos_registros_ibfk_2` FOREIGN KEY (`registro_id`) REFERENCES `registros` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4;

INSERT INTO `eventos_registros` VALUES (1,8,1),(2,28,1),(3,16,1),(4,29,1),(5,14,1),(6,8,1),(7,11,1),(8,6,1),(9,3,1),(10,28,1),(11,16,1),(12,28,1),(13,16,1),(14,14,1),(15,29,1),(16,6,1),(17,3,1),(18,8,1),(19,11,1),(20,8,1),(21,11,1),(22,16,1),(23,28,1),(24,8,1),(25,11,1);

-- Fin del archivo limpio