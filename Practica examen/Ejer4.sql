DROP TRIGGER actualizarEdadAlInsertar;

DELIMITER //

CREATE TRIGGER actualizarEdadAlInsertar

BEFORE INSERT ON usuarios FOR EACH ROW

BEGIN

IF NEW.edad IS NULL THEN
	SET NEW.edad = YEAR(NOW()) - YEAR(NEW.fecha_nacimiento);
END IF;

END//

DELIMITER ;


INSERT INTO usuarios (dni, nombre, apellidos, email, ciudad, fecha_nacimiento, fecha_alta) VALUES ('18456278C', 'Pablo', 'Redolar', 'redolar13@gmail.com', 'Teruel', '2005-01-20', NOW());