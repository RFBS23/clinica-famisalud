USE SISTEMAFARMACIA;

-- ---------------------------------------------------------------------------------------------
-- USUARIOS
-- ---------------------------------------------------------------------------------------------
DELIMITER $$
CREATE PROCEDURE spu_usuarios_registro
(
	IN _nombres 			VARCHAR(50),
	IN _apellidos 			VARCHAR(50),
	IN _nombreusuario 		VARCHAR(25),
	IN _nivelacceso			CHAR(1),
	IN _email			VARCHAR(80)
)
BEGIN
	INSERT INTO usuarios(nombres, apellidos,nombreusuario, clave, fechacreacion,fechabaja, nivelacceso, estado, email, codverificacion)VALUES
			(_nombres, _apellidos, _nombreusuario, "$2y$10$dvgzm2Jmh0u98DerZSGkX.QH5rVqqD/ctSC3UCgYNj4jFh0CgR5mi", CURDATE(), NULL, _nivelacceso, "A", _email, NULL);
END $$

DELIMITER $$
CREATE PROCEDURE spu_usuarios_login
(
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
END $$

CALL spu_usuarios_registro("Jesus Alberto", "Ayasta Tasayco", "Jesus", "A", "estadistica.chincha@famisalud.com.pe");
CALL spu_usuarios_registro("Litza", "Arroyo", "Litza", "F", "farmacia.chincha@famisalud.com.pe");
CALL spu_usuarios_registro("Médico", "Famisalud", "Médico Famisalud", "M", "estadistica.chincha@famisalud.com.pe");

DELIMITER $$
CREATE PROCEDURE spu_usuarios_actualizarclave
(
	IN _idusuario INT,
	IN _clave	VARCHAR(100)
)
BEGIN
	UPDATE usuarios SET clave = _clave WHERE idusuario = _idusuario;
END $$

DELIMITER $$
CREATE PROCEDURE spu_usuarios_listar()
BEGIN
	SELECT idusuario, nombres, apellidos, nombreusuario, clave, fechacreacion, fechabaja, 
		CASE 
			WHEN nivelacceso = "A" THEN "Administrador"
			WHEN nivelacceso = "F" THEN "Farmacia"
			WHEN nivelacceso = "M" THEN "Médico"
		END "nivelacceso", estado, email, codverificacion
	 FROM usuarios;
END$$

DELIMITER $$
CREATE PROCEDURE spu_usuarios_eliminar
(
	IN _idusuario INT
)
BEGIN
	UPDATE usuarios SET
		fechabaja = CURDATE(),
		estado = "I"
	WHERE idusuario = _idusuario;
END $$

DELIMITER $$
CREATE PROCEDURE spu_usuarios_reactivar
(
	IN _idusuario INT
)
BEGIN
	UPDATE usuarios SET
		fechacreacion = CURDATE(),
		fechabaja = NULL,
		estado = "A"
	WHERE idusuario = _idusuario;
END $$

DELIMITER$$
CREATE PROCEDURE spu_nombreusuario_registrado
(
	IN _nombreusuario VARCHAR(25)
)
BEGIN
	SELECT * FROM usuarios 
	WHERE nombreusuario = _nombreusuario;
END$$

DELIMITER $$
CREATE PROCEDURE spu_usuarios_getdata(IN _idusuario INT)
BEGIN
	SELECT idusuario, nombres, apellidos, nombreusuario, clave, fechacreacion, fechabaja, 
		CASE 
			WHEN nivelacceso = "A" THEN "Administrador"
			WHEN nivelacceso = "F" THEN "Farmacia"
			WHEN nivelacceso = "M" THEN "Médico"
		END "nivelacceso", estado, email, codverificacion
	 FROM usuarios
	WHERE idusuario = _idusuario;
END $$

DELIMITER $$
CREATE PROCEDURE spu_usuarios_modificar
(
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
END $$

DELIMITER$$
CREATE PROCEDURE spu_emailnoexiste_registrado -- listo
(
	IN _email VARCHAR(50)
)
BEGIN
	SELECT * FROM usuarios
	WHERE email = _email;
END$$

DELIMITER $$ -- listo
CREATE PROCEDURE spu_usuario_codverificacion(
	IN _idusuario INT,
	IN _codverificacion CHAR(6)
)
BEGIN 
	UPDATE usuarios SET
		codverificacion = _codverificacion
	WHERE idusuario = _idusuario;
END $$

DELIMITER $$
CREATE PROCEDURE spu_usuario_eliminarcodverificacion(IN _idusuario INT)  -- listo
BEGIN 
	UPDATE usuarios SET
		codverificacion = NULL
	WHERE idusuario = _idusuario;
END $$

DELIMITER $$
CREATE PROCEDURE spu_usuario_verificarcorreo(IN _email VARCHAR(50)) -- listo
BEGIN	
		SELECT idusuario, CONCAT (apellidos, " ", nombres) AS 'datospersona', nombreusuario, clave, fechacreacion, fechabaja, 
		CASE 
			WHEN nivelacceso = "A" THEN "Administrador"
			WHEN nivelacceso = "F" THEN "Farmacia"
			WHEN nivelacceso = "M" THEN "Médico"
		END "nivelacceso", estado, email, codverificacion
	 FROM usuarios
	 WHERE email =_email AND estado = "A";
END $$

-- ----------------------------------------------------------------------------------------------------------------------
-- CATEGORIAS
-- ----------------------------------------------------------------------------------------------------------------------

DELIMITER $$
CREATE PROCEDURE spu_categorias_cargar()
BEGIN
	SELECT * FROM categorias ORDER BY idcategoria;
END $$

DELIMITER $$
CREATE PROCEDURE spu_productos_filtrar_categorias
(
 IN _idcategoria INT
)
BEGIN
	SELECT * FROM productos
	INNER JOIN categorias ON categorias.idcategoria = productos.idcategoria
	WHERE productos.idcategoria= _idcategoria;
END $$
-- ----------------------------------------------------------------------------------------------------------------------
-- PRODUCTOS
-- ----------------------------------------------------------------------------------------------------------------------
DELIMITER $$
CREATE PROCEDURE spu_productos_registro
(
	IN _idcategoria			INT,
	IN _nombreproducto		TEXT,
	IN _principiosactivos		TEXT,
	IN _formafarmaceutica 		TEXT,
	IN _descripcion			TEXT,
	IN _fechavencimiento DATE
)
BEGIN	
	INSERT INTO productos(idcategoria, nombreproducto, principiosactivos, formafarmaceutica, descripcion, fechavencimiento) VALUES 
			(_idcategoria, _nombreproducto, _principiosactivos, _formafarmaceutica, _descripcion, _fechavencimiento);
END $$

DELIMITER $$
CREATE PROCEDURE spu_nombreproducto_registrado -- listo
(
	IN _nombreproducto VARCHAR(50)
)
BEGIN
	SELECT * FROM productos
	WHERE nombreproducto = _nombreproducto;
END $$

DELIMITER $$
CREATE PROCEDURE spu_eliminar_producto(IN _idproducto INT)
BEGIN
		DELETE FROM productos
		WHERE idproducto = _idproducto;
END$$

DELIMITER$$
CREATE PROCEDURE spu_productos_modificar
(
	IN _idproducto INT,
	IN _nombreproducto TEXT,
	IN _principiosactivos TEXT,
	IN _formafarmaceutica TEXT,
	IN _descripcion TEXT,
	IN _fechavencimiento DATE
)
BEGIN
	UPDATE productos SET
	nombreproducto = _nombreproducto,
	principiosactivos = _principiosactivos,
	formafarmaceutica = _formafarmaceutica,
	descripcion = _descripcion,
	fechavencimiento = _fechavencimiento
	WHERE idproducto = _idproducto;
END$$

DELIMITER $$
CREATE PROCEDURE spu_productos_getdata(IN _idproducto INT)
BEGIN
	SELECT * FROM productos
	WHERE idproducto = _idproducto;
END $$

-- ------------------------------------------------------------------------------------------------------------
-- VISTAS
-- ------------------------------------------------------------------------------------------------------------


CREATE VIEW vista_listar_productos_farmacia
AS
SELECT idproducto, nombreproducto, categorias.categoria, principiosactivos, formafarmaceutica, descripcion, fechavencimiento
FROM productos
INNER JOIN categorias ON categorias.idcategoria = productos.idcategoria;


