DROP IF EXISTS DATABASE tiendaOnline;
CREATE DATABASE tiendaOnline;
USE tiendaOnline;
-- Borramos primero todas las tablas x si acaso existen, y creamos las tablas nuevas q nos piden en el ejercicio
DROP IF EXISTS TABLE  tiendaOnline;
CREATE TABLE IF NOT EXISTS productos(
);
DROP IF EXISTS TABLE clientes;
CREATE TABLE IF NOT EXISTS clientes(
);
CREATE TABLE IF NOT EXISTS pedidos(
);
CREATE TABLE IF NOT EXISTS detalle_pedidos(

);

