CREATE DEFINER=`root`@`localhost` FUNCTION `CalcularDescuentoCliente2`(cliente int) RETURNS int
    DETERMINISTIC
BEGIN
declare antic int; -- variable para almacenar la antigüedad 
declare descuento int;
set descuento=5;
select (year(curdate()) - year(fechaRegistro)) into antic from clientes where ID= cliente;
if (antic > 3) then 
set descuento=15;
elseif (antic > 1) then 
set descuento=10;
end if;
RETURN descuento;
END