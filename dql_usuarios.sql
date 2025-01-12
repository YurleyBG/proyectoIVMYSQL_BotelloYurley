use CampusLands_ERP;

-- 1.  Coordinador Académico: Acceso total.

CREATE USER 'Coordinador'@'localhost' IDENTIFIED BY 'coordinador123';
GRANT ALL PRIVILEGES ON * . * TO 'Coordinador'@'localhost';
SHOW GRANTS FOR 'Coordinador'@'localhost';

-- 2. Trainer: Gestión de evaluaciones y asignación de rutas.

CREATE USER 'Trainer'@'localhost' IDENTIFIED BY 'Trainer123';
GRANT ALL PRIVILEGES ON inscripcion_camper_rutas . * TO 'Trainer'@'localhost';
GRANT ALL PRIVILEGES ON evaluaciones_modulos . * TO 'Trainer'@'localhost';
SHOW GRANTS FOR 'Trainer'@'localhost';

-- 3. Encargado de Inscripciones: Registro y actualización de datos de campers.

CREATE USER 'Encargado_de_Inscripciones'@'localhost' IDENTIFIED BY 'Encargado_de_Inscripciones123';
GRANT insert , update ON campers . * TO 'Encargado_de_Inscripciones'@'localhost';
SHOW GRANTS FOR 'Encargado_de_Inscripciones'@'localhost';

-- 4. Administrador de Rutas: Gestión de rutas y módulos.

CREATE USER 'Administrador_de_Rutas'@'localhost' IDENTIFIED BY 'Administrador_de_Rutas123';
GRANT ALL PRIVILEGES ON componentes_modulos . * TO 'Administrador_de_Rutas'@'localhost';
GRANT ALL PRIVILEGES ON modulos . * TO 'Administrador_de_Rutas'@'localhost';
GRANT ALL PRIVILEGES ON ruta . * TO 'Administrador_de_Rutas'@'localhost';
SHOW GRANTS FOR 'Administrador_de_Rutas'@'localhost';

-- 5. Encargado de Áreas: Gestión de áreas y horarios.

CREATE USER 'Encargado_de_Áreas'@'localhost' IDENTIFIED BY 'Encargado_de_Áreas123';
GRANT ALL PRIVILEGES ON areas . * TO 'Encargado_de_Áreas'@'localhost';
GRANT ALL PRIVILEGES ON horario . * TO 'Encargado_de_Áreas'@'localhost';
SHOW GRANTS FOR 'Encargado_de_Áreas'@'localhost';

Select user from mysql.user;  