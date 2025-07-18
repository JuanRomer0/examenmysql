CREATE TABLE IF NOT EXISTS pais (
id_pais smallint unsigned PRIMARY KEY NOT NULL AUTO_INCREMENT,
nombre VARCHAR(50),
ultima_actualizacion timestamp
)ENGINE=INNODB;


CREATE TABLE IF NOT EXISTS ciudad (
id_ciudad smallint unsigned PRIMARY KEY NOT NULL AUTO_INCREMENT,
nombre VARCHAR(50),
id_pais smallint unsigned,
FOREIGN KEY (id_pais) REFERENCES pais(id_pais),
ultima_actualizacion timestamp
)ENGINE=INNODB;


CREATE TABLE IF NOT EXISTS direccion (
id_direccion smallint unsigned PRIMARY KEY NOT NULL AUTO_INCREMENT,
direccion VARCHAR(50),
direccion2 VARCHAR(50),
distrito VARCHAR(20),
id_ciudad smallint unsigned,
FOREIGN KEY (id_ciudad) REFERENCES ciudad(id_ciudad),
codigo_postal VARCHAR(10),
telefono VARCHAR(20),
ultima_actualizacion timestamp
)ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS categoria (
id_categoria tinyint unsigned PRIMARY KEY NOT NULL AUTO_INCREMENT,
nombre VARCHAR(25),
ultima_actualizacion timestamp
)ENGINE=INNODB;


CREATE TABLE IF NOT EXISTS pago (
id_pago smallint unsigned PRIMARY KEY NOT NULL AUTO_INCREMENT,
id_cliente smallint unsigned,
id_empreado tinyint unsigned,
id_alquiler INT,
total DECIMAL(5,2),
fecha_pago datetime,
ultima_actualizacion timestamp
)ENGINE=INNODB;


CREATE TABLE IF NOT EXISTS alquiler (
id_alquiler INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
fecha_alquiler datetime,
id_inventario mediumint unsigned,
id_cliente smallint unsigned,
fecha_devolucion datetime,
id_empleado tinyint unsigned,
ultima_actualizacion timestamp
)ENGINE=INNODB;


CREATE TABLE IF NOT EXISTS empleado (
id_empleado tinyint unsigned PRIMARY KEY NOT NULL AUTO_INCREMENT,
nombre VARCHAR(45),
apellidos VARCHAR(45),
id_direccion smallint unsigned,
FOREIGN KEY (id_direccion) REFERENCES direccion(id_direccion),
imagen blob,
email VARCHAR(50),
id_almacen tinyint unsigned,
activo tinyint(1),
username VARCHAR(16),
password VARCHAR(40),
ultima_actualizacion timestamp
)ENGINE=INNODB;


CREATE TABLE IF NOT EXISTS almacen (
id_almacen tinyint unsigned PRIMARY KEY NOT NULL AUTO_INCREMENT,
id_empleado_jefe tinyint unsigned,
FOREIGN KEY (id_empleado_jefe) REFERENCES empleado(id_empleado),
id_direccion smallint unsigned,
FOREIGN KEY (id_direccion) REFERENCES direccion(id_direccion),
ultima_actualizacion timestamp
)ENGINE=INNODB;


CREATE TABLE IF NOT EXISTS cliente (
id_cliente smallint unsigned PRIMARY KEY NOT NULL AUTO_INCREMENT,
id_almacen tinyint unsigned,
FOREIGN KEY (id_almacen) REFERENCES almacen(id_almacen),
nombre VARCHAR(45),
apellidos VARCHAR(45),
email VARCHAR(50),
id_direccion smallint unsigned,
FOREIGN KEY (id_direccion) REFERENCES direccion(id_direccion),
activo tinyint(1),
fecha_creacion datetime,
ultima_actualizacion timestamp
)ENGINE=INNODB;


CREATE TABLE IF NOT EXISTS actor (
id_actor smallint unsigned PRIMARY KEY NOT NULL AUTO_INCREMENT,
nombre VARCHAR(45),
apellidos VARCHAR(45),
ultima_actualizacion timestamp
)ENGINE=INNODB;


CREATE TABLE IF NOT EXISTS idioma (
id_idioma tinyint unsigned PRIMARY KEY NOT NULL AUTO_INCREMENT,
nombre CHAR(20),
ultima_actualizacion timestamp
)ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS pelicula (
id_pelicula smallint unsigned PRIMARY KEY NOT NULL AUTO_INCREMENT,
titulo VARCHAR(20),
descripcion text,
anyo_lanzamiento year,
id_idioma tinyint unsigned,
FOREIGN KEY (id_idioma) REFERENCES idioma(id_idioma),
id_idioma_original tinyint unsigned,
FOREIGN KEY (id_idioma_original) REFERENCES idioma(id_idioma),
duracion_alquiler tinyint unsigned,
rental_rate DECIMAL(4,2),
duracion smallint unsigned,
replacement_cost DECIMAL(5,2),
clasificacion enum('G','PG-13','R','NC-17'),
caracteristicas_especiales set('Trailers','Commentaries','Deleted Scenes','Behind the Scenes'),
ultima_actualizacion timestamp
)ENGINE=INNODB;


CREATE TABLE IF NOT EXISTS pelicula_categoria (
id_pelicula smallint unsigned,
id_categoria tinyint unsigned,
PRIMARY KEY(id_pelicula, id_categoria),
FOREIGN KEY (id_pelicula) REFERENCES pelicula(id_pelicula),
FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria),
ultima_actualizacion timestamp
)ENGINE=INNODB;


CREATE TABLE IF NOT EXISTS pelicula_actor (
id_actor smallint unsigned,
id_pelicula smallint unsigned,
PRIMARY KEY(id_actor, id_pelicula),
FOREIGN KEY (id_actor) REFERENCES actor(id_actor),
FOREIGN KEY (id_pelicula) REFERENCES pelicula(id_pelicula),
ultima_actualizacion timestamp
)ENGINE=INNODB;


CREATE TABLE IF NOT EXISTS inventario (
id_inventario mediumint unsigned PRIMARY KEY NOT NULL AUTO_INCREMENT,
id_pelicula smallint unsigned,
FOREIGN KEY (id_pelicula) REFERENCES pelicula(id_pelicula),
id_almacen tinyint unsigned,
FOREIGN KEY (id_almacen) REFERENCES almacen(id_almacen),
ultima_actualizacion timestamp
)ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS film_text (
film_id smallint PRIMARY KEY NOT NULL AUTO_INCREMENT,
title VARCHAR(255),
description text
)ENGINE=INNODB;

