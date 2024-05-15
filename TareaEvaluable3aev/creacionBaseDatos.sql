CREATE TABLE usuarios (id INT AUTO_INCREMENT PRIMARY KEY, email VARCHAR(255), contraseña CHAR(10), fecha_cumpleanios DATE, nickname VARCHAR(20), foto VARCHAR(255), estado ENUM('en linea', 'desconectado', 'ocupado', 'disponible'), fecha_creacion DATE);

----------------

CREATE TABLE amistad (acepta_solicitud_SI_NO BOOLEAN, PRIMARY KEY(id_usuario, id_usuario_amigo), FOREIGN KEY (id_usuario) REFERENCES TO usuarios(id), FOREIGN key (id_usuario_amigo) REFERENCES TO usuarios(id));

----------------

CREATE TABLE grupos (id INT AUTO_INCREMENT PRIMARY KEY, nombre VARCHAR(100), foto VARCHAR(255));

----------------

CREATE TABLE usuarios_pertenecen_grupos (id_usuario INT, id_grupo INT, fecha_union DATE, PRIMARY KEY (id_usuario, id_grupo), FOREIGN KEY (id_usuario) REFERENCES usuarios(id), FOREIGN KEY (id_grupo) REFERENCES grupos(id));

----------------

CREATE TABLE mensajes (id INT AUTO_INCREMENT PRIMARY KEY, id_usuario_emisor INT, cuerpo_mensaje VARCHAR(512), FOREIGN KEY (id_usuario_emisor) REFERENCES usuarios(id));

----------------

CREATE TABLE envio_mensajes (id_mensaje INT, id_usuario_destino INT, id_grupo_destino INT, fecha_envio DATE, PRIMARY KEY(id_mensaje, 	id_usuario_destino, id_grupo_destino), 
	FOREIGN KEY (id_mensaje) REFERENCES mensajes(id),
	FOREIGN KEY (id_usuario_destino) REFERENCES usuarios(id);
	FOREIGN KEY (id_grupo_destino) REFERENCES grupos(id);
);

---------------