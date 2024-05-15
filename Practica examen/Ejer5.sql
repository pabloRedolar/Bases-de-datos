DROP TRIGGER eliminarPistaCerradaPublico;

DELIMITER //

CREATE TRIGGER eliminarPistaCerradaPublico
 
AFTER DELETE ON pistas_abiertas FOR EACH ROW

BEGIN

INSERT INTO pistas_cerradas (id_pista, fecha_clausura, motivo) VALUES (OLD.id_pista, NOW(), 'Se ha rompido');

END//

DELIMITER ;


DELETE FROM pistas_abiertas WHERE id_pista = 199;



