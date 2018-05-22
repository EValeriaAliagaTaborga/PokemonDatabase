-- MySQL dump 10.13  Distrib 5.7.21, for Win64 (x86_64)
--
-- Host: localhost    Database: arceusdex_db
-- ------------------------------------------------------
-- Server version	5.7.21-log

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
-- Table structure for table `campeondelaliga`
--

DROP TABLE IF EXISTS `campeondelaliga`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campeondelaliga` (
  `id_campeon` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_campeon` varchar(200) NOT NULL,
  `nombre_version` varchar(200) NOT NULL,
  `region_origen` varchar(100) NOT NULL,
  PRIMARY KEY (`nombre_version`),
  KEY `id_campeon` (`id_campeon`),
  KEY `region_origen` (`region_origen`),
  CONSTRAINT `campeondelaliga_ibfk_1` FOREIGN KEY (`id_campeon`) REFERENCES `entrenador` (`id_entrenador`),
  CONSTRAINT `campeondelaliga_ibfk_2` FOREIGN KEY (`nombre_version`) REFERENCES `versiondejuego` (`nombre_version`),
  CONSTRAINT `campeondelaliga_ibfk_3` FOREIGN KEY (`region_origen`) REFERENCES `region` (`nombre_region`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campeondelaliga`
--

LOCK TABLES `campeondelaliga` WRITE;
/*!40000 ALTER TABLE `campeondelaliga` DISABLE KEYS */;
INSERT INTO `campeondelaliga` VALUES (25,'Steven Stone','Alpha Sapphire','Hoenn'),(27,'Cynthia','Diamond','Sinnoh'),(26,'Wallace','Emerald','Hoenn'),(25,'Steven Stone','Omega Ruby','Hoenn'),(27,'Cynthia','Pearl','Sinnoh'),(27,'Cynthia','Platinum','Sinnoh'),(25,'Steven Stone','Ruby','Hoenn'),(25,'Steven Stone','Sapphire','Hoenn'),(28,'Diantha','X','Kalos'),(28,'Diantha','Y','Kalos');
/*!40000 ALTER TABLE `campeondelaliga` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entrenador`
--

DROP TABLE IF EXISTS `entrenador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entrenador` (
  `id_entrenador` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_entrenador` varchar(100) NOT NULL,
  `tipo_entrenador` varchar(100) DEFAULT NULL,
  `genero` varchar(50) NOT NULL,
  PRIMARY KEY (`id_entrenador`,`nombre_entrenador`),
  UNIQUE KEY `nombre_entrenador` (`nombre_entrenador`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrenador`
--

LOCK TABLES `entrenador` WRITE;
/*!40000 ALTER TABLE `entrenador` DISABLE KEYS */;
INSERT INTO `entrenador` VALUES (1,'Red','Protagonista','Masculino'),(2,'Leaf','Protagonista','Femenino'),(3,'Ethan','Protagonista','Masculino'),(4,'Kris','Protagonista','Femenino'),(5,'Lyra','Protagonista','Femenino'),(6,'Brendan','Protagonista','Masculino'),(7,'May','Protagonista','Femenino'),(8,'Dawn','Protagonista','Femenino'),(9,'Hilda','Protagonista','Femenino'),(10,'Nate','Protagonista','Masculino'),(11,'Calem','Protagonista','Masculino'),(12,'Serena','Protagonista','Femenino'),(13,'Sun','Protagonista','Masculino'),(14,'Moon','Protagonista','Femenino'),(15,'Blue','Rival','Masculino'),(16,'Silver','Rival','Masculino'),(17,'Wally','Rival','Masculino'),(18,'Barry','Rival','Masculino'),(19,'Bianca','Rival','Femenino'),(20,'Cheren','Rival','Masculino'),(21,'Shauna','Rival','Femenino'),(22,'Trevor','Rival','Masculino'),(23,'Hau','Rival','Masculino'),(24,'Gladion','Rival','Masculino'),(25,'Steven Stone','Campeon','Masculino'),(26,'Wallace','Campeon','Masculino'),(27,'Cynthia','Campeon','Femenino'),(28,'Diantha','Campeon','Femenino');
/*!40000 ALTER TABLE `entrenador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipopokemon`
--

DROP TABLE IF EXISTS `equipopokemon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipopokemon` (
  `id_entrenador` int(11) NOT NULL AUTO_INCREMENT,
  `id_pokemon` int(11) NOT NULL,
  KEY `id_entrenador` (`id_entrenador`),
  KEY `id_pokemon` (`id_pokemon`),
  CONSTRAINT `equipopokemon_ibfk_1` FOREIGN KEY (`id_entrenador`) REFERENCES `entrenador` (`id_entrenador`),
  CONSTRAINT `equipopokemon_ibfk_2` FOREIGN KEY (`id_pokemon`) REFERENCES `pokemon` (`id_pokemon`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipopokemon`
--

LOCK TABLES `equipopokemon` WRITE;
/*!40000 ALTER TABLE `equipopokemon` DISABLE KEYS */;
INSERT INTO `equipopokemon` VALUES (1,25),(1,745),(2,778),(2,131),(3,262),(4,403),(5,25),(6,25),(7,403),(24,25),(25,493),(26,131),(27,676),(28,475),(20,405),(1,25),(1,745),(2,778),(2,131),(3,262),(4,403),(5,25),(6,25),(7,403),(24,25),(25,493),(26,131),(27,676),(28,475),(20,405);
/*!40000 ALTER TABLE `equipopokemon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `habitat`
--

DROP TABLE IF EXISTS `habitat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `habitat` (
  `id_pokemon` int(11) NOT NULL,
  `nombre_region` varchar(100) NOT NULL,
  KEY `id_pokemon` (`id_pokemon`),
  KEY `nombre_region` (`nombre_region`),
  CONSTRAINT `habitat_ibfk_1` FOREIGN KEY (`id_pokemon`) REFERENCES `pokemon` (`id_pokemon`),
  CONSTRAINT `habitat_ibfk_2` FOREIGN KEY (`nombre_region`) REFERENCES `region` (`nombre_region`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `habitat`
--

LOCK TABLES `habitat` WRITE;
/*!40000 ALTER TABLE `habitat` DISABLE KEYS */;
INSERT INTO `habitat` VALUES (403,'Sinnoh'),(405,'Sinnoh'),(778,'Alola'),(745,'Alola'),(131,'Kanto'),(131,'Alola'),(25,'Kanto'),(25,'Alola'),(25,'Johto'),(475,'Hoenn'),(475,'Unova'),(676,'Kalos'),(262,'Hoenn'),(493,'Sinnoh');
/*!40000 ALTER TABLE `habitat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `listadeciudades`
--

DROP TABLE IF EXISTS `listadeciudades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `listadeciudades` (
  `nombre_ciudad` varchar(300) NOT NULL,
  `nombre_region` varchar(100) NOT NULL,
  PRIMARY KEY (`nombre_ciudad`),
  KEY `nombre_region` (`nombre_region`),
  CONSTRAINT `listadeciudades_ibfk_1` FOREIGN KEY (`nombre_region`) REFERENCES `region` (`nombre_region`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `listadeciudades`
--

LOCK TABLES `listadeciudades` WRITE;
/*!40000 ALTER TABLE `listadeciudades` DISABLE KEYS */;
INSERT INTO `listadeciudades` VALUES ('Heaven Town','Afloa'),('Hau\'oli City','Alola'),('Heahea City','Alola'),('Iki Town','Alola'),('Konikoni City','Alola'),('Malie City','Alola'),('Paniola Town','Alola'),('Po Town','Alola'),('Seafolk Village','Alola'),('Tapu Village','Alola'),('Dewford Town','Hoenn'),('Ever Grande City','Hoenn'),('Fallarbor Town','Hoenn'),('Fortree City','Hoenn'),('Lavaridge Town','Hoenn'),('Lilycove City','Hoenn'),('Litteroot Town','Hoenn'),('Mauville City','Hoenn'),('Mossdeep City','Hoenn'),('Oldale Town','Hoenn'),('Pacifidog Town','Hoenn'),('Petalburg City','Hoenn'),('Rustboro City','Hoenn'),('Slateport City','Hoenn'),('Sootopolis City','Hoenn'),('Verdanturf Town','Hoenn'),('Azalea Town','Johto'),('Blackthorn City','Johto'),('Cherrygrove City','Johto'),('Cianwood City','Johto'),('Ecruteak City','Johto'),('Goldenrod City','Johto'),('Mahogany Town','Johto'),('New Bark Town','Johto'),('Olivine City','Johto'),('Violet City','Johto'),('Ambrette Town','Kalos'),('Anistar City','Kalos'),('Aquacorde Town','Kalos'),('Camphrier Town','Kalos'),('Coumarine City','Kalos'),('Couriway Town','Kalos'),('Cyllage City','Kalos'),('Dendemille Town','Kalos'),('Geosense Town','Kalos'),('Kiloude City','Kalos'),('Laverre City','Kalos'),('Lumiose City','Kalos'),('Santalune City','Kalos'),('Shalour City','Kalos'),('Snowbelle City','Kalos'),('Vaniville Town','Kalos'),('Celadon Town','Kanto'),('Cerulean City','Kanto'),('Cinnabar Island','Kanto'),('Fucshia City','Kanto'),('Lavander Town','Kanto'),('Pallet Town','Kanto'),('Pewter City','Kanto'),('Saffron City','Kanto'),('Vermilion City','Kanto'),('Viridian City','Kanto'),('Canalave City','Sinnoh'),('Celestic Town','Sinnoh'),('Eterna City','Sinnoh'),('Floaroma Town','Sinnoh'),('Hearthome City','Sinnoh'),('Jubile City','Sinnoh'),('Oreburgh City','Sinnoh'),('Pastoria City','Sinnoh'),('Sandgem Town','Sinnoh'),('Snowpoint City','Sinnoh'),('Solaceon Town','Sinnoh'),('Sunyshore City','Sinnoh'),('Twinleaf Town','Sinnoh'),('Veilstone City','Sinnoh'),('Accumula Town','Unova'),('Anville Town','Unova'),('Aspertia City','Unova'),('Black City','Unova'),('Castelia City','Unova'),('Driftveil City','Unova'),('Floccesy Town','Unova'),('Humilau City','Unova'),('Icirrus City','Unova'),('Lacunosa Town','Unova'),('Lentimas Town','Unova'),('Mistralton City','Unova'),('Nacrete City','Unova'),('Nimbasa City','Unova'),('Nuvema Town','Unova'),('Opelucid City','Unova'),('Striaton City','Unova'),('Undella Town','Unova'),('Virbank','Unova');
/*!40000 ALTER TABLE `listadeciudades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `origenpokemon`
--

DROP TABLE IF EXISTS `origenpokemon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `origenpokemon` (
  `id_pokemon` int(11) NOT NULL,
  `nombre_version` varchar(200) NOT NULL,
  KEY `id_pokemon` (`id_pokemon`),
  KEY `nombre_version` (`nombre_version`),
  CONSTRAINT `origenpokemon_ibfk_1` FOREIGN KEY (`id_pokemon`) REFERENCES `pokemon` (`id_pokemon`),
  CONSTRAINT `origenpokemon_ibfk_2` FOREIGN KEY (`nombre_version`) REFERENCES `versiondejuego` (`nombre_version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `origenpokemon`
--

LOCK TABLES `origenpokemon` WRITE;
/*!40000 ALTER TABLE `origenpokemon` DISABLE KEYS */;
INSERT INTO `origenpokemon` VALUES (403,'Diamond'),(403,'Pearl'),(403,'Platinum'),(405,'Diamond'),(405,'Pearl'),(405,'Platinum'),(778,'Sun'),(778,'Moon'),(778,'Ultra Sun'),(778,'Ultra Moon'),(745,'Sun'),(745,'Moon'),(745,'Ultra Sun'),(745,'Ultra Moon'),(131,'Blue'),(131,'FireRed'),(25,'Yellow'),(25,'FireRed'),(25,'Ruby'),(25,'Emerald'),(25,'Diamond'),(25,'Platinum'),(475,'Omega Ruby'),(475,'Alpha Sapphire'),(475,'Black'),(475,'Black 2'),(676,'X'),(676,'Sun'),(676,'Ultra Sun'),(262,'Ruby'),(262,'Emerald'),(493,'Diamond'),(493,'Pearl'),(493,'Platinum'),(427,'Diamond');
/*!40000 ALTER TABLE `origenpokemon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pokemon`
--

DROP TABLE IF EXISTS `pokemon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pokemon` (
  `id_pokemon` int(11) NOT NULL,
  `nombre_pokemon` varchar(100) NOT NULL,
  `altura` double DEFAULT NULL,
  `peso` double DEFAULT NULL,
  `generacion` varchar(100) NOT NULL,
  PRIMARY KEY (`id_pokemon`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pokemon`
--

LOCK TABLES `pokemon` WRITE;
/*!40000 ALTER TABLE `pokemon` DISABLE KEYS */;
INSERT INTO `pokemon` VALUES (25,'Pikachu',0.4,6,'Primera'),(131,'Lapras',2.5,220,'Primera'),(262,'Mightyena',1,37,'Tercera'),(403,'Shinx',0.5,9.5,'Cuarta'),(405,'Luxray',1.4,42,'Cuarta'),(427,'Buneary',0.4,5.5,'Cuarta'),(475,'Gallade',1.6,52,'Cuarta'),(493,'Arceus',3.2,320,'Cuarta'),(676,'Furfrou',1.2,28,'Sexta'),(745,'Lycanroc',1,25,'Septima'),(778,'Mimikyu',0.2,0.7,'Septima');
/*!40000 ALTER TABLE `pokemon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pokemontipo`
--

DROP TABLE IF EXISTS `pokemontipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pokemontipo` (
  `id_pokemon` int(11) NOT NULL,
  `tipo` varchar(100) NOT NULL,
  KEY `id_pokemon` (`id_pokemon`),
  CONSTRAINT `pokemontipo_ibfk_1` FOREIGN KEY (`id_pokemon`) REFERENCES `pokemon` (`id_pokemon`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pokemontipo`
--

LOCK TABLES `pokemontipo` WRITE;
/*!40000 ALTER TABLE `pokemontipo` DISABLE KEYS */;
INSERT INTO `pokemontipo` VALUES (403,'Electrico'),(405,'Electrico'),(778,'Fantasma'),(778,'Hada'),(745,'Roca'),(131,'Agua'),(131,'Hielo'),(25,'Electrico'),(475,'Psiquico'),(475,'Lucha'),(676,'Normal'),(262,'Siniestro'),(493,'Normal'),(427,'Normal');
/*!40000 ALTER TABLE `pokemontipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `region`
--

DROP TABLE IF EXISTS `region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `region` (
  `nombre_region` varchar(100) NOT NULL,
  `profesor_regional` varchar(200) NOT NULL,
  PRIMARY KEY (`nombre_region`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `region`
--

LOCK TABLES `region` WRITE;
/*!40000 ALTER TABLE `region` DISABLE KEYS */;
INSERT INTO `region` VALUES ('Afloa','Adriana Amorim'),('Alola','Kukui'),('Hoenn','Birch'),('Johto','Elm'),('Kalos','Augustine Sycamore'),('Kanto','Samuel Oak'),('Sinnoh','Rowan'),('Unova','Aurea Juniper');
/*!40000 ALTER TABLE `region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regionversion`
--

DROP TABLE IF EXISTS `regionversion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `regionversion` (
  `nombre_region` varchar(100) NOT NULL,
  `nombre_version` varchar(200) NOT NULL,
  PRIMARY KEY (`nombre_version`),
  KEY `nombre_region` (`nombre_region`),
  CONSTRAINT `regionversion_ibfk_1` FOREIGN KEY (`nombre_region`) REFERENCES `region` (`nombre_region`),
  CONSTRAINT `regionversion_ibfk_2` FOREIGN KEY (`nombre_version`) REFERENCES `versiondejuego` (`nombre_version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regionversion`
--

LOCK TABLES `regionversion` WRITE;
/*!40000 ALTER TABLE `regionversion` DISABLE KEYS */;
INSERT INTO `regionversion` VALUES ('Alola','Moon'),('Alola','Sun'),('Alola','Ultra Moon'),('Alola','Ultra Sun'),('Hoenn','Alpha Sapphire'),('Hoenn','Emerald'),('Hoenn','Omega Ruby'),('Hoenn','Ruby'),('Hoenn','Sapphire'),('Johto','Crystal'),('Johto','Gold'),('Johto','GoldHeart'),('Johto','Silver'),('Johto','SoulSilver'),('Kalos','X'),('Kalos','Y'),('Kanto','Blue'),('Kanto','FireRed'),('Kanto','Green'),('Kanto','LeafGreen'),('Kanto','Red'),('Kanto','Yellow'),('Sinnoh','Diamond'),('Sinnoh','Pearl'),('Sinnoh','Platinum'),('Unova','Black'),('Unova','Black 2'),('Unova','White'),('Unova','White 2');
/*!40000 ALTER TABLE `regionversion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `versiondejuego`
--

DROP TABLE IF EXISTS `versiondejuego`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `versiondejuego` (
  `nombre_version` varchar(200) NOT NULL,
  `generacion` varchar(100) NOT NULL,
  PRIMARY KEY (`nombre_version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `versiondejuego`
--

LOCK TABLES `versiondejuego` WRITE;
/*!40000 ALTER TABLE `versiondejuego` DISABLE KEYS */;
INSERT INTO `versiondejuego` VALUES ('Alpha Sapphire','Sexta'),('Black','Quinta'),('Black 2','Quinta'),('Blue','Primera'),('Crystal','Segunda'),('Diamond','Cuarta'),('Emerald','Tercera'),('FireRed','Tercera'),('Gold','Segunda'),('GoldHeart','Cuarta'),('Green','Primera'),('LeafGreen','Tercera'),('Moon','Septima'),('Omega Ruby','Sexta'),('Pearl','Cuarta'),('Platinum','Cuarta'),('Red','Primera'),('Ruby','Tercera'),('Sapphire','Tercera'),('Silver','Segunda'),('SoulSilver','Cuarta'),('Sun','Septima'),('Turquesa','Octava'),('Ultra Moon','Septima'),('Ultra Sun','Septima'),('White','Quinta'),('White 2','Quinta'),('X','Sexta'),('Y','Sexta'),('Yellow','Primera');
/*!40000 ALTER TABLE `versiondejuego` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `villanos`
--

DROP TABLE IF EXISTS `villanos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `villanos` (
  `nombre_organizacion` varchar(200) NOT NULL,
  `lider` varchar(200) NOT NULL,
  `nombre_region` varchar(100) NOT NULL,
  PRIMARY KEY (`nombre_organizacion`),
  KEY `nombre_region` (`nombre_region`),
  CONSTRAINT `villanos_ibfk_1` FOREIGN KEY (`nombre_region`) REFERENCES `region` (`nombre_region`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `villanos`
--

LOCK TABLES `villanos` WRITE;
/*!40000 ALTER TABLE `villanos` DISABLE KEYS */;
INSERT INTO `villanos` VALUES ('Team Aqua','Archie','Hoenn'),('Team Flare','Lysandre','Kalos'),('Team Galactic','Cyrus','Sinnoh'),('Team Magma','Maxie','Hoenn'),('Team Plasma','N','Unova'),('Team Rocket','Giovanni','Kanto'),('Team Skull','Guzma','Alola');
/*!40000 ALTER TABLE `villanos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `villanosversionjuego`
--

DROP TABLE IF EXISTS `villanosversionjuego`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `villanosversionjuego` (
  `nombre_organizacion` varchar(200) NOT NULL,
  `nombre_version` varchar(200) NOT NULL,
  KEY `nombre_organizacion` (`nombre_organizacion`),
  KEY `nombre_version` (`nombre_version`),
  CONSTRAINT `villanosversionjuego_ibfk_1` FOREIGN KEY (`nombre_organizacion`) REFERENCES `villanos` (`nombre_organizacion`),
  CONSTRAINT `villanosversionjuego_ibfk_2` FOREIGN KEY (`nombre_version`) REFERENCES `versiondejuego` (`nombre_version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `villanosversionjuego`
--

LOCK TABLES `villanosversionjuego` WRITE;
/*!40000 ALTER TABLE `villanosversionjuego` DISABLE KEYS */;
INSERT INTO `villanosversionjuego` VALUES ('Team Rocket','Red'),('Team Rocket','LeafGreen'),('Team Magma','Ruby'),('Team Magma','Omega Ruby'),('Team Aqua','Alpha Sapphire'),('Team Aqua','Sapphire'),('Team Magma','Emerald'),('Team Aqua','Emerald'),('Team Galactic','Diamond'),('Team Galactic','Pearl'),('Team Plasma','Black'),('Team Plasma','White 2'),('Team Flare','X'),('Team Skull','Sun');
/*!40000 ALTER TABLE `villanosversionjuego` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-23  7:03:23
