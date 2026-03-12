-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: shop_shoes
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id_categories` int NOT NULL AUTO_INCREMENT,
  `categories_titles` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_categories`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Женская обувь'),(2,'Мужская обувь');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manufacturers`
--

DROP TABLE IF EXISTS `manufacturers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manufacturers` (
  `id_manufacturer` int NOT NULL AUTO_INCREMENT,
  `manufacturer_title` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_manufacturer`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufacturers`
--

LOCK TABLES `manufacturers` WRITE;
/*!40000 ALTER TABLE `manufacturers` DISABLE KEYS */;
INSERT INTO `manufacturers` VALUES (1,'Alessio Nesca'),(2,'CROSBY'),(3,'Kari'),(4,'Marco Tozzi'),(5,'Rieker'),(6,'Рос');
/*!40000 ALTER TABLE `manufacturers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id_order` int NOT NULL AUTO_INCREMENT,
  `order_date` date DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `id_pickup_point` int DEFAULT NULL,
  `id_user` int DEFAULT NULL,
  `order_code` varchar(10) DEFAULT NULL,
  `order_status` enum('Завершён','Новый') DEFAULT NULL,
  PRIMARY KEY (`id_order`),
  KEY `pup_idx` (`id_pickup_point`),
  KEY `us _idx` (`id_user`),
  CONSTRAINT `pup` FOREIGN KEY (`id_pickup_point`) REFERENCES `pickup_point` (`id_pickup_point`),
  CONSTRAINT `us ` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2025-02-27','2025-04-20',1,10,'901','Завершён'),(2,'2022-09-28','2025-04-21',11,5,'902','Завершён'),(3,'2025-03-21','2025-04-22',2,7,'903','Завершён'),(4,'2025-02-20','2025-04-23',11,6,'904','Завершён'),(5,'2025-03-17','2025-04-24',2,10,'905','Завершён'),(6,'2025-03-01','2025-04-25',15,5,'906','Завершён'),(7,'2025-02-03','2025-04-26',3,7,'907','Завершён'),(8,'2025-03-31','2025-04-27',19,6,'908','Новый'),(9,'2025-04-02','2025-04-28',5,10,'909','Новый'),(10,'2025-04-03','2025-04-29',19,10,'910','Новый');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_structures`
--

DROP TABLE IF EXISTS `orders_structures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_structures` (
  `id_order_structure` int NOT NULL AUTO_INCREMENT,
  `id_order_structure_number` int DEFAULT NULL,
  `order_structure_article` varchar(6) DEFAULT NULL,
  `order_structure_count` int DEFAULT NULL,
  PRIMARY KEY (`id_order_structure`),
  KEY `idst_idx` (`id_order_structure_number`),
  KEY `art_idx` (`order_structure_article`),
  CONSTRAINT `art` FOREIGN KEY (`order_structure_article`) REFERENCES `tovars` (`tovar_article`),
  CONSTRAINT `idst` FOREIGN KEY (`id_order_structure_number`) REFERENCES `orders` (`id_order`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_structures`
--

LOCK TABLES `orders_structures` WRITE;
/*!40000 ALTER TABLE `orders_structures` DISABLE KEYS */;
INSERT INTO `orders_structures` VALUES (1,1,'А112Т4',2),(2,2,'H782T5',1),(3,3,'J384T6',10),(4,4,'F572H7',5),(5,5,'А112Т4',2),(6,6,'H782T5',1),(7,7,'J384T6',10),(8,8,'F572H7',5),(9,9,'B320R5',5),(10,10,'S213E3',5),(11,1,'F635R4',2),(12,2,'G783F5',1),(13,3,'D572U8',10),(14,4,'D329H3',4),(15,5,'F635R4',2),(16,6,'G783F5',1),(17,7,'D572U8',10),(18,8,'D329H3',4),(19,9,'G432E4',1),(20,10,'E482R4',5);
/*!40000 ALTER TABLE `orders_structures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pickup_point`
--

DROP TABLE IF EXISTS `pickup_point`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pickup_point` (
  `id_pickup_point` int NOT NULL AUTO_INCREMENT,
  `pickup_point_index` varchar(6) DEFAULT NULL,
  `pickup_point_city` varchar(45) DEFAULT NULL,
  `pickup_point_street` varchar(45) DEFAULT NULL,
  `pickup_point_number` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_pickup_point`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pickup_point`
--

LOCK TABLES `pickup_point` WRITE;
/*!40000 ALTER TABLE `pickup_point` DISABLE KEYS */;
INSERT INTO `pickup_point` VALUES (1,'420151','Лесной','Вишневая','32'),(2,'125061','Лесной','Подгорная','8'),(3,'630370','Лесной','Шоссейная','24'),(4,'400562','Лесной','Зеленая','32'),(5,'614510','Лесной','Маяковского','47'),(6,'410542','Лесной','Светлая','46'),(7,'620839','Лесной','Цветочная','8'),(8,'443890','Лесной','Коммунистическая','1'),(9,'603379','Лесной','Спортивная','46'),(10,'603721','Лесной','Гоголя','41'),(11,'410172','Лесной','Северная','13'),(12,'614611','Лесной','Молодежная','50'),(13,'454311','Лесной','Новая','19'),(14,'660007','Лесной','Октябрьская','19'),(15,'603036','Лесной','Садовая','4'),(16,'394060','Лесной','Фрунзе','43'),(17,'410661','Лесной','Школьная','50'),(18,'625590','Лесной','Коммунистическая','20'),(19,'625683','Лесной','8 Марта','6'),(20,'450983','Лесной','Комсомольская','26'),(21,'394782','Лесной','Чехова','3'),(22,'603002','Лесной','Дзержинского','28'),(23,'450558','Лесной','Набережная','30'),(24,'344288','Лесной','Чехова','1'),(25,'614164','Лесной','Степная','30'),(26,'394242','Лесной','Коммунистическая','43'),(27,'660540','Лесной','Солнечная','25'),(28,'125837','Лесной','Шоссейная','40'),(29,'125703','Лесной','Партизанская','49'),(30,'625283','Лесной','Победы','46'),(31,'614753','Лесной','Полевая','35'),(32,'426030','Лесной','Маяковского','44'),(33,'450375','Лесной','Клубная','44'),(34,'625560','Лесной','Некрасова','12'),(35,'630201','Лесной','Комсомольская','17'),(36,'190949','Лесной','Мичурина','26');
/*!40000 ALTER TABLE `pickup_point` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provider`
--

DROP TABLE IF EXISTS `provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provider` (
  `id_provider` int NOT NULL AUTO_INCREMENT,
  `provider_title` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_provider`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provider`
--

LOCK TABLES `provider` WRITE;
/*!40000 ALTER TABLE `provider` DISABLE KEYS */;
INSERT INTO `provider` VALUES (1,'Kari'),(2,'Обувь для вас');
/*!40000 ALTER TABLE `provider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tovars`
--

DROP TABLE IF EXISTS `tovars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tovars` (
  `tovar_article` varchar(6) NOT NULL,
  `tovar_title` varchar(45) DEFAULT NULL,
  `tovar_price` decimal(10,0) DEFAULT NULL,
  `id_proider` int DEFAULT NULL,
  `id_manufacturer` int DEFAULT NULL,
  `id_category` int DEFAULT NULL,
  `tovar_sale` int DEFAULT NULL,
  `tovar_count` int DEFAULT NULL,
  `tovar_description` varchar(100) DEFAULT NULL,
  `tovar_photo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`tovar_article`),
  KEY `prov_idx` (`id_proider`),
  KEY `manuf_idx` (`id_manufacturer`),
  KEY `cat_idx` (`id_category`),
  CONSTRAINT `cat` FOREIGN KEY (`id_category`) REFERENCES `categories` (`id_categories`),
  CONSTRAINT `manuf` FOREIGN KEY (`id_manufacturer`) REFERENCES `manufacturers` (`id_manufacturer`),
  CONSTRAINT `prov` FOREIGN KEY (`id_proider`) REFERENCES `provider` (`id_provider`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tovars`
--

LOCK TABLES `tovars` WRITE;
/*!40000 ALTER TABLE `tovars` DISABLE KEYS */;
INSERT INTO `tovars` VALUES ('B320R5','Туфлиии',4300,1,5,1,2,6,'Туфли Rieker женские демисезонные, размер 41, цвет коричневый','9.jpg'),('B431R5','Ботинки',2700,2,5,2,2,5,'Мужские кожаные ботинки/мужские ботинки',''),('C436G5','Ботинки',10200,1,1,1,15,9,'Ботинки женские, ARGO, размер 40',''),('D268G5','Туфли',4399,2,5,1,3,12,'Туфли Rieker женские демисезонные, размер 36, цвет коричневый',''),('D329H3','Полуботинки',1890,2,1,1,4,4,'Полуботинки Alessio Nesca женские 3-30797-47, размер 37, цвет: бордовый','8.jpg'),('D364R4','Туфли',12400,1,3,1,16,5,'Туфли Luiza Belly женские Kate-lazo черные из натуральной замши',''),('D572U8','Кроссовки',4100,2,6,2,3,6,'129615-4 Кроссовки мужские','6.jpg'),('E482R4','Полуботинки',1800,1,3,1,2,14,'Полуботинки kari женские MYZ20S-149, размер 41, цвет: черный',''),('F427R5','Ботинки',11800,2,5,1,15,11,'Ботинки на молнии с декоративной пряжкой FRAU',''),('F572H7','Туфли',2700,1,4,1,2,14,'Туфли Marco Tozzi женские летние, размер 39, цвет черный','7.jpg'),('F635R4','Ботинки',3244,2,4,1,2,13,'Ботинки Marco Tozzi женские демисезонные, размер 39, цвет бежевый','2.jpg'),('G432E4','Туфли',2800,1,3,1,3,15,'Туфли kari женские TR-YR-413017, размер 37, цвет: черный','10.jpg'),('G531F4','Ботинки',6600,1,3,1,12,9,'Ботинки женские зимние ROMER арт. 893167-01 Черный',''),('G783F5','Ботинки',5900,1,6,2,2,8,'Мужские ботинки Рос-Обувь кожаные с натуральным мехом','4.jpg'),('H535R5','Ботинки',2300,2,5,1,2,7,'Женские Ботинки демисезонные',''),('H782T5','Туфли',4499,1,3,2,4,5,'Туфли kari мужские классика MYZ21AW-450A, размер 43, цвет: черный','3.jpg'),('J384T6','Ботинки',3800,2,5,2,2,16,'B3430/14 Полуботинки мужские Rieker','5.jpg'),('J542F5','Тапочки',500,1,3,2,13,0,'Тапочки мужские Арт.70701-55-67син р.41',''),('K345R4','Полуботинки',2100,2,2,2,2,3,'407700/01-02 Полуботинки мужские CROSBY',''),('K358H6','Тапочки',599,1,5,2,20,2,'Тапочки мужские син р.41',''),('L754R4','Полуботинки',1700,1,3,1,2,7,'Полуботинки kari женские WB2020SS-26, размер 38, цвет: черный',''),('M542T5','Кроссовки',2800,2,5,2,18,3,'Кроссовки мужские TOFA',''),('N457T5','Полуботинки',4600,1,2,1,3,13,'Полуботинки Ботинки черные зимние, мех',''),('O754F4','Туфли',5400,2,5,1,4,18,'Туфли женские демисезонные Rieker артикул 55073-68/37',''),('P764G4','Туфли',6800,1,2,1,15,15,'Туфли женские, ARGO, размер 38',''),('S213E3','Полуботинки',2156,2,2,2,3,6,'407700/01-01 Полуботинки мужские CROSBY',''),('S326R5','Тапочки',9900,2,2,2,17,15,'Мужские кожаные тапочки \"Профиль С.Дали\" ',''),('S634B5','Кеды',5500,2,2,2,3,0,'Кеды Caprice мужские демисезонные, размер 42, цвет черный',''),('T324F5','Сапоги',4699,1,2,1,2,5,'Сапоги замша Цвет: синий',''),('А112Т4','Ботинки',4990,1,3,1,3,6,'Женские Ботинки демисезонные kari','1.jpg');
/*!40000 ALTER TABLE `tovars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `user_role` enum('Администратор','Менеджер','Авторизированный клиент') DEFAULT NULL,
  `user_lastname` varchar(45) DEFAULT NULL,
  `user_name` varchar(45) DEFAULT NULL,
  `user_surname` varchar(45) DEFAULT NULL,
  `user_email` varchar(45) DEFAULT NULL,
  `user_password` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `user_email_UNIQUE` (`user_email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Администратор','Никифорова','Весения','Николаевна','94d5ous@gmail.com','uzWC67'),(2,'Администратор','Одинцов','Серафим','Артёмович','yzls62@outlook.com','JlFRCZ'),(3,'Администратор','Сазонов','Руслан','Германович','uth4iz@mail.com','2L6KZG'),(4,'Менеджер','Ворсин','Петр','Евгеньевич','tjde7c@yahoo.com','YOyhfR'),(5,'Менеджер','Старикова','Елена','Павловна','wpmrc3do@tutanota.com','RSbvHv'),(6,'Менеджер','Степанов','Михаил','Артёмович','1diph5e@tutanota.com','8ntwUp'),(7,'Авторизированный клиент','Ворсин','Петр','Евгеньевич','1qz4kw@mail.com','gynQMT'),(8,'Авторизированный клиент','Михайлюк','Анна','Вячеславовна','5d4zbu@tutanota.com','rwVDh9'),(9,'Авторизированный клиент','Ситдикова','Елена','Анатольевна','ptec8ym@yahoo.com','LdNyos'),(10,'Авторизированный клиент','Старикова','Елена','Павловна','4np6se@mail.com','AtnDjr');
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

-- Dump completed on 2026-02-11 16:42:36
