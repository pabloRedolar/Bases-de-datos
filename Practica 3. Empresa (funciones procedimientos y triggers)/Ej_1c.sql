DELIMITER //

CREATE PROCEDURE asignacionTarea (IN dni_empleado VARCHAR(20), IN nombre_tarea VARCHAR(20), IN descripcion_tarea VARCHAR(100))

BEGIN
INSERT INTO tareas (nombre, descripcion, fecha_inicio, empleado) VALUES (nombre_tarea, descripcion_tarea, NOW(), dni_empleado);

END//
DELIMITER ;

CALL asignacionTarea ('18456278C', 'Limpiar', 'Barrer y fregar');