ALTER TABLE usuarios ADD COLUMN edad INT(3);

-------------------------

DROP PROCEDURE insertarEdad;

DELIMITER //

CREATE PROCEDURE insertarEdad ()

BEGIN

UPDATE usuarios SET edad = YEAR(NOW()) - YEAR(fecha_nacimiento);

END//

DELIMITER ;

CALL insertarEdad();



