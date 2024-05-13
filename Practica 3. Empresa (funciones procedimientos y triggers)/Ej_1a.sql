DELIMITER //

CREATE PROCEDURE insercionEmpleado (IN dni1 CHAR(9), IN nombre1 VARCHAR(20), IN apellidos1 VARCHAR(30), IN fecha_nacimiento1 DATE, IN departamento1 VARCHAR(20), IN telefono1 CHAR(9))
BEGIN

INSERT INTO empleados (dni, nombre, apellidos, fecha_nacimiento, departamento, telefono) VALUES (dni1, nombre1, apellidos1, fecha_nacimiento1, departamento1,  telefono1);

END//
DELIMITER ;

CALL insercionEmpleado ('18456278C', 'Pablo', 'Redolar Sanchez', '2005-01-20', 'Informatica', '659981050');

