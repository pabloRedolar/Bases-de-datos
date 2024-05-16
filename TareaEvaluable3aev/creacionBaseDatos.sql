CREATE DATABASE mensajeria_instantanea;

USE mensajeria_instantanea;

CREATE TABLE usuarios (id INT AUTO_INCREMENT PRIMARY KEY, email VARCHAR(255), contraseña CHAR(10), fecha_cumpleanios DATE, nickname VARCHAR(20), foto VARCHAR(255), estado ENUM('en linea', 'desconectado', 'ocupado', 'disponible'), fecha_creacion DATE);


CREATE TABLE amistad (id_usuario INT, id_usuario_amigo INT, acepta_solicitud_SI_NO BOOLEAN, PRIMARY KEY(id_usuario, id_usuario_amigo), FOREIGN KEY (id_usuario) REFERENCES usuarios(id), FOREIGN key (id_usuario_amigo) REFERENCES usuarios(id));


CREATE TABLE grupos (id INT AUTO_INCREMENT PRIMARY KEY, nombre VARCHAR(100), foto VARCHAR(255));


CREATE TABLE usuarios_pertenecen_grupos (id_usuario INT, id_grupo INT, fecha_ingreso DATE, PRIMARY KEY (id_usuario, id_grupo), FOREIGN KEY (id_usuario) REFERENCES usuarios(id), FOREIGN KEY (id_grupo) REFERENCES grupos(id));


CREATE TABLE mensajes (id INT AUTO_INCREMENT, id_usuario_emisor INT, cuerpo_mensaje VARCHAR(512), PRIMARY KEY(id, id_usuario_emisor), FOREIGN KEY (id_usuario_emisor) REFERENCES usuarios(id));


CREATE TABLE envio_mensajes (id_mensaje INT PRIMARY KEY, id_usuario_destino INT, id_grupo_destino INT, fecha_envio DATE, leidoSINO BOOL, FOREIGN KEY (id_mensaje) REFERENCES mensajes(id), FOREIGN KEY (id_usuario_destino) REFERENCES usuarios(id), FOREIGN KEY (id_grupo_destino) REFERENCES grupos(id));


--------------------------------

-- Datos de ejemplo para la tabla `usuarios`
INSERT INTO usuarios (email, contraseña, fecha_cumpleanios, nickname, foto, estado, fecha_creacion) VALUES
('usuario1@example.com', '123456', '1990-01-15', 'user1', 'foto1.jpg', 'disponible', '2023-02-10'),
('usuario2@example.com', 'abcdef', '1985-07-22', 'user2', 'foto2.jpg', 'en linea', '2023-02-11'),
('usuario3@example.com', 'qwerty', '1995-04-30', 'user3', 'foto3.jpg', 'ocupado', '2023-02-12'),
('usuario4@example.com', 'password', '1988-12-05', 'user4', 'foto4.jpg', 'desconectado', '2023-02-13'),
('usuario5@example.com', 'securepass', '1992-09-18', 'user5', 'foto5.jpg', 'disponible', '2023-02-14'),
('pablo@gmail.com', '1994', '2005-01-20', 'redolar', 'pablo.jpg', 'en linea', NOW()),
('juan@gmail.com', 'pass1234', '2004-04-21', 'juanvi', 'juan.jpg', 'ocupado', NOW()),
('manuel@gmail.com', 'pass2005', '2005-11-05', 'manujuldo', 'manu.jpg', 'desconectado', NOW());


-- Datos de ejemplo para la tabla `grupos`
INSERT INTO grupos (nombre, foto) VALUES
('Familia', 'familia.jpg'),
('Amigos', 'amigos.jpg'),
('Trabajo', 'trabajo.jpg'),
('Deportes', 'deportes.jpg'),
('Estudios', 'estudios.jpg');


-- Datos de ejemplo para la tabla `usuarios_pertenecen_grupos`
INSERT INTO usuarios_pertenecen_grupos (id_usuario, id_grupo, fecha_ingreso) VALUES
(6, 2, NOW()),
(7, 4, NOW()),
(8, 1, NOW());
(1, 1, '2023-02-10'),
(2, 2, '2023-02-11'),
(3, 3, '2023-02-12'),
(4, 4, '2023-02-13'),
(5, 5, '2023-02-14')


-- Datos de ejemplo para la tabla `mensajes`
INSERT INTO mensajes (id_usuario_emisor, cuerpo_mensaje) VALUES
(1, 'Hola, ¿cómo estás?'),
(2, '¡Hola! Bien, gracias. ¿Y tú?'),
(3, 'Hola a todos. ¿Qué planes para el fin de semana?'),
(4, 'Buenos días, ¿alguien tiene el informe listo?'),
(5, '¡Hola mundo!');

INSERT INTO mensajes (id_usuario_emisor, cuerpo_mensaje) VALUES (6, 'Muy buenas a todos');
INSERT INTO mensajes (id_usuario_emisor, cuerpo_mensaje) VALUES (6, '¿Como estais?');
INSERT INTO mensajes (id_usuario_emisor, cuerpo_mensaje) VALUES (6, 'Ultimo mensaje del usuario 6');


INSERT INTO mensajes (id_usuario_emisor, cuerpo_mensaje) VALUES (1, 'mensaje prueba 1'), (1, 'mensaje prueba 2'), (1, 'mensaje prueba 3'), (1, 'mensaje prueba 4');


-- Datos de ejemplo para la tabla `envio_mensajes`
INSERT INTO envio_mensajes (id_mensaje, id_usuario_destino, id_grupo_destino, fecha_envio, leidoSINO) VALUES
(1, 2, NULL, '2023-02-10', 0),
(2, 1, NULL, '2023-02-11', 0),
(3, NULL, 2, '2023-02-12', 0),
(4, NULL, 3, '2023-02-13', 0),
(5, 4, NULL, '2023-02-14', 0);

INSERT INTO envio_mensajes (id_mensaje, id_usuario_destino, id_grupo_destino, fecha_envio, leidoSINO) VALUES (6, NULL, 2, NOW(), 0);
INSERT INTO envio_mensajes (id_mensaje, id_usuario_destino, id_grupo_destino, fecha_envio, leidoSINO) VALUES (7, NULL, 2, NOW(), 0);

INSERT INTO envio_mensajes (id_mensaje, id_usuario_destino, id_grupo_destino, fecha_envio, leidoSINO) VALUES (8, NULL, 2, CURRENT_TIMESTAMP(), 0);

INSERT INTO envio_mensajes (id_mensaje, id_usuario_destino, id_grupo_destino, fecha_envio, leidoSINO) VALUES
(9, 2, NULL, '2023-02-11', 0), (10, 2, NULL, '2023-02-12', 0), (11, 2, NULL, '2023-02-13', 0), (12, 2, NULL, '2023-02-14', 0);

-- Datos de ejemplo para la tabla `amistad`
INSERT INTO amistad (id_usuario, id_usuario_amigo, acepta_solicitud_SI_NO) VALUES
(1, 2, 0),
(2, 1, 0),
(1, 3, 0),
(3, 4, 0),
(4, 5, 0);
