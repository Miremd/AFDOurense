CREATE DEFINER=`root`@`localhost` FUNCTION `ClasificarJuegoPorPrecio`(dineros float) RETURNS varchar(30) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
declare clasificacion varchar(30);
If dineros < 20 then set clasificacion = 'Economico';
elseif dineros < 50 then set clasificacion = 'Intermedio';
else set clasificacion = 'Premium'; 
end if; 
RETURN clasificacion;
END