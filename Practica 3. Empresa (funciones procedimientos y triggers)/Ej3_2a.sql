DROP FUNCTION IF EXISTS empleadomayoredad;

DELIMITER //

CREATE FUNCTION empleadoMayorEdad (dni_empleado CHAR(9)) RETURNS VARCHAR(100)

BEGIN

SET @edad = (select year(now()) - year(fecha_nacimiento) from empleados WHERE dni = dni_empleado);

SET @nombrecompleto = (select CONCAT (nombre, ' ', apellidos) from empleados where dni = dni_empleado);

IF @edad >= 18 THEN
	SET @mayormenor = "Es mayor de edad";
ELSE
	SET @mayormenor = 'Es menor de edad';
END IF;
	RETURN CONCAT(@nombrecompleto, ' - ', @mayormenor);
END //

DELIMITER ;