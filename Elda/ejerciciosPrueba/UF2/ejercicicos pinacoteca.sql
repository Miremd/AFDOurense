use pinacoteca;
-- obras pintadas en el siglo XX con autor y fecha ordenadas de mas reciente a mas antigua
select NCuadro, year(FCuadro) as año, NPintor 
from cuadro 
where year(FCuadro) between 1900 and 1999 order by FCuadro desc;
-- todas las obras del s XX que no son óleos
select * 
from cuadro 
where tecnica not like '%Oleo%' and year(FCuadro) between 1900 and 1999;
-- nombre y edad hasta la que vivieron los pintores españoles
select NPintor as Nombre, (year(Ffall) -year(Fnac)) as Edad
from pintor 
where PaisPintor like '%espa%';
-- calcula y visualiza el número de cuadros de Picasso en el Museo Reina Sofía
select count(*), 'Picasso' as autor, 'Reina Sofia' as pinacoteca 
from cuadro 
where NPintor like 'Picasso' and NPinacoteca like '%sof%';
-- visualiza el nombre de cada pinacoteca con el número total de cuadros que hay en ella
select NPinacoteca, count(*) 
from cuadro 
group by NPinacoteca 
order by count(*) asc;
-- Superficie de la sala en la que se expone La maja desnuda

-- Número de cuadros que hay en cada museo de todos los museos
select NPinacoteca, count(*) from cuadro group by NPinacoteca;
-- muestra los pintores que no tengan obra
select NPintor  from pintor where NPintor not in (select NPintor from cuadro);
-- superficie total del os cuadros que hay en cada museo
select sum(Alto*Alto), NPinacoteca 
from cuadro 
group by NPinacoteca order by NPinacoteca;
-- muestra todos los pintores, su pais de origen, escuela a la que pertenecieron y país de esa escuela
select NPintor, PaisPintor, NEscuela, pais 
from pintor, escuela 
where pintor.NombreE = escuela.NEscuela; 
-- título de las obras cuyos autores nacieron en marzo de 1905
select Ncuadro, cuadro.NPintor, Fnac
from cuadro, pintor 
where cuadro.NPintor = pintor.Npintor and year(Fnac) = 1905 and month(Fnac) = 03; 
-- título, autor y pinacoteca de las obras expuestas en Barcelona 
select Ncuadro as titulo, NPintor as pintor, cuadro.NPinacoteca as Pinacoteca 
from cuadro, pinacoteca
where pinacoteca.NPinacoteca = cuadro.NPinacoteca 
and ciudad like '%arcelo%';
-- escuela y pais a la que pertenecen los pintores de las pinacotecas españolas que usan oleo
select cuadro.Npintor, Tecnica, pintor.NombreE, pais 
from cuadro, pintor, escuela 
where cuadro.NPintor = pintor.Npintor and pintor.NombreE = escuela.NEscuela and Tecnica like 'ole%';
-- nombre, dirección, ciudad de pinacotecas que exponen obras de la misma técnica 
-- que las creadas por los pintores de la escuela sevillana
select * from cuadro where Npintor 
in (select NPintor from pintor where NombreE like '%sevill%'); 


