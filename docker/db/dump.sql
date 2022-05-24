-- MySQL dump 10.19  Distrib 10.3.34-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: ovm_Essens-bersichtswebseite
-- ------------------------------------------------------
-- Server version	10.3.34-MariaDB-0+deb10u1

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
-- Table structure for table `bestellung`
--

DROP TABLE IF EXISTS `bestellung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bestellung` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sammel_bestellung_id` int(11) NOT NULL,
  `gast_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_150D4EEC4A211314` (`sammel_bestellung_id`),
  CONSTRAINT `FK_150D4EEC4A211314` FOREIGN KEY (`sammel_bestellung_id`) REFERENCES `sammel_bestellung` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bestellung`
--

LOCK TABLES `bestellung` WRITE;
/*!40000 ALTER TABLE `bestellung` DISABLE KEYS */;
INSERT INTO `bestellung` VALUES (1,1,'Tom'),(2,1,'Lea'),(3,128,'test'),(4,128,'Leon'),(5,128,'Leon'),(6,145,'Leon'),(7,146,'Testen'),(8,146,'asdfsadf'),(9,147,'Test'),(10,148,'Jonas'),(11,149,'ARGI'),(12,149,'Jo'),(13,150,'Jonas'),(14,150,'Leon'),(15,150,'Hans'),(16,150,'leon'),(17,150,'Hans'),(18,150,'Jonas'),(19,142,'gg'),(20,125,'A'),(21,152,'Tim'),(22,153,'test'),(23,155,'Test'),(24,156,'Hi'),(25,158,'na'),(26,159,'na2'),(27,160,'Leon'),(28,161,'a'),(29,162,'a'),(30,160,'Leon'),(31,160,'Leon'),(32,160,'Leon'),(33,160,'Leon'),(34,162,'a'),(35,162,'a'),(36,163,'Leon'),(37,164,'Leon'),(38,165,'Leon'),(39,166,'Leon'),(40,167,'Leon'),(41,167,'Deine Mama'),(42,169,'Tom'),(43,170,'dfg'),(44,171,'Tomjo'),(45,172,'jka'),(46,173,'Testtest'),(47,174,'Leon'),(48,174,'kein'),(49,175,'Test'),(50,150,'Leon'),(51,176,'asdf'),(52,176,'Leon'),(53,178,'testJonas'),(54,179,'Leon'),(55,180,'Leon'),(56,184,'Jo'),(57,185,'Alex'),(58,185,'Phil'),(59,186,'Alex'),(60,187,'Alex'),(61,188,'s'),(62,189,'Alex'),(63,190,'Alex'),(64,191,'👀'),(65,193,'Lone'),(66,235,'Leon'),(67,235,'Test'),(68,235,'Test'),(69,236,'Leon'),(70,238,'Leon'),(71,239,'Leon'),(72,240,'Lron'),(73,241,'G'),(74,243,'Jo Olli'),(75,243,'Peter'),(76,244,'Leon'),(77,245,'Hans'),(78,246,'Kim'),(79,246,'Andy'),(80,247,'Jonas'),(81,249,'Leon'),(82,250,'Leon'),(83,250,'Admin');
/*!40000 ALTER TABLE `bestellung` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bestellung_gericht_variation`
--

DROP TABLE IF EXISTS `bestellung_gericht_variation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bestellung_gericht_variation` (
  `bestellung_id` int(11) NOT NULL,
  `gericht_variation_id` int(11) NOT NULL,
  PRIMARY KEY (`bestellung_id`,`gericht_variation_id`),
  KEY `IDX_B1F1F96FD6F2F2D7` (`bestellung_id`),
  KEY `IDX_B1F1F96F202CE121` (`gericht_variation_id`),
  CONSTRAINT `FK_B1F1F96F202CE121` FOREIGN KEY (`gericht_variation_id`) REFERENCES `gericht_variation` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_B1F1F96FD6F2F2D7` FOREIGN KEY (`bestellung_id`) REFERENCES `bestellung` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bestellung_gericht_variation`
--

LOCK TABLES `bestellung_gericht_variation` WRITE;
/*!40000 ALTER TABLE `bestellung_gericht_variation` DISABLE KEYS */;
INSERT INTO `bestellung_gericht_variation` VALUES (1,31),(1,46),(6,5),(6,44),(7,83),(8,88),(9,1),(9,31),(10,7),(10,158),(11,26),(11,76),(12,31),(12,91),(12,108),(13,2),(13,6),(13,7),(13,8),(13,12),(14,135),(15,116),(15,148),(15,149),(15,175),(15,178),(16,6),(16,7),(16,73),(17,21),(17,148),(18,7),(19,7),(20,23),(20,50),(21,190),(21,192),(22,1),(25,12),(26,16),(26,54),(33,2),(33,3),(35,6),(36,8),(36,10),(36,38),(37,3),(38,8),(39,194),(40,3),(40,7),(41,3),(41,222),(42,2),(42,3),(43,12),(45,12),(46,46),(53,2),(53,7),(57,5),(57,10),(58,2),(58,19),(59,8),(61,2),(61,20),(62,5),(64,5),(65,11),(65,24),(66,5),(69,225),(70,1),(70,13),(71,331),(72,426),(73,1),(74,21),(74,71),(75,157),(77,1),(77,6),(78,154),(78,158),(79,104),(80,2),(81,3),(82,307);
/*!40000 ALTER TABLE `bestellung_gericht_variation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctrine_migration_versions`
--

LOCK TABLES `doctrine_migration_versions` WRITE;
/*!40000 ALTER TABLE `doctrine_migration_versions` DISABLE KEYS */;
/*!40000 ALTER TABLE `doctrine_migration_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gericht`
--

DROP TABLE IF EXISTS `gericht`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gericht` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `restaurant_id` int(11) NOT NULL,
  `kategorie_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nummer` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `beschreibung` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FEA51929B1E7706E` (`restaurant_id`),
  KEY `IDX_FEA51929BAF991D3` (`kategorie_id`),
  CONSTRAINT `FK_FEA51929B1E7706E` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`id`),
  CONSTRAINT `FK_FEA51929BAF991D3` FOREIGN KEY (`kategorie_id`) REFERENCES `kategorie` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gericht`
--

LOCK TABLES `gericht` WRITE;
/*!40000 ALTER TABLE `gericht` DISABLE KEYS */;
INSERT INTO `gericht` VALUES (1,1,1,'Margherita','1',''),(2,1,1,'Salami','2','mit Salami'),(3,1,1,'Prosciutto','3','mit Schinken'),(4,1,1,'Funghi','4','mit Pilzen'),(5,1,1,'Paesana','5','mit Salami u. Schinken'),(6,1,1,'Rustica','6','mit Salami u. Pilzen'),(7,1,1,'Hawaii','7','mit Ananas u. Schinken'),(8,1,1,'Peperoni','8','mit Peperoni u. Schinken'),(9,1,1,'Picobello','9','mit Salami, Pilzen u. Peperoni'),(10,1,1,'De la Chef','10','mit Salami, Zwiebeln, Peperoni u. Knoblauch'),(11,1,1,'Tonno','11','mit Thunfisch u. Zwiebeln'),(12,1,1,'Roma','12','mit Salami, Schinken u. Pilzen'),(13,1,1,'La Doma','13','mit Dönerfleisch u. Zwiebeln'),(14,1,1,'Marinara','14','mit Meeresfrüchten u. Knoblauch'),(15,1,1,'Bolognese','15','mit Hackfleischsauce u. Zwiebeln'),(16,1,1,'4 Jahreszeiten','16','mit Salami, Schinken, Pilzen u. Paprika'),(17,1,1,'Caprese','17','mit Mozzarella, Pesto Basilikum u fr. Tomaten'),(18,1,1,'Hollandaise','80','mit Broccoli, Hähnchenbrust u fr. Pilzen'),(19,1,1,'Pizza Brot','81',''),(20,1,1,'Pizza Brot','82','mit Käse'),(21,1,1,'Fantasia','18','mit Schinken, Spinat, Weißkäse'),(22,1,1,'Chef','19','mit Salami, Schinken, Pilzen, Paprika u. Thunfisch'),(23,1,1,'Vegetaria','20','mit Broccoli, Spinat, Mozzarella, Pilzen, Paprika u. Zucchini'),(24,1,1,'Hofgeismar','21','mit Paprika, Zwiebeln, Artischocken, Pilzen u. Oliven'),(25,1,1,'Krabben','22','mit Krabben u. Knochblauch'),(26,1,1,'Vier Käse','23','mit Mozzarella, Weißkäse u. Gorgonzola'),(27,1,1,'Quattro','24','mit türkischer Wurst, Peperoni u. Spiegelei'),(28,1,1,'Diavolo','25','mit Salami, Paprika, Peperoni u. Oliven'),(29,1,1,'Pizza mit Allem','26','mit Salami, Schinken, Thunfisch, Pilzen, Paprika, Zwiebeln, Ei u. Mozzarella'),(30,1,1,'Spezial','27','mit Salami, Pilzen, Schinken, Mozzarella u fr. Tomaten'),(31,1,1,'Sardellen','28','mit Sardellen, Broccoli, Paprika u. Zwiebeln'),(32,1,1,'Calzone Spezial','29','mit Salami, Schinken, Mozzarella u. Pilzen'),(33,1,1,'Calzone Tonno','30','mit Thunfisch u. Zwiebeln'),(34,1,1,'Calzone Döner','31','mit Dönerfleisch'),(35,1,2,'Spaghetti Napoli','32','mit Tomatensauce'),(36,1,2,'Spaghetti Bolognese','33','mit Bolognesesauce'),(37,1,2,'Spaghetti Carbonare','34','mit Schinken, Sahnesauce u. Eigelb'),(38,1,2,'Spaghetti Spezial','35a','mit Dönerfleisch'),(39,1,2,'Maccaroni mit Dönerfleisch','35b','mit Tomatensauce, Dönerfleisch u. Käse überbacken'),(40,1,2,'Maccaroni Italia','36','mit Tomatensauce, Spinat, Weißkäse u. Käse überbacken'),(41,1,2,'Maccaroni Bolognese','37','mit Bolognesesauce u. Käse überbacken'),(42,1,2,'Maccaroni Al Forno','38','mit Tomatensauce, Schinken u. Käse überbacken'),(43,1,2,'Maccaroni Picobello','39','mit Broccoli, Paprika, Tonno, Pilzen, Toomatensauce u. Käse überbacken'),(44,1,2,'Maccaroni 4 Formaggi','40','mit vier Käse Sorten'),(45,1,2,'Tortellini Al Forno','41','mit Tomatensauce, Schinken u. Käse überbacken'),(46,1,2,'Tortellini Panna','42','mit Schinken u. Sahnesauce'),(47,1,2,'Tortellini Picobello','43a','mit Broccoli, Gorgonzola u. Sahnesauce'),(48,1,2,'Lasagne al Forno','43b','mit Bolognesesauce u. Käse überbacken'),(49,1,2,'Bandnudeln','43c','mit Lachs u. Sahnesauce'),(50,1,3,'Tomaten Salat','44','Grüner Salat, Tomaten, Zwiebeln, Essig u. Öl'),(51,1,3,'Tonno Salat','45','Grüner Salat, Tomaten, Gurken, Thunfisch, Zwiebeln, Ei u. Dressing'),(52,1,3,'Mista Salat','46','Grüner Salat, Tomaten, Gurken, Zwiebeln, Paprika, Oliven, Mais u. Dressing'),(53,1,3,'Roma Salat','47','Grüner Salat, Tomaten, Gurken, thunfisch, Zwiebeln, Oliven, Schinken, Käse, Ei u. Dressing'),(54,1,3,'Caprese Salat','48','Grüner Salat, Tomaten, Mozzarella, Basilikum u. Olivenöl'),(55,1,3,'Picobello Salat','49','Grüner Salat, Tomaten, Gurken, thunfisch, Schinken, Käse u. Dressing'),(56,1,3,'Weißkäse Salat','50','Grüner Salat, tomaten, Gurken, Oliven, Paprika, Weißkäse, Essig u. Öl'),(57,1,3,'Spezial Salat','51','Grüner Salat, Tomaten, Gurken, Karotten, Zwiebeln, Schinken, Käse u. Dressing'),(58,1,4,'Schnitzel Wiener Art','52','Schweineschnitzel'),(59,1,4,'Zwiebel Schnitzel','52a','Schweineschnitzel mit gebratenen Zwiebeln u. Pilzen'),(60,1,4,'Rahm Schnitzel','53','Schweineschnitzel mit Rahmsauce'),(61,1,4,'Jäger Schnitzel','54','Schweineschnitzel mit Jägersauce'),(62,1,4,'Zigeuner Schnitzel','55','Schweineschnitzel mit Zigeunersauce'),(63,1,4,'Butter Schnitzel','56','Schweineschnitzel mit Sahnesauce u. Käse überbacken'),(64,1,4,'Hawaii Schnitzel','57','Schweineschnitzel mit Sahnesauce Ananas u. Käse überbacken'),(65,1,4,'Hollandaise Schnitzel','83','Schnitzel mit Hollandaise Sauce'),(66,1,4,'Cordon Bleu','58','Schweineschnitzel gefüllt mit Schinken u. Käse'),(67,1,4,'Calamaris mit Pommes','59','Tintenfisch, Salat und Tzatziki'),(68,1,4,'Chicken Nugget','60','4 Stück mit Pommes'),(69,1,4,'Pommes Frites','61','ohne alles'),(70,1,4,'Pommes Frites','62','rot und weiß'),(71,1,5,'Döner','63','mit Salat, Dönerfleisch, Tzatziki im Fladenbrot'),(72,1,5,'Döner','64','mit Salat, Dönerfleisch, Weißkäse, Tzatziki im Fladenbrot'),(73,1,5,'Mini Döner','65','mit Salat, Dönerfleisch, Tzatziki im Fladenbrot'),(74,1,5,'Döner Vegetarisch','66','mit Salat, Weißkäse, Tzaziki im Fladenbrot'),(75,1,5,'Döner Teller','67','mit Dönerfleisch , Pommes, Salat u. Tzaziki'),(76,1,5,'Döner Menü','68','Im Fladenbrot mit Dönerfleisch, Salat, Tzaziki, Pommes u. ein Getränk nach Wahl (alkoholfrei)'),(77,1,5,'Lahmacun','69','mit Salat u. Tzaziki'),(78,1,5,'Lahmacun spezial','70','mit Dönerfleisch, Salat u. Tzaziki'),(79,1,5,'Dürüm','71','mit Salat u. Tzaziki'),(80,1,5,'Dürüm spezial','72','mit Dönerfleisch, Salat u. Tzaziki'),(81,1,5,'Börek','73','Weißkäse oder Hackfleisch'),(82,1,5,'Börek','74','Weißkäse u. Spinat'),(83,1,5,'Frisches Fladenbrot','75',''),(84,1,5,'Döner Box','76','mit Pommes u. Tzaziki oder Dressing'),(85,1,5,'Falafel','77','Im Fladenbrot'),(86,1,6,'Cola','',''),(87,1,6,'cola light','',''),(88,1,6,'Cola Zero','',''),(89,1,6,'Fanta','',''),(90,1,6,'Fanta Exotik','',''),(91,1,6,'Sprite','',''),(92,1,6,'Mezzo Mix','',''),(93,1,6,'Uludag','',''),(94,1,6,'Apfelschorle','',''),(95,1,6,'Ayran','',''),(96,1,6,'Wasser','',''),(97,1,6,'Bier / Krombacher','',''),(98,1,6,'Bier / Efes','',''),(99,1,6,'Paulaner Weizenbier','',''),(118,4,1,'Pizza Margherita','01',''),(119,4,1,'Salami','01','mit Salami'),(120,4,1,'Prosciutto','03','mit Schinken'),(121,4,1,'Funghi','04','mit Pilzen'),(122,4,1,'Rustica','05','mit Salami und Pilzen'),(123,4,1,'Rustica','05','mit Salami und Pilzen'),(124,4,1,'Roma','07','mit Salami, Schinken und Pilzen'),(125,4,1,'Hawaii','08','mit Schinken und Ananas'),(126,4,1,'Tonno','09','mit Thunfisch und Zwiebeln'),(127,4,1,'De La Chef','10','mit Salami, Zwiebeln, Peperoni und Knoblauch'),(128,4,1,'Caprese','11','mit fr. Tomaten, Mozzarella und Pesto Basilikum'),(129,4,1,'Marinara','12','mit Knoblauch und Meeresfrüchten'),(130,4,1,'Bolognese','13','mit Zwiebeln und Hackfleischsauce'),(131,4,1,'4 Stagioni','14','mit Salami, Schinken, Pilzen und Artischocken'),(132,4,1,'Milano','15','mit Salami, Pilzen und Peperoni'),(133,4,1,'Vegetaria mit Broccoli','16','Spinat, Pilzen, Paprika, Zucchini und Mozzarefta'),(134,4,1,'Hollandaise A mit Mais','17','Hähnchenbrustfilet, Broccoli, Champignons & Hollandaise'),(135,4,1,'Hollandaise B','18','mit Hähnchenbrustfilet, Broccoli und Sauce Hollandaise'),(136,4,1,'Vier Käse','19','mit Mozzarefta, Gorgonzola und Weichkäse'),(137,4,1,'Bombay','20','mit Hähnchenbrustfilet, Zwiebeln und Mozzarella'),(138,4,1,'Döner','21','mit Drehspießfleisch und Zwiebeln'),(139,4,1,'Krabben','22','mit Krabben und Knoblauch'),(140,4,1,'Quattro','23','mit türkischer Knoblauchwurst, Peperoni und Spiegelei'),(141,4,1,'Pizzabrot','36A','mit Käse'),(142,4,1,'Chef','24','mit Salami, Schinken, Pilzen, Paprika und Thunfisch'),(143,4,1,'Pizza mit allem','25','mit Salami, Schinken, Pilzen, Paprika, Thunfisch, Zwiebelnm Ei und Mozzarella'),(144,4,1,'Pizza Sardellen','26','mit Sardellen, Broccoli, Paprika und Zwiebeln'),(145,4,1,'Pizza Hänchen','27','mit Hänchenbrustfilet, Zwiebeln, Peperoni, und Tzaziki'),(146,4,1,'Calzone Tajmahal','28','mit Hänchenbrustfilet, Paprika, fr. Tomaten, Champingons und Käse'),(147,4,1,'Calzone Tonno','29','mit Thunfisch und Zwiebeln'),(148,4,1,'Calzone Döner','29','mit Drehspießfleisch und Käse'),(149,4,1,'Diavolo (scharf)','32','mit Salami, Zwiebeln, scharfe Peperoni und Oliven'),(150,4,1,'Pronto','33','mit Spinat, Scampi, Gorgonzola und Knoblauch'),(151,4,1,'Pizza Lachs','34','mit Spinat, Lachs, Schafskäse und Knoblauch'),(152,4,1,'Pizza Lachs','35','mit Salami, Schinken, Champignons und Sauce Hollandaise'),(153,4,1,'Pizza Rucola','36','mit Mozzarella, Schinken, Rucola und Parmesankäse'),(154,4,1,'Pizzabrot','36B',''),(155,4,2,'Spaghetti Scampi (4 Stück)','37','mit milder Peperoni, Knoblauch, Scampi und Olivenöl'),(156,4,2,'Spaghetti Hollandiase','38','mit Brocoli, Schinken, Sahnesaucce und Sauce Hollandaise'),(157,4,2,'Spaghetti Rucola','39','mit Parmesankäse, fr. Tomaten, Peperoni, Knoblauch, Rucola und Olivenöl'),(158,4,2,'Spaghetti Napoli','41','mit Tomatensauce'),(159,4,2,'Spaghetti Bolognese','41','mit Bolognesesauce'),(160,4,2,'Spaghetti Mare','43','mit Meeresfrüchten, Tomatensauce und Knoblauch');
/*!40000 ALTER TABLE `gericht` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gericht_variation`
--

DROP TABLE IF EXISTS `gericht_variation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gericht_variation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gericht_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint(4) NOT NULL DEFAULT 0,
  `preis` decimal(5,2) NOT NULL,
  `geloescht` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_4AC0E6AB6C6146DE` (`gericht_id`),
  CONSTRAINT `FK_4AC0E6AB6C6146DE` FOREIGN KEY (`gericht_id`) REFERENCES `gericht` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=443 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gericht_variation`
--

LOCK TABLES `gericht_variation` WRITE;
/*!40000 ALTER TABLE `gericht_variation` DISABLE KEYS */;
INSERT INTO `gericht_variation` VALUES (1,1,'Mini 24cm',0,4.00,0),(2,1,'Normal 30cm',1,5.50,0),(3,1,'Groß 32cm',0,6.00,0),(4,1,'Maxi 40cm',0,10.00,0),(5,1,'Party 60cm',0,18.00,0),(6,2,'Mini 24cm',0,4.50,0),(7,2,'Normal 30cm',1,6.00,0),(8,2,'Groß 32cm',0,6.50,0),(9,2,'Maxi 40cm',0,12.00,0),(10,2,'Party 60cm',0,20.00,0),(11,3,'Mini 24cm',0,4.50,0),(12,3,'Normal 30cm',1,6.00,0),(13,3,'Groß 32cm',0,6.50,0),(14,3,'Maxi 40cm',0,12.00,0),(15,3,'Party 60cm',0,20.00,0),(16,4,'Mini 24cm',0,4.50,0),(17,4,'Normal 30cm',1,6.00,0),(18,4,'Groß 32cm',0,6.50,0),(19,4,'Maxi 40cm',0,12.00,0),(20,4,'Party 60cm',0,20.00,0),(21,5,'Mini 24cm',0,4.90,0),(22,5,'Normal 30cm',1,6.50,0),(23,5,'Groß 32cm',0,6.90,0),(24,5,'Maxi 40cm',0,13.00,0),(25,5,'Party 60cm',0,22.00,0),(26,6,'Mini 24cm',0,4.90,0),(27,6,'Normal 30cm',1,6.50,0),(28,6,'Groß 32cm',0,6.90,0),(29,6,'Maxi 40cm',0,13.00,0),(30,6,'Party 60cm',0,22.00,0),(31,7,'Mini 24cm',0,4.90,0),(32,7,'Normal 30cm',1,6.50,0),(33,7,'Groß 32cm',0,6.90,0),(34,7,'Maxi 40cm',0,13.00,0),(35,7,'Party 60cm',0,25.00,0),(36,8,'Mini 24cm',0,4.90,0),(37,8,'Normal 30cm',1,6.50,0),(38,8,'Groß 32cm',0,6.90,0),(39,8,'Maxi 40cm',0,12.50,0),(40,8,'Party 60cm',0,25.00,0),(41,9,'Mini 24cm',0,5.00,0),(42,9,'Normal 30cm',1,7.00,0),(43,9,'Groß 32cm',0,7.50,0),(44,9,'Maxi 40cm',0,14.00,0),(45,9,'Party 60cm',0,26.00,0),(46,10,'Mini 24cm',0,5.50,0),(47,10,'Normal 30cm',1,7.00,0),(48,10,'Groß 32cm',0,7.90,0),(49,10,'Maxi 40cm',0,14.00,0),(50,10,'Party 60cm',0,26.00,0),(51,11,'Mini 24cm',0,5.50,0),(52,11,'Normal 30cm',1,7.50,0),(53,11,'Groß 32cm',0,7.90,0),(54,11,'Maxi 40cm',0,14.00,0),(55,11,'Party 60cm',0,26.00,0),(56,12,'Mini 24cm',0,5.50,0),(57,12,'Normal 30cm',1,7.00,0),(58,12,'Groß 32cm',0,7.50,0),(59,12,'Maxi 40cm',0,15.00,0),(60,12,'Party 60cm',0,26.00,0),(61,13,'Mini 24cm',0,5.90,0),(62,13,'Normal 30cm',1,7.50,0),(63,13,'Groß 32cm',0,7.90,0),(64,13,'Maxi 40cm',0,16.00,0),(65,13,'Party 60cm',0,30.00,0),(66,14,'Mini 24cm',0,6.00,0),(67,14,'Normal 30cm',1,7.50,0),(68,14,'Groß 32cm',0,8.50,0),(69,14,'Maxi 40cm',0,16.00,0),(70,14,'Party 60cm',0,29.00,0),(71,15,'Mini 24cm',0,4.00,0),(72,15,'Normal 30cm',1,6.90,0),(73,15,'Groß 32cm',0,7.50,0),(74,15,'Maxi 40cm',0,14.00,0),(75,15,'Party 60cm',0,25.00,0),(76,16,'Mini 24cm',0,5.90,0),(77,16,'Normal 30cm',1,7.50,0),(78,16,'Groß 32cm',0,8.00,0),(79,16,'Maxi 40cm',0,15.00,0),(80,16,'Party 60cm',0,27.00,0),(81,17,'Mini 24cm',0,5.00,0),(82,17,'Normal 30cm',1,6.50,0),(83,17,'Groß 32cm',0,7.00,0),(84,17,'Maxi 40cm',0,13.00,0),(85,17,'Party 60cm',0,26.00,0),(86,18,'Mini 24cm',0,5.50,0),(87,18,'Normal 30cm',1,7.50,0),(88,18,'Groß 32cm',0,8.50,0),(89,18,'Maxi 40cm',0,16.00,0),(90,18,'Party 60cm',0,31.00,0),(91,19,'',1,2.80,0),(92,20,'',1,3.50,0),(93,21,'Mini 24cm',0,5.00,0),(94,21,'Normal 30cm',1,6.50,0),(95,21,'Groß 32cm',0,7.00,0),(96,21,'Maxi 40cm',0,13.00,0),(97,21,'Party 60cm',0,26.00,0),(98,22,'Mini 24cm',0,5.90,0),(99,22,'Normal 30cm',1,7.50,0),(100,22,'Groß 32cm',0,7.90,0),(101,22,'Maxi 40cm',0,15.00,0),(102,22,'Party 60cm',0,30.00,0),(103,23,'Mini 24cm',0,5.50,0),(104,23,'Normal 30cm',1,7.50,0),(105,23,'Groß 32cm',0,7.90,0),(106,23,'Maxi 40cm',0,15.00,0),(107,23,'Party 60cm',0,29.00,0),(108,24,'Mini 24cm',0,5.50,0),(109,24,'Normal 30cm',1,7.50,0),(110,24,'Groß 32cm',0,7.90,0),(111,24,'Maxi 40cm',0,15.00,0),(112,24,'Party 60cm',0,29.00,0),(113,25,'Mini 24cm',0,5.50,0),(114,25,'Normal 30cm',1,7.50,0),(115,25,'Groß 32cm',0,8.00,0),(116,25,'Maxi 40cm',0,15.00,0),(117,25,'Party 60cm',0,28.00,0),(118,26,'Mini 24cm',0,5.50,0),(119,26,'Normal 30cm',1,7.50,0),(120,26,'Groß 32cm',0,8.00,0),(121,26,'Maxi 40cm',0,14.00,0),(122,26,'Party 60cm',0,29.00,0),(123,27,'Mini 24cm',0,5.50,0),(124,27,'Normal 30cm',1,7.00,0),(125,27,'Groß 32cm',0,7.50,0),(126,27,'Maxi 40cm',0,13.00,0),(127,27,'Party 60cm',0,27.00,0),(128,28,'Mini 24cm',0,5.50,0),(129,28,'Normal 30cm',1,7.00,0),(130,28,'Groß 32cm',0,7.50,0),(131,28,'Maxi 40cm',0,13.00,0),(132,28,'Party 60cm',0,28.00,0),(133,29,'Mini 24cm',0,6.00,0),(134,29,'Normal 30cm',1,8.00,0),(135,29,'Groß 32cm',0,8.50,0),(136,29,'Maxi 40cm',0,16.00,0),(137,29,'Party 60cm',0,32.00,0),(138,30,'Mini 24cm',0,5.50,0),(139,30,'Normal 30cm',1,7.50,0),(140,30,'Groß 32cm',0,8.00,0),(141,30,'Maxi 40cm',0,15.00,0),(142,30,'Party 60cm',0,29.00,0),(143,31,'Mini 24cm',0,5.50,0),(144,31,'Normal 30cm',1,7.00,0),(145,31,'Groß 32cm',0,7.50,0),(146,31,'Maxi 40cm',0,13.00,0),(147,31,'Party 60cm',0,27.00,0),(148,32,'Mini 24cm',0,4.50,0),(149,32,'Normal 30cm',1,6.00,0),(150,32,'Groß 32cm',0,6.50,0),(151,33,'Mini 24cm',0,5.50,0),(152,33,'Normal 30cm',1,7.00,0),(153,33,'Groß 32cm',0,7.50,0),(154,34,'Mini 24cm',0,5.50,0),(155,34,'Normal 30cm',1,7.00,0),(156,34,'Groß 32cm',0,7.50,0),(157,35,'',1,5.40,0),(158,36,'',1,5.90,0),(159,37,'',1,6.90,0),(160,38,'',1,6.40,0),(161,39,'',1,6.90,0),(162,40,'',1,6.90,0),(163,41,'',1,6.50,0),(164,42,'',1,6.40,0),(165,43,'',1,6.90,0),(166,44,'',1,7.40,0),(167,45,'',1,6.90,0),(168,46,'',1,7.40,0),(169,47,'',1,7.90,0),(170,48,'',1,7.40,0),(171,49,'',1,7.90,0),(172,50,'',1,4.90,0),(173,51,'',1,7.40,0),(174,52,'',1,7.40,0),(175,53,'',1,7.90,0),(176,54,'',1,6.50,0),(177,55,'',1,7.40,0),(178,56,'',1,6.90,0),(179,57,'',1,7.40,0),(180,58,'',1,8.00,0),(181,59,'',1,9.50,0),(182,60,'',1,9.50,0),(183,61,'',1,9.50,0),(184,62,'',1,9.50,0),(185,63,'',1,9.50,0),(186,64,'',1,9.50,0),(187,65,'',1,10.00,0),(188,66,'',1,10.90,0),(189,67,'',1,7.90,0),(190,68,'',1,5.00,0),(191,69,'',1,2.50,0),(192,70,'',1,2.80,0),(193,71,'',1,4.50,0),(194,72,'',1,4.90,0),(195,73,'',1,2.90,0),(196,74,'',1,3.50,0),(197,75,'',1,7.90,0),(198,76,'',1,7.90,0),(199,77,'',1,3.90,0),(200,78,'',1,5.90,0),(201,79,'',1,3.50,0),(202,80,'',1,5.90,0),(203,81,'',1,3.50,0),(204,82,'',1,3.50,0),(205,83,'',1,2.00,0),(206,84,'',1,3.90,0),(207,85,'',1,4.50,0),(208,86,'0.33L',1,2.00,0),(209,86,'1L',1,3.50,0),(210,87,'0.33L',1,2.00,0),(211,87,'1L',1,3.50,0),(212,88,'0.33L',1,2.00,0),(213,88,'1L',1,3.50,0),(214,89,'0.33L',1,2.00,0),(215,89,'1L',1,3.50,0),(216,90,'0.33L',1,2.00,0),(217,91,'0.33L',1,2.00,0),(218,91,'1L',1,3.50,0),(219,92,'0.33L',1,2.00,0),(220,92,'1L',1,3.50,0),(221,93,'0.33L',1,2.00,0),(222,93,'1L',1,3.50,0),(223,94,'0.33L',1,2.00,0),(224,95,'0.2L',1,1.30,0),(225,95,'0.5L',1,1.80,0),(226,96,'1L',1,2.50,0),(227,97,'0.33L',1,2.00,0),(228,98,'0.33L',1,2.00,0),(229,99,'0.5L',1,3.00,0),(302,118,'Mini (24cm)',0,3.50,0),(303,118,'Normal (30cm)',1,5.00,0),(304,118,'Maxi (40cm)',0,9.00,0),(305,118,'Party (60cm)',0,17.00,0),(306,119,'Mini (24cm)',0,4.00,0),(307,119,'Normal (30cm)',1,5.00,0),(308,119,'Maxi (40cm)',0,11.00,0),(309,119,'Party (60cm)',0,19.00,0),(310,120,'Mini (24cm)',0,4.00,0),(311,120,'Normal (30cm)',1,5.00,0),(312,120,'Maxi (40cm)',0,11.00,0),(313,120,'Party (60cm)',0,19.00,0),(314,121,'Mini (24cm)',0,4.00,0),(315,121,'Normal (30cm)',1,5.00,0),(316,121,'Maxi (40cm)',0,11.00,0),(317,121,'Party (60cm)',0,19.00,0),(318,123,'Mini (24cm)',0,4.00,0),(319,123,'Normal (30cm)',1,6.00,0),(320,123,'Maxi (40cm)',0,12.50,0),(321,123,'Party (60cm)',0,21.00,0),(322,124,'Mini (24cm)',0,4.50,0),(323,124,'Normal (30cm)',1,6.50,0),(324,124,'Maxi (40cm)',0,14.00,0),(325,124,'Party (60cm)',0,25.00,0),(326,125,'Mini (24cm)',0,4.00,0),(327,125,'Normal (30cm)',1,6.00,0),(328,125,'Maxi (40cm)',0,12.00,0),(329,125,'Party (60cm)',0,24.00,0),(330,126,'Mini (24cm)',0,4.50,0),(331,126,'Normal (30cm)',1,6.00,0),(332,126,'Maxi (40cm)',0,13.00,0),(333,126,'Party (60cm)',0,25.00,0),(334,127,'Mini (24cm)',0,4.50,0),(335,127,'Normal (30cm)',1,6.00,0),(336,127,'Maxi (40cm)',0,13.00,0),(337,127,'Party (60cm)',0,25.00,0),(338,128,'Mini (24cm)',0,4.00,0),(339,128,'Normal (30cm)',1,6.00,0),(340,128,'Maxi (40cm)',0,12.00,0),(341,128,'Party (60cm)',0,23.00,0),(342,129,'Mini (24cm)',0,5.00,0),(343,129,'Normal (30cm)',1,7.00,0),(344,129,'Maxi (40cm)',0,15.00,0),(345,129,'Party (60cm)',0,28.00,0),(346,130,'Mini (24cm)',0,4.00,0),(347,130,'Normal (30cm)',1,6.00,0),(348,130,'Maxi (40cm)',0,13.00,0),(349,130,'Party (60cm)',0,26.00,0),(350,131,'Mini (24cm)',0,4.50,0),(351,131,'Normal (30cm)',1,6.00,0),(352,131,'Maxi (40cm)',0,14.00,0),(353,131,'Party (60cm)',0,26.00,0),(354,132,'Mini (24cm)',0,4.50,0),(355,132,'Normal (30cm)',1,6.50,0),(356,132,'Maxi (40cm)',0,13.50,0),(357,132,'Party (60cm)',0,25.00,0),(358,133,'Mini (24cm)',0,5.00,0),(359,133,'Normal (30cm)',1,6.50,0),(360,133,'Maxi (40cm)',0,14.00,0),(361,133,'Party (60cm)',0,28.00,0),(362,134,'Mini (24cm)',0,5.00,0),(363,134,'Normal (30cm)',1,7.50,0),(364,134,'Maxi (40cm)',0,17.00,0),(365,134,'Party (60cm)',0,37.00,0),(366,135,'Mini (24cm)',0,5.00,0),(367,135,'Normal (30cm)',1,7.00,0),(368,135,'Maxi (40cm)',0,16.00,0),(369,135,'Party (60cm)',0,32.00,0),(370,136,'Mini (24cm)',0,4.50,0),(371,136,'Normal (30cm)',1,6.00,0),(372,136,'Maxi (40cm)',0,13.00,0),(373,136,'Party (60cm)',0,27.00,0),(374,137,'Mini (24cm)',0,5.50,0),(375,137,'Normal (30cm)',1,7.00,0),(376,137,'Maxi (40cm)',0,15.00,0),(377,137,'Party (60cm)',0,32.00,0),(378,138,'Mini (24cm)',0,4.50,0),(379,138,'Normal (30cm)',1,7.00,0),(380,138,'Maxi (40cm)',0,15.00,0),(381,138,'Party (60cm)',0,29.00,0),(382,139,'Mini (24cm)',0,5.00,0),(383,139,'Normal (30cm)',1,7.00,0),(384,139,'Maxi (40cm)',0,14.00,0),(385,139,'Party (60cm)',0,27.00,0),(386,140,'Mini (24cm)',0,4.50,0),(387,140,'Normal (30cm)',1,6.00,0),(388,140,'Maxi (40cm)',0,12.00,0),(389,140,'Party (60cm)',0,26.00,0),(390,141,'Mini (24cm)',0,2.50,0),(391,141,'Normal (30cm)',1,4.00,0),(392,142,'Mini (24cm)',0,5.00,0),(393,142,'Normal (30cm)',1,6.00,0),(394,142,'Maxi (40cm)',0,14.00,0),(395,142,'Party (60cm)',0,29.00,0),(396,143,'Mini (24cm)',0,5.50,0),(397,143,'Normal (30cm)',1,7.00,0),(398,143,'Maxi (40cm)',0,15.00,0),(399,143,'Party (60cm)',0,31.00,0),(400,144,'Mini (24cm)',0,4.50,0),(401,144,'Normal (30cm)',1,6.00,0),(402,144,'Maxi (40cm)',0,12.00,0),(403,144,'Party (60cm)',0,26.00,0),(404,145,'Mini (24cm)',0,6.00,0),(405,145,'Normal (30cm)',1,7.50,0),(406,145,'Maxi (40cm)',0,15.00,0),(407,145,'Party (60cm)',0,31.00,0),(408,146,'Mini (24cm)',0,5.00,0),(409,146,'Normal (30cm)',1,6.50,0),(410,147,'Mini (24cm)',0,4.50,0),(411,147,'Normal (30cm)',1,6.00,0),(412,148,'Mini (24cm)',0,5.00,0),(413,148,'Normal (30cm)',1,6.00,0),(414,148,'Maxi (40cm)',0,15.00,0),(415,148,'Party (60cm)',0,31.00,0),(416,149,'Mini (24cm)',0,5.00,0),(417,149,'Normal (30cm)',1,6.50,0),(418,149,'Maxi (40cm)',0,12.00,0),(419,149,'Party (60cm)',0,25.00,0),(420,150,'Mini (24cm)',0,5.50,0),(421,150,'Normal (30cm)',1,7.00,0),(422,150,'Maxi (40cm)',0,13.00,0),(423,150,'Party (60cm)',0,26.00,0),(424,151,'Mini (24cm)',0,5.00,0),(425,151,'Normal (30cm)',1,7.00,0),(426,151,'Maxi (40cm)',0,13.00,0),(427,151,'Party (60cm)',0,26.00,0),(428,152,'Mini (24cm)',0,5.00,0),(429,152,'Normal (30cm)',1,6.50,0),(430,152,'Maxi (40cm)',0,12.00,0),(431,152,'Party (60cm)',0,25.00,0),(432,153,'Mini (24cm)',0,5.00,0),(433,153,'Normal (30cm)',1,6.50,0),(434,153,'Maxi (40cm)',0,12.00,0),(435,153,'Party (60cm)',0,25.00,0),(436,154,'Mini (24cm)',0,1.50,0),(437,155,'',1,6.50,0),(438,156,'',1,6.50,0),(439,157,'',1,6.50,0),(440,158,'',1,4.50,0),(441,159,'',1,5.50,0),(442,160,'',1,6.50,0);
/*!40000 ALTER TABLE `gericht_variation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kategorie`
--

DROP TABLE IF EXISTS `kategorie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kategorie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bezeichner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kategorie`
--

LOCK TABLES `kategorie` WRITE;
/*!40000 ALTER TABLE `kategorie` DISABLE KEYS */;
INSERT INTO `kategorie` VALUES (1,'Pizza'),(2,'Nudeln'),(3,'Salate'),(4,'Deutsche Küche'),(5,'Döner Spezialitäten'),(6,'Getränke');
/*!40000 ALTER TABLE `kategorie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ort`
--

DROP TABLE IF EXISTS `ort`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ort` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plz` int(11) NOT NULL,
  `ort` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ort`
--

LOCK TABLES `ort` WRITE;
/*!40000 ALTER TABLE `ort` DISABLE KEYS */;
INSERT INTO `ort` VALUES (1,34369,'Hofgeismar');
/*!40000 ALTER TABLE `ort` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant`
--

DROP TABLE IF EXISTS `restaurant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `restaurant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ort_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefon_nr` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobil` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `straße` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `haus_nr` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `oeffnungszeit` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '(DC2Type:json)',
  PRIMARY KEY (`id`),
  KEY `IDX_EB95123FB62F846A` (`ort_id`),
  CONSTRAINT `FK_EB95123FB62F846A` FOREIGN KEY (`ort_id`) REFERENCES `ort` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant`
--

LOCK TABLES `restaurant` WRITE;
/*!40000 ALTER TABLE `restaurant` DISABLE KEYS */;
INSERT INTO `restaurant` VALUES (1,1,'La doma Restaurant Cafe Bar','05671500179','','Oberer Graben','5',''),(2,1,'tavola grande','056717668387','','Garnisonsgalerie','4',''),(3,1,'China-Restaurant Shanghai','0567150509','','Steinweg','12',''),(4,1,'Pizzeria Milano Blitz','056717919991','','Elisabethstraße','2',NULL);
/*!40000 ALTER TABLE `restaurant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sammel_bestellung`
--

DROP TABLE IF EXISTS `sammel_bestellung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sammel_bestellung` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `restaurant_id` int(11) NOT NULL,
  `admin_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `public_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ist_offen` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_CFBAF77DB1E7706E` (`restaurant_id`),
  CONSTRAINT `FK_CFBAF77DB1E7706E` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=251 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sammel_bestellung`
--

LOCK TABLES `sammel_bestellung` WRITE;
/*!40000 ALTER TABLE `sammel_bestellung` DISABLE KEYS */;
INSERT INTO `sammel_bestellung` VALUES (1,1,'hu','a',NULL),(2,1,'60cc5797231cb1.29706723','60cc5797231c81.00666266',NULL),(3,1,'60cc57c16f6ba9.35817906','60cc57c16f6b61.76867291',NULL),(4,1,'60cc57c7752903.57556634','60cc57c77528e6.01249999',NULL),(5,1,'60cc57fe3bbff7.11040565','60cc57fe3bbfc4.40690904',NULL),(6,1,'60cc580327f2b3.19116789','60cc580327f270.74154785',NULL),(7,1,'60cc58053eae12.40923734','60cc58053eade2.49675535',NULL),(8,1,'60cc582a842db6.36304401','60cc582a842d96.38495459',NULL),(9,1,'60cc582c1e7ae6.11796718','60cc582c1e7ab8.76486627',NULL),(10,1,'60cc58319f5559.25173941','60cc58319f5523.58767468',NULL),(11,1,'60cc5834b5a546.21510063','60cc5834b5a517.98005809',NULL),(12,1,'60cc583f544730.85799425','60cc583f544705.56116850',NULL),(13,1,'0c3b5ac3769165b3f5cd873b6b45e220','c1d830bdf52cf3ca1d36aff6e56d7fbb',NULL),(14,1,'1b2732abf7686b769ba4ef0cf22f31fd','6ecc5dd0b5696b8454bc02c47e96e9f5',NULL),(15,1,'28c8e16966c940260a0dfa6b2b90f997','665538df460a6c08cb86783b1c7bb6f0',NULL),(16,1,'a968e3799be55f21bb0e91cf0bae4b56','281951d07320ce84ab4efb2fa2aa0bf4',NULL),(17,1,'fe811a84e8b33684c51b2c64ffb12224','10411d388a6fe8d0c31ebca59823ba71',NULL),(18,1,'0387f9bbae7506a264be47ca01ca914c','6241f7f5dacb9b4592a9d32eaa432a7d',NULL),(19,1,'6f76358340aa328fde4b1f804bac0d7c','5fc2fc2b078d0deff5f7659dda50275b',NULL),(20,1,'67dab6b85134a16a1cbd9b994cd51daa','1c4caaca129c1ca5452a1c4ff7a3663e',NULL),(21,1,'bfa523508c13725ed27981f14e60af93','39c7afcba9e5883f2f0decd72925953c',NULL),(22,1,'a49b40b580833c3e0490f5d17b41282c','6e135fe7112792508a233b6bcd9b85b5',NULL),(23,1,'4075f0d408bfc8088ddb9179fdb58916','05a04cdb7278145f946972b1fc55c296',NULL),(24,1,'0757b6fde2413e6c143e02c039b87f1b','cceef16dca9326dc78ff72f1dc301e32',NULL),(25,1,'fb827bbf80646d89c68b250a13eebf8a','afc65d8a3abb7316b44c12da84877646',NULL),(26,1,'d13fc4d8a7e84551a6804a5f34b010f9','84b58682f4deacba366ba5d90714ee38',NULL),(27,1,'3fa661a310b5f04ca00e23882ac2c9f3','c89a7c10d7a1e1c61e8a95dea3343141',NULL),(28,1,'737e250b5012ebc91e87d307f3faff56','90c47c4f9fa8a92afe5b62b0b8db1b23',NULL),(29,1,'03d67020be8d19bf5b3bfcaaf891c122','6addd8276520326a3ae570cc084f8749',NULL),(30,1,'04e57a7ee910dc6fb57df7f523d38de3','fd22ab128af2fa4c23a02e467ce9abb8',NULL),(31,2,'a459f2fc07fbc8d89340ead98da3a50c','7409b10d4ae0e1b9ad382b128b13fb12',NULL),(32,1,'e75bfee7a3ac0f7c40b631532506b46b','0a7997d7907d2494f5b73e69636bdf74',NULL),(33,1,'dfd50b01b1a68143bfbfc95f84148039','3f49c8987b6360c67f93cf1c6c3984e4',NULL),(34,1,'eabaa6a3efa16fc3cea64eb1f5611ea5','0721e78eac46631fe44725c7c7593279',NULL),(35,1,'e92370bdb3e3b5a68f9d5035040e43ef','f6e4041023719a006ff0bac1e89098c5',NULL),(36,1,'5804caf57621bd2d8dd211df9c8786e4','8ce48d2fd623480b2b87042b252fb84f',NULL),(37,1,'4be838452067456f04de0d042dcfa642','c5b6c654dfdc23e43208058525e42958',NULL),(38,1,'66f9f596fe4bc268bab93efed728661f','3d907d38011591149848c7bcb0f23d82',NULL),(39,1,'b99ac431ba0eb594085dfe175c4a6c99','53b3e8ed17949046ef8abac455d13b09',NULL),(40,1,'502b2081a16a46cf7b1e5adfb1db6366','2d842f7280122629ef4df08c18cb5d92',NULL),(41,1,'cd265319688118c750e8436572543c8d','0b38454d5573bc2525253b4d6c85c5e6',NULL),(42,1,'0c597f682966b743b9a7376a5bf1f9c9','265208b6ec2023a91c517475a6379dbf',NULL),(43,1,'58e93648c25677a92da2fd50ecb03a9f','57c651c3268544ca448622ce45cc8942',NULL),(44,1,'ceffcc292aefb83ad46b3a1bd5736f42','ef12a6f3d49092f91cb8459085efd3a4',NULL),(45,1,'2375a43d83805cb6e19085bdaa3ab9a7','c27c1953e3eb840dc433d175b20432ac',NULL),(46,1,'b47e5842178c92dbb6fc6d0316b788d3','30dff006448f769ffe64435a20b603e4',NULL),(47,1,'3341cbcd0b430ced44ed4e19a43e5cbf','243fd60c0f8c1f39e191fa1128feeea1',NULL),(48,1,'dad862c52f987611b99026bb009f4ae6','8cc2ae50499506e7876ef47222b78ee8',NULL),(49,1,'eece420ef443f661c5ed663fc24af785','1630364eff96cd9b3c18eda867ae1bd4',NULL),(50,1,'8c8226ee4c37cf4d874a66a340704fb5','284cc5fac31a995ad6c784024f941bc5',NULL),(51,1,'32d3e64894d24ba53e4f624cd9cd8827','979f16acb44573c6a435378b34bbe155',NULL),(52,1,'986805011b4d0a3ffdf14f8801d4710d','ebb61435d09f64ee2bc3b8e76d721976',NULL),(53,1,'b806f2adc47526983324878adccca8e7','65276dfa990fc9706f52c49792c37522',NULL),(54,1,'40554c1243f397bae7c3589edb0e918f','0f31331d7cb5efbbe67549a50c90b54b',NULL),(55,1,'b8785d18efded050a8bc369002c0f3e2','ecf7232ce9365d2504b9da1ca99ce1ed',NULL),(56,1,'18cdda5605026c2a68395ff2038ec2f6','f51af877df988c1d9e20da24fb95676a',NULL),(57,1,'ee3e3e9229c89efd0a8e4d806bffcb41','2e19e270460d91f6c1b036ec04d7827a',NULL),(58,1,'970d192bbaecccbfea403c888a102c4e','3ff092a9845902f7cedee68752ff3bc4',NULL),(59,1,'6b315ad372585c24a4f74eea6fee9891','4597935c84c0a8244f7859c2171c376d',NULL),(60,1,'c542715f44ee9918ddc648cb8f532a17','08c2d597a869b99c961da03990ead22c',NULL),(61,1,'a8a2d5af4402f4acf72e4668bb865932','fbeb3a68b5ec2e7c59db5405ba7cccd2',NULL),(62,1,'985c69caf365ee80f5db1b8a3eb07d59','54c2235535b4c798c1b0e8932439d738',NULL),(63,1,'04478e27ea6b92a5c00bcc02d160ee3d','0d15095e16d31fc2c89c8ac57e5a97a1',NULL),(64,1,'00b253840d3e15674d067513a0823132','5db7ef3bed8c8c44d5cd09033be56a92',NULL),(65,1,'95c6f32009a2bfb79333e88b158d9bc1','18c8a0c999b99a326bb71971c90a9583',NULL),(66,1,'1c2167d8ee9292f04c03c67c7a2580a6','617314c248e96b71f3793049829e8d98',NULL),(67,1,'b8191b1be1c0b01989a8a3cf78f505d7','a110cc3ded45d238ef2df84b97bcf00e',NULL),(68,1,'3bea6788594d9abb3e01e7b3d1c61154','9dcdc3e79c62bb320705f1f9c64534a6',NULL),(69,1,'dd7c1c6b7e0b1495353b436a841c87ed','e32f4a45e1e9b867cd72a4a6974bdc58',NULL),(70,1,'ea0022c5016e97f6ba8e42cedf0ca9de','9552cd31724a0f8609500bb9d922d576',NULL),(71,1,'a04b9fefa1e880215f65c787b002cff7','01499e8978a102629164539d8a3b7785',NULL),(72,1,'9f4a9b28f0d49f9fcb18e1a069577ff7','bdb229af0417ce3710306835ff4aed76',NULL),(73,1,'79748bc10b15b7631aa17071fdcc70e3','345cf9b067f8c623f2dd3a09a47739a0',NULL),(74,1,'a066562f7e7d5cd0b17f9826e7485bee','ecaf1840a678f3a144e5a05baaadcf88',NULL),(75,1,'afe75da873aa052993738c0832ac9f11','098d247f17ce3689accae90542284903',NULL),(76,1,'085fd3160c2dd6e0182a5f6be0044fb8','6673934e4c89a51ab09cfc3aa5782130',NULL),(77,1,'8e5fa23f5df31bfadf38ffaa20e60ab9','e54abf720418d93c0d5508d5b005e290',NULL),(78,1,'edc0228a213d281caa4518e7632e1d8f','50db89fa404f52f97a5a27c8e25a1a2c',NULL),(79,1,'483120807f4f57dcb6ded24d4306ef34','079b6e09803dc53eec8af6ac9c3cba15',NULL),(80,1,'a4785b25f4d96bce083b85b5fdd3333f','3c79ce3f99db8406b08b1dccb21448fc',NULL),(81,1,'dfbbff82efc9dcdb21217f2189c4600d','edd2804ab773cdee2e6b1e3213d93d65',NULL),(82,1,'6a98e7d611d35a6911c16d581f52ac77','0f64e7f50749dc681de1f52ecbff026b',NULL),(83,1,'8ecab74f47b8ebff030d8eadab308a24','b8b81b6eae4b915faec4cb7e421f4ec9',NULL),(84,1,'fffaf2905e2f7a23541c512d5eab5a7f','8ab2bc964b9c4d8b8972030af06ed615',NULL),(85,1,'5cfd90263c2cb225a571c19de5f4a9eb','78ccd38d07839e7e33c0a76e5621d6b3',NULL),(86,1,'899c93090f8a94f969602208cb75bade','03a9e478eff77bdd0b222b10ac0f1a68',NULL),(87,1,'6b6448723e66051220deeb84e7ee1f27','cf5cf78e71ba47c02c3042cff767d771',NULL),(88,1,'22571b8ab7e65b469d6a36a6a9c2f5c1','ba39012772b6606f6613c067b8153278',NULL),(89,1,'9a1f80f87c1c27ab296730a653b8b4d0','d0324ce8e397dfb1e0899bb9734de58f',NULL),(90,1,'0d1fd3008740c920a09a8c231c066948','15db987742493f2a78f4547bfe3292bf',NULL),(91,1,'2a02e81658310aec2df1a1bd30b034ba','a13ef764eda241b6c428f144e5cd696c',NULL),(92,1,'e188ac488ec7d67546dd9a8d817f484a','6d58c12e73c1b811daa128b427d605dc',NULL),(93,1,'bb92eea28f0ce8af51d30e2d54c5d576','33d669d0c9cb8e3ae3943b8f324a6ab1',NULL),(94,1,'72f3473ba32d1f2ac745ef010f4b08e1','e3bd758421931d6a9cb8c5f785c67b49',NULL),(95,1,'66c84fb80eebea8d3782d861cbde77ee','cf9b86bb92bd33b11c873713f301fd67',NULL),(96,1,'ebe3bc262d1cda82b28b79742f65a759','ab0d606f9ef972c58cf992859cc6284a',NULL),(97,1,'56a8f4ee121ab3682e90308a2c0ebe91','4a8c432456e6b3753fef7e099c2f2499',NULL),(98,1,'4449fed8d2ad76462670483dc7dcd9f7','e0cf70dd96b63850adbbecc0da31800a',NULL),(99,1,'b5b3216f2cd550d67a3e5ed70ec532f8','34263a09a5423790c346ca80eb941152',NULL),(100,1,'c6963a16772721e15328f1ecd1677595','03c5d4099893486b22b89c40d0159b44',NULL),(101,1,'334ac8fa74424011b1231146082a845b','f8ede47df791d6340af92d68cf6488fe',NULL),(102,1,'cff79914b7325c7d2dc9fe13f257d4f0','f6b69566f97c7038a59bfb60cb8e7f83',NULL),(103,1,'d61b690c3d139d7d8ee851a7fc6b0dd2','c927dad70debdbfe5dd864643968bcc0',NULL),(104,1,'4c63ed94a8332f4dbf82854436ca5fd9','ed8793feb1460494ed0f7db257145639',NULL),(105,1,'f039c4a600dc232f50a681780d977d93','bf148e2f89b28a4821bace64dcc11953',NULL),(106,1,'70d09c62afc8e5cbcebcec89d9114658','49fb73abc3ef1d30dfd57bf95178bff3',NULL),(107,1,'32da6dd4aac83f27abe5327ff6b4d4e0','f13146784dc31af181de3cc1f6cf23cb',NULL),(108,1,'9a6ed80a4981ea4ec840711c7d7ba0f8','b07f83cb10d9c5965eb74720b46d4503',NULL),(109,1,'026b004db17d75e0fc6a211d0e034263','0fc4ab5508f5192525ded86e8e5a48d4',NULL),(110,1,'9e503553a71fc3809a92ea756dc761e9','77ba73d86298d97317a5f0c8b8ed6f14',NULL),(111,1,'a640122bd5f67927cd3b312fac8dc2e3','6852fb6457c73662152cb8b980a639cd',NULL),(112,1,'85ab293de321238f26b915b3b41ef6ee','4ad0dad88442f20e10f81591e1b5abc1',NULL),(113,1,'b98b83205f6a33365bea104bf29b8702','a08b7ef6cd128c101197e1018a1f54f8',NULL),(114,1,'5dc2afe75b1cbc855ded7aa595449609','ebab780a607d5f0fe3dcb40c4d62819a',NULL),(115,1,'02de0b9f64174b7fc5d0e63ba1937a65','be1ab64b13224e5e98db1ad08a2af2a4',NULL),(116,1,'7a82ea27c546822a460eede614714a4b','844fe9a9d061d27202a1447c479607c7',NULL),(117,1,'7d4c639b10ce8392975dcff01648becf','c02c0d08c4c4dbb4bf3fcf1dff60ee5a',NULL),(118,1,'638a445fc9cd81cdcc57627e15fae7e9','f47d62fa49d8417eb6004fd5b7e13767',NULL),(119,1,'a36c30aa2f4d018c2542a5a7f0feb897','5827b5289f8bd0fa3e035095040b9b3f',NULL),(120,1,'1693c639a6947ff95f65f0c223b3c3eb','250d245387aca6fec91ae192522377fd',NULL),(121,1,'f707f749961ddd2b531d6506715c1794','d0530156ecebf65ba83471a5a4dc9cc2',NULL),(122,1,'7670cb71d1c5938bd0f0b212b1d18540','aa360ed5bebdfb70ce054a773ff4af8a',NULL),(123,1,'5e9ea18c0374f30fbf15e0550add907f','def45e808488d06ac64d782ddcadb748',NULL),(124,1,'b3a2245e363f4794d84ba4d29fd20465','65c0349fe77a7317655d8fda1945bf01',NULL),(125,1,'1db929541c4657e205267d5d935080e1','513020cce338c3b842578a7ed96a57c0',NULL),(126,1,'fc59c83c4d8becd3b7e8f40c20f80a6c','cebde0e9a30ca781d8dbb5219911b014',NULL),(127,1,'d60c160e56a1f88f808c1927a192e396','cb058bfb87acfa6a986eb6462c32ef8e',NULL),(128,1,'0924f40713acc9aa3e56e3ac297e24e2','a8b8f279d242aecf5d3170c06760c178',NULL),(129,1,'33778b573336de22da58f815494276dc','ba0c27f470fea8d6350200ab13420674',NULL),(130,1,'92e2cecfcd13d147946695f94c95f37a','f459c9de560e4f07bbb0ef8ec3266957',NULL),(131,1,'415d6ff1ae41f1a6ae8007466fddb65c','21b7d7db430beabd04e98d3d71077bd6',NULL),(132,1,'254da5bfa36d55bf50f36d0fea8d817c','bd4ba93a4eb5e5d3debfabba8e79744f',NULL),(133,1,'8bcbdac877b22f94bb94a309763be2ae','4017f3f48779d3baddb01d30e24dcb9b',NULL),(134,1,'874502feb371bfe4d38ee1f395d4fb25','2fa836904c60c3eb79cca589d3425da0',NULL),(135,1,'f6bc94f593325adcacc61c01e4fe22a4','39e450ae55c06620448f51990c4a7b65',NULL),(136,1,'06d818144145e1ba3a2c0f41dfdf957f','d6b4594c3893707ca7425527c50754f2',NULL),(137,1,'774a433ff08e3df3959db57705f6f882','1ece4f61e010ba09ed932e9f9d64f795',NULL),(138,1,'f0cdb9a3c6fa4a333bb8b527a81df4c8','c07437a79d69d80ec5b4df0a2676ddc7',NULL),(139,1,'4db812103d0a71887fdea99676a5d498','a245b01550505a6cf034a8203060b7f5',NULL),(140,1,'5b32d17a82da842afb12a2558a107a84','e33c7049f039b2bd33596f1ca017590d',NULL),(141,1,'20277b960a6fe0009a3f6fdb6490b67b','072ce6bac1a16ebbc9a7874eb1732ff9',NULL),(142,1,'f32eacb7bc255404f9f85fe3ad47a230','add83a9262c5ca6b45957aae998305a9',NULL),(143,1,'854ccbda907959d64a36ae042ba50057','1a647a7f655a4604c4653a6d155bef24',NULL),(144,1,'62dbb0dc4eca335e695e411b20fe56bc','a2ceb15208871caf7fff0863ea855179',NULL),(145,1,'5326663c579c82ed14c198e89fa99cb8','8202cd425a595c74799aae7ac77f5c95',NULL),(146,1,'486302263712cfc3252af11afa9b83ba','3a0b6796388656cb58393af97f2e44d7',NULL),(147,1,'f47705c64099e03585d2518432b9eee8','a658c3fc029edb769de0b13f8cd4ddf9',NULL),(148,1,'131cc75f124c337524fd1d850aeaacc1','9c9521ff9a928397bc6486bbe6024e60',NULL),(149,1,'91a3d71fad0900550fe4f0102a663894','adbb2fb16c783e17fe32ffe8b05723f3',NULL),(150,1,'fe856912cf189640861526e16c3845b8','08d97f7332dbdfb8a031dd767aac5333',NULL),(151,1,'2919d493a2bfef2dde224d32843e3e4c','f81050e6d9389fb4936a25ccea4a8a31',NULL),(152,1,'dcd7bd64679448e181d00565fd1de39d','e80c97bd32b54131dfda0dd7616114c2',NULL),(153,1,'16b0b7324e6f70dfea53a94bcf52706a','0240545e4e193db9d459ba7993bc329e',NULL),(154,1,'52526844e9bbd13689ac8a6d3c3e1a89','1f5d0205481fb88674efe74aae6c005f',NULL),(155,1,'71fdea83416a4ff400a0056f56f9a9b6','4609a7f50f46c273281e1dfd58b1c50d',NULL),(156,1,'1f19612fc3806cd245f8b6ce16e8ad64','83df78b1b198d9c54e6363e0c0064d9a',NULL),(157,1,'5df61fe8482c18494304984267ac7532','80e396de98d60dd17dbfcc6ed846956c',NULL),(158,1,'80675b2783a90a790582aa007778423c','53694e2a5df5f71703acc0436d4a18a0',NULL),(159,1,'83be3d1a6180d473a6c5f6d5da157180','c95560b127828a552462a4df8cc1d67b',NULL),(160,1,'9f75e5cf2cf2ee42ddc3e14184dbd6fa','c93120bd85d239dddd9108dcbe1ca94d',NULL),(161,1,'e4256d5ddc1f6e6d952c2c03631e9df6','5404f2198b6b1fe594d7a67e65a2c5d6',NULL),(162,1,'80a90d33990920f9dc18534397b3c447','ae4616f1ea0a45eab935c24a91208871',NULL),(163,1,'9b6c77b08c6122387611db7ce39d9c97','8295f7e2b7f6d34f1b279aa1560ab6e4',NULL),(164,1,'2e8866148dc64fc33e2be6de0f4d07b8','4760b1f786255044930719216b66f09c',NULL),(165,1,'78841721bdb67d840815f64b9929f67a','3e04dbafa43fb9707eeffd7fde1877b3',NULL),(166,1,'8c42cb0d4133453805ab10d75444cf56','82c881dd4a297dde18db9632b744ca57',NULL),(167,1,'29d4a5e8e0e23940a946135665726a13','533a07653f831f42c23530c37544d1d3',NULL),(168,1,'89311941fab24ba561289e799ec4d5c9','f179e4c75442e28cffd7abf005bec41e',NULL),(169,1,'22b4006ed4f77169747c07b4c3d7b774','483b86c32edea10de70ea8283b56f27b',NULL),(170,1,'3b07cf6dac2a160bd18c3c077c8b3471','9e2f1441c645a26e32cf5ec717506f00',NULL),(171,1,'ea51bcaf841652f674a421f5e329355f','2e7493b8bb13654306eb53fc2963727f',NULL),(172,1,'4db8a555c70d3a4065dac21317e5d266','ff42c7f892decb0c39374f039144ae79',NULL),(173,1,'dcc9b40c8a1208970e54aefc4c144c81','2b458b39c85f7d93c24bc15d32ee25b0',NULL),(174,1,'34b8c17d61f6a049f5b9cfe99190a4c3','dc3d59bd18221444b178e8a794b7f4f2',NULL),(175,1,'2adf53b1d98e54501c82865f74c5c95f','dc0a0313ab05c8b6441ff8026b5073d2',NULL),(176,1,'a36c10fcc26cd9e493caf335a09189c1','46cd3688a96636019b8ccbaa8e40542f',NULL),(177,1,'5d867e1b60a2e92b1483d2c608f76e56','3bb0b547cf40064ca6ba57ad1d945926',NULL),(178,1,'537fdb173b2a6b402de0a044327d2625','5022ac9a00d764bac4715f31a2aafbde',NULL),(179,4,'43d92c5a8e5a0f445f6afd8ea9d4fc7e','bbab7fe4fb09edae70c4ced52e0e568b',NULL),(180,4,'f352fa823daca4aeb80579db7800b73a','3e3da4b5d3a99e8ceaf7423b163a065e',NULL),(181,3,'517b3d08d8bba2380ee7e8c239367752','c9fb73ea9fe1bd1784da7daedb61bbe2',NULL),(182,1,'1e37af2efb1b2713aec4fd80b4067cc2','0eca605892c63d1de46fab7d41f4554b',NULL),(183,1,'1a9b5a896d413ff4f3f052afb046d2a5','c89622ba949728802600d9fa10f454d8',NULL),(184,2,'0e09aaf240123caef6cd44689560e2d7','122bbfb01e9db81d10f9bc571568a775',NULL),(185,1,'5eeb97d9c72d5ce92d7c173ac13f66fd','4d80b722159b1a7797f40f37aeaa752a',NULL),(186,1,'cae6393d9ae6029d793e8908606354a5','87471c536185cafcda13b1d8c32f235d',NULL),(187,1,'7da69ea8b176c42ea2822b26b013b3f3','1b7497de66e6e4e555dd86f1c81cbe17',NULL),(188,1,'d1909809be83712f80b5672835251003','f80b16bc9b41bf1dba520951aa1893ba',NULL),(189,1,'436698f80c2dc763c62a402a4fce68a1','8041973e270ff9f2dcd61c3413da15f7',NULL),(190,1,'d0afcdf8461b75bb4b22a93f5e41f4cf','80dd802d4625352dda87cb60e9ff2372',NULL),(191,1,'de54c878fb71bc19a294dcbadc017b9f','b7775aa88e651b7d2fdc5c9b41c27235',NULL),(192,4,'1faf9ad6955a2a76b50f4a987c6389ea','f4b7e3e893411b06986c4a9ad3d0e089',NULL),(193,1,'a30331ef70e5f6de312e8df2366d8203','356dd9447b189a5320760da4b63671f8',NULL),(194,3,'65a57273091adb1c2532b64fc24f499b','e16a034d45ad53a47418e94cc9a6a19b',NULL),(195,4,'0f57fc2e57ec5974698ba1e3e4485cf5','0bf6563a64918b5ff89bf18952322e09',NULL),(196,2,'a9f6759871892ed95deac1f9b1d8ea11','513b29db1845fc52c882d7d85b420d77',NULL),(197,1,'7c11bfe2e2b73397d8d04f4fd80e2a4d','bb1d634dd56dbc86f9007dc69a8f7f17',NULL),(198,2,'9c9a17f67690de64c3907a00d7b088af','f34f3db4cbe987277c89d49004f1e089',NULL),(199,1,'631d02a4bd4c737b71ba9a0fa1298a66','1e90f21b6440b278287b9711668153d4',NULL),(200,3,'b7017ed5bee180a08effcb6174fc32aa','dfd8a5210e411aefc057172747674a54',NULL),(201,4,'a73fa80188b04c6cd9ee3f8cc01a6d5e','fb8645523e406bf6418861d3b1a08726',NULL),(202,2,'560f9272aada5ff6cc57a9ef6ea98fb0','f0f44fc9e2ac3afba4385707a60e7dce',NULL),(203,1,'00231b1b8715f69dfc9dffb0c4b77923','e69bde1a14c8e250ed38acbe9dc6965d',NULL),(204,3,'11451512d4b08c400c162a7da4365ea0','d4780f1b4b5c1462ddb10f7cb2bbcb09',NULL),(205,4,'7e6bca9e37239d751de838c31affe576','de69cfa0cc08318c77be88c0f06fd613',NULL),(206,1,'86a5029eddeed3401a29257c10771f82','872dae2bf2099d77df6163f8f6f0d50f',NULL),(207,3,'59162ddb2968d9966d34004e7c1680d0','841a2976e61a3cdf845fc95bbffdae48',NULL),(208,2,'f852a5b0c44114250e1afaa97d3f5008','db9488de957a1dda821d44bdc49f1f1a',NULL),(209,4,'4e79375bc9c05053ac61599f316ae55c','7540e7544599922fdfa0c5e31284a228',NULL),(210,1,'4b6601c1b9edc9e2c1d864f2eea2657a','028448df270499299f43f3c172e5b56e',NULL),(211,2,'76a8892457d583b36e4b65f0688afd2a','06d28e46179d078cb59b8830317170ab',NULL),(212,3,'a8067a993b48ad1bdd9923ba6227eead','c9dd894db72cdd0a1214f55bbba0f1a6',NULL),(213,4,'506bf52aa5ddd42ccfd234fa2c21d216','f2ed2ef28cda0da6b5a40f0a9cd59d64',NULL),(214,2,'270717b36d20bb3486bd831366197346','d9bc93c44926718ad9526a6d8318eac5',NULL),(215,3,'fb461a79f206076c0dbf20c5e5eae334','4a5e4f2c098b1f97999852c14ba9c078',NULL),(216,1,'8caf3bdb6d6f7bc44fddb02049b3fe3b','625c1f3e4744d598204dadcb67e7da42',NULL),(217,4,'a98f32050a4282f7cfd0d56173e1c972','fbcc02f5754dbc8a02d99dfccdf52c36',NULL),(218,2,'c429956e295eb054abb0cc4a87bb60ca','31ec695f417c1154f298b5adfa1463ac',NULL),(219,1,'e42e5e5e73c09914bc908bdc5a32b798','855d8e0bca8cc66152bb36ebe1f40591',NULL),(220,4,'06b5aed018f0d381df5b5f540f43aa47','9a32f89d2969d1a552398a2d45b2cd20',NULL),(221,3,'7b4b9033e9bfd1d0ed49280c74dc900c','b9142ff8cb1ae07d26c2ac0cc9794382',NULL),(222,4,'af94f216b14c2771da57169a1f3346de','1636b1982ce5df8d19c5a8d019b12c13',NULL),(223,2,'32107e0a218fee97e944505da305dee9','71b1afb574cb9ef6b71fcf2b51aad431',NULL),(224,3,'0aa0b28604d132206c83b5397b0a40dc','f0b6c87e5ee93c09af74d898e0589f78',NULL),(225,1,'9918fd0f494cbc5dd1b29234fc9aab55','2a1ddee024566f339cc0d73a442e8d4a',NULL),(226,2,'8fb7380befd0a8cf4d8b2f781b291b7a','fe7d1a6e261870c645b806c336c990b7',NULL),(227,4,'da133db1e14192c9ea9757d600e1ccc1','635186f9156518a7d12125d222dba631',NULL),(228,3,'694467330831dd323546a6048b92b1ef','38f0624f59f5cc846d6104a75edcc3e2',NULL),(229,1,'1ae7b42a7925cb15c85a677ab1444f61','d934a917f764e9a6c164f06db3de3a7c',NULL),(230,3,'aec3aa841a625dba3bb8732104e8ea1a','c5f66365fd2e61b1a08c53a1081de197',NULL),(231,1,'23ad2259b052775c03b005cee46ee996','df84ebb607337feea26e5a82e84fe1cb',NULL),(232,2,'0635797d5c630ae7ea079d7428d07fac','89d5c13c96ffdd307111499756546599',NULL),(233,4,'77debf6df4dd11ef07c9e817946ec478','eadb7172c95facd53459371450832656',NULL),(234,3,'75bdf3bddd684f87130de072cd1e46c2','8d64aadbf5ae6693ea95496e2dbab2f0',NULL),(235,1,'370453c8d61ac38a8a42280c05c29a65','10face6d405a8aa5a7e8181f89e95a68',NULL),(236,1,'ac44ad3ac4188b38ea78e37b05f6b475','583ac1bb472a5904fcd52086e1dfccfa',NULL),(237,1,'bc30fe23122108331e479703353a4d56','c56862668058b1c4a51c7f6c51bdb624',NULL),(238,1,'a2fb432aca7836f63a8e45e1545fad15','fca5bdbb39065b8c155386a86c975b7b',0),(239,4,'f9e77fa8729b25a56503201d58b8aac1','3d840ceb7aa8be904241c19fdab597dd',0),(240,4,'16f0d7203f37739c36e6db3bdfd0c0b8','ae04a7bc3db616e3f279326df2fe216e',1),(241,1,'bb847f0f092f847f325a86d0ae0b77fa','7b96da99f945eae3226df28c6a65106b',1),(242,1,'6d8b4aa4e9db26bc2d3eb03be4041a24','9fddd30386c1fb278a23fec748eca2d1',1),(243,1,'029afbf6b73ce1a8a8b1e478c171a7a3','1e8a3572483e3a27222dea87e5a4c000',1),(244,1,'af5f46ec99d77ecfee4456394898f2e7','751bea39c0ab4d9a62599b74690b974d',1),(245,1,'da220204ac683b0fae754d452cb6c1ab','cee7bb5b68239703e2105b4031492d41',1),(246,1,'ba867ee8485fd887a3ceab328cebb326','3499dbe9f16886f98010d924d62d3466',1),(247,1,'7733cdd7dad2945e725b4070d760bab8','b7bf5abe94ccfc7112af45c4b6fa7be4',1),(248,1,'b121841818f4138e7843823d42add265','0224b876fb0ede11354a53e744a07cbf',1),(249,1,'eb8b094d67ef0858d9bafbed9e12078c','f0c1f2a606c2ea9f39dcabef027e79fd',1),(250,4,'19ba661d4ab5513742a9b2806e2db19b','cc52680855af2131446f870853f7e83c',1);
/*!40000 ALTER TABLE `sammel_bestellung` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649F85E0677` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-24 12:47:49
