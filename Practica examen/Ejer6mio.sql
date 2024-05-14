DROP PROCEDURE informacion_reservas;

DELIMITER //
CREATE TABLE IF NOT EXISTS estadisticas_pista (id_reserva INT UNSIGNED, fecha_reserva DATE, fecha_uso DATE, precio FLOAT, id_pista INT UNSIGNED, nombre_usuario VARCHAR(255), email_usuario VARCHAR(255), PRIMARY KEY(id_reserva, id_pista), FOREIGN KEY (id_reserva) REFERENCES reservas(id), FOREIGN key (id_pista) REFERENCES pistas(id));

CREATE PROCEDURE informacion_reservas(IN id_pista_dada INT)

BEGIN

DECLARE pid_reserva INT;
DECLARE pfecha_reserva DATE;
DECLARE pfecha_uso DATE;
DECLARE pprecio FLOAT;
DECLARE pid_pista INT;
DECLARE pnombre_usuario VARCHAR(255);
DECLARE pemail_usuario VARCHAR(255);

DECLARE done BOOLEAN DEFAULT 0;

DECLARE cursor1 CURSOR FOR SELECT res.id, res.fecha_reserva, res.fecha_uso, res.precio, res.id_pista, usu.nombre, usu.email FROM reservas res JOIN usuario_reserva usres ON res.id = usres.id_reserva JOIN usuarios usu ON usres.id_usuario = usu.id WHERE res.id_pista = id_pista_dada;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

OPEN cursor1;

bucle: LOOP

	FETCH cursor1 INTO pid_reserva, pfecha_reserva, pfecha_uso, pprecio, pid_pista, pnombre_usuario, pemail_usuario;
	
	IF done THEN
		LEAVE bucle;
	END IF;
	
	INSERT INTO estadisticas_pista VALUES (pid_reserva, pfecha_reserva, pfecha_uso, pprecio, pid_pista, pnombre_usuario, pemail_usuario);
	
END LOOP bucle;

CLOSE cursor1;

END//

DELIMITER ;

