/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 10.4.24-MariaDB : Database - sistemafarmacia
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;

/*Data for the table `categorias` */

insert  into `categorias`(`idcategoria`,`categoria`) values 
(5,'Analgésicos - Aines solos y combinados'),
(8,'Antiacidos y Protectores gastricos'),
(4,'Antibioticos e Insulinas'),
(1,'Anticatarrales'),
(3,'Antihistaminicos'),
(7,'Antiparasitario'),
(12,'Cardiovasculares'),
(2,'Fluidificantes'),
(11,'Gastrointestinal'),
(14,'Hipolipemiantes'),
(10,'Inhaladores'),
(15,'Otros'),
(13,'Psicofarmacos'),
(6,'Tratamentiento para colesterol y trigliseridos'),
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `productos` */

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

/*Data for the table `usuarios` */

insert  into `usuarios`(`idusuario`,`nombres`,`apellidos`,`nombreusuario`,`clave`,`fechacreacion`,`fechabaja`,`nivelacceso`,`estado`,`email`,`codverificacion`) values 
(1,'Jesus Alberto','Ayasta Tasayco','Jesus','$2y$10$dvgzm2Jmh0u98DerZSGkX.QH5rVqqD/ctSC3UCgYNj4jFh0CgR5mi','2022-11-15',NULL,'A','A','estadistica.chincha@famisalud.com.pe',NULL),
(2,'Litza','Arroyo','Litza','$2y$10$dvgzm2Jmh0u98DerZSGkX.QH5rVqqD/ctSC3UCgYNj4jFh0CgR5mi','2022-11-15',NULL,'F','A','farmacia.chincha@famisalud.com.pe',NULL),
(3,'Médico','Famisalud','Médico Famisalud','$2y$10$dvgzm2Jmh0u98DerZSGkX.QH5rVqqD/ctSC3UCgYNj4jFh0CgR5mi','2022-11-15',NULL,'M','A','estadistica.chincha@famisalud.com.pe',NULL);

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
