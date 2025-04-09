CREATE DEFINER=`root`@`localhost` FUNCTION `verificar_juego`(codJuego int) RETURNS int
    DETERMINISTIC
BEGIN
DECLARE verificacion int DEFAULT 0;

SELECT COUNT(*) INTO verificacion FROM juegos WHERE id = codJuego;

RETURN verificacion;
END