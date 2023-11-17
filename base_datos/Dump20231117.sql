CREATE DATABASE  IF NOT EXISTS `delivery_` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `delivery_`;
-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: delivery_
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `address` varchar(255) NOT NULL,
  `neighborhood` varchar(180) NOT NULL,
  `lat` double NOT NULL,
  `lng` double NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `id_user` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_user` (`id_user`),
  CONSTRAINT `address_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'Holi, soy una calle','peru',1.2129256,-77.2890404,'2023-11-12 05:01:20','2023-11-12 05:01:20',3),(2,'calle malabrigo','trujillo',37.42202295228997,-122.08403103053568,'2023-11-12 06:12:49','2023-11-12 06:12:49',1),(3,'jueputa','minimini',37.404726454761125,-122.06897914409637,'2023-11-12 22:15:44','2023-11-12 22:15:44',1),(4,'mesamesa','quetvaplaude',37.420093268995714,-122.09894679486753,'2023-11-12 23:05:04','2023-11-12 23:05:04',1),(5,'qq','aa',37.417240591027124,-122.09937192499639,'2023-11-14 05:33:23','2023-11-14 05:33:23',1),(6,'salaverry','morales',-8.12762485107535,-79.0155728906393,'2023-11-15 17:36:02','2023-11-15 17:36:02',14),(7,'antenor urrego','por aqui',-8.11587014006969,-79.02317393571138,'2023-11-17 15:52:46','2023-11-17 15:52:46',1);
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(180) NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'bebidas','Diferente tipo de bebidas para acompañar tus comidas','2023-11-03 12:35:10','2023-11-03 12:35:10'),(2,'Pollo','Selecciona el pollo con lo que quieres','2023-11-03 14:23:38','2023-11-03 14:23:38'),(3,'hamburguesa','seleciona cual quieres','2023-11-03 14:24:52','2023-11-03 14:24:52'),(4,'postres','holi','2023-11-13 03:21:45','2023-11-13 03:21:45'),(52,'romeo','1233','2023-11-14 02:44:29','2023-11-14 02:44:29'),(53,'pezquisa','ee','2023-11-14 05:29:43','2023-11-14 05:29:43');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_has_products`
--

DROP TABLE IF EXISTS `order_has_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_has_products` (
  `id_order` bigint NOT NULL,
  `id_product` bigint NOT NULL,
  `quantity` bigint NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id_order`,`id_product`),
  KEY `id_product` (`id_product`),
  CONSTRAINT `order_has_products_ibfk_1` FOREIGN KEY (`id_order`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `order_has_products_ibfk_2` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_has_products`
--

LOCK TABLES `order_has_products` WRITE;
/*!40000 ALTER TABLE `order_has_products` DISABLE KEYS */;
INSERT INTO `order_has_products` VALUES (2,1,2,'2023-11-13 02:09:41','2023-11-13 02:09:41'),(2,2,1,'2023-11-13 02:09:41','2023-11-13 02:09:41'),(2,3,5,'2023-11-13 02:09:41','2023-11-13 02:09:41'),(3,1,1,'2023-11-13 03:03:35','2023-11-13 03:03:35'),(4,1,1,'2023-11-14 05:32:05','2023-11-14 05:32:05'),(4,2,3,'2023-11-14 05:32:05','2023-11-14 05:32:05'),(4,3,2,'2023-11-14 05:32:05','2023-11-14 05:32:05'),(4,4,2,'2023-11-14 05:32:05','2023-11-14 05:32:05'),(4,5,2,'2023-11-14 05:32:05','2023-11-14 05:32:05'),(4,7,2,'2023-11-14 05:32:05','2023-11-14 05:32:05'),(5,1,1,'2023-11-14 05:33:28','2023-11-14 05:33:28'),(5,2,3,'2023-11-14 05:33:28','2023-11-14 05:33:28'),(5,3,2,'2023-11-14 05:33:28','2023-11-14 05:33:28'),(5,4,2,'2023-11-14 05:33:28','2023-11-14 05:33:28'),(5,5,2,'2023-11-14 05:33:28','2023-11-14 05:33:28'),(5,7,2,'2023-11-14 05:33:28','2023-11-14 05:33:28'),(6,1,1,'2023-11-14 05:59:31','2023-11-14 05:59:31'),(6,2,7,'2023-11-14 05:59:31','2023-11-14 05:59:31'),(7,1,2,'2023-11-14 16:32:46','2023-11-14 16:32:46'),(7,2,1,'2023-11-14 16:32:46','2023-11-14 16:32:46'),(7,3,5,'2023-11-14 16:32:46','2023-11-14 16:32:46'),(8,1,2,'2023-11-15 17:36:07','2023-11-15 17:36:07'),(8,3,1,'2023-11-15 17:36:07','2023-11-15 17:36:07'),(9,2,2,'2023-11-17 15:52:51','2023-11-17 15:52:51'),(9,6,2,'2023-11-17 15:52:51','2023-11-17 15:52:51');
/*!40000 ALTER TABLE `order_has_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `id_client` bigint NOT NULL,
  `id_delivery` bigint DEFAULT NULL,
  `id_address` bigint NOT NULL,
  `lat` double DEFAULT NULL,
  `lng` double DEFAULT NULL,
  `status` varchar(90) NOT NULL,
  `timestamp` bigint NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_client` (`id_client`),
  KEY `id_delivery` (`id_delivery`),
  KEY `id_address` (`id_address`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`id_delivery`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`id_address`) REFERENCES `address` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,NULL,1,NULL,NULL,'PAGADO',1699840950686,'2023-11-13 02:02:31','2023-11-13 02:02:31'),(2,1,14,1,37.4219983,-122.084,'EN CAMINO',1699841380760,'2023-11-13 02:09:41','2023-11-15 04:59:15'),(3,1,1,4,-8.12572,-79.0357483,'EN CAMINO',1699844614778,'2023-11-13 03:03:35','2023-11-15 18:59:27'),(4,1,14,2,37.4219983,-122.084,'EN CAMINO',1699939925435,'2023-11-14 05:32:05','2023-11-15 05:06:44'),(5,1,14,5,37.4219983,-122.084,'EN CAMINO',1699940007659,'2023-11-14 05:33:28','2023-11-15 05:22:40'),(6,1,14,3,37.4219983,-122.084,'EN CAMINO',1699941571420,'2023-11-14 05:59:31','2023-11-15 05:07:38'),(7,1,14,1,-8.1157833,-79.0257367,'EN CAMINO',1699979565497,'2023-11-14 16:32:45','2023-11-17 15:47:31'),(8,14,16,6,-8.1232567,-79.0181517,'ENTREGADO',1700069767016,'2023-11-15 17:36:07','2023-11-17 15:34:42'),(9,1,14,7,-8.0906317,-79.0380967,'ENTREGADO',1700236371177,'2023-11-17 15:52:51','2023-11-17 15:56:54');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(180) NOT NULL,
  `description` text NOT NULL,
  `price` double DEFAULT NULL,
  `image1` varchar(255) DEFAULT NULL,
  `image2` varchar(255) DEFAULT NULL,
  `image3` varchar(255) DEFAULT NULL,
  `id_category` bigint NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `id_category` (`id_category`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`id_category`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'licor','es bueno para la salud',3,'https://firebasestorage.googleapis.com/v0/b/deliverysql-d2ae5.appspot.com/o/image_1699234426338?alt=media&token=bbe60118-a335-4480-a898-3e7d1ca59dc9','https://firebasestorage.googleapis.com/v0/b/deliverysql-d2ae5.appspot.com/o/image_1699234427701?alt=media&token=bbe60118-a335-4480-a898-3e7d1ca59dc9','https://firebasestorage.googleapis.com/v0/b/deliverysql-d2ae5.appspot.com/o/image_1699234428276?alt=media&token=bbe60118-a335-4480-a898-3e7d1ca59dc9',1,'2023-11-06 01:33:46','2023-11-06 01:33:49'),(2,'jugo de naranja','200 gramos de naranja pura',20,'https://firebasestorage.googleapis.com/v0/b/deliverysql-d2ae5.appspot.com/o/image_1699235219411?alt=media&token=bbe60118-a335-4480-a898-3e7d1ca59dc9','https://firebasestorage.googleapis.com/v0/b/deliverysql-d2ae5.appspot.com/o/image_1699235221669?alt=media&token=bbe60118-a335-4480-a898-3e7d1ca59dc9','https://firebasestorage.googleapis.com/v0/b/deliverysql-d2ae5.appspot.com/o/image_1699235222453?alt=media&token=bbe60118-a335-4480-a898-3e7d1ca59dc9',1,'2023-11-06 01:46:59','2023-11-06 01:47:03'),(3,'xd','xd',3,'https://firebasestorage.googleapis.com/v0/b/deliverysql-d2ae5.appspot.com/o/image_1699235349062?alt=media&token=bbe60118-a335-4480-a898-3e7d1ca59dc9','https://firebasestorage.googleapis.com/v0/b/deliverysql-d2ae5.appspot.com/o/image_1699235349784?alt=media&token=bbe60118-a335-4480-a898-3e7d1ca59dc9','https://firebasestorage.googleapis.com/v0/b/deliverysql-d2ae5.appspot.com/o/image_1699235350610?alt=media&token=bbe60118-a335-4480-a898-3e7d1ca59dc9',2,'2023-11-06 01:49:09','2023-11-06 01:49:11'),(4,'Jugo de Mora','200Ml de Delicioso jugo demora',10,'https://firebasestorage.googleapis.com/v0/b/deliverysql-d2ae5.appspot.com/o/image_1699384343145?alt=media&token=b3d51ba1-201a-4edc-9e42-d24073a6a3d0','https://firebasestorage.googleapis.com/v0/b/deliverysql-d2ae5.appspot.com/o/image_1699384345072?alt=media&token=b3d51ba1-201a-4edc-9e42-d24073a6a3d0','https://firebasestorage.googleapis.com/v0/b/deliverysql-d2ae5.appspot.com/o/image_1699384345955?alt=media&token=b3d51ba1-201a-4edc-9e42-d24073a6a3d0',1,'2023-11-07 19:12:23','2023-11-07 19:12:27'),(5,'agridulce','hola',144,'https://firebasestorage.googleapis.com/v0/b/deliverysql-d2ae5.appspot.com/o/image_1699845916575?alt=media&token=2b7e4740-feb5-4a48-8417-7904ebddcac9','https://firebasestorage.googleapis.com/v0/b/deliverysql-d2ae5.appspot.com/o/image_1699845917819?alt=media&token=2b7e4740-feb5-4a48-8417-7904ebddcac9','https://firebasestorage.googleapis.com/v0/b/deliverysql-d2ae5.appspot.com/o/image_1699845918882?alt=media&token=2b7e4740-feb5-4a48-8417-7904ebddcac9',4,'2023-11-13 03:25:17','2023-11-13 03:25:19'),(6,'tomate','rico',12,'https://firebasestorage.googleapis.com/v0/b/deliverysql-d2ae5.appspot.com/o/image_1699930024317?alt=media&token=2e0dd5f6-b5ef-4b4b-963a-211cc3bc2185','https://firebasestorage.googleapis.com/v0/b/deliverysql-d2ae5.appspot.com/o/image_1699930025299?alt=media&token=2e0dd5f6-b5ef-4b4b-963a-211cc3bc2185','https://firebasestorage.googleapis.com/v0/b/deliverysql-d2ae5.appspot.com/o/image_1699930025866?alt=media&token=2e0dd5f6-b5ef-4b4b-963a-211cc3bc2185',52,'2023-11-14 02:47:04','2023-11-14 02:47:06'),(7,'locro','www',12,'https://firebasestorage.googleapis.com/v0/b/deliverysql-d2ae5.appspot.com/o/image_1699939813860?alt=media&token=e083a064-854b-4a3d-8ccb-cc0c06af6ec5','https://firebasestorage.googleapis.com/v0/b/deliverysql-d2ae5.appspot.com/o/image_1699939814306?alt=media&token=e083a064-854b-4a3d-8ccb-cc0c06af6ec5','https://firebasestorage.googleapis.com/v0/b/deliverysql-d2ae5.appspot.com/o/image_1699939814740?alt=media&token=e083a064-854b-4a3d-8ccb-cc0c06af6ec5',53,'2023-11-14 05:30:14','2023-11-14 05:30:15');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(90) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `route` varchar(180) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'RESTAURANTE','https://firebasestorage.googleapis.com/v0/b/deliverysql-d2ae5.appspot.com/o/restaurant.png?alt=media&token=fa77c9a8-09bf-4dc8-bdee-ed95a030d46d&_gl=1*tq6w5x*_ga*MTMxNjQyOTM4MC4xNjk4MDM4Njc3*_ga_CW55HF8NVT*MTY5ODM2OTQzNi41LjEuMTY5ODM2OTY2MS4yLjAuMA..','/restaurant/home','2023-10-25 05:00:00','2023-10-25 05:00:00'),(2,'REPARTIDOR','https://firebasestorage.googleapis.com/v0/b/deliverysql-d2ae5.appspot.com/o/mainPage.png?alt=media&token=0eb6d504-df7c-4e8b-baec-d487a01a7cc9&_gl=1*loy3jl*_ga*MTMxNjQyOTM4MC4xNjk4MDM4Njc3*_ga_CW55HF8NVT*MTY5ODM2OTQzNi41LjEuMTY5ODM2OTYwMy42MC4wLjA.','/delivery/home','2023-10-25 05:00:00','2023-10-25 05:00:00'),(3,'CLIENTE','https://firebasestorage.googleapis.com/v0/b/deliverysql-d2ae5.appspot.com/o/cliente.jpg?alt=media&token=122160c3-4b72-484f-bcff-2a64c42dc4dc&_gl=1*1fhyrms*_ga*MTMxNjQyOTM4MC4xNjk4MDM4Njc3*_ga_CW55HF8NVT*MTY5ODM2OTQzNi41LjEuMTY5ODM2OTUxMy40NS4wLjA.','/client/home','2023-10-25 05:00:00','2023-10-25 05:00:00');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_has_roles`
--

DROP TABLE IF EXISTS `user_has_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_has_roles` (
  `id_user` bigint NOT NULL,
  `id_rol` bigint NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id_user`,`id_rol`),
  KEY `id_rol` (`id_rol`),
  CONSTRAINT `user_has_roles_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_has_roles_ibfk_2` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_has_roles`
--

LOCK TABLES `user_has_roles` WRITE;
/*!40000 ALTER TABLE `user_has_roles` DISABLE KEYS */;
INSERT INTO `user_has_roles` VALUES (1,1,'2023-10-26 07:44:38','2023-10-26 07:44:38'),(1,2,'2023-10-26 07:44:38','2023-10-26 07:44:38'),(1,3,'2023-10-26 07:44:38','2023-10-26 07:44:38'),(2,3,'2023-10-27 02:35:53','2023-10-27 02:35:53'),(3,3,'2023-11-02 09:18:50','2023-11-02 09:18:50'),(4,3,'2023-11-02 10:59:23','2023-11-02 10:59:23'),(5,3,'2023-11-02 11:05:18','2023-11-02 11:05:18'),(6,3,'2023-11-02 13:24:36','2023-11-02 13:24:36'),(7,3,'2023-11-03 09:01:25','2023-11-03 09:01:25'),(8,3,'2023-11-03 09:28:34','2023-11-03 09:28:34'),(9,3,'2023-11-03 13:13:16','2023-11-03 13:13:16'),(10,3,'2023-11-03 13:15:51','2023-11-03 13:15:51'),(11,3,'2023-11-14 04:33:02','2023-11-14 04:33:02'),(12,3,'2023-11-14 04:36:15','2023-11-14 04:36:15'),(13,3,'2023-11-14 04:41:11','2023-11-14 04:41:11'),(14,2,'2023-11-14 16:41:07','2023-11-14 16:41:07'),(14,3,'2023-11-14 16:39:52','2023-11-14 16:39:52'),(16,2,'2023-11-14 16:41:07','2023-11-14 16:41:07'),(16,3,'2023-11-14 16:41:07','2023-11-14 16:41:07');
/*!40000 ALTER TABLE `user_has_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(180) NOT NULL,
  `name` varchar(90) NOT NULL,
  `lastname` varchar(90) NOT NULL,
  `phone` varchar(90) NOT NULL,
  `image` varchar(255) NOT NULL,
  `password` varchar(90) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'pieers@gmail.com','pieers','del aguila','939737373','https://firebasestorage.googleapis.com/v0/b/deliverysql-d2ae5.appspot.com/o/image_1698306276645?alt=media&token=b52b35e5-bebc-47c1-9f29-d35ceeecd570','$2a$10$rfqRVz.mQJTPt7mgSMhya.4SgbaK48UdE0jIUznbBAcIv25p2PPmm','2023-10-26 07:44:38','2023-10-26 07:44:38'),(2,'delacruz1@gmail.com','delacruzddd','jesusd','939349392321','https://firebasestorage.googleapis.com/v0/b/deliverysql-d2ae5.appspot.com/o/image_1698374151439?alt=media&token=c25e1932-a404-4a7a-8071-a7375458cfaa','hola1','2023-10-27 02:35:53','2023-11-02 09:03:09'),(3,'x1@gmail.com','segundoazs','segundo','222','https://firebasestorage.googleapis.com/v0/b/deliverysql-d2ae5.appspot.com/o/image_1698922677836?alt=media&token=4703ba97-6a78-44c4-a698-67b8802c7ccd','$2a$10$DEWfqeYsUgad8GiMySj.EenTubqq1vwqehVVz05iBsPtRgDwxiM.K','2023-11-02 09:18:50','2023-11-02 10:57:59'),(4,'a@gmail.com','pieer','delaguila','3333','https://firebasestorage.googleapis.com/v0/b/deliverysql-d2ae5.appspot.com/o/image_1698922762081?alt=media&token=4703ba97-6a78-44c4-a698-67b8802c7ccd','$2a$10$egGl8WDKB1Fv9yT2IUxzNO6E48N7RxJPZD/avs.rRtq8dATHYd0WO','2023-11-02 10:59:23','2023-11-02 10:59:23'),(5,'pollo@gmail.com','hola1','def','2222','https://firebasestorage.googleapis.com/v0/b/deliverysql-d2ae5.appspot.com/o/image_1698931123690?alt=media&token=09bd60b2-7ac2-499f-ac3f-238adc2d1b4f','$2a$10$dYgK8F4g70f8MsEbt7gA..WRyipVg6RL4/DtzOpXcTJr9e6gueBa.','2023-11-02 11:05:18','2023-11-02 13:18:45'),(6,'juegos1@gmail.com','hola','33','33','https://firebasestorage.googleapis.com/v0/b/deliverysql-d2ae5.appspot.com/o/image_1698931473451?alt=media&token=71bc551e-ddc4-4604-b9c8-60f8d4f5ce4d','$2a$10$i0pSdCsQvdQg.EEYsHqUpe/7ZqPIXOh0CVtfU9MFbZihzCQg8pqbm','2023-11-02 13:24:36','2023-11-02 13:25:45'),(7,'loco@gmail.com','federico','mauro','88888','https://firebasestorage.googleapis.com/v0/b/deliverysql-d2ae5.appspot.com/o/image_1699003413582?alt=media&token=8df39689-99cc-4b2d-88bb-e63599cc63c7','$2a$10$IJ8NHtAA7OyPBNPBN6qdGue.3qB3lfwj1zLjcfcynqyaOveyQ5AD6','2023-11-03 09:01:25','2023-11-03 09:23:35'),(8,'quispe@gmail.com','juan','a','948984973','https://firebasestorage.googleapis.com/v0/b/deliverysql-d2ae5.appspot.com/o/image_1699008755124?alt=media&token=c07dd8c7-26d3-4e5f-bf65-e1be204ddb88','$2a$10$NXl.eQI9PQG8mSKBY8ZvBO1Bt.Dw4sD2sk.nc78lFDZFv39/Z.rJW','2023-11-03 09:28:34','2023-11-03 10:56:19'),(9,'pieersde@gmail.com','erwin','hola','9858','https://firebasestorage.googleapis.com/v0/b/deliverysql-d2ae5.appspot.com/o/image_1699017192993?alt=media&token=1b1ccd63-8d3a-47fe-93ff-70f862276306','$2a$10$FsIR9Utavg59uwjLzb72COoZFVVJ/9SzmRVeTpJ3iBz89FlMKsb0u','2023-11-03 13:13:16','2023-11-03 13:13:16'),(10,'w1@gmail.com','00','555','989855','https://firebasestorage.googleapis.com/v0/b/deliverysql-d2ae5.appspot.com/o/image_1699939705509?alt=media&token=e083a064-854b-4a3d-8ccb-cc0c06af6ec5','$2a$10$DhNh6HgdI0/M48bDN3mpEOxa4NEixV4I0HOyf8SrhnNupp7bE6JkG','2023-11-03 13:15:51','2023-11-14 05:28:47'),(11,'fameca1@gmail.com','Pedro','Del Aguila','94989555','https://firebasestorage.googleapis.com/v0/b/deliverysql-d2ae5.appspot.com/o/image_1699936381078?alt=media&token=2e0dd5f6-b5ef-4b4b-963a-211cc3bc2185','$2a$10$g/Nwqkvw8ZRsOHe4r/is0utGSvsS97.UniU0vvc99Q4ntBTSOAVoa','2023-11-14 04:33:02','2023-11-14 04:34:01'),(12,'z1@gmail.com','e','e','443','https://firebasestorage.googleapis.com/v0/b/deliverysql-d2ae5.appspot.com/o/image_1699936573960?alt=media&token=2e0dd5f6-b5ef-4b4b-963a-211cc3bc2185','$2a$10$lLW//GLN9cjRAGAZkCMKiOXuNj1KvwMZsxKnczNDJInGfYrNnwlqK','2023-11-14 04:36:14','2023-11-14 04:37:31'),(13,'e1@gmail.com','pedro','juan','555','https://firebasestorage.googleapis.com/v0/b/deliverysql-d2ae5.appspot.com/o/image_1699936870199?alt=media&token=2e0dd5f6-b5ef-4b4b-963a-211cc3bc2185','$2a$10$HtNryOjUQhpySO2wBq0cwusF2KHC1ZKwdeirOjOs0M8rXOFE8Fwp2','2023-11-14 04:41:11','2023-11-14 04:43:42'),(14,'jeycob@gmail.com','jeycob','e','2555','https://firebasestorage.googleapis.com/v0/b/deliverysql-d2ae5.appspot.com/o/image_1699979990815?alt=media&token=7c399c4a-9f95-4c2b-8baf-4fdbf9ba8538','$2a$10$ix.hUjjN3wfJfEGy.ZIfZ.I3pwwjGO4Siek3.3MY5cDzdO40yhVDG','2023-11-14 16:39:52','2023-11-14 16:39:52'),(16,'ramiro@gmail.com','ramiro','1212','6584','https://firebasestorage.googleapis.com/v0/b/deliverysql-d2ae5.appspot.com/o/image_1699980066304?alt=media&token=7c399c4a-9f95-4c2b-8baf-4fdbf9ba8538','$2a$10$GoDHurL3SHmuKcbm8eDkDe0ee7Wm4ORwRQSp.2SHPCBw2Z73riaay','2023-11-14 16:41:07','2023-11-14 16:41:07');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-17 11:13:17
