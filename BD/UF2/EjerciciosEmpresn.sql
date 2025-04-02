use empresan_datos;

--  Lista el nombre de los distintos departamentos que tiene la empresa y los datos de nombre y 
-- apellidos de los trabajadores que pertenecen a ellos. Datos ordenados alfabéticamente por 
-- nombre de departamento.

SELECT nomdep,nomemp,ape1emp,ape2emp
FROM tdepartamentos,templeados
WHERE tdepartamentos.iddepartamento=templeados.iddepemp
ORDER BY nomdep ASC

-- Visualiza  el nombre de las categorías que tienen empleados que hayan empezado a trabajar 
-- antes del año 2000. Debes visualizar también el nombre, apellidos y fecha de alta de los 
-- trabajadores a los que hace referencia la consulta.
SELECT nomcat,nomemp, ape1emp, ape2emp, faltaemp
FROM tcategorias cat, templeados em
WHERE cat.idcategoria=em.idcatemp
AND YEAR (faltaemp)<2000;

-- Lista todos los datos de los empleados  que entraron en la empresa antes del 1 de enero del 
-- año 2000, que perciban un salario base entre 900 y 1500 euros, o bien de aquellos que 
-- pertenezcan a los departamentos 2, 3 o 4

SELECT * FROM templeados em JOIN  tcategorias cat
ON cat.idcategoria=em.idcatemp
and year(faltaemp)<2000
and sueldobase between 900 and 1500
or iddepemp in (2, 3, 4);

-- Obtén el salario base más alto de la empresa, el más bajo, la diferencia entre ellos y el 
-- número de empleados de la empresa. Todos los datos deben aparecer con un nombre de 
-- campo relativo a su contenido

	SELECT 
		MAX(c.sueldobase) AS salario_maximo,
		MIN(c.sueldobase) AS salario_minimo,
		(MAX(c.sueldobase) - MIN(c.sueldobase)) AS diferencia_sueldos,
		COUNT(e.nifemp) AS numero_empleados
	FROM templeados e
	JOIN tcategorias c ON e.idcatemp = c.idcategoria;

--  Indica, para aquellos empleados que tienen 30 años cumplidos, su nombre, nombre de 
-- departamento en el que trabajan, extensión telefónica y salario base asociado a su categoría

SELECT 
    e.nomemp AS nombre_empleado, 
    d.nomdep AS nombre_departamento, 
    d.extdep AS extension_telefono, 
    c.sueldobase AS salario_base
FROM templeados e
JOIN tdepartamentos d ON e.iddepemp = d.iddepartamento
JOIN tcategorias c ON e.idcatemp = c.idcategoria
WHERE TIMESTAMPDIFF(YEAR, e.fnacemp, CURDATE()) = 30;

--  Lista los nombres de las provincias en las que viva más de 1 empleado.

SELECT 
    e.ape1emp, 
    e.ape2emp, 
    e.nomemp, 
    e.tlfemp, 
    c.nomcat AS categoria, 
    d.nomdept AS departamento
FROM templeados e
JOIN tcategorias c ON e.idcatemp = c.idcategoria
JOIN tdepartamentos d ON e.iddepemp = d.iddepartamento;

SELECT 
    d.nomdept AS departamento, 
    COUNT(e.nifemp) AS num_empleados
FROM 
    templeados e
JOIN 
    tdepartamentos d ON e.iddepemp = d.iddepartamento
GROUP BY 
    d.nomdept;
-- Obtener empleados con su sueldo base y categoría:
-- Supongamos que quieras saber los empleados junto con su sueldo base (de la tabla tcategorias), ordenados por su sueldo base.

SELECT 
    e.ape1emp, 
    e.ape2emp, 
    e.nomemp, 
    c.sueldobase
FROM templeados e
JOIN tcategorias c ON e.idcatemp = c.idcategoria
ORDER BY 
    c.sueldobase DESC;
-- Obtener empleados y detalles de su vehículo (si tienen):
SELECT 
    e.ape1emp, 
    e.ape2emp, 
    e.nomemp, 
    e.vehiculo
FROM 
    templeados e;
-- Obtener empleados con su ubicación de departamento y fecha de nacimiento:
-- Para obtener los empleados junto con la ubicación de su departamento y su fecha de nacimiento, puedes hacer esta consulta:

SELECT 
    e.ape1emp, 
    e.ape2emp, 
    e.nomemp, 
    e.fnacempt, 
    d.ubicacion AS ubicacion_depto
FROM 
    templeados e
JOIN 
    tdepartamentos d ON e.iddepemp = d.iddepartamento;
-- Obtener empleados con más de 3 hijos:
SELECT 
    e.ape1emp, 
    e.ape2emp, 
    e.nomemp, 
    e.nhijosemp
FROM 
    templeados e
WHERE 
    e.nhijosemp > 3;
-- Obtén el salario base más alto de la empresa, el más bajo, la diferencia entre ellos y el 
-- número de empleados de la empresa. Todos los datos deben aparecer con un nombre de 
-- campo relativo a su contenido

SELECT 
    MAX(c.sueldobase) AS salario_maximo,
    MIN(c.sueldobase) AS salario_minimo,
    (MAX(c.sueldobase) - MIN(c.sueldobase)) AS diferencia_sueldos,
    COUNT(e.nifemp) AS numero_empleados
