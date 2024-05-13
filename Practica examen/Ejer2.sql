DROP FUNCTION edadUsuarioX;

DELIMITER //

CREATE FUNCTION edadUsuarioX (nombre_usuario_completo VARCHAR(100)) RETURNS INT DETERMINISTIC

BEGIN

SET @edadDelUsuario = (SELECT edad FROM usuarios WHERE concat(nombre,' ',apellidos) = nombre_usuario_completo /*limit 1*/);

RETURN @edadDelUsuario;

END//

DELIMITER ;


select edadusuariox('antonio garcia');
