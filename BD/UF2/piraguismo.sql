-- Crear la base de datos
CREATE DATABASE Piraguismo;

-- Usar la base de datos
USE Piraguismo;

-- Crear la tabla de Clubs
CREATE TABLE Clubs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    ciudad VARCHAR(100) NOT NULL,
    pais VARCHAR(100) NOT NULL,
    año_fundacion YEAR NOT NULL
);

-- Crear la tabla de Miembros
CREATE TABLE Miembros (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    club_id INT,
    FOREIGN KEY (club_id) REFERENCES Clubs(id)
);

-- Crear la tabla de Entrenadores
CREATE TABLE Entrenadores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    especialidad VARCHAR(100),
    club_id INT,
    FOREIGN KEY (club_id) REFERENCES Clubs(id)
);

-- Crear la tabla de Competencias
CREATE TABLE Competencias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    fecha DATE NOT NULL,
    lugar VARCHAR(100) NOT NULL
);

-- Crear la tabla de Resultados
CREATE TABLE Resultados (
    id INT AUTO_INCREMENT PRIMARY KEY,
    competencia_id INT,
    miembro_id INT,
    puesto INT NOT NULL,
    tiempo TIME,
    FOREIGN KEY (competencia_id) REFERENCES Competencias(id),
    FOREIGN KEY (miembro_id) REFERENCES Miembros(id)
);

-- Insertar clubs
INSERT INTO Clubs (nombre, ciudad, pais, año_fundacion) VALUES
('Club Piragüismo Elcano', 'Madrid', 'España', 1995),
('Club Piragüismo Marítimo', 'Barcelona', 'España', 2000),
('Piragüismo Costa Azul', 'Valencia', 'España', 2010);

-- Insertar miembros
INSERT INTO Miembros (nombre, fecha_nacimiento, club_id) VALUES
('Carlos Sánchez', '1990-05-10', 1),
('Ana Martínez', '1992-08-12', 2),
('José Rodríguez', '1988-03-22', 3),
('Laura Gómez', '1995-11-15', 1),
('Pablo Fernández', '1993-02-25', 2);

-- Insertar entrenadores
INSERT INTO Entrenadores (nombre, especialidad, club_id) VALUES
('Miguel García', 'Velocidad', 1),
('Luis Pérez', 'Maratón', 2),
('Patricia López', 'Sprint', 3);

-- Insertar competencias
INSERT INTO Competencias (nombre, fecha, lugar) VALUES
('Campeonato Nacional de Piragüismo', '2025-06-15', 'Madrid'),
('Copa Internacional de Velocidad', '2025-07-20', 'Barcelona'),
('Maratón de Piragüismo Costa Brava', '2025-09-10', 'Valencia');

-- Insertar resultados
INSERT INTO Resultados (competencia_id, miembro_id, puesto, tiempo) VALUES
(1, 1, 1, '00:15:30'),
(1, 2, 2, '00:16:45'),
(2, 3, 1, '00:22:00'),
(3, 4, 3, '00:35:20'),
(3, 5, 2, '00:32:10');


/*Consultas SQL
Obtener todos los miembros de un club específico (por ejemplo, 'Club Piragüismo Elcano'):*/
SELECT m.nombre AS Miembro, m.fecha_nacimiento, c.nombre AS Club
FROM Miembros m
JOIN Clubs c ON m.club_id = c.id
WHERE c.nombre = 'Club Piragüismo Elcano';

/*Ver las competencias realizadas por un club específico (por ejemplo, 'Club Piragüismo Marítimo'):*/

SELECT co.nombre AS Competencia, co.fecha, co.lugar
FROM Competencias co
JOIN Resultados r ON co.id = r.competencia_id
JOIN Miembros m ON r.miembro_id = m.id
JOIN Clubs c ON m.club_id = c.id
WHERE c.nombre = 'Club Piragüismo Marítimo';


/*Ver el resultado de un miembro en una competencia específica (por ejemplo, 'Carlos Sánchez' en 'Campeonato Nacional de Piragüismo'):*/

SELECT co.nombre AS Competencia, r.puesto, r.tiempo
FROM Resultados r
JOIN Competencias co ON r.competencia_id = co.id
JOIN Miembros m ON r.miembro_id = m.id
WHERE m.nombre = 'Carlos Sánchez' AND co.nombre = 'Campeonato Nacional de Piragüismo';

/*Obtener los entrenadores de un club específico (por ejemplo, 'Piragüismo Costa Azul'):*/
SELECT e.nombre AS Entrenador, e.especialidad, c.nombre AS Club
FROM Entrenadores e
JOIN Clubs c ON e.club_id = c.id
WHERE c.nombre = 'Piragüismo Costa Azul';

/*Ver el miembro con mejor tiempo (1er puesto) en cada competencia:*/
SELECT co.nombre AS Competencia, m.nombre AS Miembro, r.tiempo
FROM Resultados r
JOIN Competencias co ON r.competencia_id = co.id
JOIN Miembros m ON r.miembro_id = m.id
WHERE r.puesto = 1
ORDER BY co.fecha;
/*Ver las competencias en las que un miembro específico ha participado (por ejemplo, 'José Rodríguez'):*/
SELECT co.nombre AS Competencia, r.puesto, r.tiempo
FROM Resultados r
JOIN Competencias co ON r.competencia_id = co.id
JOIN Miembros m ON r.miembro_id = m.id
WHERE m.nombre = 'José Rodríguez';

/*Obtener los miembros de un club que hayan ganado alguna competencia (1er puesto):*/
	SELECT DISTINCT m.nombre AS Miembro, c.nombre AS Club
FROM Resultados r
JOIN Miembros m ON r.miembro_id = m.id
JOIN Clubs c ON m.club_id = c.id
WHERE r.puesto = 1;
