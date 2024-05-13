DROP FUNCTION IF EXISTS empleadoMayorSalario;

DELIMITER //

CREATE FUNCTION empleadoMayorSalario() RETURNS VARCHAR(100) 

BEGIN

set @salario_alto = (SELECT MAX(salario) FROM empleados);

SET @empleado_mayor_salario = (SELECT CONCAT(nombre, ' ', apellidos) AS 'Nombre completo' FROM empleados WHERE salario = @salario_alto);

RETURN @empleado_mayor_salario;

END//

DELIMITER ;

SELECT empleadoMayorSalario();