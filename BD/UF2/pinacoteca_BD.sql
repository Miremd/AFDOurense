drop database if exists pinacoteca;
CREATE DATABASE  IF NOT EXISTS `pinacoteca` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `pinacoteca`;
-- MySQL dump 10.13  Distrib 5.5.46, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: pinacoteca
-- ------------------------------------------------------
-- Server version	5.5.27

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
-- Table structure for table `cuadro`
--

DROP TABLE IF EXISTS `cuadro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cuadro` (
  `CodCuadro` varchar(10) NOT NULL,
  `Ncuadro` varchar(40) DEFAULT NULL,
  `Alto` smallint(5) DEFAULT NULL,
  `Ancho` smallint(5) DEFAULT NULL,
  `Fcuadro` datetime DEFAULT NULL,
  `Tecnica` varchar(15) DEFAULT NULL,
  `NPintor` varchar(15) DEFAULT NULL,
  `NPinacoteca` varchar(20) DEFAULT NULL,
  `numsala` smallint(5) DEFAULT NULL,
  PRIMARY KEY (`CodCuadro`),
  KEY `PINTORCUADRO` (`NPintor`),
  KEY `salasCUADRO` (`NPinacoteca`,`numsala`),
  CONSTRAINT `FK_cuadro_2` FOREIGN KEY (`NPinacoteca`, `numsala`) REFERENCES `salas` (`NPinacoteca`, `numSala`),
  CONSTRAINT `cuadro_ibfk_1` FOREIGN KEY (`NPintor`) REFERENCES `pintor` (`Npintor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuadro`
--

LOCK TABLES `cuadro` WRITE;
/*!40000 ALTER TABLE `cuadro` DISABLE KEYS */;
INSERT INTO `cuadro` VALUES ('10540     ','Tribunal de la Alhambra                 ',75,59,'1905-02-13 00:00:00','Oleo           ','M. Fortuny','Fund. Gala-S. Dalí',1),('10733     ','Galarina                                ',64,50,'1905-04-27 00:00:00','Oleo           ','Dalí','Fund. Gala-S. Dalí',1),('21987     ','San Andrés                              ',99,77,'1904-06-01 00:00:00','Oleo           ','El Greco','Museo de El Greco',1),('23001     ','Autorretrato                            ',NULL,NULL,'1905-03-24 00:00:00','Oleo           ','Juan Gris','Museo Reina Sofía',1),('23155     ','La Nagense                              ',182,216,'1905-04-17 00:00:00','Carboncillo    ','Picasso','Museo Reina Sofía',1),('23180     ','Violín y guitarra                       ',81,60,'1905-03-27 00:00:00','Oleo           ','Juan Gris','Museo Reina Sofía',1),('23458     ','El Guernica                             ',349,776,'1905-04-20 00:00:00','Oleo           ','Picasso','Museo Reina Sofía',1),('23469     ','Muchacha en la ventana                  ',105,74,'1905-04-08 00:00:00','Oleo s/cartón  ','Dalí','Museo Reina Sofía',1),('23511     ','Mujer en azul                           ',133,101,'1905-03-15 00:00:00','Oleo           ','Picasso','Museo Reina Sofía',1),('23670     ','Paisaje                                 ',130,194,'1905-05-29 00:00:00','Acrílico y cera','Miró','Museo Reina Sofía',1),('33079     ','Los caprichos                           ',NULL,NULL,'1904-11-29 00:00:00','Aguafuerte     ','Goya','M. del Grabado-Goya',1),('45109     ','Bailarinas en el escenario              ',66,36,'1905-02-22 00:00:00','Pastel         ','Degas','Thyssen-Bornemisza',1),('45280     ','La partida de cartas                    ',140,194,'1905-05-03 00:00:00','Oleo           ','Balthus','Thyssen-Bornemisza',1),('45901     ','Amazona de frente                       ',NULL,NULL,'1905-02-04 00:00:00',NULL,'Manet','Thyssen-Bornemisza',1),('50971     ','La oración del huerto                   ',NULL,NULL,'1904-02-08 00:00:00',NULL,'Botticelli','Capilla Real-Granada',1),('61329     ','Entierro del Sr. Orgaz                  ',480,360,'1904-05-06 00:00:00','Oleo           ','El Greco','Iglesia St. Tomé',1),('76004     ','Autorretrato                            ',32,23,'1905-03-10 00:00:00','Oleo s/papel   ','Picasso','Museo Picasso',1),('76543     ','Bodegón                                 ',59,78,'1905-03-15 00:00:00','Oleo           ','Picasso','Museo Picasso',1),('76770     ','La comida frugal                        ',61,44,'1905-03-18 00:00:00','Aguafuerte     ','Picasso','Museo Picasso',1),('76807     ','La copa azul                            ',66,28,'1905-03-16 00:00:00','Oleo           ','Picasso','Museo Picasso',1),('80175     ','El martitio de S. Mauricio              ',448,301,'1904-04-30 00:00:00','Oleo           ','El Greco','Museo de El Escorial',1),('90111     ','Paisaje                                 ',NULL,NULL,NULL,'Oleo           ','Van Dyck','Museo del Prado',1),('90258     ','Las tres gracias                        ',221,181,'1904-06-17 00:00:00','Oleo           ','Rubens','Museo del Prado',1),('90700     ','La maja desnuda                         ',97,190,'1904-11-29 00:00:00','Oleo           ','Goya','Museo del Prado',1),('90707     ','La maja vestida                         ',95,190,'1904-12-02 00:00:00','Oleo           ','Goya','Museo del Prado',1),('90813     ','Retrato de Carlos I                     ',NULL,NULL,NULL,'Oleo           ','Van Dyck','Museo del Prado',1),('91230     ','Las Meninas                             ',318,276,'1904-07-13 00:00:00','Oleo           ','Velázquez','Museo del Prado',1),('91558     ','Santa Cena                              ',107,164,'1904-06-11 00:00:00','Oleo           ','Tristán','Museo del Prado',1),('91987     ','La rendición de Breda                   ',307,367,'1904-06-22 00:00:00','Oleo           ','Velázquez','Museo del Prado',1),('92110     ','Niños en la playa                       ',118,185,'1905-03-24 00:00:00','Oleo           ','Sorolla','Museo del Prado',1);
/*!40000 ALTER TABLE `cuadro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `escuela`
--

DROP TABLE IF EXISTS `escuela`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `escuela` (
  `NEscuela` varchar(10) NOT NULL,
  `Pais` varchar(10) DEFAULT NULL,
  `Fecha` datetime DEFAULT NULL,
  PRIMARY KEY (`NEscuela`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `escuela`
--

LOCK TABLES `escuela` WRITE;
/*!40000 ALTER TABLE `escuela` DISABLE KEYS */;
INSERT INTO `escuela` VALUES ('Flamenca  ','Holanda   ','1903-10-31 00:00:00'),('Sevillana ','España    ','1904-03-29 00:00:00'),('Veneciana ','Italia    ','1903-07-23 00:00:00');
/*!40000 ALTER TABLE `escuela` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mecenas`
--

DROP TABLE IF EXISTS `mecenas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mecenas` (
  `NombreM` varchar(10) NOT NULL,
  `CiudadM` varchar(10) DEFAULT NULL,
  `PaisM` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`NombreM`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mecenas`
--

LOCK TABLES `mecenas` WRITE;
/*!40000 ALTER TABLE `mecenas` DISABLE KEYS */;
INSERT INTO `mecenas` VALUES ('L. Medici ','Florencia ','Italia    ');
/*!40000 ALTER TABLE `mecenas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pinacoteca`
--

DROP TABLE IF EXISTS `pinacoteca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pinacoteca` (
  `NPinacoteca` varchar(20) NOT NULL,
  `Ciudad` varchar(10) DEFAULT NULL,
  `Direccion` varchar(20) DEFAULT NULL,
  `Superficie` smallint(5) DEFAULT NULL,
  PRIMARY KEY (`NPinacoteca`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pinacoteca`
--

LOCK TABLES `pinacoteca` WRITE;
/*!40000 ALTER TABLE `pinacoteca` DISABLE KEYS */;
INSERT INTO `pinacoteca` VALUES ('Capilla Real-Granada','Granada   ',NULL,NULL),('Fund. Gala-S. Dalí  ','Barcelona ',NULL,NULL),('Iglesia St. Tomé    ','Toledo    ','Plaza del Conde s/n ',NULL),('M. del Grabado-Goya ','Zaragoza  ','Fuendetodos         ',NULL),('Museo de El Escorial','Madrid    ',NULL,NULL),('Museo de El Greco   ','Toledo    ','Toledo              ',NULL),('Museo del Prado     ','Madrid    ','Paseo del Prado s/n ',NULL),('Museo Picasso       ','Barcelona ',NULL,NULL),('Museo Reina Sofía   ','Madrid    ','Sta. Isabel, 52     ',NULL),('Thyssen-Bornemisza  ','Madrid    ','Paseo del Prado, 8  ',NULL);
/*!40000 ALTER TABLE `pinacoteca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pintor`
--

DROP TABLE IF EXISTS `pintor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pintor` (
  `Npintor` varchar(15) NOT NULL,
  `Ciudadpintor` varchar(20) DEFAULT NULL,
  `PaisPintor` varchar(10) DEFAULT NULL,
  `Fnac` datetime DEFAULT NULL,
  `Ffall` datetime DEFAULT NULL,
  `NombreE` varchar(10) DEFAULT NULL,
  `NPintorMaestro` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`Npintor`),
  KEY `ESCUELAPINTOR` (`NombreE`),
  KEY `PINTORPINTOR` (`NPintorMaestro`),
  CONSTRAINT `pintor_ibfk_2` FOREIGN KEY (`NPintorMaestro`) REFERENCES `pintor` (`Npintor`),
  CONSTRAINT `pintor_ibfk_1` FOREIGN KEY (`NombreE`) REFERENCES `escuela` (`NEscuela`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pintor`
--

LOCK TABLES `pintor` WRITE;
/*!40000 ALTER TABLE `pintor` DISABLE KEYS */;
INSERT INTO `pintor` VALUES ('Balthus        ','París               ','Francia   ','1905-03-22 00:00:00','1925-06-23 00:00:00',NULL,'Derain         '),('Bayeu          ',NULL,NULL,'1934-04-05 00:00:00','1795-08-04 00:00:00',NULL,NULL),('Botticelli     ','Florencia           ','Italia    ','1493-12-15 00:00:00','1555-11-29 00:00:00',NULL,'F. F. Lippi    '),('D. Soberano    ',NULL,NULL,NULL,NULL,NULL,NULL),('Dalí           ','Figueras            ','España    ','1905-03-18 00:00:00','1957-05-29 00:00:00',NULL,NULL),('Degas          ','París               ','Francia   ','1860-01-07 00:00:00','1922-02-15 00:00:00',NULL,NULL),('Derain         ',NULL,NULL,NULL,NULL,NULL,NULL),('El Greco       ','Creta               ','Grecia    ','1541-03-20 00:00:00','1619-11-06 00:00:00','Veneciana ',NULL),('F. F. Lippi    ',NULL,NULL,NULL,NULL,NULL,NULL),('F. Pacheco     ',NULL,NULL,NULL,NULL,NULL,NULL),('Goya           ','Fuendetodos         ','España    ','1745-10-11 00:00:00','1812-11-25 00:00:00',NULL,'Bayeu          '),('Juan Gris      ','Madrid              ','España    ','1905-03-01 00:00:00','1989-07-02 00:00:00',NULL,NULL),('M. Fortuny     ','Reus                ','España    ','1905-01-11 00:00:00','1995-05-27 00:00:00',NULL,'D. Soberano    '),('Manet          ','París               ','Francia   ','1832-01-05 00:00:00','1883-02-24 00:00:00',NULL,NULL),('Miró           ','Barcelona           ','España    ','1905-03-07 00:00:00','1958-03-22 00:00:00',NULL,NULL),('Murillo        ','Sevilla             ','España    ','1617-06-04 00:00:00','1682-11-17 00:00:00','Sevillana ',NULL),('Picasso        ','Málaga              ','España    ','1905-02-23 00:00:00','1992-09-16 00:00:00',NULL,NULL),('Rubens         ','Siegen              ','Alemania  ','1577-04-25 00:00:00','1640-08-15 00:00:00','Flamenca  ',NULL),('Sorolla        ','Valencia            ','España    ','1863-02-05 00:00:00','1933-05-21 00:00:00',NULL,NULL),('Tristán        ','Toledo              ','España    ','1904-05-03 00:00:00','1922-09-23 00:00:00',NULL,'El Greco       '),('Van Dyck       ','Amberes             ','Bélgica   ','1599-05-17 00:00:00','1641-05-10 00:00:00','Flamenca  ','Rubens         '),('Velázquez      ','Sevilla             ','España    ','1599-05-17 00:00:00','1660-03-16 00:00:00',NULL,'F. Pacheco     ');
/*!40000 ALTER TABLE `pintor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `protege`
--

DROP TABLE IF EXISTS `protege`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `protege` (
  `NMecenas` varchar(10) NOT NULL,
  `NPintor` varchar(15) NOT NULL,
  `FInicio` datetime DEFAULT NULL,
  `FFin` datetime DEFAULT NULL,
  PRIMARY KEY (`NMecenas`,`NPintor`),
  KEY `MECENASPROTEGE` (`NMecenas`),
  KEY `PINTORPROTEGE` (`NPintor`),
  CONSTRAINT `FK_protege_2` FOREIGN KEY (`NMecenas`) REFERENCES `mecenas` (`NombreM`),
  CONSTRAINT `FK_protege_1` FOREIGN KEY (`NPintor`) REFERENCES `pintor` (`Npintor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `protege`
--

LOCK TABLES `protege` WRITE;
/*!40000 ALTER TABLE `protege` DISABLE KEYS */;
/*!40000 ALTER TABLE `protege` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salas`
--

DROP TABLE IF EXISTS `salas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salas` (
  `NPinacoteca` varchar(20) NOT NULL,
  `numSala` smallint(5) NOT NULL,
  `metros` double(7,2) DEFAULT NULL,
  PRIMARY KEY (`NPinacoteca`,`numSala`),
  KEY `PINACOTECAsalas` (`NPinacoteca`),
  CONSTRAINT `salas_ibfk_1` FOREIGN KEY (`NPinacoteca`) REFERENCES `pinacoteca` (`NPinacoteca`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salas`
--

LOCK TABLES `salas` WRITE;
/*!40000 ALTER TABLE `salas` DISABLE KEYS */;
INSERT INTO `salas` VALUES ('Capilla Real-Granada',1,0.00),('Fund. Gala-S. Dalí',1,0.00),('Iglesia St. Tomé',1,0.00),('M. del Grabado-Goya',1,0.00),('Museo de El Escorial',1,0.00),('Museo de El Greco',1,0.00),('Museo del Prado',1,0.00),('Museo del Prado',2,0.00),('Museo del Prado',3,0.00),('Museo del Prado',4,0.00),('Museo Picasso',1,0.00),('Museo Picasso',2,0.00),('Museo Reina Sofía',1,0.00),('Museo Reina Sofía',2,0.00),('Museo Reina Sofía',3,0.00),('Thyssen-Bornemisza',1,0.00),('Thyssen-Bornemisza',2,0.00),('Thyssen-Bornemisza',3,0.00);
/*!40000 ALTER TABLE `salas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-01-13 21:22:52
