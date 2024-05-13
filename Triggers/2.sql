EJER2 TRIGGERS



DELIMITER //

CREATE TRIGGER insert_empleados_controlcambios 

AFTER INSERT ON empleados FOR EACH ROW
BEGIN

INSERT INTO controlcambios (usuario, documento_usuario, fecha, datoanterior, 
datonuevo) VALUES (current_user, NEW.documento, NOW(), NULL, 
NEW.documento);

END//
DELIMITER ;


INSERT INTO empleados (documento, nombre, domicilio, seccion) 
VALUES ('18456278', 'Pablo Redolar', 'Calle Plano Alto, 36', 'Cocina');

