/*
SQLyog Professional v12.5.1 (64 bit)
MySQL - 10.4.25-MariaDB : Database - sistemafarmacia
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`sistemafarmacia` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `sistemafarmacia`;

/*Table structure for table `categorias` */

DROP TABLE IF EXISTS `categorias`;

CREATE TABLE `categorias` (
  `idcategoria` int(11) NOT NULL AUTO_INCREMENT,
  `categoria` varchar(50) NOT NULL,
  PRIMARY KEY (`idcategoria`),
  UNIQUE KEY `uk_categoria_cat` (`categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4;

/*Data for the table `categorias` */

insert  into `categorias`(`idcategoria`,`categoria`) values 
(5,'Analgésicos y antiinflamatorios - Aines solos y co'),
(8,'Antiacidos y Protectores gastricos'),
(4,'Antibioticos'),
(1,'Anticatarrales'),
(18,'Anticonceptivos y hormonales'),
(17,'Antiespasmódicos'),
(3,'Antihistaminicos'),
(19,'Antimicótico y antifúngicas'),
(7,'Antiparasitario'),
(12,'Cardiovasculares'),
(2,'Fluidificantes, antiasmáticos y antitusígenos'),
(11,'Gastrointestinal'),
(10,'Inhaladores'),
(15,'Otros'),
(13,'Psicofarmacos'),
(6,'Tratamentiento para colesterol y trigliseridos'),
(16,'Tratamiento genitorurinario'),
(14,'Tratamiento para diabetes'),
(9,'Vitaminas');

/*Table structure for table `productos` */

DROP TABLE IF EXISTS `productos`;

CREATE TABLE `productos` (
  `idproducto` int(11) NOT NULL AUTO_INCREMENT,
  `idcategoria` int(11) NOT NULL,
  `nombreproducto` text NOT NULL,
  `principiosactivos` text NOT NULL,
  `formafarmaceutica` text NOT NULL,
  `descripcion` text NOT NULL,
  `fechavencimiento` date NOT NULL,
  PRIMARY KEY (`idproducto`),
  KEY `fk_idcategoria_prod` (`idcategoria`),
  CONSTRAINT `fk_idcategoria_prod` FOREIGN KEY (`idcategoria`) REFERENCES `categorias` (`idcategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=507 DEFAULT CHARSET=utf8mb4;

/*Data for the table `productos` */

insert  into `productos`(`idproducto`,`idcategoria`,`nombreproducto`,`principiosactivos`,`formafarmaceutica`,`descripcion`,`fechavencimiento`) values 
(1,4,'<p><span style=\"color: rgb(0, 0, 0); background-color: rgb(241, 196, 15);\">ACICLAV 1 GR</span></p>','<p>AMOXICILINA + ACIDO CLAVULANICO</p>','<p>TABLETA</p>','<p>PR&Oacute;XIMO A VENCER</p>','2023-04-30'),
(2,9,'<p>ACIDO FOLICO 0.5 MG</p>','<p>ACIDO FOLICO</p>','<p>TABLETA</p>','<p>.</p>','2024-05-30'),
(3,15,'<p>ACICLOVIR 200 MG</p>','<p>ACICLOVIR&nbsp;</p>','<p>TABLETA</p>','<p>.</p>','2024-01-30'),
(5,5,'<p>AFLAXIL 550 MG</p>','<p>NAPROXENO</p>','<p>TABLETA</p>','<p>.</p>','2023-07-30'),
(6,12,'<p>ATENOLOL 100 MG</p>','<p>ATENOLOL 100 MG</p>','<p>TABLETA</p>','<p>.</p>','2023-07-30'),
(7,7,'<p>ALBENDAZOL 200 MG</p>','<p>ALBENDAZOL&nbsp;</p>','<p>TABLETA</p>','<p>.</p>','2024-08-30'),
(8,7,'<p>ALBISEC 166.66 + 33.33 MG</p>','<p>ITRACONAZOL + SECNIDAZOL</p>','<p>TABLETA</p>','<p>.</p>','2023-08-30'),
(9,3,'<p>ALERGILAB 5 MG</p>','<p>LEVOCETIRIZINA</p>','<p>TABLETA</p>','<p>.</p>','2024-07-30'),
(10,14,'<p>AMARYL 2 MG</p>','<p>GLIMEPIRIDA</p>','<p>TABLETA</p>','<p>.</p>','2023-08-30'),
(11,5,'<p><span style=\"color: rgb(0, 0, 0); background-color: rgb(241, 196, 15);\">ANAFLEX MUJER 200 MG</span></p>','<p>IBUPROFENO</p>','<p>CAPSULA</p>','<p>PR&Oacute;XIMO A VENCER</p>','2023-04-10'),
(12,4,'<p>AMOXICILINA 500 MG</p>','<p>AMOXICILINA</p>','<p>TABLETA</p>','<p>TABLETA</p>','2025-04-30'),
(13,4,'<p>AMPICILINA 500 MG</p>','<p>AMPICILINA&nbsp;</p>','<p>TABLETA</p>','<p>.</p>','2024-02-28'),
(14,4,'<p>AMOXIDIN 500 MG</p>','<p>AMOXICILINA&nbsp;</p>','<p>TABLETA</p>','<p>.</p>','2023-07-30'),
(15,4,'<p>AMOXICILINA + ACIDO CLAVUL&Aacute;NICO 500 + 125 MG</p>','<p>AMOXICILINA + ACIDO CLAVUL&Aacute;NICO</p>','<p>TABLETA</p>','<p>.</p>','2025-04-30'),
(16,12,'<p>AMLODIPINO 5 MG</p>','<p>AMLODIPINO</p>','<p>TABLETA</p>','<p>.</p>','2024-02-28'),
(17,5,'<p>ANTALGINA 500 MG</p>','<p>METAMIZOL</p>','<p>TABLETA</p>','<p>.</p>','2024-05-30'),
(18,9,'<p>ANEURIN FORTE NF</p>','<p>PIRIDOXINA + TIAMINA + CIANOCOBALAMINA</p>','<p>TABLETA</p>','<p>.</p>','2023-12-30'),
(19,9,'<p>ARTHROCEN 300 MG</p>','<p>EXTRACTO TOTAL DE INSAPONIFICABLE AGUACATE/SOYA</p>','<p>CAPSULA</p>','<p>.</p>','2025-01-30'),
(20,5,'<p>ARTRIPLUS 10 MG</p>','<p>METOTREXATO</p>','<p>TABLETA</p>','<p>.</p>','2025-02-28'),
(21,5,'<p>ARTICOX 200 MG</p>','<p>CELECOXIB</p>','<p>TABLETA</p>','<p>.</p>','2024-02-28'),
(22,5,'<p>APROXEN 550 MG</p>','<p>NAPROXENO</p>','<p>TABLETA</p>','<p>.</p>','2023-03-30'),
(23,5,'<p>APRONAX 550 MG</p>','<p>NAPROXENO</p>','<p>TABLETA</p>','<p>.</p>','2023-11-30'),
(25,6,'<p>ATORVASTATINA 20 MG</p>','<p>ATORVASTATINA</p>','<p>TABLETA</p>','<p>.</p>','2024-09-30'),
(28,12,'<p>BISOPSI 5 MG</p>','<p>BISOPROLOL</p>','<p>TABLETA</p>','<p>.</p>','2024-05-30'),
(29,4,'<p>BIOLEVF 750 MG</p>','<p>LEVOFLOXACINO</p>','<p>TABLETA</p>','<p>.</p>','2026-02-28'),
(30,8,'<p>BISMUTOL 262 MG</p>','<p>SUBSALICILATO DE BISMUTO</p>','<p>TABLETA</p>','<p>.</p>','2025-03-30'),
(32,8,'<p>BONAZOL 20 MG</p>','<p>ESOMEPRAZOL</p>','<p>TABLETA</p>','<p>.</p>','2023-09-30'),
(33,8,'<p>BONAZOL 40 MG</p>','<p>ESOMEPRAZOL</p>','<p>TABLETA</p>','<p>.</p>','2023-12-30'),
(34,4,'<p>CEFADROXILO 500 MG</p>','<p>CEFADROXILO</p>','<p>TABLETA</p>','<p>.</p>','2024-09-30'),
(35,12,'<p>CAPTOPRIL 25 MG</p>','<p>CAPTOPRIL</p>','<p>TABLETA</p>','<p>.</p>','2024-09-30'),
(36,4,'<p>CLARIXLAB 500 MG</p>','<p>CLARITROMICINA</p>','<p>TABLETA</p>','<p>.</p>','2023-06-30'),
(37,3,'<p>CLAROL 10 MG</p>','<p>LORATADINA</p>','<p>TABLETA</p>','<p>.</p>','2023-07-30'),
(38,4,'<p>CEFALEXINA 500 MG</p>','<p>CEFALEXINA</p>','<p>TABLETA</p>','<p>.</p>','2025-01-30'),
(39,4,'<p>CEFACLOR 500 MG</p>','<p>CEFACLOR</p>','<p>TABLETA</p>','<p>.</p>','2024-01-30'),
(40,4,'<p>CEFUROXIMA 500 MG</p>','<p>CEFUROXIMA</p>','<p>TABLETA</p>','<p>.</p>','2025-03-30'),
(41,5,'<p>CELGESE 10 MG</p>','<p>KETOROLACO</p>','<p>TABLETA</p>','<p>.</p>','2023-10-30'),
(42,4,'<p>CIMOCAL 500 MG</p>','<p>CIPROFLOXACINO</p>','<p>TABLETA</p>','<p>.</p>','2024-06-30'),
(43,6,'<p>CIPROFIBRATO 100 MG</p>','<p>CIPROFIBRATO</p>','<p>TABLETA</p>','<p>.</p>','2024-11-30'),
(44,4,'<p>CLINCHECK 300 MG</p>','<p>CLINDAMICINA</p>','<p>TABLETA</p>','<p>.</p>','2023-02-28'),
(45,4,'<p>CLINDAMICINA 300 MG</p>','<p>CLINDAMICINA&nbsp;</p>','<p>TABLETA</p>','<p>.</p>','2024-10-30'),
(46,6,'<p>CONTROLIP 160 MG</p>','<p>FENOFIBRATO</p>','<p>TABLETA</p>','<p>.</p>','2023-10-30'),
(48,12,'<p>CLOPIDROGEL 75 MG</p>','<p>CLOPIDROGEL</p>','<p>TABLETA</p>','<p>.</p>','2023-09-30'),
(49,12,'<p>CORENTEL 2.5 MG</p>','<p>BISOPROLOL</p>','<p>TABLETA</p>','<p>.</p>','2024-08-30'),
(50,9,'<p>DAYAMINERAL</p>','<p>Vitamina A; D; C;&nbsp;B12; Nicotinamida; Tiamina; Riboflavina;&nbsp;Piridoxina; Pantotenol; Bitartrato de Colina; Inositol; Gluconato Ferroso; Lactato<br>de Calcio; Hipofosfito de Calcio;&nbsp;Manganeso; Zinc;&nbsp;Magnesio; Potasio.</p>','<p>TABLETA Y JARABE</p>','<p>.</p>','2023-07-30'),
(51,5,'<p>DXA FOUR 4 MG</p>','<p>DEXAMETASONA&nbsp;</p>','<p>TABLETA</p>','<p>.</p>','2023-08-30'),
(52,12,'<p>DAFL&Oacute;N 500 MG</p>','<p>DIOSMINA + HESPERIDINA</p>','<p>TABLETA</p>','<p>.</p>','2023-11-30'),
(53,5,'<p>DEFLAZYN 6 MG</p>','<p>DEFLAZACORT</p>','<p>TABLETA</p>','<p>.</p>','2024-09-30'),
(54,5,'<p><span style=\"background-color: rgb(241, 196, 15);\">DEXALAB 4 MG</span></p>','<p>DEXAMETASONA</p>','<p>TABLETA</p>','<p>PROXIMO A VENCER</p>','2023-03-30'),
(55,5,'<p>DESAZONA 4 MG</p>','<p>DEXAMETASONA</p>','<p>TABLETA</p>','<p>.</p>','2023-08-30'),
(56,4,'<p><span style=\"background-color: rgb(241, 196, 15);\">DEQUAZOL ORAL 500 MG</span></p>','<p>METRONIDAZOL</p>','<p>TABLETA</p>','<p>PR&Oacute;XIMO A VENCER</p>','2023-05-30'),
(57,5,'<p><span style=\"background-color: rgb(241, 196, 15);\">DEXPHARM 4 MG</span></p>','<p>DEXAMETASONA</p>','<p>TABLETA</p>','<p>PR&Oacute;XIMO A VENCER</p>','2023-05-30'),
(58,4,'<p>DICLOXACILINA 500 MG</p>','<p>DICLOXACILINA</p>','<p>TABLETA</p>','<p>.</p>','2024-05-30'),
(59,5,'<p><span style=\"background-color: rgb(241, 196, 15);\">DI-KEFEPROF 150 MG</span></p>','<p>KETOPROFENO</p>','<p>TABLETA</p>','<p>PR&Oacute;XIMO A VENCER</p>','2023-06-30'),
(60,5,'<p>DOLO TENSODOX 5 + 15 MG</p>','<p>CICLOBENZAPRINA + MELOXICAM</p>','<p>TABLETA</p>','<p>.</p>','2023-08-30'),
(61,11,'<p>DIGESTASE 80 MG</p>','<p>SIMETICONA</p>','<p>TABLETA MASTICABLE</p>','<p>.</p>','2024-01-30'),
(62,4,'<p>DOXIPLUS 100 MG</p>','<p>DOXICICLINA</p>','<p>TABLETA</p>','<p>.</p>','2024-02-28'),
(63,5,'<p>DOLXICAM 15 MG</p>','<p>MELOXICAM</p>','<p>TABLETA</p>','<p>.</p>','2023-11-30'),
(64,12,'<p>DOBEXILAB 500 MG</p>','<p>DOBESILATO C&Aacute;LCICO</p>','<p>TABLETA</p>','<p>.</p>','2024-03-30'),
(65,11,'<p>DONAMED F 2 MG</p>','<p>LOPERAMIDA</p>','<p>TABLETA</p>','<p>.</p>','2025-01-30'),
(66,5,'<p>DOLO NEUROBION FORTE&nbsp;</p>','<p>DICLOFENACO + TIAMINA + PIRIDOXINA + CIANOCOBALAMINA</p>','<p>TABLETA</p>','<p>.</p>','2023-10-30'),
(67,8,'<p>EPRAZ 40 MG</p>','<p>ESOMEPRAZOL</p>','<p>TABLETA</p>','<p>.</p>','2024-07-30'),
(68,8,'<p>EPRAZ 20 MG</p>','<p>ESOMEPRAZOL</p>','<p>TABLETA</p>','<p>.</p>','2025-01-30'),
(71,11,'<p>ENZIMATIK</p>','<p>ENZIMAS DIGESTIVAS, METOCLOPRAMIDA, SIMETICONA</p>','<p>TABLETA</p>','<p>.</p>','2024-02-28'),
(72,12,'<p><span style=\"background-color: rgb(241, 196, 15);\">ESPIRONOLACTONA 25 MG</span></p>','<p>ESPIRONOLACTONA</p>','<p>TABLETA</p>','<p>PR&Oacute;XIMO A VENCER</p>','2023-04-30'),
(73,16,'<p>AZOCEFASABAL 100 MG</p>','<p>FENAZOPIRIDINA</p>','<p>TABLETA</p>','<p>.</p>','2025-01-30'),
(74,16,'<p>BLADOXATO 200 MG</p>','<p>FLAVOXATO</p>','<p>TABLETA</p>','<p>.</p>','2024-05-30'),
(75,18,'<p>BRUNELLE&nbsp;</p>','<p>ACETATO DE CLORMADINONA + ETINILESTRADIOL&nbsp;</p>','<p>TABLETA</p>','<p>.</p>','2023-10-30'),
(76,17,'<p>BUSCAPINA&nbsp;</p>','<p>BUTILBROMURO DE HIOSCINA + PARACETAMOL</p>','<p>TABLETA</p>','<p>.</p>','2025-06-30'),
(77,16,'<p>CEFASABAL</p>','<p>SABAL SERRULATA + AESCULUS HIPPOCASTANUM + SOLIDAGO VIRGAUREA</p>','<p>TABLETA</p>','<p>.</p>','2024-08-30'),
(78,16,'<p>CLINDESS DUO</p>','<p>CLINDAMICINA + KETOCONAZOL</p>','<p>&Oacute;VULO</p>','<p>.</p>','2023-12-30'),
(79,19,'<p>CONIMEZOL 150 MG</p>','<p>FLUCONAZOL</p>','<p>TABLETA</p>','<p>.</p>','2024-01-30'),
(80,16,'<p>CLUVAX&nbsp;</p>','<p>CLOTRIMAZOL + CLINDAMICINA</p>','<p>&Oacute;VULO</p>','<p>.</p>','2023-08-30'),
(81,18,'<p>DIXI 35</p>','<p>CIPROTERONA + ETINILESTRADIOL</p>','<p>TABLETA</p>','<p>.</p>','2023-10-30'),
(82,5,'<p><span style=\"background-color: rgb(241, 196, 15);\">ETORIGLOB 120 MG</span></p>','<p>ETORICOXIB</p>','<p>TABLETA</p>','<p>PR&Oacute;XIMO A VENCER</p>','2023-06-30'),
(83,5,'<p>ETORIGLOB 90 MG</p>','<p>ETORICOXIB</p>','<p>TABLETA</p>','<p>.</p>','2024-04-30'),
(84,18,'<p>EUTIROX 25 MCG</p>','<p>LEVOTIROXINA</p>','<p>TABLETA</p>','<p>.</p>','2025-02-28'),
(85,18,'<p>EUTIROX 50 MCG</p>','<p>LEVOTIROXINA</p>','<p>TABLETA</p>','<p>.</p>','2024-12-30'),
(86,18,'<p>EUTIROX 75 MCG</p>','<p>LEVOTIROXINA</p>','<p>TABLETA</p>','<p>.</p>','2024-11-30'),
(87,9,'<p><span style=\"background-color: rgb(241, 196, 15);\">FERANIN 100 MG</span></p>','<p>HIERRO</p>','<p>GRAGEAS</p>','<p>PR&Oacute;XIMO A VENCER</p>','2023-06-30'),
(88,5,'<p>ETOSHINE 60 MG</p>','<p>ETORICOXIB</p>','<p>TABLETA</p>','<p>.</p>','2023-07-30'),
(89,3,'<p>FERNIDEL 10 MG</p>','<p>CETIRIZINA&nbsp;</p>','<p>TABLETA</p>','<p>.</p>','2024-01-30'),
(90,6,'<p>FENOBRAT 160 MG</p>','<p>FENOFIBRATO</p>','<p>TABLETA</p>','<p>.</p>','2024-10-30'),
(91,11,'<p>FLORATIL 250 MG</p>','<p>SACCHAROMYCES BOULARDII</p>','<p>TABLETA&nbsp;</p>\n<p>&nbsp;</p>','<p>.</p>','2025-02-28'),
(92,4,'<p>FLOXALID 500 MG</p>','<p>LEVOFLOXACINO</p>','<p>TABLETA</p>','<p>.</p>','2024-04-30'),
(93,2,'<p>FLUIBRONCOL 600 MG</p>','<p>ACETILCISTEINA</p>','<p>POLVO</p>','<p>.</p>','2024-06-30'),
(94,7,'<p>GARDIL 500 MG</p>','<p>NITAZOXANIDA</p>','<p>TABLETA</p>','<p>.</p>','2024-02-28'),
(95,15,'<p>GABAPENTINA 300 MG</p>','<p>GABAPENTINA</p>','<p>TABLETA</p>','<p>.</p>','2024-11-30'),
(96,6,'<p>GEMFIBROZILO 600 MG</p>','<p>GEMFIBROZILO</p>','<p>TABLETA</p>','<p>.</p>','2024-10-30'),
(97,9,'<p>GEROMUCOVIT</p>','<p>vitamina A, E, C, B1, B2, B6, pantotenato de calcio.</p>','<p>TABLETA</p>','<p>.</p>','2023-08-30'),
(98,11,'<p>GASEOVET MS</p>','<p>MAGALDRATO + SIMETICONA</p>','<p>TABLETA MASTICABLE</p>','<p>.</p>','2023-11-30'),
(99,14,'<p>GLIBENCLAMIDA 5 MG</p>','<p>GLIBENCLAMIDA</p>','<p>TABLETA</p>','<p>.</p>','2024-04-30'),
(100,11,'<p>FRUTENZIMA</p>','<p>metoclopramida, simeticona, &aacute;cido dehidroc&oacute;lico, pancreatina, celulosa, pepsina, lipasa, amilasa.&nbsp;</p>','<p>CAPSULA</p>','<p>.</p>','2024-01-30'),
(101,7,'<p>GYNFLU</p>','<p>FLUCONAZOL + SECNIDAZOL</p>','<p>TABLETA</p>','<p>.</p>','2023-07-30'),
(102,9,'<p>HEPABIONTA</p>','<p>BIOTINA, COMPLEJO B, LIP&Oacute;ICO, &Aacute;CIDO, OR&Oacute;TIC, &Aacute;CIDO, RUTINA, VITAMINA B2, VITAMINA B3 (NICOT&Iacute;NICO, &Aacute;CIDO, NIACINA, NIACINAMIDA, NICOTINAMIDA), VITAMINA E</p>','<p>GRAGEAS</p>','<p>.</p>','2024-10-30'),
(103,12,'<p>HIDROCLOROTIAZIDA 25 MG</p>','<p>HIDROCLOROTIAZIDA</p>','<p>TABLETA</p>','<p>.</p>','2024-07-30'),
(105,17,'<p>HIOSIMOL COMPUESTO</p>','<p>HIOSCINA + PARACETAMOL</p>','<p>TABLETA</p>','<p>.</p>','2024-05-30'),
(106,1,'<p><span style=\"background-color: rgb(241, 196, 15);\">HISTAGRIP</span></p>','<p>PARACETAMOL + DEXTROMETORFANO + FENILEFRINA</p>','<p>TABLETA</p>','<p>PR&Oacute;XIMO A VENCER</p>','2023-06-30'),
(107,19,'<p>ITRACONAZOL 100 MG</p>','<p>ITRACONAZOL</p>','<p>TABLETA</p>','<p>.</p>','2024-04-30'),
(108,5,'<p>IBUPROFENO 400 MG</p>','<p>IBUPROFENO</p>','<p>TABLETA</p>','<p>.</p>','2024-02-28'),
(109,12,'<p>ISORBIDE SUBLINGUAL 5 MG</p>','<p>DINITRATO DE ISORBIDE</p>','<p>TABLETA</p>','<p>.</p>','2023-08-30'),
(110,12,'<p>ISORBIDE ORAL 10 MG</p>','<p>DINITRATO DE ISORBIDE</p>','<p>TABLETA</p>','<p>.</p>','2024-08-30'),
(111,14,'<p>JANUMET 50 + 100 MG</p>','<p>SITAGLIPTINA + METFORMINA</p>','<p>TABLETA</p>','<p>PR&Oacute;XIMO A VENCER</p>','2023-05-30'),
(112,6,'<p>KETSIC 100 MG</p>','<p>CIPROFIBRATO</p>','<p>TABLETA</p>','<p>.</p>','2024-03-30'),
(113,5,'<p>KETESSE 25 MG</p>','<p>DEXKETOPROFENO</p>','<p>TABLETA</p>','<p>.</p>','2023-12-30'),
(114,5,'<p>KETOFENID 100 MG</p>','<p>KETOPROFENO</p>','<p>TABLETA</p>','<p>.</p>','2024-10-30'),
(115,1,'<p><span style=\"background-color: rgb(241, 196, 15);\">KITAGRIP</span></p>','<p>PARACETAMOL + FENILEFRINA +&nbsp; DEXTROMETORFANO + BROMHEXINA</p>','<p>TABLETA</p>','<p>PR&Oacute;XIMO A VENCER</p>','2023-06-30'),
(117,19,'<p>KETOCONAZOL 200 MG</p>','<p>KETOCONAZOL</p>','<p>TABLETA</p>','<p>.</p>','2025-03-30'),
(118,15,'<p>LABOPAN</p>','<p>Dihidroergotamina + propifenazona + cafe&iacute;na</p>','<p>TABLETA</p>','<p>.</p>','2023-11-30'),
(119,15,'<p>KITADOL MIGRA&Ntilde;A</p>','<p>PARACETAMOL + CAFEINA</p>','<p>TABLETA</p>','<p>.</p>','2024-04-30'),
(120,8,'<p>LANSOPRAZOL 30 MG</p>','<p>LANSOPRAZOL</p>','<p>TABLETA</p>','<p>.</p>','2024-02-28'),
(121,4,'<p>LEVOFLOXACINO 500 MG</p>','<p>LEVOFLOXACINO</p>','<p>TABLETA</p>','<p>.</p>','2025-03-30'),
(122,3,'<p>LORATADINA 10 MG</p>','<p>LORATADINA</p>','<p>TABLETA</p>','<p>.</p>','2024-01-30'),
(123,12,'<p>LOSARTAN 50 MG</p>','<p>LOSARTAN</p>','<p>TABLETA</p>','<p>.</p>','2025-04-30'),
(124,4,'<p>LINCOMICINA 500 MG</p>','<p>LINCOMICINA</p>','<p>TABLETA</p>','<p>.</p>','2024-01-30'),
(125,6,'<p>LIPIPRESS 20 MG</p>','<p>ATORVASTATINA</p>','<p>TABLETA</p>','<p>.</p>','2023-11-30'),
(126,6,'<p>LIPIPRESS 40 MG</p>','<p>ATORVASTATINA</p>','<p>TABLETA</p>','<p>.</p>','2024-03-30'),
(127,6,'<p>LOPID 600 MG</p>','<p>GEMFIBROZILO</p>','<p>TABLETA</p>','<p>.</p>','2023-09-30'),
(128,15,'<p>MACUVIT</p>','<p>Lute&iacute;na 5 mg, Zeaxantina 1 mg, Omega-3: DHA 188,75mg y EPA 264,25 mg, Vitamina A 750 &mu;g RE, Vitamina C 30 mg, Vitamina E 15 mg, Zinc 12 mg, Cobre 1mg, Selenio 20&mu;g, Manganeso 2,5 mg.</p>','<p>CAPSULAS BLANDAS</p>','<p>.</p>','2024-03-30'),
(129,11,'<p>MEDRAVOL 50 MG</p>','<p>DIMENHIDRINATO</p>','<p>TABLETA</p>','<p>.</p>','2024-01-30'),
(130,4,'<p>METRONIDAZOL 500 MG</p>','<p>METRONIDAZOL</p>','<p>TABLETA</p>','<p>.</p>','2025-07-30'),
(131,15,'<p><span style=\"background-color: rgb(241, 196, 15);\">MEDROL 16 MG</span></p>','<p>METILPREDNISOLONA</p>','<p>TABLETA</p>','<p>PR&Oacute;XIMO A VENCER</p>','2023-06-30'),
(132,4,'<p>MACRODANTINA 100 MG</p>','<p>NITROFURANTOINA</p>','<p>TABLETA</p>','<p>.</p>','2023-03-30'),
(133,11,'<p>METOCLOPRAMIDA 10 MG</p>','<p>METOCLOPRAMIDA</p>','<p>TABLETA</p>','<p>.</p>','2025-01-30'),
(134,15,'<p>MICROSER 16 MG</p>','<p>BETAHISTINA</p>','<p>TABLETA</p>','<p>.</p>','2024-02-28'),
(136,15,'<p>MIGRADEL</p>','<p>Paracetamol 250 mg. &Aacute;cido acetilsalic&iacute;lico 250 mg. Cafe&iacute;na 65 mg</p>','<p>TABLETA</p>','<p>.</p>','2023-08-30'),
(137,15,'<p>MIGRADORIXINA</p>','<p>PARACETAMOL + CAFEINA + ERGOTAMINA</p>','<p>TABLETA</p>','<p>.</p>','2023-11-30'),
(138,15,'<p><span style=\"background-color: rgb(241, 196, 15);\">MISOPROLEN 200 MCG</span></p>','<p>MISOPROSTOL</p>','<p>TABLETA</p>','<p>PR&Oacute;XIMO A VENCER</p>','2023-04-30'),
(139,5,'<p>MIODROL 100 MG</p>','<p>ORFENADRINA</p>','<p>TABLETA</p>','<p>.</p>','2024-04-30'),
(140,4,'<p>MYCTRIN FORTE</p>','<p>SULFAMETOXAZOL + TRIMETOPRIMA</p>','<p>TABLETA</p>','<p>.</p>','2024-04-30'),
(141,2,'<p>MONTELUKAST 10 MG</p>','<p>MONTELUKAST</p>','<p>TABLETA</p>','<p>.</p>','2025-01-30'),
(142,11,'<p>MUVETT S</p>','<p>TRIMEBUTINA 200 MG + SIMETICONA 120 MG</p>','<p>TABLETA</p>','<p>.</p>','0025-03-30'),
(143,1,'<p>NASTIZOL JUNIOR</p>','<p>PARACETAMOL + FENILEFRINA + CLORFENAMINA</p>','<p>TABLETA</p>','<p>.</p>','2023-08-30'),
(144,5,'<p>NAPROXENO 550 MG</p>','<p>NAPROXENO</p>','<p>TABLETA</p>','<p>.</p>','2024-03-30'),
(145,11,'<p>NEUCINET S 200 MG</p>','<p>TRIMEBUTINA</p>','<p>TABLETA</p>','<p>.</p>','2024-10-30'),
(146,16,'<p>NICOVEL &Oacute;VULO</p>','<p>MICONAZOL + TINIDAZOL</p>','<p>TABLETA</p>','<p>.</p>','2024-07-30'),
(147,2,'<p><span style=\"background-color: rgb(241, 196, 15);\">NISACORTEC 50 MG</span></p>','<p>PREDNISONA</p>','<p>TABLETA</p>','<p>PR&Oacute;XIMO A VENCER</p>','2023-06-30'),
(148,2,'<p><span style=\"background-color: rgb(241, 196, 15);\">NISACORTEC 20 MG</span></p>','<p>PREDNISONA</p>','<p>TABLETA</p>','<p>PR&Oacute;XIMO A VENCER</p>','2023-06-30'),
(149,5,'<p>NORFLEX PLUS</p>','<p>ORFENADRINA + PARACETAMOL&nbsp;</p>','<p>TABLETA</p>','<p>.</p>','2024-02-28'),
(150,9,'<p>OMEGA 3</p>','<p>OMEGA 3</p>','<p>CAPSULA</p>','<p>.</p>','2024-04-30'),
(151,15,'<p>PANADOL FORTE</p>','<p>PARACETAMOL + CAFEINA</p>','<p>TABLETA</p>','<p>.</p>','2024-03-30'),
(152,8,'<p><span style=\"background-color: rgb(241, 196, 15);\">PANTOPRAZOL 40 MG</span></p>','<p>PANTOPRAZOL</p>','<p>TABLETA</p>','<p>PR&Oacute;XIMO A VENCER</p>','2023-04-30'),
(153,16,'<p>PARIS 5 MG</p>','<p>TADALAFILO</p>','<p>TABLETA</p>','<p>.</p>','2024-01-30'),
(154,5,'<p><span style=\"background-color: rgb(241, 196, 15);\">PARACETAMOL 500 MG</span></p>','<p>PARACETAMOL</p>','<p>TABLETA</p>','<p>PR&Oacute;XIMO A VENCER</p>','2023-05-30'),
(155,5,'<p>PARACETAMOL 1 GR</p>','<p>PARACETAMOL</p>','<p>TABLETA</p>','<p>.</p>','2024-05-30'),
(157,2,'<p>PREDNISONA 50 MG</p>','<p>PREDNISONA&nbsp;</p>','<p>TABLETA</p>','<p>.</p>','2023-07-30'),
(158,2,'<p>PREDNISONA 20 MG</p>','<p>PREDNISONA</p>','<p>TABLETA</p>','<p>.</p>','2023-07-30'),
(159,15,'<p>PREGADOL 150 MG</p>','<p>PREGABALINA</p>','<p>TABLETA</p>','<p>.</p>','2024-06-06'),
(162,12,'<p>PENTOXIFILINA 400 MG</p>','<p>PENTOXIFILINA</p>','<p>TABLETA</p>','<p>.</p>','2023-08-30'),
(163,9,'<p>PREVENCEL</p>','<p>BETACAROTENO, COBRE, MANGANESO, SELENIO, VITAMINA C (&Aacute;CIDO ASC&Oacute;RBICO), VITAMINA E (TOCOFEROL), ZINC</p>','<p>TABLETA</p>','<p>PR&Oacute;XIMO A VENCER</p>','2023-03-30'),
(164,2,'<p><span style=\"background-color: rgb(241, 196, 15);\">PIEMONTE 5 MG</span></p>','<p>MONTELUKAST</p>','<p>TABLETA</p>','<p>PR&Oacute;XIMO A VENCER</p>','2023-05-30'),
(165,16,'<p><span style=\"background-color: rgb(241, 196, 15);\">PYRIDIUM 100 MG</span></p>','<p>FENAZOPIRIDINA</p>','<p>TABLETA</p>','<p>PR&Oacute;XIMO A VENCER</p>','2023-04-30'),
(168,12,'<p>PROPANOLOL 40 MG</p>','<p>PROPANOLOL</p>','<p>TABLETA</p>','<p>.</p>','2025-05-30'),
(169,16,'<p><span style=\"background-color: rgb(241, 196, 15);\">PONSTAN 220 MG</span></p>','<p>NAPROXENO S&Oacute;DICO</p>','<p>TABLETA</p>','<p>PR&Oacute;XIMO A VENCER</p>','2023-04-30'),
(170,4,'<p>PLUXIME 400 MG</p>','<p>CEFIXIMA</p>','<p>TABLETA</p>','<p>PR&Oacute;XIMO A VENCER</p>','2023-05-30'),
(171,8,'<p>RANITIDINA 300 MG</p>','<p>RANITIDINA</p>','<p>TABLETA</p>','<p>.</p>','2025-05-30'),
(172,16,'<p>RETEVEN 5 MG</p>','<p>OXIBUTININA</p>','<p>TABLETA</p>','<p>.</p>','2024-08-30'),
(174,5,'<p>REPRIMAN 500 MG</p>','<p>METAMIZOL S&Oacute;DICO</p>','<p>TABLETA</p>','<p>.</p>','2023-07-30'),
(175,4,'<p>RICILINA 500 MG</p>','<p>AZITROMICINA</p>','<p>TABLETA</p>','<p>TABLETA</p>','2024-05-30'),
(176,15,'<p>ROWATINEX</p>','<p>Pineno 31 mg; Canfeno 15 mg: Borneol 10 mg; Anetol 4 mg; Fenchona 4 mg; Cineol 3 mg; Aceite de Oliva</p>','<p>CAPSULA BLANDA</p>','<p>.</p>','2026-06-30'),
(177,15,'<p>ROWACHOL PERLA</p>','<p>Pineno 17 mg ,Canfeno 5 mg,&nbsp;Cineol 2 mg,&nbsp;Mentol 32 mg,&nbsp;Mentona 6 mg,&nbsp;Borneol 5 mg,&nbsp;Aceite de Oliva 33 mg.</p>','<p>CAPSULA</p>','<p>.</p>','2023-11-30'),
(178,18,'<p>SELENE</p>','<p>ETINILESTRADIOL + ACETATO DE CIPROTERONA</p>','<p>TABLETA</p>','<p>.</p>','2023-07-30'),
(179,6,'<p>SIMITRI 145 + 40 MG</p>','<p>FENOFIBRATO + SINVASTATINA</p>','<p>TABLETA</p>','<p>.</p>','2023-10-30'),
(180,15,'<p><span style=\"background-color: rgb(241, 196, 15);\">SULFATO FERROSO 300 MG</span></p>','<p>SULFATO FERROSO</p>','<p>TABLETA</p>','<p>PR&Oacute;XIMO A VENCER</p>','2023-05-30'),
(181,5,'<p>SUPRACALM 1 GR</p>','<p>PARACETAMOL</p>','<p>TABLETA</p>','<p>.</p>','2024-11-30'),
(182,16,'<p>TRANSAMIN 250 MG</p>','<p>&Aacute;CIDO TRANEX&Aacute;MICO</p>','<p>TABLETA</p>','<p>.</p>','2024-09-30'),
(183,16,'<p>TAMSULOSINA 0.4 MG</p>','<p>TAMSULOSINA</p>','<p>TABLETA</p>','<p>.</p>','2024-04-30'),
(184,16,'<p>TAMSULON DUO 0.5 + 0.4 MG</p>','<p>DUTASTERIDA + TAMSULOSINA</p>','<p>TABLETA</p>','<p>.</p>','2023-11-30'),
(185,19,'<p>TERBILAB 250 MG</p>','<p>TERBINAFINA</p>','<p>TABLETA</p>','<p>PR&Oacute;XIMO A VENCER</p>','2023-03-30'),
(186,11,'<p>TOP DEL FORTE</p>','<p>NIFUROXAZIDA + ATAPULGITA ACTIVADA</p>','<p>TABLETA</p>','<p>PR&Oacute;XIMO A VENCER</p>','2023-05-30'),
(187,15,'<p>UROCIT K</p>','<p>CITRATO DE POTASIO</p>','<p>TABLETA</p>','<p>.</p>','2025-01-30'),
(188,15,'<p>VARPEM 500 MG</p>','<p>CITICOLINA</p>','<p>TABLETA</p>','<p>.</p>','2024-01-30'),
(189,4,'<p>TRIMAX 500 MG</p>','<p>AZITROMICINA</p>','<p>TABLETA</p>','<p>.</p>','2023-07-30'),
(190,4,'<p><span style=\"background-color: rgb(241, 196, 15);\">ZITROLAB 500 MG</span></p>','<p>AZITROMICINA</p>','<p>TABLETA</p>','<p>PR&Oacute;XIMO A VENCER</p>','2023-06-30'),
(191,12,'<p>VEDIPAL 450 + 50 MG</p>','<p>DIOSMINA + HESPERIDINA</p>','<p>TABLETA</p>','<p>.</p>','2024-07-30'),
(192,7,'<p>ZENTEL 400 MG</p>','<p>ALBENDAZOL</p>','<p>TABLETA</p>','<p>PR&Oacute;XIMO A VENCER</p>','2023-04-30'),
(193,7,'<p><span style=\"background-color: rgb(241, 196, 15);\">ZENTEL 400 MG</span></p>','<p>ALBENDAZOL</p>','<p>TABLETA</p>','<p>PR&Oacute;XIMO A VENCER</p>','0023-04-30'),
(194,8,'<p>ZOLPREX 20 MG</p>','<p>OMEPRAZOL&nbsp;</p>','<p>CAPSULA</p>','<p>.</p>','2023-12-30'),
(195,2,'<p>ABRILAR</p>','<p>HEDERA HELIX</p>','<p>JARABE</p>','<p>.</p>','2023-07-30'),
(196,15,'<p>ACARIL -S 30%</p>','<p>BENZOATO DE BENCILO</p>','<p>LOCI&Oacute;N</p>','<p>.</p>','2023-08-30'),
(197,8,'<p>ACI BASIC 400 MG/30MG/5 MG 220 ML</p>','<p>MAGALDRATO + SIMETICONA</p>','<p>SUSPENSION</p>','<p>.</p>','2024-10-30'),
(198,3,'<p>ALERFREE-C</p>','<p>CETIRIZINA</p>','<p>JARABE</p>','<p>.</p>','2025-05-30'),
(199,3,'<p>ALLEGRA 30 MG/5ML</p>','<p>FEXOFENADINA</p>','<p>SUSPENSION</p>','<p>.</p>','2023-12-30'),
(200,4,'<p><span style=\"background-color: rgb(255, 255, 255);\">AMOXICILINA 250 MG/5ML</span></p>','<p>AMOXICILINA</p>','<p>SUSPENSI&Oacute;N</p>','<p>PR&Oacute;XIMO A VENCER</p>','2023-06-30'),
(201,2,'<p>AMBROXOL 30MG/5ML</p>','<p>AMBROXOL&nbsp;</p>','<p>JARABE</p>','<p>.</p>','2024-06-30'),
(202,4,'<p>AUGMOX 250MG/62.5 MG/5ML</p>','<p>AMOXICILINA + &Aacute;CIDO CLAVUL&Aacute;NICO</p>','<p>SUSPENSI&Oacute;N</p>','<p>.</p>','2024-05-30'),
(203,10,'<p>AVAMYS 27.5 MCG/DOSIS</p>','<p>FLUTICASONA</p>','<p>SUSPENSION EN SPRAY NASAL</p>','<p>.</p>','2024-03-30'),
(204,4,'<p>AZITROMAC 200MG/5ML</p>','<p>AZITROMICINA</p>','<p>SUSPENSION</p>','<p>.</p>','2025-07-30'),
(205,4,'<p>BACTEROL INFANTIL 200 MG/40 MG/5 ML</p>','<p>SULFAMETOXAZOL + TRIMETOPRIMA</p>','<p>SUSPENSI&Oacute;N</p>','<p>.</p>','2024-03-30'),
(206,9,'<p>B-COMPLEX</p>','<p>COMPLEJO B</p>','<p>TABLETAS EFERVESCENTE&nbsp;</p>','<p>.</p>','2023-12-30'),
(208,10,'<p>BROMURO DE IPATROPIO 20MCG/DOSIS</p>','<p>BROMURO DE IPATROPIO</p>','<p>AEROSOL PARA INHALACI&Oacute;N</p>','<p>.</p>','2024-03-30'),
(209,4,'<p>CIMAFIX 100 MG/5ML</p>','<p>CEFIXIMA</p>','<p>SUSPENSI&Oacute;N</p>','<p>.</p>','2023-07-30'),
(210,3,'<p>CETIRIZINA 5MG/5ML</p>','<p>CETIRIZINA</p>','<p>JARABE</p>','<p>.</p>','2026-04-30'),
(211,4,'<p><span style=\"background-color: rgb(241, 196, 15);\">CEFALEXINA 250 MG/5ML</span></p>','<p>CEFALEXINA</p>','<p>SUSPENSI&Oacute;N</p>','<p>PR&Oacute;XIMO A VENCER</p>','2023-06-30'),
(212,3,'<p>CLORFENAMINA 2 MG/5 ML</p>','<p>CLORFENAMINA</p>','<p>SUSPENSION ORAL</p>','<p>.</p>','2023-11-30'),
(213,11,'<p><span style=\"background-color: rgb(241, 196, 15);\">CONSTULOSA 3.33G/5ML</span></p>','<p>LACTULOSA</p>','<p>SUSPENSION ORAL</p>','<p>PR&Oacute;XIMO A VENCER</p>','2023-03-30'),
(214,2,'<p>CLOBULER 15MG/5ML</p>','<p>AMBROXOL</p>','<p>JARABE</p>','<p>.</p>','2025-07-30'),
(215,5,'<p>DOLOQUIMAG&Eacute;SICO 1%</p>','<p>DICLOFENACO</p>','<p>AEROSOL</p>','<p>.</p>','2024-01-30'),
(216,15,'<p><span style=\"background-color: rgb(241, 196, 15);\">DESTOLIT 5%</span></p>','<p>PERMETRINA</p>','<p>LOCI&Oacute;N</p>','<p>PR&Oacute;XIMO A VENCER</p>','2023-03-30'),
(217,2,'<p>DEXTROTOSS 15MG/5ML</p>','<p>DEXTROMETORFANO</p>','<p>JARABE</p>','<p>.</p>','2025-03-30'),
(218,2,'<p>DEXTROMETORFANO 15 MG/5ML</p>','<p>DEXTROMETORFANO</p>','<p>JARABE</p>','<p>.</p>','2025-03-30'),
(219,5,'<p>DECORTEN 2MG/5ML</p>','<p>DEXAMETASONA</p>','<p>ELIXIR</p>','<p>.</p>','2024-08-30'),
(220,5,'<p>DOLO LIVIOLEX 9MG/ 5ML</p>','<p>DICLOFENACO</p>','<p>SUSPENSION</p>','<p>.</p>','2023-12-30'),
(221,2,'<p>FLUIDAR 500MG/5 ML</p>','<p>CARBOCISTEINA</p>','<p>SOLUCI&Oacute;N ORAL</p>','<p>.</p>','2023-07-30'),
(222,15,'<p>FERROPEN 50 MG/5ML</p>','<p>HIERRO</p>','<p>JARABE</p>','<p>.</p>','2024-02-28'),
(223,2,'<p>FLUIMAX 100 MG/5 ML</p>','<p>ACETILCISTEINA</p>','<p>JARABE</p>','<p>.</p>','2026-03-30'),
(224,3,'<p>FERNIDEL 5MG/5ML</p>','<p>CETIRIZINA</p>','<p>JARABE</p>','<p>.</p>','2023-08-30'),
(225,10,'<p>FLIXONASE 50 MCG/120 DOSIS</p>','<p>FLUTICASONA</p>','<p>SPRAY NASAL</p>','<p>.</p>','2023-08-30'),
(226,10,'<p>FLUTICORT 250 MCG/DOSIS</p>','<p>FLUTICASONA</p>','<p>INHALADOR</p>','<p>.</p>','2023-09-30'),
(227,8,'<p>GASTRORAL 800 MG + 60 MG/10 ML</p>','<p>MAGALDRATO + SIMETICONA</p>','<p>SUSPENSION</p>','<p>.</p>','2025-02-28'),
(228,4,'<p>KLARICID 250 MG/5ML</p>','<p>CLARITROMICINA</p>','<p>SUSPENSION</p>','<p>.</p>','2023-08-30'),
(229,3,'<p>LIBBERA 2.5MG/5ML</p>','<p>LEVOCETIRIZINA</p>','<p>JARABE</p>','<p>.</p>','2024-12-30'),
(230,11,'<p>LAXANOVA NF 4MG/4 ML</p>','<p>GLICEROL</p>','<p>SOLUCION RECTAL</p>','<p>.</p>','2023-09-30'),
(231,11,'<p>LECHE DE MAGNESIA PHILLIPS 425 MG/5ML</p>','<p>Hidr&oacute;xido de <em>Magnesio</em>&nbsp;8.5 g; Hipoclorito de Calcio c.s.p. 2 a 5 ppm de Cloro y Agua.</p>','<p>SUSPENSION</p>','<p>.</p>','2025-02-28'),
(232,2,'<p>MUCOSOLVAN PEDI&Aacute;TRICO 7.5 MG + 0.005 MG/ 5 ML</p>','<p>AMBROXOL + CLEMBUTEROL&nbsp;</p>','<p>SUSPENSION</p>','<p>.</p>','2024-05-30'),
(233,5,'<p>MEJORALITO 160 MG/5 ML</p>','<p>PARACETAMOL</p>','<p>JARABE</p>','<p>.</p>','2024-02-28'),
(234,9,'<p>MAGNESIO + ZINC</p>','<p>MAGNESIO + ZINC</p>','<p>TABLETA EFERVESCENTE SABOR A NARANJA</p>','<p>.</p>','2024-02-28'),
(235,10,'<p>NEUMOCORT PLUS 160 MCG + 4.5 MCG/ 150 DOSIS</p>','<p>FORMOTEROL + BUDESONIDA</p>','<p>INHALADOR</p>','<p>.</p>','2024-05-30'),
(236,2,'<p><span style=\"background-color: rgb(241, 196, 15);\">MUCOSOLVAN COMPOSITUM ADULTO 15MG + 0.01MG/ 5 ML</span></p>','<p>AMBROXOL + CLEMBUTEROL</p>','<p>SUSPENSION</p>','<p>PR&Oacute;XIMO A VENCER</p>','2023-04-30'),
(237,10,'<p>NEUMOCORT 200 MCG/DOSIS</p>','<p>BUDESONIDA</p>','<p>INHALADOR</p>','<p>.</p>','2024-02-28'),
(238,8,'<p>MILPAX</p>','<p>ALGINATO DE SODIO + BICARBONATO DE SODIO + CARBONATO DE CALCIO</p>','<p>SUSPENSION</p>','<p>.</p>','2024-01-30'),
(239,5,'<p>PANADOL 160 MG/5 ML</p>','<p>PARACETAMOL</p>','<p>JARABE</p>','<p>.</p>','2024-11-30'),
(240,5,'<p>PARACETAMOL 120 MG/5 ML</p>','<p>PARACETAMOL</p>','<p>JARABE</p>','<p>.</p>','2024-11-30'),
(241,9,'<p>PURINATOR</p>','<p class=\"Normal-col\">Orotato de potasio (Vit. B<span class=\"SubIndice\">13</span>), Xantina, Adenina, Tiamina (vit. B<span class=\"SubIndice\">1</span>),&nbsp;Riboflavina (vit. B<span class=\"SubIndice\">2</span>),&nbsp;Nicotinamida, Pantenol, Piridoxina (vit. 6),&nbsp;Cianocobalamina.</p>','<p>SUSPENSION ORAL</p>','<p>.</p>','2024-12-30'),
(242,5,'<p>REPRIMAN 250 MG/5 ML</p>','<p>METAMIZOL</p>','<p>JARABE</p>','<p>.</p>','2024-01-30'),
(243,10,'<p>SALBUCOR 100 MCG + 50 MCG/ DOSIS</p>','<p>SALBUTAMOL + BECLOMETASONA</p>','<p>INHALADOR</p>','<p>.</p>','2024-03-30'),
(244,10,'<p>SERETIDE EVOHALER 25 MCG/125 MCG/DOSIS</p>','<p>SALMETEROL + FLUTICASONA</p>','<p>INHALADOR</p>','<p>.</p>','2024-04-30'),
(245,2,'<p>SINFLEMAX PEDIATRICO 7.5 MG + 0.005 MG/ 5 ML</p>','<p>AMBROXOL + CLEMBUTEROL</p>','<p>JARABE</p>','<p>.</p>','2023-10-30'),
(246,8,'<p>SUCRALEX 1GR/5ML</p>','<p>SUCRALFATO</p>','<p>SUSPENSION</p>','<p>.</p>','2024-06-30'),
(247,9,'<p>TRIMETABOL CIP 312.5 MG + 6.25 MG + 2.5 MG/ 5 ML</p>','<p>Clorhidrato de Carnitina 312.5mg | Clorhidrato de Lisina 6.25mg | Clorhidrato de Ciproheptadina 2.5mg.&nbsp;</p>','<p>SOLUCION ORAL</p>','<p>.</p>','2023-09-30'),
(248,2,'<p>TOSALBRON ADULTO 50 MG/5 ML</p>','<p>OXOLAMINA</p>','<p>JARABE</p>','<p>.</p>','2025-08-30'),
(249,2,'<p>TOSALBRON INFANTIL 28 MG/5 ML</p>','<p>OXOLAMINA</p>','<p>JARABE</p>','<p>.</p>','2025-08-30'),
(250,15,'<p><span style=\"background-color: rgb(241, 196, 15);\">YODOX 10 %</span></p>','<p>POVIDONA YODADA</p>','<p>SOLUCION T&Oacute;PICA</p>','<p>PR&Oacute;XIMO A VENCER</p>','2023-04-30'),
(251,10,'<p>VENTOLIN 100 MCG/ DOSIS</p>','<p>SALBUTAMOL</p>','<p>INHALADOR</p>','<p>.</p>','2024-01-30'),
(252,9,'<p>VITAKID</p>','<p>CALCIO + VITAMINA D3 + ZINC + MAGNESIO</p>','<p>SUSPENSION</p>','<p>.</p>','2023-08-30'),
(253,9,'<p>VITERNUM VITAMINADO</p>','<p>Dihexaz&iacute;n 3 mg; Vitamina B1 0.68 mg; Vitamina B2 0.72 mg; Nicotinamida 6.8 mg; Vitamina B6 0.68 mg; Vitamina C 16.8 mg.&nbsp;</p>','<p>SOLUCION ORAL</p>','<p>.</p>','2024-01-30'),
(254,9,'<p>VITAMINA C + D3 + ZINC</p>','<p>VITAMINA C + D3 + ZINC</p>','<p>TABLETAS EFERVESCENTE SABOR A NARANJA</p>','<p>.</p>','2024-11-30'),
(255,9,'<p>MULTIVITAMINAS + BIOTINA</p>','<p>Vitaminas A, B1, B2, B3, B5, B6, C, D, E&nbsp; y Biotina.</p>','<p>TABLETAS EFERVESCENTE SABOR A NARANJA</p>','<p>.</p>','2024-05-30'),
(256,4,'<p><span style=\"background-color: rgb(241, 196, 15);\">ZITROLAB 200 MG/5ML</span></p>','<p>AZITROMICINA</p>','<p>SUSPENSION</p>','<p>PR&Oacute;XIMO A VENCER</p>','2023-04-30'),
(257,4,'<p>AB BRONCOL NF 1 200 000</p>','<p><strong>ampicilina benzat&iacute;nica y la ampicilina s&oacute;dica</strong>,</p>\n<p>AMPICILINA BENZATINICA + AMPICILINA S&Oacute;DICA</p>','<p>AMPOLLA</p>','<p>.</p>','2026-05-30'),
(258,4,'<p>AB BRONCOL NF 600 000</p>','<p>AMPICILINA BENZATINICA + AMPICILINA S&Oacute;DICA</p>','<p>AMPOLLA</p>','<p>.</p>','2026-02-28'),
(259,9,'<p><span style=\"background-color: rgb(255, 255, 255);\">B VAT FORTE</span></p>','<p><span class=\"light\">TIAMINA 20MG + RIBOFLAVINA, FOSFATO DE SODIO 5MG + CLORHIDRATO DE PIRIDOXINA 10MG + NICOTINAMIDA 50MG + DEXPANTENOL 5MG + CIANOCOBALAMINA 1MG</span></p>','<p>AMPOLLA</p>','<p>PR&Oacute;XIMO A VENCER</p>','2025-06-30'),
(260,15,'<p>ATROPINA</p>','<p>ATROPINA</p>','<p>AMPOLLA</p>','<p>.</p>','2024-10-30'),
(261,4,'<p>BENCILPENICILINA PROCAINICA 1 000 000</p>','<p>BENCILPENICILINA PROCAINICA</p>','<p>AMPOLLA</p>','<p>.</p>','2023-09-30'),
(262,4,'<p>BENCILPENICILINA BENZATINICA 1 200 000</p>','<p>BENCILPENICILINA PROCAINICA</p>','<p>AMPOLLA</p>','<p>.</p>','2025-02-28'),
(263,15,'<p>BICARBONATO 8.4%</p>','<p>BICARBONATO DE SODIO</p>','<p>AMPOLLA</p>','<p>.</p>','2024-04-30'),
(264,4,'<p><span style=\"background-color: rgb(255, 255, 255);\">CEFTRIAXONA 1 GR</span></p>','<p>CEFTRIAXONA</p>','<p>AMPOLLA</p>','<p>.</p>','2023-07-30'),
(265,4,'<p>CEFTAZIDIMA 1 GR</p>','<p>CEFTAZIDIMA</p>','<p>AMPOLLA</p>','<p>.</p>','2024-03-30'),
(266,4,'<p>CIFLOXDAN 200 MG/100 ML</p>','<p>CIPROFLOXACINO</p>','<p>AMPOLLA</p>','<p>.</p>','2024-08-30'),
(267,4,'<p>CLINDAMICINA 600 MG/4ML</p>','<p>CLINDAMICINA</p>','<p>AMPOLLA</p>','<p>.</p>','2024-06-30'),
(268,3,'<p>CLORO ALERGAN 10MG/1ML</p>','<p>CLORFENAMINA</p>','<p>AMPOLLA</p>','<p>.</p>','2024-10-30'),
(269,3,'<p>CLORFEDAN 10 MG/1ML</p>','<p>CLORFENAMINA</p>','<p>AMPOLLA</p>','<p>.</p>','2024-05-30'),
(270,15,'<p>CONTRAXCIN 10MG/1ML</p>','<p>OXITOCINA</p>','<p>AMPOLLA</p>','<p>.</p>','2025-02-28'),
(271,15,'<p>GLUCAL 10%</p>','<p>GLUCAL DE CALCIO</p>','<p>AMPOLLA</p>','<p>.</p>','2025-03-30'),
(272,4,'<p>CEFACROL 1000&nbsp;</p>','<p>CEFTRIAXONA</p>','<p>AMPOLLA</p>','<p>.</p>','2024-05-30'),
(273,15,'<p>DESHIDRAL 20%</p>','<p>CLORURO DE SODIO</p>','<p>AMPOLLA</p>','<p>.</p>','2023-08-30'),
(274,5,'<p>DEXCORTIL 4 MG/ 2 ML</p>','<p>DEXAMETASONA</p>','<p>AMPOLLA</p>','<p>.</p>','2023-08-30'),
(275,15,'<p>DEXTRO LUSA 335</p>','<p>DEXTROSA</p>','<p>AMPOLLA</p>','<p>.</p>','2023-09-30'),
(277,11,'<p>DIMENHIDRINATO 50MG/5ML</p>','<p>DIMENHIDRINATO</p>','<p>AMPOLLA</p>','<p>.</p>','2024-09-30'),
(278,5,'<p><span style=\"background-color: rgb(241, 196, 15);\">DOLO BENALGIN</span></p>','<p>Diclofenaco + Complejo B (B1, B6, B12)</p>','<p>AMPOLLA</p>','<p>PR&Oacute;XIMO A VENCER</p>','2023-04-30'),
(279,5,'<p><span style=\"background-color: rgb(241, 196, 15);\">DOLO NEUROBION</span></p>','<p>Diclofenaco + Complejo B (B1, B6, B12)</p>','<p>AMPOLLA</p>','<p>PR&Oacute;XIMO A VENCER</p>','2023-02-28'),
(280,17,'<p>ESPASMO ANTALGINA</p>','<p>BUTILESCOPOLAMINA + METAMIZOL</p>','<p>AMPOLLA</p>','<p>.</p>','2024-05-30'),
(281,11,'<p><span style=\"background-color: rgb(241, 196, 15);\">ENTEROGERMINA&nbsp;</span></p>','<p>4 cepas de Bacillus clausii</p>','<p>AMPOLLA ORAL</p>','<p>PR&Oacute;XIMO A VENCER</p>','2023-06-30'),
(282,17,'<p>ESCOPOLAMINA 20 MG/ML</p>','<p>ESCOPOLAMINA</p>','<p>AMPOLLA</p>','<p>.</p>','2024-08-30'),
(283,5,'<p><span style=\"background-color: rgb(241, 196, 15);\">FLEVRAL 1GR/2ML</span></p>','<p>METAMIZOL</p>','<p>AMPOLLA</p>','<p>PR&Oacute;XIMO A VENCER</p>','2023-05-30'),
(284,15,'<p>EPINEFRINA 1 MG/1ML</p>','<p>ADRENALINA</p>','<p>AMPOLLA</p>','<p>.</p>','2023-07-30'),
(285,9,'<p>FITOMENADIONA</p>','<p>VITAMINA K&nbsp;</p>','<p>AMPOLLA</p>','<p>.</p>','2024-02-28'),
(286,5,'<p>FLODIN 15 MG/1.5 ML</p>','<p>MELOXICAM</p>','<p>AMPOLLA</p>','<p>.</p>','2025-04-30'),
(287,19,'<p>FLUNGOFYL 200 MG/100 ML</p>','<p>FLUCONAZOL</p>','<p>AMPOLLA</p>','<p>.</p>','2024-08-30'),
(288,15,'<p>FUROSEMIDA 20 MG/2ML</p>','<p>FUROSEMIDA</p>','<p>AMPOLLA</p>','<p>.</p>','2023-09-30'),
(289,2,'<p>FLUIMUCIL 300 MG</p>','<p>ACETILCISTEINA</p>','<p>AMPOLLA</p>','<p>.</p>','2026-06-30'),
(290,4,'<p>GENTABIOT 160 MG/2 ML</p>','<p>GENTAMICINA</p>','<p>AMPOLLA</p>','<p>.</p>','2023-09-30'),
(291,5,'<p>HIDROCORTISONA 250 MG</p>','<p>HIDROCORTISONA</p>','<p>AMPOLLA</p>','<p>.</p>','2024-08-30'),
(292,4,'<p><span style=\"background-color: rgb(241, 196, 15);\">ITUBIOT 500 MG/2 ML</span></p>','<p>AMIKACINA</p>','<p>AMPOLLA</p>','<p>PR&Oacute;XIMO A VENCER</p>','2023-05-30'),
(293,4,'<p>ITUBIOT 1G/ 4 ML</p>','<p>AMIKACINA</p>','<p>AMPOLLA</p>','<p>.</p>','2024-05-30'),
(294,15,'<p><span style=\"background-color: rgb(241, 196, 15);\">KALIUM 20 %</span></p>','<p>CLORURO DE POTASIO</p>','<p>AMPOLLA</p>','<p>PR&Oacute;XIMO A VENCER</p>','2023-03-30'),
(295,5,'<p><span style=\"background-color: rgb(241, 196, 15);\">KETACOR 30 MG/ ML</span></p>','<p>KETOROLACO</p>','<p>AMPOLLA</p>','<p>PR&Oacute;XIMO A VENCER</p>','2023-05-30'),
(296,5,'<p>KETOPAN 100 MG/ 5ML</p>','<p>KETOPROFENO</p>','<p>AMPOLLA</p>','<p>.</p>','2026-02-28'),
(297,15,'<p>LIDOCAINA 2%</p>','<p>LIDOCAINA</p>','<p>AMPOLLA</p>','<p>.</p>','2026-06-30'),
(298,15,'<p><span style=\"background-color: rgb(241, 196, 15);\">LIKFERR 100 MG/ 5ML</span></p>','<p>HIERRRO SACAROSA</p>','<p>AMPOLLA</p>','<p>PR&Oacute;XIMO A VENCER</p>','2023-04-30'),
(299,4,'<p>LINCOMAX 600 MG/2ML</p>','<p>LINCOMICINA</p>','<p>AMPOLLA</p>','<p>.</p>','2023-09-30'),
(300,11,'<p><span style=\"background-color: rgb(241, 196, 15);\">METOCLONYL 10 MG/ 2ML</span></p>','<p>METOCLOPRAMIDA</p>','<p>AMPOLLA</p>','<p>PR&Oacute;XIMO A VENCER</p>','2023-05-30'),
(301,15,'<p>ACICLOVIR 5%</p>','<p>ACICLOVIR</p>','<p>CREMA</p>','<p>.</p>','2023-09-30'),
(302,9,'<p>BEPANTHEN&nbsp;</p>','<p>Provitamina B5 y Lanolina</p>','<p>CREMA</p>','<p>.</p>','2025-03-30'),
(303,5,'<p>BETAPLUSS 0.05%</p>','<p>BETAMETASONA</p>','<p>CREMA</p>','<p>.</p>','2025-12-30'),
(304,5,'<p>CLOBETASOL 0.05%</p>','<p>CLOBETASOL</p>','<p>CREMA</p>','<p>.</p>','2024-10-30'),
(305,15,'<p>CLORINCORT-P</p>','<p>CLORANFENICOL,HIDROCORTISONA,POLIMIXINA B</p>','<p>UNGUENTO OFT&Aacute;LMICO</p>','<p>.</p>','2024-11-30'),
(306,19,'<p>CLOTRIMAZOL 1%</p>','<p>CLOTRIMAZOL</p>','<p>CREMA</p>','<p>.</p>','2025-02-28'),
(307,15,'<p><span style=\"background-color: rgb(241, 196, 15);\">CIROCA&Iacute;NA 2%</span></p>','<p>LIDOCAINA</p>','<p>GEL</p>','<p>PR&Oacute;XIMO A VENCER</p>','2023-06-30'),
(308,5,'<p>DICLOFENACO 1 %</p>','<p>DICLOFENACO</p>','<p>GEL</p>','<p>.</p>','2024-06-30'),
(309,15,'<p>DOXIPROCT PLUS</p>','<p>DOBESILATO DE CALCIO, DEXAMETASONA, LIDOCA&Iacute;NA</p>','<p>POMADA RECTAL</p>','<p>.</p>','2024-03-30'),
(310,5,'<p>FISIODOL FORTE 2%</p>','<p>DICLOFENACO</p>','<p>GEL</p>','<p>.</p>','2024-12-30'),
(311,15,'<p>FAKTU</p>','<p>CINCOCA&Iacute;NA, POLICRESULENO</p>','<p>CREMA RECTAL</p>','<p>.</p>','2023-06-30'),
(312,4,'<p>FURACIN 0.2%</p>','<p>NITROFURAL</p>','<p>POMADA</p>','<p>..</p>','2025-06-30'),
(313,15,'<p><span style=\"background-color: rgb(241, 196, 15);\">HEMOPROPIN 20 GR</span></p>','<p>TINTURA DE PROPOLEO; TINTURA DE ANTHEMIS NOBILIS (MANZANILLA);</p>','<p>UNGUENTO</p>','<p>PR&Oacute;XIMO A VENCER</p>','2023-07-30'),
(314,19,'<p>KETOCONAZOL 2%</p>','<p>KETOCONAZOL</p>','<p>CREMA</p>','<p>.</p>','2024-03-30'),
(315,15,'<p>HIRUDOID 14 GR</p>','<p>Poli&eacute;ster Mucopolisac&aacute;rido del Acido Sulf&uacute;rico</p>','<p>POMADA</p>','<p>.</p>','2027-04-30'),
(316,19,'<p><span style=\"background-color: rgb(241, 196, 15);\">MICONAZOL 1%</span></p>','<p>ECONAZOL</p>','<p>CREMA</p>','<p>PR&Oacute;XIMO A VENCER</p>','2023-06-30'),
(317,5,'<p>MOVIFLEX 1%</p>','<p>INDOMETACINA</p>','<p>SPRAY</p>','<p>.</p>','2025-02-28'),
(318,4,'<p>MULTIMYCIN 14 GR</p>','<p>NEOMICINA + POLIMIXINA B + BACITRACINA</p>','<p>CREMA</p>','<p>.</p>','2023-09-30'),
(319,4,'<p>NOTIL 10 GR</p>','<p>BETAMETASONA, CLOTRIMAZOL, GENTAMICINA</p>','<p>CREMA</p>','<p>.</p>','2025-02-28'),
(320,9,'<p>NISTAZINC 15 GR</p>','<p>OXIDO DE ZINC; VITAMINA A; ACIDO BORICO; NISTATINA; VITAMINA D</p>','<p>CREMA</p>','<p>.</p>','2024-02-28'),
(321,5,'<p>PROFENID 2.5%</p>','<p>KETOPROFENO</p>','<p>GEL</p>','<p>.</p>','2024-06-30'),
(322,15,'<p><span style=\"background-color: rgb(241, 196, 15);\">SULFAMED</span></p>','<p>SULFADIAZINA DE PLATA + LIDOCAINA</p>','<p>CREMA</p>','<p>PR&Oacute;XIMO A VENCER</p>','2023-05-30'),
(323,4,'<p>SITIDERM&nbsp;</p>','<p>&nbsp;Betametasona + gentamicina + clotrima</p>','<p>CREMA</p>','<p>.</p>','2024-03-30'),
(324,19,'<p>TERFITIL</p>','<p>TERBINAFINA</p>','<p>CREMA</p>','<p>.</p>','2023-07-30'),
(325,9,'<p>TERNESIL</p>','<p>COLECALCIFEROL; PALMITATO DE RETINOL; OXIDO DE ZINC</p>','<p>CREMA</p>','<p>.</p>','2024-04-30'),
(326,9,'<p><span style=\"background-color: rgb(241, 196, 15);\">VITA-POS</span></p>','<p>retinol palmitato/g (Vitamina A), parafina, parafina l&iacute;quida, lanolina y vaselina blanca.</p>','<p>POMADA OFT&Aacute;LMICA</p>','<p>PR&Oacute;XIMO A VENCER</p>','2023-05-30'),
(327,19,'<p>QUIMIZOL</p>','<p>MICONAZOL + TINIDAZOL</p>','<p>CREMA</p>','<p>.</p>','2024-12-30'),
(328,15,'<p>ACTERIL</p>','<p>SALBUTAMOL</p>','<p>SOLUCION PARA NEBULIZACION</p>','<p>.</p>','2023-09-30'),
(329,15,'<p>ALERGIPAT 0.2%</p>','<p>OLOPATADINA</p>','<p>GOTAS OFTALMICAS</p>','<p>.</p>','2024-05-30'),
(331,4,'<p><span style=\"background-color: rgb(241, 196, 15);\">CIRIAX OTIC</span></p>','<p>CIPROFLOXACINO + HIDROCORTISONA</p>','<p>GOTAS OTICAS</p>','<p>PR&Oacute;XIMO A VENCER</p>','2023-04-30'),
(332,15,'<p>COSOMIDOL</p>','<p>Dorzolamida 2%| Timolol 0.5%</p>','<p>GOTAS OFTALMICAS</p>','<p>.</p>','2025-01-30'),
(333,4,'<p><span style=\"background-color: rgb(241, 196, 15);\">FRAMYCORT</span></p>','<p>FRAMICETINA SULFATO + DEXAMETASONA FOSFATO</p>','<p>GOTAS OFTALMICAS</p>','<p>PR&Oacute;XIMO A VENCER</p>','2023-06-01'),
(334,5,'<p>FLEXOPLUS 1%</p>','<p>INDOMETACINA</p>','<p>SPRAY</p>','<p>.</p>','2024-05-30'),
(335,15,'<p>FLU-SURE</p>','<p>FLUOROMETOLONA 0.1%</p>','<p>GOTAS OFTALMICAS</p>','<p>.</p>','2023-07-30'),
(337,15,'<p>FLORIL 0.03%</p>','<p>NAFAZOLINA</p>','<p>GOTAS OFTALMICAS</p>','<p>.</p>','2024-09-30'),
(338,11,'<p>GASEOVET 100 MG</p>','<p>SIMETICONA</p>','<p>GOTAS</p>','<p>.</p>','2024-06-30'),
(339,11,'<p>IDON 10 MG/ML</p>','<p>DOMPERIDONA</p>','<p>GOTAS</p>','<p>PR&Oacute;XIMO A VENCER</p>','2023-06-30'),
(340,15,'<p>HUMED 0.3%</p>','<p>HIPROMELOSA</p>','<p>GOTAS OFTALMICAS</p>','<p>.</p>','2023-11-30'),
(341,4,'<p><span style=\"background-color: rgb(241, 196, 15);\">LANCIPROX - DX</span></p>','<p>CIPROFLOXACINO + DEXAMETASONA</p>','<p>GOTAS OFTALMICAS</p>','<p>PR&Oacute;XIMO A VENCER</p>','2023-05-30'),
(342,11,'<p>MERIFAR 4 MG/ML</p>','<p>METOCLOPRAMIDA</p>','<p>GOTAS</p>','<p>PR&Oacute;XIMO A VENCER</p>','2023-07-30'),
(343,5,'<p>NEPAFEN 0.1%</p>','<p>NEPAFENACO</p>','<p>GOTAS OFTALMICO</p>','<p>.</p>','2023-11-30'),
(344,4,'<p>OTOZAMBON NF</p>','<p>&nbsp;Fluorhidrocortisona. - Lidoca&iacute;na. - Neomicina. - Polimixina B</p>','<p>GOTAS OFTALMICAS</p>','<p>.</p>','2023-08-30'),
(345,5,'<p>PARACETAMOL 100 MG/ML</p>','<p>PARACETAMOL</p>','<p>GOTAS</p>','<p>.</p>','2023-10-30'),
(346,5,'<p>REPRIMAN 400 MG/ ML</p>','<p>METAMIZOL</p>','<p>GOTAS</p>','<p>.</p>','2023-12-30'),
(347,15,'<p><span style=\"background-color: rgb(241, 196, 15);\">RYNAT D&nbsp;</span></p>','<p>OXIMETAZOLINA</p>','<p>GOTAS NASALES</p>','<p>PR&Oacute;XIMO A VENCER</p>','2023-06-30'),
(348,15,'<p>RHINO BB 0.9%</p>','<p>CLORURO DE SODIO</p>','<p>GOTAS</p>','<p>.</p>','2024-05-30'),
(349,15,'<p>RINOKID 3%</p>','<p>CLORURO DE SODIO</p>','<p>GOTAS NASALES</p>','<p>.</p>','2024-07-30'),
(350,15,'<p>SYSTANE ULTRA</p>','<p>PROPILENGLICOL</p>','<p>SOLUCION OFTALMICA</p>','<p>PR&Oacute;XIMO A VENCER</p>','2023-05-30'),
(351,11,'<p>SEDOTROPINA FLAT</p>','<p>DIMETICONA + HOMATROPINA</p>','<p>GOTAS</p>','<p>.</p>','2024-11-30'),
(352,4,'<p><span style=\"background-color: rgb(241, 196, 15);\">UNITOB 0.3%</span></p>','<p>TOBRAMICINA</p>','<p>GOTAS OFTALMICAS</p>','<p>PR&Oacute;XIMO A VENCER</p>','2023-03-30'),
(353,4,'<p>UNIMOX 0.5%</p>','<p>MOVIFLOXACINO</p>','<p>GOTAS OFTALMICAS</p>','<p>.</p>','2023-12-30'),
(354,4,'<p><span style=\"background-color: rgb(241, 196, 15);\">UNITOB - S</span></p>','<p>TOBRAMICINA + DEXAMETASONA</p>','<p>GOTAS OFTALMICAS</p>','<p>PR&Oacute;XIMO A VENCER</p>','2023-03-30'),
(355,15,'<p>UNITEARS - D</p>','<p>HIPROMELOSA + DEXTRAN 70</p>','<p>GOTAS OFT&Aacute;LMICAS</p>','<p>.</p>','2024-10-30'),
(356,5,'<p>UNIPRED -F 1%</p>','<p>PREDNISOLONA</p>','<p>GOTAS OFT&Aacute;LMICAS</p>','<p>.</p>','2024-01-30'),
(357,5,'<p>VINIL 0.1%</p>','<p>DICLOFENACO</p>','<p>GOTAS OFT&Aacute;LMICAS</p>','<p>.</p>','2024-12-30'),
(358,3,'<p>ZETALER 10MG/ML</p>','<p>CETIRIZINA</p>','<p>GOTAS</p>','<p>.</p>','2024-10-30'),
(359,4,'<p>METROXIN 500 MG/ 100 ML</p>','<p>METRONIDAZOL</p>','<p>AMPOLLA</p>','<p>.</p>','2024-05-30'),
(360,5,'<p>MELOXICAM 15 MG/1.5 ML</p>','<p>MELOXICAM</p>','<p>AMPOLLA</p>','<p>.</p>','2023-11-30'),
(361,18,'<p>MENSILLE</p>','<p>acetato de medroxiprogesterona y cipionato de estradiol</p>','<p>AMPOLLA</p>','<p>.</p>','2025-12-30'),
(362,5,'<p><span style=\"background-color: rgb(241, 196, 15);\">PARACETAMOL 1 GR</span></p>','<p>PARACETAMOL</p>','<p>AMPOLLA</p>','<p>PR&Oacute;XIMO A VENCER</p>','2023-03-30'),
(363,5,'<p>ORFENADRINA</p>','<p>ORFENADRINA</p>','<p>AMPOLLA</p>','<p>.</p>','2024-02-28'),
(364,11,'<p>ONDANSETRON</p>','<p>ONDANSETRON&nbsp;</p>','<p>AMPOLLA</p>','<p>.</p>','2024-08-30'),
(365,4,'<p>OXACILINA 1 GR</p>','<p>OXACILINA</p>','<p>AMPOLLA</p>','<p>.</p>','2023-09-30'),
(366,5,'<p>PROFENID 100 MG/2ML</p>','<p>KETOPROFENO</p>','<p>AMPOLLA</p>','<p>.</p>','2024-06-30'),
(367,17,'<p>PASMODAN 20 MG/ ML</p>','<p>BROMURO DE HIOSCINA</p>','<p>AMPOLLA</p>','<p>.</p>','2024-06-30'),
(368,9,'<p>SOMAZINA 500 MG</p>','<p>CITICOLINA</p>','<p>AMPOLLA</p>','<p>.</p>','2024-11-30'),
(369,18,'<p>SOLUTRES 150 MG</p>','<p>MEDROXIPROGESTERONA</p>','<p>AMPOLLA</p>','<p>.</p>','2024-05-30'),
(370,18,'<p>SOLUNA&nbsp;</p>','<p>Estradiol + algestona</p>','<p>AMPOLLA</p>','<p>.</p>','2025-06-30'),
(371,9,'<p>VITAMINA C 7.5 GR/50 ML</p>','<p>ACIDO ASCORBICO</p>','<p>AMPOLLA</p>','<p>.</p>','2025-03-30'),
(372,15,'<p>TRANSAMIN 1 GR</p>','<p>&Aacute;CIDO TRANEX&Aacute;MICO</p>','<p>AMPOLLA</p>','<p>.</p>','2024-02-28'),
(373,5,'<p>TRIAMCICORT</p>','<p>TRIAMCINOLONA</p>','<p>AMPOLLA</p>','<p>.</p>','2023-10-30'),
(374,4,'<p><span style=\"background-color: rgb(241, 196, 15);\">TAZOVAL 4.0 GR + 0.5 GR</span></p>','<p>PIPERACILINA + TAZOBACTAM</p>','<p>AMPOLLA</p>','<p>PR&Oacute;XIMO A VENCER</p>','2023-05-30'),
(375,4,'<p><span style=\"background-color: rgb(241, 196, 15);\">TACBANEN 1 GR</span></p>','<p>MEROPENEM</p>','<p>AMPOLLA</p>','<p>PR&Oacute;XIMO A VENCER</p>','2023-05-30'),
(376,8,'<p>ULCETON 50 MG/ 2ML</p>','<p>RANITIDINA</p>','<p>AMPOLLA</p>','<p>.</p>','2023-09-30'),
(377,4,'<p><span style=\"background-color: rgb(241, 196, 15);\">VANCOMICINA 500 MG</span></p>','<p>VANCOMICINA</p>','<p>AMPOLLA</p>','<p>PR&Oacute;XIMO A VENCER</p>','2023-02-28'),
(378,5,'<p>VINIL 75 MG/3 ML</p>','<p>DICLOFENACO</p>','<p>AMPOLLA</p>','<p>.</p>','2025-01-30'),
(379,15,'<p>MULTIFLORA PLUS</p>','<p>Lactobacillus casei; Lactobacillus rhamnosus;<br>Streptococcus thermophilus; Bifidobacterium breve; Lactobaillus acidophilus;<br>Bifidobacterium longum; Lactobacillus bulgaricus.</p>','<p>C&Aacute;PSULA</p>','<p>.</p>','2024-02-28'),
(380,15,'<p>MULTIFLORA</p>','<p>Lactobacillus casei; Lactobacillus rhamnosus; Streptococcus<br>thermophilus; Bifidobacterium breve; Lactobaillus acidophilus; Bifidobacterium<br>infantis; Lactobacillus bulgaricus</p>','<p>POLVO EN SACHETS</p>','<p>.</p>','2023-08-30'),
(381,8,'<p>DEXLANZOPRAL 60 DR</p>','<p>DEXLANZOPRAZOL</p>','<p>TABLETA</p>','<p>.</p>','2023-12-30'),
(382,18,'<p>OVESTIN 0.5 MG</p>','<p>ESTRIOL</p>','<p>&Oacute;VULO</p>','<p>.</p>','2024-09-30'),
(383,9,'<p>MAXIMUS PLUS</p>','<p>Alendr&oacute;nico &aacute;cido, calcio y colecalciferol</p>','<p>TABLETA</p>','<p>.</p>','2023-10-30'),
(384,4,'<p><span style=\"background-color: rgb(241, 196, 15);\">MONUROL 3 GR</span></p>','<p>FOSFOMICINA</p>','<p>GRANULADO EN SOBRE</p>','<p>PR&Oacute;XIMO A VENCER</p>','2023-06-30'),
(385,16,'<p>ORIFLOW DUO</p>','<p>amsulosina clorhidrato 0.4mg + Dutasterida 0.5mg&nbsp;</p>','<p>TABLETA</p>','<p>.</p>','2024-11-30'),
(386,5,'<p>TALFLEX BI 150 MG</p>','<p>KETOPROFENO</p>','<p>TABLETA</p>','<p>.</p>','2024-04-30'),
(387,15,'<p><span style=\"background-color: rgb(241, 196, 15);\">TENSYOL 5 MG</span></p>','<p>CICLOBENZAPRINA</p>','<p>TABLETA</p>','<p>PR&Oacute;XIMO A VENCER</p>','2023-05-30'),
(388,16,'<p>DIPHAZOSIN XL</p>','<p>Doxazosina</p>','<p>TABLETA</p>','<p>.</p>','2024-02-28'),
(389,15,'<p>HYALOFEMME</p>','<p>&Eacute;ster de &Aacute;cido Hialur&oacute;nico</p>','<p>GEL VAGINAL</p>','<p>.</p>','2024-11-30'),
(390,5,'<p><span style=\"background-color: rgb(255, 255, 255);\">ACEPOT 1 ML</span></p>','<p>BETAMETASONA</p>','<p>AMPOLLA</p>','<p>PR&Oacute;XIMO A VENCER</p>','2023-02-28'),
(391,4,'<p>CEFACROL 1000 I.V.</p>','<p>CEFTRIAXONA</p>','<p>AMPOLLA</p>','<p>.</p>','2024-05-30'),
(392,4,'<p>CIFLOXDAN 200 MG/100ML</p>','<p>CIPROFLOXACINO</p>','<p>AMPOLLA</p>','<p>.</p>','2024-08-30'),
(393,4,'<p>AB BRONCOL 1200 000</p>','<p>ALCANFOR, AMPICILINA, BENZATINA BENCILPENICILINA&nbsp;</p>','<p>AMPOLLA</p>','<p>.</p>','2025-01-30'),
(394,3,'<p>CLORFEDAN</p>','<p>CLORFENAMINA</p>','<p>AMPOLLA</p>','<p>.</p>','2024-05-30'),
(395,15,'<p>GLUCAL 10 %</p>','<p>GLUCONATO DE CALCIO</p>','<p>AMPOLLA</p>','<p>.</p>','2025-03-30'),
(396,5,'<p>FLEVRAL 1GR/2ML</p>','<p>METAMIZOL</p>','<p>AMPOLLA</p>','<p>PR&Oacute;XIMO A VENCER</p>','2023-05-30'),
(397,5,'<p>KETORGES-60</p>','<p>KETOROLACO</p>','<p>AMPOLLA</p>','<p>.</p>','2024-07-30'),
(398,5,'<p>KETESSE 50 MG/2ML</p>','<p>DEXKETOPROFENO</p>','<p>AMPOLLA</p>','<p>.</p>','2025-10-30'),
(399,5,'<p>MELSOL 15 MG/1.5 ML</p>','<p>MELOXICAM</p>','<p>AMPOLLA</p>','<p>.</p>','2024-04-30'),
(400,4,'<p>LEVOFLOXACINO 500 MG/ 100ML</p>','<p>LEVOFLOXACINO</p>','<p>AMPOLLA</p>','<p>.</p>','2024-02-28'),
(401,18,'<p>MENSILLE 25MG/ 5ML</p>','<p>ESTRADIOL + MEDROXIPROGESTERONA</p>','<p>AMPOLLA</p>','<p>.</p>','2025-12-30'),
(402,4,'<p>GENTAMARI 0.3%</p>','<p>GENTAMICINA</p>','<p>AMPOLLA</p>','<p>.</p>','2023-09-30'),
(403,1,'<p>PANADOL ANTIGRIPAL</p>','<p><em>paracetamol</em>, clorfenamina, dextrometorfano y fenilefrina</p>','<p>TABLETA</p>','<p>.</p>','2024-05-30'),
(404,5,'<p>PANADOL 100 MG/ML</p>','<p>PARACETAMOL</p>','<p>GOTAS</p>','<p>.</p>','2024-06-30'),
(405,15,'<p>SYSTANE BALANCE</p>','<p>Propilenglicol, Hidroxipropilguar, Aceite mineral, Dimiristoilfosfatidilglicerol, Polioxil 40 Estearato, Sorbitan Tristearato, &Aacute;cido Borico, Sorbitol, Edetato de Disodio y Polyquad&nbsp;</p>','<p>GOTAS OFT&Aacute;LMICAS</p>','<p>.</p>','2023-09-30'),
(406,15,'<p>REUMOFLEX FORTE</p>','<p>Salicilato de Metilo 29 g + Mentol 7.6 g</p>','<p>POTE</p>','<p>.</p>','2025-07-30'),
(407,19,'<p>GINNA</p>','<p>NITRATO DE FENTICONAZOL</p>','<p>CREMA</p>','<p>.</p>','2024-02-28'),
(408,4,'<p>MUPIROCINA 2 %</p>','<p>MUPIROCINA</p>','<p>CREMA</p>','<p>.</p>','2023-10-30'),
(409,1,'<p>BRONCO PHAR 120 ML</p>','<p>BROMHEXINA + CLORFENAMINA + DEXTROMETORFANO.</p>','<p>JARABE</p>','<p>.</p>','2025-12-30'),
(410,4,'<p>CEFACLOR 250 MG/5ML</p>','<p>CEFACLOR</p>','<p>SUSPENSION</p>','<p>.</p>','2024-09-30'),
(411,15,'<p>EVACUOL ENEMA</p>','<p>SODIO, FOSFATO DE, SODIO, DIB&Aacute;SICO DE FOSFATO</p>','<p>SOLUCION</p>','<p>.</p>','2026-05-30'),
(412,10,'<p>FLUTICASONA 125 MCG</p>','<p>FLUTICASONA</p>','<p>AEROSOL PARA INHALACION</p>','<p>.</p>','2023-07-30'),
(413,5,'<p>GINGISONA B</p>','<p>Bencidamina clorhidrato</p>','<p>SPRAY</p>','<p>.</p>','2025-10-30'),
(414,4,'<p>METRONIDAZOL 250MG/ 5ML</p>','<p>METRONIDAZOL</p>','<p>SUSPENSION</p>','<p>.</p>','2025-10-30'),
(415,10,'<p>SALBUTAMOL 100 MCG/DOSIS</p>','<p>SALBUTAMOL</p>','<p>SUSPENSION PARA INHALACION</p>','<p>.</p>','2024-05-30'),
(416,15,'<p>YODOX</p>','<p>POVIDONA YODADA</p>','<p>SOLUCION TOPICA</p>','<p>.</p>','2024-12-30'),
(417,15,'<p>ACICLOVIR 400 MG</p>','<p>ACICLOVIR&nbsp;</p>','<p>TABLETA</p>','<p>.</p>','2024-06-30'),
(418,9,'<p>ALKALOS</p>','<p>CITRATO DE CALCIO + VITAMINA D3</p>','<p>SOLUCION ORAL</p>','<p>.</p>','2025-03-30'),
(419,18,'<p>ARLETTE 28</p>','<p>DESOGESTREL 0.075 MG</p>','<p>TABLETA</p>','<p>.</p>','2023-10-30'),
(420,12,'<p>ASPIRINA 100 MG</p>','<p>&Aacute;CIDO ACETILSALICILICO</p>','<p>TABLETA</p>','<p>.</p>','2023-08-30'),
(421,4,'<p>AZITROMICINA 500 MG</p>','<p>AZITROMICINA</p>','<p>TABLETA</p>','<p>.</p>','2025-08-30'),
(422,16,'<p>BLADURIL 200 MG</p>','<p>FLAVOXATO</p>','<p>TABLETA</p>','<p>.</p>','2023-11-30'),
(423,9,'<p>CALCIBONE D SOYA</p>','<p>CALCIO, CITRATO DE, EXTRACTO DE ISOFLAVONAS DE SOYA, &Oacute;XIDO DE MAGNESIO, VITAMINA D3</p>','<p>TABLETA</p>','<p>.</p>','2024-08-30'),
(424,4,'<p>CEFOTRIX 500 MG</p>','<p>CEFADROXILO</p>','<p>TABLETA</p>','<p>.</p>','2023-09-30'),
(425,16,'<p>CLINDESS 100 MG</p>','<p>CLINDAMICINA</p>','<p>OVULO</p>','<p>.</p>','2024-11-30'),
(426,11,'<p>CIRUELAX</p>','<p>Pulpa de ciruelas, manzanas, semillas de linaza y mie</p>','<p>TABLETA</p>','<p>.</p>','2024-01-30'),
(427,15,'<p>COMPENSIAL 300</p>','<p>FOSFOLIPIDOS ESENCIALES</p>','<p>TABLETA</p>','<p>.</p>','2024-09-30'),
(428,4,'<p>DEQUAZOL R&nbsp;</p>','<p>Lidoca&iacute;na + metronidazol + nistatina.</p>','<p>OVULO</p>','<p>.</p>','2025-08-30'),
(429,5,'<p>DEXAMETASONA 4 MG</p>','<p>DEXAMETASONA</p>','<p>TABLETA</p>','<p>.</p>','2024-02-28'),
(430,18,'<p>EUTIROX 100 MCG</p>','<p>LEVOTIROXINA</p>','<p>TABLETA&nbsp;</p>','<p>.</p>','2025-01-30'),
(431,11,'<p>EVALAX 17 GR</p>','<p>&nbsp;Polietilenglicol 3350</p>','<p>POLVO PARA SOLUCION ORAL</p>','<p>.</p>','2025-01-30'),
(432,12,'<p>EVIGAX FORTE 250 MG</p>','<p>SIMETICONA</p>','<p>CAPSULA</p>','<p>.</p>','2024-01-30'),
(433,16,'<p>FLAVOXATO 200 MG</p>','<p>FLAVOXATO</p>','<p>TABLETA</p>','<p>.</p>','2025-05-30'),
(434,19,'<p>FLUCONAZOL 150 MG</p>','<p>FLUCONAZOL&nbsp;</p>','<p>TABLETA</p>','<p>.</p>','2023-07-30'),
(435,2,'<p><span style=\"background-color: rgb(241, 196, 15);\">FLUDYCISTEINA 200 MG</span></p>','<p>ACETILCISTEINA</p>','<p>SOBRE</p>','<p>PR&Oacute;XIMO A VENCER</p>','2023-05-30'),
(436,2,'<p><span style=\"background-color: rgb(241, 196, 15);\">FLUDYCISTEINA 600 MG</span></p>','<p>ACETILCISTEINA</p>','<p>SOBRE</p>','<p>PR&Oacute;XIMO A VENCER</p>','2023-03-30'),
(437,5,'<p>GINGISONA B CARAMELO</p>','<p>&nbsp;Bencidamina Clorhidrato 3 mg</p>','<p>CARAMELO</p>','<p>.</p>','2023-10-30'),
(438,11,'<p>GLYCOLAX 17 GR</p>','<p>Polietilenglicol 3350</p>','<p>SOBRE</p>','<p>.</p>','2023-11-30'),
(439,5,'<p>KETOPROFENO 100 MG&nbsp;</p>','<p>KETOPROFENO</p>','<p>TABLETA</p>','<p>.</p>','2024-01-30'),
(440,3,'<p>LERGIZINA PLUS 5 MG</p>','<p>LEVOCETIRIZINA</p>','<p>TABLETA</p>','<p>.</p>','2024-08-30'),
(441,4,'<p>LEVOCTRIM FORTE 750 MG</p>','<p>LEVOFLOXACINO</p>','<p>TABLETA</p>','<p>.</p>','2023-07-30'),
(442,4,'<p>LEVOCTRIM 500 MG</p>','<p>LEVOFLOXACINO</p>','<p>TABLETA</p>','<p>.</p>','2024-08-30'),
(443,11,'<p>LISICAF 25 MG</p>','<p>LEVOSULPIRIDA</p>','<p>TABLETA</p>','<p>.</p>','2024-11-30'),
(444,2,'<p>MONTELUKAST 5 MG</p>','<p>MONTELUKAST</p>','<p>TABLETA</p>','<p>.</p>','2024-06-30'),
(445,2,'<p>MUCOASMAT 200 MG</p>','<p>ACETILCISTEINA</p>','<p>SOBRE</p>','<p>.</p>','2024-12-30'),
(446,2,'<p>MUCOASMAT 600 MG</p>','<p>ACETILCISTEINA</p>','<p>SOBRE</p>','<p>.</p>','2024-02-28'),
(447,16,'<p>PROSTASIL PLUS</p>','<p>Dutasterida 0.5mg + Tamsulosina 0.4mg</p>','<p>TABLETA</p>','<p>.</p>','2023-12-30'),
(448,16,'<p>PROSTANATUR 320 MG</p>','<p>EXTRACTO DE SERENOA REPENS</p>','<p>TABLETA</p>','<p>.</p>','2024-06-30'),
(449,16,'<p>PROSTANATUR MAX</p>','<p>EXTRACTO DE SERENOA REPEAS + EXTRACTO DE SOLANUM + LEVADURA</p>','<p>TABLETA</p>','<p>.</p>','2024-07-30'),
(450,11,'<p>REFLUCIL 5 MG</p>','<p>MOSAPRIDA</p>','<p>TABLETA</p>','<p>.</p>','2024-02-28'),
(451,7,'<p>SECNIDAZOL 500 MG</p>','<p>SECNIDAZOL</p>','<p>TABLETA</p>','<p>.</p>','2023-07-30'),
(452,5,'<p>SIFACOX 200 MG</p>','<p>CELECOXIB</p>','<p>TABLETA</p>','<p>.</p>','2024-09-30'),
(453,5,'<p>SIFACOX 400 MG</p>','<p>CELECOXIB</p>','<p>TABLETA</p>','<p>.</p>','2024-06-30'),
(454,16,'<p>TAMSUCAR 0.4 MG</p>','<p>TAMSULOSINA</p>','<p>TABLETA</p>','<p>.</p>','2024-01-30'),
(455,3,'<p>TDN ALLERGY 10 MG</p>','<p>CETIRIZINA</p>','<p>TABLETA</p>','<p>.</p>','2025-03-30'),
(456,5,'<p><span style=\"background-color: rgb(241, 196, 15);\">MULTIBIOTICOS</span></p>','<p>Cloruro de Decualinio 0.25mg y Benzoca&iacute;na 10mg</p>','<p>CARAMELOS</p>','<p>PROXIMO A VENCER</p>','2023-06-30'),
(457,9,'<p>NEUROBION</p>','<p>tiamina + piridoxina + cianocobalamina</p>','<p>TABLETA</p>','<p>.</p>','2024-06-30'),
(458,11,'<p>NULYTELY</p>','<p>ELECTR&Oacute;LITOS ORALES, POLIETILENGLICOL&nbsp;</p>','<p>SOBRE</p>','<p>.</p>','2025-04-30'),
(459,9,'<p>OSTEOBONE D FORTE</p>','<p>CITRATO DE CALCIO + VITAMINA D3</p>','<p>TABLETA</p>','<p>.</p>','2024-03-30'),
(460,15,'<p>PAXELIS RETARD</p>','<p>TAPENTADOL</p>','<p>TABLETA</p>','<p>.</p>','2024-09-30'),
(461,5,'<p>PANADOL 500 MG</p>','<p>PARACETAMOL</p>','<p>TABLETA</p>','<p>.</p>','2023-12-30'),
(462,15,'<p>PLIADINE PLUS 300&nbsp;</p>','<p>INSAPONIFICABLE DE PALTA Y SOYA + ACEITE DE SOYA</p>','<p>TABLETA</p>','<p>.</p>','2024-06-30'),
(464,15,'<p>VERTE 120 MG</p>','<p>ORLISTAT</p>','<p>TABLETA</p>','<p>.</p>','2023-07-30'),
(465,4,'<p><span style=\"background-color: rgb(241, 196, 15);\">ZITROLAB 500 MG</span></p>','<p>AZITROMICINA</p>','<p>TABLETA</p>','<p>PR&Oacute;XIMO A VENCER</p>','2023-06-30'),
(466,18,'<p>VACIDOX 0.5 MG</p>','<p>ESTRIOL</p>','<p>OVULO</p>','<p>..</p>','2023-09-30'),
(467,5,'<p><span style=\"background-color: rgb(241, 196, 15);\">MEDRODOL EXTRA FORTE</span></p>','<p>DICLOFENACO + PARACETAMOL&nbsp;</p>','<p>TABLETA</p>','<p>PR&Oacute;XIMO A VENCER</p>','2023-07-30'),
(468,5,'<p><span style=\"background-color: rgb(241, 196, 15);\">DOLOPRESS FORTE</span></p>','<p>DICLOFENACO + PARACETAMOL</p>','<p>TABLETA</p>','<p>PR&Oacute;XIMO A VENCER</p>','2023-07-30'),
(469,5,'<p><span style=\"background-color: rgb(241, 196, 15);\">MIODEL RELAX</span></p>','<p>DICLOFENACO + ORFENADRINA + PARACETAMOL</p>','<p>TABLETA</p>','<p>PR&Oacute;XIMO A VENCER</p>','2023-07-30'),
(470,5,'<p><span style=\"background-color: rgb(255, 255, 255);\">EXADIOL FLEX</span></p>','<p>CCELECOXIB + ORFENADRINA</p>','<p>TABLETA</p>','<p>.</p>','2023-12-30'),
(471,15,'<p>SERTRALINA 50 MG</p>','<p>SERTRALINA</p>','<p>TABLETA</p>','<p>.</p>','2024-12-30'),
(472,15,'<p>FLUOXETINA 20 MG</p>','<p>FLUOXETINA</p>','<p>TABLETA</p>','<p>.</p>','2024-12-30'),
(473,15,'<p>ALPRAZOLAN 0.5 MG</p>','<p>ALPRAZOLAN TAB</p>','<p>TABLETA</p>','<p>.</p>','2025-05-30'),
(474,2,'<p>AIRUM JAT</p>','<p>CODEINA + PSEUDOEFEDRINA + CLORFENAMINA</p>','<p>JARABE</p>','<p>.</p>','2024-05-30'),
(475,15,'<p>CLONAZEPAN 2 MG</p>','<p>CLONAZEPAN</p>','<p>TABLETA</p>','<p>.</p>','2023-07-30'),
(476,3,'<p>LIBBERA D</p>','<p>LEVOCETIRIZINA + PSEUDOEFEDRINA</p>','<p>TABLETA</p>','<p>.</p>','2025-02-28'),
(477,3,'<p>HISALER D</p>','<p>CETIRIZINA + PSEUDOEFEDRINA</p>','<p>TABLETA</p>','<p>.</p>','2025-03-30'),
(478,15,'<p>ERGOTRATE 0.2 MG</p>','<p>ERGOMETRINA</p>','<p>TABLETA</p>','<p>.</p>','2024-10-30'),
(479,15,'<p>PACITRAN 10 MG/ 2ML</p>','<p>DIAZEPAN</p>','<p>AMPOLLA</p>','<p>.</p>','2025-06-30'),
(480,3,'<p>ALERGICAL SF</p>','<p>CLORFENAMINA + PSEUDOEFEDRINA</p>','<p>JARABE</p>','<p>.</p>','2024-09-30'),
(481,15,'<p>TRAMAL 100 MG/2ML</p>','<p>TRAMADOL</p>','<p>TABLETA</p>','<p>.</p>','2026-09-30'),
(482,3,'<p>LIBBERA D 15 ML</p>','<p>LEVOCETIRIZINA + PSEUDOEFEDRINA</p>','<p>GOTAS</p>','<p>.</p>','2024-08-30'),
(483,12,'<p>ANGIDEX 30 MG</p>','<p>NIFEDIPINO</p>','<p>CAPSULA</p>','<p>.</p>','2024-10-30'),
(484,5,'<p>BANES 100 ML</p>','<p>IBUPROFENO</p>','<p>SUSPENSION</p>','<p>.</p>','2025-04-30'),
(485,5,'<p>BANES FORTE 200 MG/ 5ML</p>','<p>IBUPROFENO</p>','<p>SUSPENSION</p>','<p>.</p>','2025-06-30'),
(486,9,'<p>COMPLEJO B</p>','<p>PIRIDOXINA + TIAMINA + CIANOCOBALAMINA</p>','<p>TABLETA</p>','<p>.</p>','2023-11-30'),
(487,5,'<p>DEFLAZACORT 30 MG</p>','<p>DEFLAZACORT</p>','<p>TABLETA</p>','<p>.</p>','2024-12-30'),
(488,5,'<p>DICLOFENACO 50 MG</p>','<p>DICLOFENACO</p>','<p>TABLETA</p>','<p>.</p>','2025-05-30'),
(489,15,'<p>MEGATOB 5 ML</p>','<p>DEXAMETASONA, FOSFATO DE, TETRAHIDROZOLINA, TOBRAMICINA</p>','<p>GOTAS OFTALMICAS</p>','<p>.</p>','2025-05-30'),
(490,8,'<p>OMEPRAZOL 20 MG</p>','<p>OMEPRAZOL&nbsp;</p>','<p>TABLETA</p>','<p>.</p>','2025-08-30'),
(491,16,'<p><span style=\"background-color: rgb(241, 196, 15);\">ORIFLOW 0.4 MG</span></p>','<p>TAMSULOSINA</p>','<p>TABLETA</p>','<p>PR&Oacute;XIMO A VENCER</p>','2023-03-30'),
(492,15,'<p>PREGABALINA 150 MG</p>','<p>PREGABALINA</p>','<p>TABLETA</p>','<p>.</p>','2024-03-30'),
(493,14,'<p>DEXIDE 500 MG</p>','<p>METFORMINA</p>','<p>TABLETA</p>','<p>.</p>','2024-06-30'),
(494,2,'<p>BRONPAX 7.5 MG/ ML</p>','<p>AMBROXOL</p>','<p>GOTAS</p>','<p>.</p>','2025-02-28'),
(495,15,'<p>IRRIGOR PLUS</p>','<p>CITICOLINA, NIMODIPINA</p>','<p>TABLETA</p>','<p>.</p>','2025-04-22'),
(496,9,'<p>REDOXON</p>','<p>VITAMINA C + VITAMINA D</p>','<p>TABLETA EFERVESCENTE</p>','<p>.</p>','2023-12-31'),
(497,9,'<p>CURCUFLEX&nbsp;</p>','<p>CURCUMA + PIMIENTA NEGRA + JENGIBRE</p>','<p>CAPSULAS</p>','<p>.</p>','2023-12-15'),
(498,9,'<p>MAGNE SURE</p>','<p>QUINUA + MAGNESIO + ZINC</p>','<p>POLVO</p>','<p>.</p>','2024-03-30'),
(499,9,'<p>HIERRO SURE</p>','<p>HIERRO + CALCIO + ZINC + PROTEINA</p>','<p>POLVO</p>','<p>.</p>','2024-03-30'),
(500,9,'<p>CEFASABAL 400 GR FRASCO</p>','<p>VITAMINA A, B1, B2, B6, B12, C, D, E, &Aacute;CIDO FOLICO, &Aacute;CIDO PANTOT&Eacute;NICO, CALCIO, F&Oacute;SFORO, HIERRO, SODIO, POTASIO, ZINC + 6 MINERALES + OMEGA 3,6,9</p>','<p>POLVO</p>','<p>.</p>','2024-11-30'),
(501,9,'<p>ELASTIFLEX ULTRA COMPLEX</p>','<p>COL&Aacute;GENO HIDROLIZADO + GLUCOSAMINA + CONDROITINA + MSM + VITAMINA C + &Aacute;CIDO HIALUR&Oacute;NICO + MAGNESIO</p>','<p>POLVO</p>','<p>.</p>','2024-09-30'),
(502,9,'<p>COLAG FLEX</p>','<p>COL&Aacute;GENO HIDROLIZADO + GLUCOSAMINA + CONDROITINA + VITAMINA C + ZINC</p>','<p>POLVO</p>','<p>.</p>','2024-07-30'),
(503,9,'<p>GERIA SURE</p>','<p>MAGNESIO + ZINC + F&Oacute;SFORO + SODIO + POTASIO + HIERRO + CALCIO + VITAMINA A, B, C, D</p>','<p>POLVO</p>','<p>.</p>','2024-03-30'),
(504,15,'<p>ACICLOVIR 800 MG</p>','<p>ACICLOVIR</p>','<p>TABLETA</p>','<p>.</p>','2025-08-30'),
(505,5,'<p>DIOXAFLEX CB PLUS</p>','<p>DICLOFENACO + PRIDINOL</p>','<p>CAPSULA</p>','<p>.</p>','2024-08-30'),
(506,5,'<p>DIOXAFLEX PLUS</p>','<p>DICLOFENACO + PRIDINOL</p>','<p>AMPOLLA</p>','<p>.</p>','2023-08-30');

/*Table structure for table `usuarios` */

DROP TABLE IF EXISTS `usuarios`;

CREATE TABLE `usuarios` (
  `idusuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(70) NOT NULL,
  `apellidos` varchar(70) NOT NULL,
  `nombreusuario` varchar(25) NOT NULL,
  `clave` varchar(100) NOT NULL,
  `fechacreacion` date NOT NULL,
  `fechabaja` date DEFAULT NULL,
  `nivelacceso` char(1) NOT NULL,
  `estado` char(1) NOT NULL,
  `email` varchar(50) NOT NULL,
  `codverificacion` char(6) DEFAULT NULL,
  PRIMARY KEY (`idusuario`),
  UNIQUE KEY `uk_nombreusuario_user` (`nombreusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

/*Data for the table `usuarios` */

insert  into `usuarios`(`idusuario`,`nombres`,`apellidos`,`nombreusuario`,`clave`,`fechacreacion`,`fechabaja`,`nivelacceso`,`estado`,`email`,`codverificacion`) values 
(1,'Jesus Alberto','Ayasta Tasayco','Jesus','$2y$10$dvgzm2Jmh0u98DerZSGkX.QH5rVqqD/ctSC3UCgYNj4jFh0CgR5mi','2022-11-15',NULL,'A','A','estadistica.chincha@famisalud.com.pe',NULL),
(2,'Litza','Arroyo','Litza','$2y$10$pHiM1bP1CPSDzopAnXagQes08xmCVZal00URx2qlhGmC74ZkJlCE.','2022-11-15',NULL,'F','A','farmacia.chincha@famisalud.com.pe',NULL),
(3,'Médico','Famisalud','Médico Famisalud','$2y$10$dvgzm2Jmh0u98DerZSGkX.QH5rVqqD/ctSC3UCgYNj4jFh0CgR5mi','2022-11-15',NULL,'M','A','estadistica.chincha@famisalud.com.pe',NULL),
(4,'Yoleida','PALMAR   ','DIRECCIÓN MEDICA','$2y$10$I642YzPxLDQS.d0o2xbpk.OeuFm3v7p4tPiA.erZ/jwbg0pV1zW2.','2022-12-20',NULL,'M','A','estadistica.chincha@famisalud.com.pe',NULL),
(5,'ELSIE ESTEFANNI','PORTAL ALMEYDA','OBSTETRIS','$2y$10$dvgzm2Jmh0u98DerZSGkX.QH5rVqqD/ctSC3UCgYNj4jFh0CgR5mi','2022-12-20',NULL,'M','A','eportalalmeyda@gmail.com.pe',NULL),
(6,'JESUS','CRUZ MEJIA','GINECOLOGIA','$2y$10$dvgzm2Jmh0u98DerZSGkX.QH5rVqqD/ctSC3UCgYNj4jFh0CgR5mi','2022-12-20',NULL,'M','A','estadistica.chincha@famisalud.com.pe',NULL),
(7,'NELIDA','ATOCCSA ','MEDICINA FISICA ','$2y$10$dvgzm2Jmh0u98DerZSGkX.QH5rVqqD/ctSC3UCgYNj4jFh0CgR5mi','2022-12-20',NULL,'M','A','nelida_201525@hotmail.com',NULL);

/* Procedure structure for procedure `spu_categorias_cargar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_categorias_cargar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_categorias_cargar`()
BEGIN
	SELECT * FROM categorias ORDER BY idcategoria;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_eliminar_producto` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_eliminar_producto` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_eliminar_producto`(IN _idproducto INT)
BEGIN
		DELETE FROM productos
		WHERE idproducto = _idproducto;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_emailnoexiste_registrado` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_emailnoexiste_registrado` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_emailnoexiste_registrado`(
	IN _email VARCHAR(50)
)
BEGIN
	SELECT * FROM usuarios
	WHERE email = _email;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_nombreproducto_registrado` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_nombreproducto_registrado` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_nombreproducto_registrado`(
	IN _nombreproducto VARCHAR(50)
)
BEGIN
	SELECT * FROM productos
	WHERE nombreproducto = _nombreproducto;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_nombreusuario_registrado` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_nombreusuario_registrado` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_nombreusuario_registrado`(
	IN _nombreusuario VARCHAR(25)
)
BEGIN
	SELECT * FROM usuarios 
	WHERE nombreusuario = _nombreusuario;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_productos_filtrar_categorias` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_productos_filtrar_categorias` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_productos_filtrar_categorias`(
 IN _idcategoria INT
)
BEGIN
	SELECT * FROM productos
	INNER JOIN categorias ON categorias.idcategoria = productos.idcategoria
	WHERE productos.idcategoria= _idcategoria;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_productos_getdata` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_productos_getdata` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_productos_getdata`(IN _idproducto INT)
BEGIN
	SELECT * FROM productos
	WHERE idproducto = _idproducto;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_productos_modificar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_productos_modificar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_productos_modificar`(
	IN _idproducto INT,
	IN _nombreproducto TEXT,
	IN _principiosactivos TEXT,
	IN _formafarmaceutica TEXT,
	IN _descripcion TEXT,
	in _fechavencimiento date
)
BEGIN
	UPDATE productos SET
	nombreproducto = _nombreproducto,
	principiosactivos = _principiosactivos,
	formafarmaceutica = _formafarmaceutica,
	descripcion = _descripcion,
	fechavencimiento = _fechavencimiento
	WHERE idproducto = _idproducto;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_productos_registro` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_productos_registro` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_productos_registro`(
	IN _idcategoria			INT,
	IN _nombreproducto		TEXT,
	IN _principiosactivos		TEXT,
	IN _formafarmaceutica 		TEXT,
	IN _descripcion			TEXT,
	in _fechavencimiento date
)
BEGIN	
	INSERT INTO productos(idcategoria, nombreproducto, principiosactivos, formafarmaceutica, descripcion, fechavencimiento) VALUES 
			(_idcategoria, _nombreproducto, _principiosactivos, _formafarmaceutica, _descripcion, _fechavencimiento);
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_usuarios_actualizarclave` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_usuarios_actualizarclave` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_usuarios_actualizarclave`(
	IN _idusuario INT,
	IN _clave	VARCHAR(100)
)
BEGIN
	UPDATE usuarios SET clave = _clave WHERE idusuario = _idusuario;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_usuarios_eliminar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_usuarios_eliminar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_usuarios_eliminar`(
	IN _idusuario INT
)
BEGIN
	UPDATE usuarios SET
		fechabaja = CURDATE(),
		estado = "I"
	WHERE idusuario = _idusuario;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_usuarios_getdata` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_usuarios_getdata` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_usuarios_getdata`(IN _idusuario INT)
BEGIN
	SELECT idusuario, nombres, apellidos, nombreusuario, clave, fechacreacion, fechabaja, 
		CASE 
			WHEN nivelacceso = "A" THEN "Administrador"
			WHEN nivelacceso = "F" THEN "Farmacia"
			WHEN nivelacceso = "M" THEN "Médico"
		END "nivelacceso", estado, email, codverificacion
	 FROM usuarios
	WHERE idusuario = _idusuario;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_usuarios_listar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_usuarios_listar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_usuarios_listar`()
BEGIN
	SELECT idusuario, nombres, apellidos, nombreusuario, clave, fechacreacion, fechabaja, 
		CASE 
			WHEN nivelacceso = "A" THEN "Administrador"
			WHEN nivelacceso = "F" THEN "Farmacia"
			WHEN nivelacceso = "M" THEN "Médico"
		END "nivelacceso", estado, email, codverificacion
	 FROM usuarios;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_usuarios_login` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_usuarios_login` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_usuarios_login`(
	IN _nombreusuario 	VARCHAR(25)
)
BEGIN
	SELECT idusuario, nombres, apellidos, nombreusuario, clave, fechacreacion, fechabaja, 
		CASE 
			WHEN nivelacceso = "A" THEN "Administrador"
			WHEN nivelacceso = "F" THEN "Farmacia"
			WHEN nivelacceso = "M" THEN "Médico"
		END "nivelacceso", estado, email, codverificacion
	 FROM usuarios
	WHERE nombreusuario = _nombreusuario AND estado = "A";
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_usuarios_modificar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_usuarios_modificar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_usuarios_modificar`(
	IN _idusuario INT,
	IN _nombreusuario VARCHAR(25),
	IN _nivelacceso CHAR(1),
	IN _email VARCHAR(50)
)
BEGIN
	UPDATE usuarios SET
		nombreusuario = _nombreusuario,
		nivelacceso = _nivelacceso,
		email = _email
	WHERE idusuario = _idusuario;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_usuarios_reactivar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_usuarios_reactivar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_usuarios_reactivar`(
	IN _idusuario INT
)
BEGIN
	UPDATE usuarios SET
		fechacreacion = CURDATE(),
		fechabaja = NULL,
		estado = "A"
	WHERE idusuario = _idusuario;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_usuarios_registro` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_usuarios_registro` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_usuarios_registro`(
	IN _nombres 			VARCHAR(50),
	IN _apellidos 			VARCHAR(50),
	IN _nombreusuario 		VARCHAR(25),
	IN _nivelacceso			CHAR(1),
	IN _email			VARCHAR(80)
)
BEGIN
	INSERT INTO usuarios(nombres, apellidos,nombreusuario, clave, fechacreacion,fechabaja, nivelacceso, estado, email, codverificacion)VALUES
			(_nombres, _apellidos, _nombreusuario, "$2y$10$dvgzm2Jmh0u98DerZSGkX.QH5rVqqD/ctSC3UCgYNj4jFh0CgR5mi", CURDATE(), NULL, _nivelacceso, "A", _email, NULL);
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_usuario_codverificacion` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_usuario_codverificacion` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_usuario_codverificacion`(
	IN _idusuario INT,
	IN _codverificacion CHAR(6)
)
BEGIN 
	UPDATE usuarios SET
		codverificacion = _codverificacion
	WHERE idusuario = _idusuario;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_usuario_eliminarcodverificacion` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_usuario_eliminarcodverificacion` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_usuario_eliminarcodverificacion`(IN _idusuario INT)
BEGIN 
	UPDATE usuarios SET
		codverificacion = NULL
	WHERE idusuario = _idusuario;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_usuario_verificarcorreo` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_usuario_verificarcorreo` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_usuario_verificarcorreo`(IN _email VARCHAR(50))
BEGIN	
		SELECT idusuario, CONCAT (apellidos, " ", nombres) AS 'datospersona', nombreusuario, clave, fechacreacion, fechabaja, 
		CASE 
			WHEN nivelacceso = "A" THEN "Administrador"
			WHEN nivelacceso = "F" THEN "Farmacia"
			WHEN nivelacceso = "M" THEN "Médico"
		END "nivelacceso", estado, email, codverificacion
	 FROM usuarios
	 WHERE email =_email AND estado = "A";
END */$$
DELIMITER ;

/*Table structure for table `vista_listar_productos_farmacia` */

DROP TABLE IF EXISTS `vista_listar_productos_farmacia`;

/*!50001 DROP VIEW IF EXISTS `vista_listar_productos_farmacia` */;
/*!50001 DROP TABLE IF EXISTS `vista_listar_productos_farmacia` */;

/*!50001 CREATE TABLE  `vista_listar_productos_farmacia`(
 `idproducto` int(11) ,
 `nombreproducto` text ,
 `categoria` varchar(50) ,
 `principiosactivos` text ,
 `formafarmaceutica` text ,
 `descripcion` text ,
 `fechavencimiento` date 
)*/;

/*View structure for view vista_listar_productos_farmacia */

/*!50001 DROP TABLE IF EXISTS `vista_listar_productos_farmacia` */;
/*!50001 DROP VIEW IF EXISTS `vista_listar_productos_farmacia` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_listar_productos_farmacia` AS select `productos`.`idproducto` AS `idproducto`,`productos`.`nombreproducto` AS `nombreproducto`,`categorias`.`categoria` AS `categoria`,`productos`.`principiosactivos` AS `principiosactivos`,`productos`.`formafarmaceutica` AS `formafarmaceutica`,`productos`.`descripcion` AS `descripcion`,`productos`.`fechavencimiento` AS `fechavencimiento` from (`productos` join `categorias` on(`categorias`.`idcategoria` = `productos`.`idcategoria`)) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
