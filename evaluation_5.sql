-- MySQL dump 10.13  Distrib 8.0.30, for Linux (x86_64)
--
-- Host: localhost    Database: evaluation_5
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `Acces`
--

DROP TABLE IF EXISTS `Acces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Acces` (
  `admin_id` int NOT NULL,
  `cinema_id` int NOT NULL,
  PRIMARY KEY (`admin_id`,`cinema_id`) USING BTREE,
  KEY `Acces_ibfk_2` (`cinema_id`) USING BTREE,
  CONSTRAINT `Acces_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `Administrators` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `Acces_ibfk_2` FOREIGN KEY (`cinema_id`) REFERENCES `Cinemas` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Acces`
--

LOCK TABLES `Acces` WRITE;
/*!40000 ALTER TABLE `Acces` DISABLE KEYS */;
INSERT INTO `Acces` VALUES (3,1),(2,2),(1,3),(2,4),(1,5),(4,6);
/*!40000 ALTER TABLE `Acces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Administrators`
--

DROP TABLE IF EXISTS `Administrators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Administrators` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fullname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `role` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `passwd` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Administrators`
--

LOCK TABLES `Administrators` WRITE;
/*!40000 ALTER TABLE `Administrators` DISABLE KEYS */;
INSERT INTO `Administrators` VALUES (1,'dumas aurelie','administrateur','dumasaurelie@live.fr','b5fda7f118ae251f8c739ed5915173e6'),(2,'dupont gerard','gerant','dupontgerard@gnail.com','2a09c03d7a445a268a9322674e867481'),(3,'durand michel','gerant','durandmichel@gnail.com','a43e40b74fd327f000d91e9f60187d25'),(4,'martin pierre','gerant','martinpierre@gnail.com','06d01874dc1eb6d50cf952b4a2ac255a'),(5,'fernand christine','gerant','fernandchristine@gnail.com','96842bf3d7c8b2f0a8088bef61b3fdfd');
/*!40000 ALTER TABLE `Administrators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cinemas`
--

DROP TABLE IF EXISTS `Cinemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Cinemas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `signboard` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `city` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cinemas`
--

LOCK TABLES `Cinemas` WRITE;
/*!40000 ALTER TABLE `Cinemas` DISABLE KEYS */;
INSERT INTO `Cinemas` VALUES (1,'Le Granier','Chambéry'),(2,'La Galoppe','Grenoble'),(3,'Le Trélod','Chambéry'),(4,'Le Peney','Lyon'),(5,'Le Mont Blanc','Annecy'),(6,'Le Margériaz','Lyon');
/*!40000 ALTER TABLE `Cinemas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customers`
--

DROP TABLE IF EXISTS `Customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Customers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `lastname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `firstname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `passwd` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customers`
--

LOCK TABLES `Customers` WRITE;
/*!40000 ALTER TABLE `Customers` DISABLE KEYS */;
INSERT INTO `Customers` VALUES (1,'Gilbert','Sylvie','gilbertsylvie@gmil.fr','a5dddb7705470be27a85a22a3612ed5e'),(2,'Guillot','Augustin','guillotaugustin@gmil.fr','249a9c0de26f21f90a79a731265281f5'),(3,'Ferreira','Franck','ferreirafranck@gmil.fr','807b52f02f68df8f815f206b8062c736'),(4,'Pons','Guillaume','ponsguillaume@gmil.fr','3b4cfa2a0d627d5ccf524e3ffd6e2f56'),(5,'Laroche','Léon','larocheléon@gmil.fr','bc954f4842d99ebd9ef3ddd05d62db4d');
/*!40000 ALTER TABLE `Customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Movies`
--

DROP TABLE IF EXISTS `Movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Movies` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `director` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `releaseDate` date NOT NULL,
  `duration` smallint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Movies`
--

LOCK TABLES `Movies` WRITE;
/*!40000 ALTER TABLE `Movies` DISABLE KEYS */;
INSERT INTO `Movies` VALUES (1,'BLACK PANTHER','Action','Ryan Coogler','La Reine Ramonda, Shuri, M’Baku, Okoye et les Dora Milaje luttent pour protéger leur nation des ingérences d’autres puissances mondiales après la mort du roi T’Challa. Alors que le peuple s’efforce d’aller de l’avant, nos héros vont devoir s’unir et compter sur l’aide de la mercenaire Nakia et d’Everett Ross pour faire entrer le royaume du Wakanda dans une nouvelle ère.','2022-11-09',125),(2,'ARMAGEDDON TIME','Drame','James Gray','L’histoire très personnelle du passage à l’âge adulte d’un garçon du Queens dans les années 80, de la force de la famille et de la quête générationnelle du rêve américain.','2022-11-09',100),(3,'ENZO LE CROCO','Famille','Will Speck','Quand la famille Primm déménage à New York, leur jeune fils Josh peine à s\'adapter à sa nouvelle école et à ses nouveaux camarades. Tout cela change quand il découvre Enzo - un crocodile chanteur qui aime les bains et le caviar – et qui vit dans le grenier de sa nouvelle maison.','2022-11-09',75),(4,'VIOLENT NIGHT','Thriller','Tommy Wirkola','Le soir de Noël, quand un groupe de mercenaires entre par effraction sur la propriété d’une famille aisée qu’ils prennent en otage, ils vont devoir affronter un adversaire auquel ils ne s’attendaient pas : Le Père Noël est dans la place et il va leur montrer que ce bon vieux Saint Nicolas a plus d’un tour dans sa hotte.','2022-11-09',100),(5,'BLACK ADAM','Action','Jaume Collet-Serra','Dans l’antique Kahndaq, l’esclave Teth Adam avait reçu les super-pouvoirs des dieux. Mais il en a fait usage pour se venger et a fini en prison. Cinq millénaires plus tard, alors qu’il a été libéré, il fait régner sa conception très sombre de la justice dans le monde. Refusant de se rendre, Teth Adam doit affronter une bande de héros d’aujourd’hui qui composent la Justice Society – Hawkman, le Dr Fate, Atom Smasher et Cyclone – qui comptent bien le renvoyer en prison pour l’éternité.','2022-11-09',100),(6,'SAMOURAÏ ACADEMY','Famille','Rob Minkoff','Hank est un chien enjoué qui rêve d’être samouraï dans un monde où ce privilège n’est réservé… qu’aux chats ! Moqué, refusé par toutes les écoles de samouraïs, il rencontre un gros matou grincheux, un maître guerrier qui finit par accepter de lui enseigner les techniques ancestrales des samouraïs. L’apprentissage va être rude pour le jeune chien remuant et dissipé : il faut apprendre à manier le sabre, devenir agile comme un chat, maîtriser les arts martiaux, et Hank n’est pas très doué.','2022-11-09',75),(7,'NOVEMBRE','Thriller','Cedric Jimenez','Une plongée au cœur de l’Anti-Terrorisme pendant les 5 jours d\'enquête qui ont suivi les attentats du 13 novembre.','2022-11-09',100),(8,'SPIDER-MAN: ACROSS THE SPIDER-VERSE','Fantastique','Joaquim Dos Santos','Miles Morales revient dans un nouveau chapitre de la franchise oscarisée Spider-Man : New Generation, pour une aventure épique qui entraînera notre héros sympa originaire de Brooklyn, à travers le Multivers pour unir ses forces à celles de Gwen Stacy et une nouvelle équipe de Spider-héros pour faire face au méchant le plus puissant qu\'ils n\'aient jamais affronté.','2022-11-09',125),(9,'AVATAR : LA VOIE DE L\'EAU','Fantastique','James Cameron','Se déroulant plus d’une décennie après les événements relatés dans le premier film, AVATAR : LA VOIE DE L’EAU raconte l\'histoire des membres de la famille Sully (Jake, Neytiri et leurs enfants), les épreuves auxquelles ils sont confrontés, les chemins qu’ils doivent emprunter pour se protéger les uns les autres, les batailles qu’ils doivent mener pour rester en vie et les tragédies qu\'ils endurent.','2022-11-09',150),(10,'ANT-MAN ET LA GUÊPE : QUANTUMANIA','Fantastique','Peyton Reed','Les super-héros et partenaires Scott Lang et Hope Van Dyne – alias Ant-Man et la Guêpe – vont vivre de nouvelles péripéties. En compagnie de Hank Pym et Janet Van Dyne - les parents de Hope – le duo va explorer la dimension subatomique, interagir avec d\'étranges nouvelles créatures et se lancer dans une odyssée qui les poussera au-delà des limites de ce qu\'il pensait être possible.','2022-11-09',125);
/*!40000 ALTER TABLE `Movies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Orders`
--

DROP TABLE IF EXISTS `Orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_at` date NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `customer` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `order_customer` (`customer`) USING BTREE,
  CONSTRAINT `order_customer` FOREIGN KEY (`customer`) REFERENCES `Customers` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Orders`
--

LOCK TABLES `Orders` WRITE;
/*!40000 ALTER TABLE `Orders` DISABLE KEYS */;
INSERT INTO `Orders` VALUES (6,'2022-11-10',21.00,1),(7,'2022-11-15',18.40,3),(8,'2022-11-11',15.10,5),(9,'2022-11-12',15.20,4),(10,'2022-11-11',21.00,2);
/*!40000 ALTER TABLE `Orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrdersDetails`
--

DROP TABLE IF EXISTS `OrdersDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OrdersDetails` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rate_id` int DEFAULT NULL,
  `order_id` int NOT NULL,
  `quantity` int NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `rate_id` (`rate_id`) USING BTREE,
  KEY `order_id` (`order_id`) USING BTREE,
  CONSTRAINT `OrdersDetails_ibfk_1` FOREIGN KEY (`rate_id`) REFERENCES `Rates` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `OrdersDetails_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `Orders` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrdersDetails`
--

LOCK TABLES `OrdersDetails` WRITE;
/*!40000 ALTER TABLE `OrdersDetails` DISABLE KEYS */;
INSERT INTO `OrdersDetails` VALUES (2,34,6,1,9.20),(3,36,6,2,5.90),(4,25,7,2,9.20),(5,7,8,1,9.20),(6,9,8,1,5.90),(7,41,9,2,7.60),(8,52,10,1,9.20),(9,54,10,2,5.90);
/*!40000 ALTER TABLE `OrdersDetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Rates`
--

DROP TABLE IF EXISTS `Rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Rates` (
  `id` int NOT NULL AUTO_INCREMENT,
  `amount` decimal(10,2) NOT NULL,
  `public` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `session_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `Rates_ibfk_1` (`session_id`) USING BTREE,
  CONSTRAINT `Rates_ibfk_1` FOREIGN KEY (`session_id`) REFERENCES `Sessions` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Rates`
--

LOCK TABLES `Rates` WRITE;
/*!40000 ALTER TABLE `Rates` DISABLE KEYS */;
INSERT INTO `Rates` VALUES (1,9.20,'Plein Tarif',64),(2,7.60,'Etudiant',64),(3,5.90,'Enfant',64),(4,9.20,'Plein Tarif',65),(5,7.60,'Etudiant',65),(6,5.90,'Enfant',65),(7,9.20,'Plein Tarif',66),(8,7.60,'Etudiant',66),(9,5.90,'Enfant',66),(10,9.20,'Plein Tarif',67),(11,7.60,'Etudiant',67),(12,5.90,'Enfant',67),(13,9.20,'Plein Tarif',68),(14,7.60,'Etudiant',68),(15,5.90,'Enfant',68),(16,9.20,'Plein Tarif',69),(17,7.60,'Etudiant',69),(18,5.90,'Enfant',69),(19,9.20,'Plein Tarif',70),(20,7.60,'Etudiant',70),(21,5.90,'Enfant',70),(22,9.20,'Plein Tarif',71),(23,7.60,'Etudiant',71),(24,5.90,'Enfant',71),(25,9.20,'Plein Tarif',72),(26,7.60,'Etudiant',72),(27,5.90,'Enfant',72),(28,9.20,'Plein Tarif',73),(29,7.60,'Etudiant',73),(30,5.90,'Enfant',73),(31,9.20,'Plein Tarif',74),(32,7.60,'Etudiant',74),(33,5.90,'Enfant',74),(34,9.20,'Plein Tarif',75),(35,7.60,'Etudiant',75),(36,5.90,'Enfant',75),(37,9.20,'Plein Tarif',76),(38,7.60,'Etudiant',76),(39,5.90,'Enfant',76),(40,9.20,'Plein Tarif',77),(41,7.60,'Etudiant',77),(42,5.90,'Enfant',77),(43,9.20,'Plein Tarif',78),(44,7.60,'Etudiant',78),(45,5.90,'Enfant',78),(46,9.20,'Plein Tarif',79),(47,7.60,'Etudiant',79),(48,5.90,'Enfant',79),(49,9.20,'Plein Tarif',80),(50,7.60,'Etudiant',80),(51,5.90,'Enfant',80),(52,9.20,'Plein Tarif',81),(53,7.60,'Etudiant',81),(54,5.90,'Enfant',81),(55,9.20,'Plein Tarif',82),(56,7.60,'Etudiant',82),(57,5.90,'Enfant',82),(58,9.20,'Plein Tarif',83),(59,7.60,'Etudiant',83),(60,5.90,'Enfant',83),(64,9.20,'Plein Tarif',84),(65,7.60,'Etudiant',84),(66,5.90,'Enfant',84);
/*!40000 ALTER TABLE `Rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Rooms`
--

DROP TABLE IF EXISTS `Rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Rooms` (
  `id` int NOT NULL AUTO_INCREMENT,
  `room_number` int NOT NULL,
  `seats` int NOT NULL,
  `cinema` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `Rooms_ibfk_1` (`cinema`) USING BTREE,
  CONSTRAINT `Rooms_ibfk_1` FOREIGN KEY (`cinema`) REFERENCES `Cinemas` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Rooms`
--

LOCK TABLES `Rooms` WRITE;
/*!40000 ALTER TABLE `Rooms` DISABLE KEYS */;
INSERT INTO `Rooms` VALUES (99,1,50,1),(100,2,25,1),(101,3,70,1),(102,4,25,1),(103,5,50,1),(104,1,20,2),(105,2,25,2),(106,3,50,2),(107,4,100,2),(108,5,100,2),(109,6,100,2),(110,7,25,2),(111,8,50,2),(112,9,25,2),(113,10,25,2),(114,1,50,3),(115,2,25,3),(116,3,70,3),(117,4,25,3),(118,5,50,3),(119,1,20,4),(120,2,50,4),(121,3,50,4),(122,4,100,4),(123,5,70,4),(124,6,100,4),(125,7,25,4),(126,8,50,4),(127,9,100,4),(128,10,25,4),(129,1,100,5),(130,2,50,5),(131,3,50,5),(132,4,50,5),(133,5,50,5);
/*!40000 ALTER TABLE `Rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sessions`
--

DROP TABLE IF EXISTS `Sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sessions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `start_at` datetime NOT NULL,
  `room` int NOT NULL,
  `movie` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `Sessions_ibfk_1` (`room`) USING BTREE,
  KEY `Sessions_ibfk_2` (`movie`) USING BTREE,
  CONSTRAINT `Sessions_ibfk_1` FOREIGN KEY (`room`) REFERENCES `Rooms` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `Sessions_ibfk_2` FOREIGN KEY (`movie`) REFERENCES `Movies` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sessions`
--

LOCK TABLES `Sessions` WRITE;
/*!40000 ALTER TABLE `Sessions` DISABLE KEYS */;
INSERT INTO `Sessions` VALUES (64,'2022-11-10 22:10:00',99,1),(65,'2022-11-12 17:15:00',101,2),(66,'2022-11-12 21:10:00',102,3),(67,'2022-11-11 13:15:00',106,9),(68,'2022-11-10 11:00:00',110,4),(69,'2022-11-12 19:50:00',114,5),(70,'2022-11-10 17:15:00',115,4),(71,'2022-11-11 15:45:00',121,10),(72,'2022-11-11 11:00:00',122,2),(73,'2022-11-10 15:45:00',127,1),(74,'2022-11-12 15:45:00',130,8),(75,'2022-11-11 19:50:00',129,6),(76,'2022-11-11 21:10:00',105,3),(77,'2022-11-10 19:50:00',119,8),(78,'2022-11-12 22:10:00',131,2),(79,'2022-11-10 13:15:00',104,5),(80,'2022-11-11 22:10:00',133,10),(81,'2022-11-11 17:15:00',128,9),(82,'2022-11-10 21:10:00',132,2),(83,'2022-11-12 11:00:00',123,8),(84,'2022-11-12 13:15:00',125,10);
/*!40000 ALTER TABLE `Sessions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-14 12:49:34
