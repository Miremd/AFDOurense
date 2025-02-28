create database avion;
use avion;

CREATE TABLE Aviones (
    matricula VARCHAR(20) PRIMARY KEY,
    tipo VARCHAR(50),
    num_pasajeros INT
);

CREATE TABLE Pilotos (
    num_piloto INT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido1 VARCHAR(50),
    apellido2 VARCHAR(50),
    direccion TEXT,
    telefono VARCHAR(20),
    mentor INT,
    FOREIGN KEY (mentor) REFERENCES Pilotos(num_piloto)
);

CREATE TABLE Vuelos (
    clave_vuelo VARCHAR(20) PRIMARY KEY,
    fecha_salida DATE,
    hora_salida TIME,
    hora_embarque TIME,
    ciudad_origen VARCHAR(50),
    ciudad_destino VARCHAR(50),
    matricula_avion VARCHAR(20),
    piloto1 INT,
    piloto2 INT,
    FOREIGN KEY (matricula_avion) REFERENCES Aviones(matricula),
    FOREIGN KEY (piloto1) REFERENCES Pilotos(num_piloto),
    FOREIGN KEY (piloto2) REFERENCES Pilotos(num_piloto)
);

CREATE TABLE Pasajeros (
    dni VARCHAR(20) PRIMARY KEY,
    nombre VARCHAR(50),
    apellido1 VARCHAR(50),
    apellido2 VARCHAR(50),
    direccion TEXT,
    telefono VARCHAR(20)
);

CREATE TABLE Pasajero_Vuelo (
    id SERIAL PRIMARY KEY,
    dni_pasajero VARCHAR(20),
    clave_vuelo VARCHAR(20),
    FOREIGN KEY (dni_pasajero) REFERENCES Pasajeros(dni),
    FOREIGN KEY (clave_vuelo) REFERENCES Vuelos(clave_vuelo)
);
