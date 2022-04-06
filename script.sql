--Parte 1
--1.Crear una base de datos con nombre “Posts”.
CREATE DATABASE posts;
\c posts;

--2. Crear una tabla “post”, con los atributos id, nombre de usuario, fecha de creación,
--contenido y descripción.
CREATE TABLE post(id SERIAL PRIMARY KEY, nombre_usuario VARCHAR(25) NOT NULL, fecha_creacion DATE NOT NULL, contenido VARCHAR(255) NOT NULL, descripcion VARCHAR(255) NOT NULL);

--3. Insertar 3 post, 2 para el usuario "Pamela" y uno para "Carlos".
INSERT INTO post(nombre_usuario, fecha_creacion, contenido, descripcion) VALUES ('pamela', '1999-01-01', 'Ejemplo de contenido 1', 'Ejemplo de descripcion');
INSERT INTO post(nombre_usuario, fecha_creacion, contenido, descripcion) VALUES ('pamela', '1984-08-09', 'Ejemplo de contenido 2', 'Ejemplo de descripcion 2');
INSERT INTO post(nombre_usuario, fecha_creacion, contenido, descripcion) VALUES ('Carlos', '2015-11-21', 'Ejemplo de contenido 3', 'Ejemplo de descripcion 3');

--4. Modificar la tabla post, agregando la columna título.
ALTER TABLE post ADD titulo VARCHAR(45);

--5. Agregar título a las publicaciones ya ingresadas.
UPDATE post SET titulo = 'Titulo 1' where id = 1;
UPDATE post SET titulo = 'Titulo 12' where id = 2;
UPDATE post SET titulo = 'Titulo 123' where id = 3;

--6. Insertar 2 post para el usuario "Pedro".
INSERT INTO post(nombre_usuario, fecha_creacion, contenido, descripcion, titulo) VALUES ('Pedro', '1998-11-11', 'Ejemplo de contenido 4', 'Ejemplo de descripcion 4', 'Titulo 4');
INSERT INTO post(nombre_usuario, fecha_creacion, contenido, descripcion, titulo) VALUES ('Pedro', '1945-03-21', 'Ejemplo de contenido 5', 'Ejemplo de descripcion 5', 'Titulo 5');

--7. Eliminar el post de Carlos.
DELETE FROM post WHERE id = 3;

--8. Ingresar un nuevo post para el usuario "Carlos".
INSERT INTO post(nombre_usuario, fecha_creacion, contenido, descripcion, titulo) VALUES ('Carlos', '2016-11-21', 'Ejemplo de contenido 6', 'Ejemplo de descripcion 6', 'Titulo 6');

--Parte 2
--1. Crear una nueva tabla llamada “comentarios”, con los atributos id, fecha, hora de
--creación y contenido, que se relacione con la tabla posts.
CREATE TABLE comentarios(id SERIAL PRIMARY KEY, id_post INT NOT NULL, fecha DATE NOT NULL, hora_creacion TIME NOT NULL, contenido VARCHAR(255) NOT NULL, FOREIGN KEY (id_post) REFERENCES post(id));

--2. Crear 2 comentarios para el post de "Pamela" y 4 para "Carlos".
INSERT INTO comentarios(id_post, fecha, hora_creacion, contenido) VALUES (1, '1999-01-02', '23:12:45', 'Ejemplo de comentario 1');
INSERT INTO comentarios(id_post, fecha, hora_creacion, contenido) VALUES (2, '1984-08-19', '12:12:45', 'Ejemplo de comentario 2');
INSERT INTO comentarios(id_post, fecha, hora_creacion, contenido) VALUES (6, '1999-01-02', '13:12:45', 'Ejemplo de comentario 1');
INSERT INTO comentarios(id_post, fecha, hora_creacion, contenido) VALUES (6, '1999-01-02', '14:12:45', 'Ejemplo de comentario 2');
INSERT INTO comentarios(id_post, fecha, hora_creacion, contenido) VALUES (6, '1999-01-02', '15:12:45', 'Ejemplo de comentario 3');
INSERT INTO comentarios(id_post, fecha, hora_creacion, contenido) VALUES (6, '1999-01-02', '16:12:45', 'Ejemplo de comentario 4');

--3. Crear un nuevo post para "Margarita".
INSERT INTO post(nombre_usuario, fecha_creacion, contenido, descripcion, titulo) VALUES ('Margarita', '1815-03-22', 'Ejemplo de contenido Margarita', 'Ejemplo de descripcion Margarita', 'Titulo Margarita');

--4. Ingresar 5 comentarios para el post de Margarita.
INSERT INTO comentarios(id_post, fecha, hora_creacion, contenido) VALUES (7, '1959-01-22', '23:12:45', 'Ejemplo de comentario margarita 1');
INSERT INTO comentarios(id_post, fecha, hora_creacion, contenido) VALUES (7, '1954-08-29', '12:12:45', 'Ejemplo de comentario margarita 2');
INSERT INTO comentarios(id_post, fecha, hora_creacion, contenido) VALUES (7, '1959-03-22', '13:12:45', 'Ejemplo de comentario margarita 3');
INSERT INTO comentarios(id_post, fecha, hora_creacion, contenido) VALUES (7, '1959-11-22', '14:12:45', 'Ejemplo de comentario margarita 4');
INSERT INTO comentarios(id_post, fecha, hora_creacion, contenido) VALUES (7, '1959-12-22', '15:12:45', 'Ejemplo de comentario margarita 5');