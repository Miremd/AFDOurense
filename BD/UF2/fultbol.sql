-- Crear la base de datos
CREATE DATABASE Futbol;

-- Usar la base de datos
USE Futbol;

-- Crear tabla de equipos
CREATE TABLE Equipos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    ciudad VARCHAR(100) NOT NULL,
    estadio VARCHAR(100) NOT NULL
);

-- Crear tabla de jugadores
CREATE TABLE Jugadores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    equipo_id INT,
    fecha_nacimiento DATE,
    posicion VARCHAR(50),
    FOREIGN KEY (equipo_id) REFERENCES Equipos(id)
);

-- Crear tabla de partidos
CREATE TABLE Partidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    equipo_local_id INT,
    equipo_visitante_id INT,
    fecha DATE,
    goles_local INT,
    goles_visitante INT,
    FOREIGN KEY (equipo_local_id) REFERENCES Equipos(id),
    FOREIGN KEY (equipo_visitante_id) REFERENCES Equipos(id)
);

-- Crear tabla de goles
CREATE TABLE Goles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    partido_id INT,
    jugador_id INT,
    goles INT,
    FOREIGN KEY (partido_id) REFERENCES Partidos(id),
    FOREIGN KEY (jugador_id) REFERENCES Jugadores(id)
);

-- Insertar equipos
INSERT INTO Equipos (nombre, ciudad, estadio) VALUES
('FC Barcelona', 'Barcelona', 'Camp Nou'),
('Real Madrid', 'Madrid', 'Santiago Bernabéu'),
('Atlético de Madrid', 'Madrid', 'Wanda Metropolitano'),
('Sevilla FC', 'Sevilla', 'Ramón Sánchez Pizjuán');

-- Insertar jugadores
INSERT INTO Jugadores (nombre, equipo_id, fecha_nacimiento, posicion) VALUES
('Lionel Messi', 1, '1987-06-24', 'Delantero'),
('Sergio Ramos', 2, '1986-03-30', 'Defensa'),
('Antoine Griezmann', 3, '1991-03-21', 'Delantero'),
('Jordán', 4, '1994-01-07', 'Centrocampista');

-- Insertar partidos
INSERT INTO Partidos (equipo_local_id, equipo_visitante_id, fecha, goles_local, goles_visitante) VALUES
(1, 2, '2025-03-30', 3, 1),
(3, 4, '2025-03-31', 2, 2),
(2, 3, '2025-04-01', 1, 1);

-- Insertar goles
INSERT INTO Goles (partido_id, jugador_id, goles) VALUES
(1, 1, 2),
(1, 2, 1),
(2, 3, 1),
(2, 4, 1);


-- Obtener todos los jugadores de un equipo específico (por ejemplo, FC Barcelona):

explain SELECT j.nombre AS Jugador, j.posicion, e.nombre AS Equipo
FROM Jugadores j
JOIN Equipos e ON j.equipo_id = e.id
WHERE e.nombre = 'FC Barcelona';

-- Ver los partidos jugados por un equipo (por ejemplo, Real Madrid):


SELECT p.fecha, e_local.nombre AS Local, p.goles_local, e_visitante.nombre AS Visitante, p.goles_visitante
FROM Partidos p
JOIN Equipos e_local ON p.equipo_local_id = e_local.id
JOIN Equipos e_visitante ON p.equipo_visitante_id = e_visitante.id
WHERE e_local.nombre = 'Real Madrid' OR e_visitante.nombre = 'Real Madrid';

-- Ver los goles de un jugador específico (por ejemplo, Lionel Messi):

explain SELECT p.fecha, e_local.nombre AS Local, e_visitante.nombre AS Visitante, g.goles
FROM Goles g
JOIN Partidos p ON g.partido_id = p.id
JOIN Equipos e_local ON p.equipo_local_id = e_local.id
JOIN Equipos e_visitante ON p.equipo_visitante_id = e_visitante.id
WHERE g.jugador_id = (SELECT id FROM Jugadores WHERE nombre = 'Lionel Messi');


-- Obtener el equipo con más goles en un partido específico (por ejemplo, FC Barcelona vs Real Madrid):

explain SELECT CASE
    WHEN p.goles_local > p.goles_visitante THEN e_local.nombre
    WHEN p.goles_local < p.goles_visitante THEN e_visitante.nombre
    ELSE 'Empate'
END AS Equipo_Mas_Goles
FROM Partidos p
JOIN Equipos e_local ON p.equipo_local_id = e_local.id
JOIN Equipos e_visitante ON p.equipo_visitante_id = e_visitante.id
WHERE e_local.nombre = 'FC Barcelona' AND e_visitante.nombre = 'Real Madrid';


-- Ver los partidos con más goles anotados (ordenado de mayor a menor):

explain SELECT p.fecha, e_local.nombre AS Local, p.goles_local, e_visitante.nombre AS Visitante, p.goles_visitante,
       (p.goles_local + p.goles_visitante) AS Total_Goles
FROM Partidos p
JOIN Equipos e_local ON p.equipo_local_id = e_local.id
JOIN Equipos e_visitante ON p.equipo_visitante_id = e_visitante.id
ORDER BY Total_Goles DESC;

HELP 'create database'; # Make world the current database
SELECT JSON_EXTRACT(@myselect, "$.query_block.table.key");

