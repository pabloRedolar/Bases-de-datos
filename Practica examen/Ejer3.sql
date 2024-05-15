DELIMITER //

CREATE FUNCTION pista_mas_reservada2014 () RETURNS VARCHAR(255) DETERMINISTIC

BEGIN

SET @numero_veces_reservada = (select max(cuenta) from (select COUNT(*) as cuenta from reservas where year(fecha_reserva) = 2014 GROUP BY id_pista)t1);

SET @pista_mas_reservada = (select id_pista from reservas where year(fecha_reserva) = 2014 group by id_pista having count(*) = @numero_veces_reservada limit 1);


RETURN CONCAT('La pista más reservada ha sido la ', @pista_mas_reservada, ' con un total de ', @numero_veces_reservada, ' reservas');

END//

DELIMITER ;

SELECT pista_mas_reservada2014();


