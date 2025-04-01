Use pinacoteca;
Use empresan_datos;
-- Hoja Enunciado 2 Pinacoteca

-- Ejercicio 4

Select * from pintor;
Select year(Ffall)- year(Fnac), Npintor, PaisPintor
from pintor
where PaisPintor ='España';

-- Hoja 3 Empresa N Ejercicios
-- Ejercicio 1

Select nomdep,nomemp,ape1emp,ape2emp,iddepemp from tdepartamentos
join templeados
on templeados.iddepemp= tdepartamentos.iddepartamento order by nomdep asc;


-- ejercicio 2 

Select nomcat, nomemp as nombre,ape1emp as apellido1, ape2emp as apellido2, faltaemp as Comienzo  
from tcategorias 
join templeados
on tcategorias.idcategoria = templeados.idcatemp
where year(faltaemp) < 2000;

-- Ejercicio 3

Select * from templeados 
join tcategorias
on templeados.idcatemp = tcategorias.idcategoria
where year(faltaemp) <'2000' and sueldobase between '900' and '1500' or iddepemp in('2','3','4');

-- ejercicio 4

select max(sueldobase) as sueldazo, min(sueldobase) as sueldito, (max(sueldobase)-min(sueldobase)) as diferencia, count(Nifemp) as Plantilla
from tcategorias
join templeados
 on tcategorias.idcategoria = templeados.idcatemp;

-- ejercicio 5

Select * from templeados;
select * from tcategorias;
select * from tdepartamentos;
Select nomemp as empleado,nomdep as departamento,tlfemp as telefono,sueldobase
from templeados
join tcategorias
on tcategorias.idcategoria = templeados.idcatemp
join tdepartamentos
on templeados.iddepemp = tdepartamentos.iddepartamento
where year(now()) - year(fnacemp) > '50';


