use empresan_datos; 
 -- Lista el nombre de los distintos departamentos que tiene la empresa y los datos de nombre y 
-- apellidos de los trabajadores que pertenecen a ellos. Datos ordenados alfabéticamente por 
-- nombre de departamento.
select d.iddepartamento, nomdep, nomemp, ape1emp, ape2emp 
from tdepartamentos d, templeados em 
where d.iddepartamento = em.iddepemp 
order by nomdep asc; 
-- Visualiza  el nombre de las categorías que tienen empleados que hayan empezado a trabajar 
-- antes del año 2000. Debes visualizar también el nombre, apellidos y fecha de alta de los 
-- trabajadores a los que hace referencia la consulta. 
select nomcat, nomemp, ape1emp, ape2emp, faltaemp
from tcategorias cat, templeados em 
where cat.idcategoria=em.idcatemp 
and year(faltaemp)<2000; 
-- Lista todos los datos de los empleados  que entraron en la empresa antes del 1 de enero del 
-- año 2000, que perciban un salario base entre 900 y 1500 euros, o bien de aquellos que 
-- pertenezcan a los departamentos 2, 3 o 4.
select * from templeados where ape1emp like '%puga%' order by nifemp ;
select * from templeados em 
join tcategorias cat
on cat.idcategoria=em.idcatemp 
where  year(faltaemp)<2000 
and sueldobase between 900 and 1500 
or iddepemp in(2, 3, 4); 
--  Obtén el salario base más alto de la empresa, el más bajo, la diferencia entre ellos y el 
-- número de empleados de la empresa. Todos los datos deben aparecer con un nombre de 
-- campo relativo a su contenido.
select count(Nifemp) as total_empleados, 
max(sueldobase) as sueldo_max, min(sueldobase) as sueldo_min, 
(max(sueldobase)-min(sueldobase)) as diferencia
from templeados em 
join tcategorias cat 
on cat.idcategoria=em.idcatemp; 
--  Indica, para aquellos empleados que tienen 50 años cumplidos, su nombre, nombre de 
-- departamento en el que trabajan, extensión telefónica y salario base asociado a su categoría.
select nomemp, nomdep, extdep, sueldobase 
from templeados em 
join tdepartamentos dep on dep.iddepartamento=em.iddepemp 
join tcategorias cat on em.idcatemp=cat.idcategoria 
where datediff(now(), fnacemp)/365>50;
--  Lista los nombres de las provincias en las que viva más de 1 empleado.
select proemp from templeados
group by proemp 
having count(proemp)>1; 



