/* a. Consulta el número de usuarios de cada grupo y el grupo al que pertenecen.*/

SELECT COUNT(id_usuario) 'usuarios por grupo', gru.nombre FROM usuarios_pertenecen_grupos upg JOIN grupos gru ON upg.id_grupo = gru.id GROUP BY id_grupo;

/* b. Consulta que participante ha enviado más mensajes el último mes.*/

 SELECT id_usuario_emisor, COUNT(id_mensaje) FROM mensajes msg JOIN envio_mensajes emsg ON msg.id = emsg.id_mensaje GROUP BY id_usuario_emisor, month(fecha_envio) ORDER BY month(fecha_envio) desc limit 1;

/* c. Consulta el último mensaje que ha enviado el usuario que ha enviado más mensajes.*/

select * from mensajes where id_usuario_emisor = (SELECT id_usuario_emisor FROM mensajes msj JOIN envio_mensajes envmsj ON msj.id = envmsj.id_mensaje GROUP BY fecha_envio HAVING COUNT(envmsj.id_mensaje) = (SELECT COUNT(id_mensaje) FROM envio_mensajes GROUP BY fecha_envio ORDER BY COUNT(id_mensaje) DESC LIMIT 1)) order by id desc limit 1;


SELECT id, cuerpo_mensaje FROM mensajes msg JOIN envio_mensajes emsg ON msg.id = emsg.id_mensaje WHERE fecha_envio = (SELECT fecha_envio FROM envio_mensajes ORDER BY fecha_envio DESC LIMIT 1) AND msg.id_usuario_emisor = (SELECT id_usuario_emisor FROM mensajes msj JOIN envio_mensajes envmsj ON msj.id = envmsj.id_mensaje GROUP BY fecha_envio HAVING COUNT(envmsj.id_mensaje) = (SELECT COUNT(id_mensaje) FROM envio_mensajes GROUP BY fecha_envio ORDER BY COUNT(id_mensaje) DESC LIMIT 1));

/* d. Consulta el estado del receptor del primer mensaje enviado por el usuario con id=1.*/

SELECT id, nickname, estado FROM usuarios WHERE id IN (select id_usuario_destino from envio_mensajes where id_mensaje IN (SELECT id FROM mensajes WHERE id_usuario_emisor = 1));

/* e. Consulta el id y el mail de los usuarios que no han enviado ningún mensaje. */

SELECT us.id, email FROM usuarios us LEFT JOIN mensajes msg ON us.id = msg.id_usuario_emisor WHERE msg.id_usuario_emisor IS NULL;

SELECT us.id, email FROM usuarios us WHERE us.id NOT IN (SELECT id_usuario_emisor FROM mensajes);