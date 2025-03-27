use pinacoteca;

-- PRACTICA 1 PINACOTECA

-- Ejercicio 1
select cuadro.Ncuadro , pinacoteca.Npinacoteca  from pinacoteca
join cuadro
on pinacoteca.NPinacoteca = cuadro.NPinacoteca
where pinacoteca.Npinacoteca like '%prado%';

-- Ejercicio 2
select * from cuadro;
select Ncuadro, Npintor from cuadro
where year(Fcuadro) between year('1899-12-31') and year('1999-01-01');

-- ejercicio 3

Select Ncuadro, Npintor,Fcuadro 
from cuadro
order by Fcuadro desc;

-- ejercicio 4

Select * from pintor
where year(Fnac) between year('1899-12-31') and year('1999-01-01');

-- ejercicio 5

Select Npintor as Pintor, NPintorMaestro as Maestro 
from pintor
where NpintorMaestro is not null;
-- Ejercicio 6

select NEscuela as Escuela, Pais,Fecha 
from escuela
order by fecha;

-- Ejercicio 7

select Ncuadro as cuadro, Fcuadro as Fecha, Npintor as pintor, NPinacoteca as Pinacoteca
from cuadro
order by Fecha desc limit 1;

select Ncuadro as cuadro, Fcuadro as Fecha, Npintor as pintor, NPinacoteca as Pinacoteca
from cuadro
where Fcuadro is not null order by Fcuadro limit 1;

-- Ejercicio 8

Select Ncuadro, Npintor, NPinacoteca 
from cuadro
where NPinacoteca like '%sofia%' and Npintor != 'Picasso';

-- Ejercicio 9

select NCuadro, tecnica, Fcuadro
from cuadro
where year(Fcuadro) between year('1899-12-31') and year('1999-01-01') and tecnica != 'Oleo';

-- Ejercicio 10

select Ncuadro, NPintor,NPinacoteca, (Alto*Ancho) as superficie
from cuadro
where (Alto*Ancho) is not null order by superficie desc limit 1;

-- Ejercicio 11

Select  * from pintor;
Select year(Ffall)-year(Fnac) as edad, Npintor as Pintor
from pintor
where fnac is not null and ffall is not null and ffall > fnac order by edad limit 1;