FROM 
    templeados e
JOIN 
    tcategorias c ON e.idcatemp = c.idcategoria;

SELECT 
    e.nomemp AS nombre_empleado, 
    d.nomdept AS nombre_departamento, 
    d.extdept AS extension_telefono, 
    c.sueldobase AS salario_base
FROM 
    templeados e
JOIN 
    tdepartamentos d ON e.iddepemp = d.iddepartamento
JOIN 
    tcategorias c ON e.idcatemp = c.idcategoria
WHERE 
    TIMESTAMPDIFF(YEAR, e.fnacempt, CURRENT_DATE) = 30;

-- Indica, para aquellos empleados que tienen 30 años cumplidos, su nombre, nombre de 
-- departamento en el que trabajan, extensión telefónica y salario base asociado a su categoría.
SELECT 
    e.nomemp AS nombre_empleado, 
    d.nomdept AS nombre_departamento, 
    d.extdept AS extension_telefono, 
    c.sueldobase AS salario_base
FROM templeados e
JOIN tdepartamentos d ON e.iddepemp = d.iddepartamento
JOIN tcategorias c ON e.idcatemp = c.idcategoria
WHERE TIMESTAMPDIFF(YEAR, e.fnacempt, CURDATE()) = 30;

SELECT 
    e.nomemp AS nombre_empleado, 
    d.nomdept AS nombre_departamento, 
    d.extdept AS extension_telefono, 
    c.sueldobase AS salario_base
FROM templeados e
JOIN tdepartamentos d ON e.iddepemp = d.iddepartamento
JOIN tcategorias c ON e.idcatemp = c.idcategoria
WHERE EXTRACT(YEAR FROM AGE(e.fnacempt)) = 30;


SELECT 
    e.nomemp AS nombre_empleado, 
    d.nomdept AS nombre_departamento, 
    d.extdept AS extension_telefono, 
    c.sueldobase AS salario_base
FROM 
    templeados e
JOIN 
    tdepartamentos d ON e.iddepemp = d.iddepartamento
JOIN 
    tcategorias c ON e.idcatemp = c.idcategoria
WHERE 
    DATEDIFF(YEAR, e.fnacempt, GETDATE()) = 30;

SELECT 
    e.nomemp AS nombre_empleado, 
    d.nomdept AS nombre_departamento, 
    d.extdept AS extension_telefono, 
    c.sueldobase AS salario_base
FROM 
    templeados e
JOIN 
    tdepartamentos d ON e.iddepemp = d.iddepartamento
JOIN 
    tcategorias c ON e.idcatemp = c.idcategoria
WHERE 
    TIMESTAMPDIFF(YEAR, e.fnacempt, CURDATE()) = 30;


SELECT 
    e.nomemp AS nombre_empleado, 
    d.nomdept AS nombre_departamento, 
    d.extdept AS extension_telefono, 
    c.sueldobase AS salario_base,
    e.fnacempt AS fecha_nacimiento
FROM 
    templeados e
JOIN 
    tdepartamentos d ON e.iddepemp = d.iddepartamento
JOIN 
    tcategorias c ON e.idcatemp = c.idcategoria;


 -- Indica, para aquellos empleados que tienen 30 años cumplidos, su nombre, nombre de 
-- departamento en el que trabajan, extensión telefónica y salario base asociado a su categoría.
SELECT 
    e.nomemp AS nombre_empleado, 
    d.nomdept AS nombre_departamento, 
    d.extdept AS extension_telefono, 
    c.sueldobase AS salario_base
FROM 
    templeados e
JOIN 
    tdepartamentos d ON e.iddepemp = d.iddepartamento
JOIN 
    tcategorias c ON e.idcatemp = c.idcategoria
WHERE 
    TIMESTAMPDIFF(YEAR, e.fnacempt, CURDATE()) BETWEEN 29 AND 31;

SELECT 
    e.nomemp AS nombre_empleado, 
    d.nomdept AS nombre_departamento, 
    c.nomcat AS nombre_categoria
FROM templeados e
JOIN tdepartamentos d ON e.iddepemp = d.iddepartamento
JOIN tcategorias c ON e.idcatemp = c.idcategoria;

-- Lista los nombres de las provincias en las que viva más de 1 empleado.
SELECT e.proemp AS provincia,
COUNT(e.nifemp) AS num_empleados
FROM templeados e
GROUP BY e.proemp
HAVING COUNT(e.nifemp) > 1;

-- Visualiza el nombre, el sueldobase y el salario bruto que percibe cada trabajador de la 
-- empresa. El salario bruto estará formado por el salario base más el plus por antigüedad y 
-- más el plus por hijos. El plus de antigüedad es de 12 euros por año trabajado y el plus de 
-- hijos es 18 euros por hijo
	SELECT 
		e.nomemp AS nombre_empleado,
		c.sueldobase AS salario_base,
		(c.sueldobase + (TIMESTAMPDIFF(YEAR, e.faltaemp, CURDATE()) * 12) + (e.nhijosemp * 18)) AS salario_bruto
	FROM templeados e
	JOIN tcategorias c ON e.idcatemp = c.idcategoria;
