-- Crea una función llamada CalcularDescuentoCliente que reciba el ID
-- de un cliente y devuelva un descuento según su antigüedad en la tienda:
-- Más de 3 años → 15%; Entre 1 y 3 años → 10%; Menos de 1 año → 5%
CREATE FUNCTION `CalcularDescuentoCliente` (cliente int)
RETURNS INTEGER deterministic
BEGIN
declare antic int; -- variable para almacenar la antigüedad 
declare descuento int;
select (year(curdate()) - year(fechaRegistro)) into antic from clientes where ID= cliente;
if (antic > 3) then 
set descuento=15;
elseif (antic > 1) then 
set descuento=10;
else 
set descuento=5;
end if;
RETURN descuento;
END
