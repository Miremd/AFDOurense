select Ncuadro,nPintor,Fcuadro 
from cuadro 
where year (Fcuadro) between 1900 and 1999 order by Fcuadro;

select *
from cuadro
where year(Fcuadro) between 1900 and 1999 and Tecnica not like '%oleo%';

select Npintor as nombre,(year(Ffall) - year(Fnac)) as edad 
from pintor 
where PaisPintor like '%espa%';

select NPintor as Pintor,count(*) as cuadros 
from cuadro 
where Npintor = 'Picasso' and NPinacoteca like '%sof%';

select Npinacoteca,count(Ncuadro) from cuadro group by Npinacoteca;

select count(CodCuadro),Npinacoteca from cuadro group by Npinacoteca;

select Npintor from pintor where Npintor not in (select distinct Npintor from cuadro);
-- muestra la superficie total de los cuadros que hay en cada museo
select sum(ancho*alto), Npinacoteca from cuadro group by Npinacoteca;
-- Muestra todos los pintores, su pais de origen, escNuela a la que pertnecen y pais de la escuela
select Npintor,PaisPintor,NombreE, Pais from pintor,escuela where(escuela.NEscuela =pintor.NombreE);

-- Visualiza el titulo d las obras cuyos autores nacieron en marzo de 1905
select Ncuadro,cuadro.Npintor,Fnac  from cuadro,pintor where (cuadro.NPintor = pintor.Npintor) and year(Fnac) = 1905 and month(Fnac) = 03;

-- titulo, autor y pinacoteca de obras expuestas en barcelona. 
select Ncuadro as titulo,Npintor as autor, cuadro.Npinacoteca as museo, pinacoteca.Ciudad from cuadro,pinacoteca where pinacoteca.Ciudad= 'barcelona';
-- visualiza la escuela y el pais a la que pertenecen los pintores de las pinacotecas españolas pintadas al oleo
select NEscuela, escuela.Pais from escuela,cuadro where Npintor= (select Npintor from cuadro where Tecnica = 'oleo');

-- visualiza nombre, direccion, ciudad y telefono de aquellas pinacotecas 
-- que exponen obras de la misma tecnica que  las creadas por los pintores
-- de la escuela sevillana
Select * from pinacoteca 








 

