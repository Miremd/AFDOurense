CREATE FUNCTION `verificar_cliente` (codCliente int)
RETURNS INT  deterministic
BEGIN
DECLARE verificacion int DEFAULT 0;

SELECT COUNT(*) INTO verificacion FROM clientes WHERE id = codCliente;

RETURN verificacion;
END
