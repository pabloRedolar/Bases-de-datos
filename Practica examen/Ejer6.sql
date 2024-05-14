DELIMITER //
CREATE PROCEDURE estadisticas(IN p_id_pista INT)
BEGIN
DECLARE fin BOOLEAN DEFAULT 0;
DECLARE c_pista INT;
DECLARE c_nombre VARCHAR(50);
DECLARE c_email VARCHAR(50);
DECLARE c_fecha_reserva DATE;
DECLARE c_fecha_uso DATE;
DECLARE c_precio INT;
DECLARE cursor1 CURSOR FOR SELECT r.id_pista,u.nombre,u.email,r.fecha_reserva,r.fecha_uso,r.precio FROM usuarios u JOIN usuario_reserva ur ON u.id=ur.id_usuario JOIN reservas r ON ur.id_reserva=r.id AND r.id_pista=p_id_pista;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin=1;

CREATE TABLE IF NOT EXISTS estadisticas_pistas(id_stat INT AUTO_INCREMENT, id_pista INT unsigned, nombre_usuario VARCHAR(50), email_usuario VARCHAR(50), fecha_reserva DATE, fecha_uso DATE, precio_pista INT, PRIMARY KEY(id_stat,id_pista), FOREIGN KEY (id_pista) REFERENCES pistas (id));

OPEN cursor1;
myloop:LOOP
    FETCH cursor1 INTO c_pista,c_nombre,c_email,c_fecha_reserva,c_fecha_uso,c_precio;
    IF (fin = 1) THEN LEAVE myloop;
    END IF;
    INSERT INTO estadisticas_pistas (id_pista,nombre_usuario,email_usuario,fecha_reserva,fecha_uso,precio_pista) VALUES (c_pista,c_nombre,c_email,c_fecha_reserva,c_fecha_uso,c_precio);
	
END LOOP myloop;
CLOSE cursor1;
END//
DELIMITER ;