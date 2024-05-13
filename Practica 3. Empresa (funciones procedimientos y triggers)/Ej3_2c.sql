DROP FUNCTION IF EXISTS departamentoMasNumeroso;

DELIMITER //

CREATE FUNCTION departamentoMasNumeroso() RETURNS VARCHAR(100)

BEGIN 

SET @departamento_con_mas_gente = (SELECT CONCAT('Codigo: ', codigo, ' | Nombre: ', nombre, ' | Jefe: ', jefe) AS departamento FROM departamentos WHERE codigo = (SELECT departamento FROM empleados GROUP BY departamento HAVING COUNT(dni) = (SELECT MAX(cuenta2) FROM (SELECT count(dni) as cuenta2 FROM empleados GROUP BY departamento)t1)));

RETURN @departamento_con_mas_gente;

END//

DELIMITER ;