use pinacoteca;
-- media de edad de los pintores nacidos en Sevilla
select avg(year(Ffall)-year(Fnac)) from pintor where Ciudadpintor like '%sevi%';
-- superficie de la sala donde se expone La maja desnuda
select Ncuadro, cuadro.NPinacoteca, cuadro.numsala, metros
from cuadro, salas 
where cuadro.NPinacoteca = salas.NPinacoteca and Ncuadro like '%desnud%';
-- pintores con cuadros en mas de dos pinacotecas 
select NPintor, count(distinct NPinacoteca) 
from cuadro 
group by NPintor 
having count(distinct NPinacoteca)> 2; 
-- mostras los cuadros que tienen alto y ancho = null
select Ncuadro, NPintor from cuadro where Alto is null and Ancho is null; 
 