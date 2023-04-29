CREATE DATABASE SISTEMAFARMACIA;
USE SISTEMAFARMACIA;

CREATE TABLE usuarios(
	idusuario		INT 			AUTO_INCREMENT PRIMARY KEY,
	nombres			VARCHAR(70)		NOT NULL,
	apellidos		VARCHAR(70)		NOT NULL,
	nombreusuario		VARCHAR(25)		NOT NULL,
	clave			VARCHAR(100)		NOT NULL,
	fechacreacion 		DATE 			NOT NULL,
	fechabaja		DATE 			NULL,
	nivelacceso	 	CHAR(1)			NOT NULL,
	estado			CHAR(1)			NOT NULL,
	email 			VARCHAR(50) 		NOT NULL,
	codverificacion 	CHAR(6) 		NULL,
	CONSTRAINT uk_nombreusuario_user UNIQUE (nombreusuario)
)ENGINE = INNODB;

CREATE TABLE categorias(
	idcategoria		INT 			AUTO_INCREMENT PRIMARY KEY,
	categoria		VARCHAR(50)		NOT NULL,
	CONSTRAINT uk_categoria_cat UNIQUE (categoria)
)ENGINE = INNODB;

CREATE TABLE productos(
	idproducto		INT 			AUTO_INCREMENT PRIMARY KEY,
	idcategoria		INT			NOT NULL,
	nombreproducto		TEXT		NOT NULL,
	principiosactivos	TEXT		NOT NULL,
	formafarmaceutica	TEXT		NOT NULL,
	descripcion		TEXT			NOT NULL,
	fechavencimiento DATE	NOT NULL,
	CONSTRAINT fk_idcategoria_prod FOREIGN KEY (idcategoria) REFERENCES categorias(idcategoria)
)ENGINE = INNODB;


INSERT INTO categorias(categoria) VALUES
("Anticatorrales"),
("Fluidificantes"),
("Antistaminicos"),
("Antibioticos"),
("Analgèsicos y Aines sales combinados"),
("Tratamentiento para colesterol y trigliseridos"),
("Antiparasitario"),
("Antiacidos y Protectores gastricos"),
("Vitaminas"),
("Otros");

SELECT * FROM categorias ORDER BY idcategoria