CREATE DEFINER=`root`@`localhost` FUNCTION `ClasificarJuegoPorPrecio`(pjuego int) RETURNS varchar(20) CHARSET utf8mb4
    DETERMINISTIC
BEGIN 
declare cat varchar(20);
if pjuego <20 then
	set cat='Economico';
elseif pjuego>20 and pjuego<50 then 
	set cat='Intermedio';
else set cat='Premium';
end if;
return 'cat';
END