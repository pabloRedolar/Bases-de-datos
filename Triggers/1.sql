EJER1 TRIGGERS



DELIMITER //

CREATE TRIGGER modificar_empleado

BEFORE UPDATE ON empleados 
FOR EACH ROW
BEGIN

IF OLD.documento != NEW.documento THEN
	INSERT INTO controlcambios (usuario, documento_usuario, fecha,
	datoanterior, datonuevo) VALUES (current_user,old.documento, NOW(), 		
	OLD.documento, NEW.documento);
END IF;

IF OLD.nombre != NEW.nombre THEN
	
	INSERT INTO controlcambios (usuario, documento_usuario, fecha,
	datoanterior, datonuevo) VALUES (current_user,old.documento, NOW(),
	OLD.nombre, NEW.nombre);
END IF;

IF OLD.domicilio != NEW.domicilio THEN
	INSERT INTO controlcambios (usuario, documento_usuario, fecha,
	datoanterior, datonuevo) VALUES (current_user,old.documento, NOW(),
	OLD.domicilio, NEW.domicilio);
END IF;

IF OLD.seccion != NEW.seccion THEN
	INSERT INTO controlcambios (usuario, documento_usuario, fecha,
	datoanterior, datonuevo) VALUES (current_user,old.documento, NOW(),
	OLD.seccion, NEW.seccion);
END IF;

END;
//

DELIMITER ;


UPDATE empleados SET documento = '11111111', nombre = 'Pepe', domicilio = 'Calle 2, N23', seccion = 'informatica' WHERE documento='22222222';


