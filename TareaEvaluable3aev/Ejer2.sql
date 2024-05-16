/* a. Crea una función que cuando le introduzcas un usuario te conteste si dicho usuario 
tiene algún mensaje sin leer o no.   */

DROP FUNCTION mensajesSinLeer;

DELIMITER //

CREATE FUNCTION mensajesSinLeer (usuario_param INT) RETURNS VARCHAR(255) DETERMINISTIC

BEGIN

	SET @cantMsgNoLeidos = (SELECT COUNT(id_mensaje) FROM envio_mensajes WHERE id_usuario_destino = usuario_param AND leidoSINO = false);

	SET @avisoMensajes = (CONCAT('Tienes ', @cantMsgNoLeidos, ' mensajes sin leer'));

	RETURN @avisoMensajes;

END //

DELIMITER ;


SELECT mensajesSinLeer(2);



/* Crea un procedimiento que inserte un nuevo miembro en un grupo */

DELIMITER //

CREATE PROCEDURE insertarMiembroEnGrupo (IN p_id_usuario INT, IN p_id_grupo INT)

BEGIN

	INSERT INTO usuarios_pertenecen_grupos (id_usuario, id_grupo, fecha_ingreso) VALUES (p_id_usuario, p_id_grupo, NOW());

END //

DELIMITER ;

CALL insertarMiembroEnGrupo(6, 1);



/* c. Crea un trigger que haga que antes de dar de alta un nuevo usuario en un grupo 
realice las siguientes tareas: 
	- Dicho usuario envíe un mensaje al grupo preguntando si aceptan su amistad que de 
	momento no estará recibido, ni leído.
	
	- El grupo reciba y lea el mensaje y por tanto cambie dichos campos en la tabla 
	correspondiente.
	
	- El grupo acepte al usuario y por tanto le envíe un mensaje de respuesta diciendo que 
	acepta introducirlo en el grupo. */
	

DROP PROCEDURE grupo_lee_mensaje;

DELIMITER //

CREATE PROCEDURE grupo_lee_mensaje (IN p_id_mensaje INT)

BEGIN

	UPDATE envio_mensajes SET leidoSINO = true WHERE id_mensaje = p_id_mensaje;

END//

DELIMITER ;


DROP TRIGGER enviarSolicitudUnirseGrupo;

DELIMITER //
	
CREATE TRIGGER enviarSolicitudUnirseGrupo BEFORE INSERT ON usuarios_pertenecen_grupos FOR EACH ROW

BEGIN
	
	DECLARE usuario_que_se_use INT;
	DECLARE grupo_al_que_se_inserta INT;

	SET usuario_que_se_use = NEW.id_usuario;	
	SET grupo_al_que_se_inserta = NEW.id_grupo;
	
	
	INSERT INTO mensajes (id_usuario_emisor, cuerpo_mensaje) VALUES (usuario_que_se_use, 'Hola grupo, solicito unirme');
	
	SET @id_nuevo_mensaje = (SELECT id FROM mensajes ORDER BY id DESC LIMIT 1);
	
	INSERT INTO envio_mensajes (id_mensaje, id_usuario_destino, id_grupo_destino, fecha_envio, leidoSINO) VALUES (@id_nuevo_mensaje, NULL, grupo_al_que_se_inserta, NOW(), false);
	
		CALL grupo_lee_mensaje(@id_nuevo_mensaje);

END//

DELIMITER ;


INSERT INTO usuarios_pertenecen_grupos (id_usuario, id_grupo, fecha_ingreso) VALUES (7, 3, NOW());

