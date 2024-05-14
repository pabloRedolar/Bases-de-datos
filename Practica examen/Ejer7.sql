CREATE TABLE IF NOT EXISTS personas (id INT AUTO_INCREMENT PRIMARY KEY, nombre VARCHAR(50), apellido VARCHAR(100), peso FLOAT(3, 2), altura INT, IMC FLOAT(2, 2));


DELIMITER //

DROP PROCEDURE if EXISTS calculaIMC;
CREATE PROCEDURE calculaIMC (IN peso_param FLOAT, IN altura_param INT, OUT imc FLOAT)

BEGIN

DECLARE altura_m INT;

SET altura_m = altura_param / 100;

SET imc = peso_param / (altura_m*altura_m);

END //

DELIMITER ;

---------------------

DELIMITER //

DROP TRIGGER IF EXISTS insercionTablaPersonas;
CREATE TRIGGER insercionTablaPersonas BEFORE INSERT ON personas FOR EACH ROW

BEGIN

CALL calculaIMC(NEW.peso, NEW.altura, NEW.imc);

END//

DELIMITER ;

INSERT INTO personas (nombre, apellido, peso, altura) VALUES ('Pablo', 'Redolar', 74, 178);

-----------------------

DELIMITER //

CREATE TRIGGER cuandoUpdateRellenarIMC BEFORE UPDATE ON personas FOR EACH ROW

BEGIN

CALL calculaIMC(NEW.peso, NEW.altura, NEW.imc);

END//

DELIMITER ;

UPDATE personas SET peso = 80, altura = 180 WHERE id = 1;








