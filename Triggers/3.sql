EJER3 TRIGGERS



DELIMITER //

CREATE TRIGGER eliminar_empleado_controlcambios

AFTER DELETE ON empleados

FOR EACH ROW
BEGIN
INSERT INTO controlcambios (usuaruio, documento_usuario, fecha, 
datoanterior, datonuevo) VALUES (CURRENT_USER, NULL, NOW(), 
OLD.documento, NULL);<


END//