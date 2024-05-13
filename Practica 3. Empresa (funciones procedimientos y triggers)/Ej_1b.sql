DELIMITER //

CREATE PROCEDURE subidaDeSalario (IN departamento_empleado INT, IN porcentaje_aumento INT)
BEGIN

UPDATE empleados SET salario = salario+(salario*porcentaje_aumento/100) WHERE departamento = departamento_empleado;

END//

DELIMITER ;

CALL subidaDeSalario (1, 20);