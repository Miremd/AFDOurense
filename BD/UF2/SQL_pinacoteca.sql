-- 1A
use pinacoteca;
select  year(FCuadro) as Fecha_del_cuadro, NCuadro, NPintor from cuadro where year(FCuadro) between 1900 and 1999 order by Fcuadro desc; 

select * from cuadro where tecnica not like '%oleo%'and alto is not null and ancho < 50 ;

select Npintor, (year(Ffall) - year(Fnac)) from pintor  where PaisPintor like PaisPintor = '%espa%';


select count(*), 'Picasso' as autor from cuadro where NPintor like '%picca%' and NPinacoteca like '%sofia%';


select NPinacoteca, count(CodCuadro) from cuadro group by NPinacoteca; 

select NPinacoteca, count(CodCuadro) from cuadro group by NPinacoteca order by count(codCuadro) asc; 

use pinacoteca;

	/*muestra el numero de cuadros que hay en cada museo, en todos los museos*/
    select  count(Ncuadro) as numero_de_cuadro from cuadro group by Npinacoteca;
    	/*muestra muestra los pintores que no tengan obras*/
   select Npintor as pintores  from pintor where Npintor not in (select distinct  Npintor from cuadro);
   /*Muestra la superficie total que hay en cada museo, con todos los museos*/
select sum(Ancho)*sum(Alto) as Area , Npinacoteca as Nombre_pinacorteca  from cuadro  group by Npinacoteca;

   SELECT 
    SUM(COALESCE(Ancho, 0) * COALESCE(Alto, 0)) AS Area,
    Npinacoteca AS Nombre_pinacoteca
FROM 
    cuadro
WHERE 
    Npinacoteca IS NOT NULL 
    AND Ancho IS NOT NULL 
    AND Alto IS NOT NULL
GROUP BY 
    Npinacoteca;
   
   /*10 Muestra todos los pintores, su pais de origen, escuela ala que pertenecieron y el pais de la escuela*/
   
   select Npintor, PaisPintor, NombreE, Pais from pintor, escuela where pintor.NombreE = escuela.NombreE;
   
   /*Visualiza el titulo de las obras  cuyos autores nacieron en marzo de 1905*/

   
   SELECT 
    c.Ncuadro, 
    p.Npintor 
FROM 
    cuadro c
JOIN 
    pintor p 
    ON c.Npintor = p.Npintor 
WHERE 
    YEAR(p.Fnac) = 1905 
    AND MONTH(p.Fnac) = 03;

 /* Visualiza el titulo, autor, y pinacorteca de las obras de las obras expuestas en barcelona*/
select Ncuadro as Titulo, Npintor as Autor, cuadro.NPinacorteca as pinacoteca from cuadro, pinacoteca where cuadro.NPinacorteca = pinacoteca.NPinacoteca and ciudad like '%barcelona%';
  /*Visualiza la escuela y el pais de dicha escuela a la que pertenecen los pintores de las pinacotecas españolas que han utilizado cualquier tecnica basada en oleo  */
   select  cuadro.NPintor, Tecnica, NombreE, Pais from cuadro, pintor, escuela  where cuadro.Npintor = pintor.Npintor and pintor.NombreE = escuela.NEscuela and tecnica like '%oleo%';
   /*Visualiza el nombre,direccion y  ciudad de aquellas pinacotecas que exponen obras de la misma tecnica que la misma tecnica que las ha creado */
   
   select * from cuadro where in (select Npintor , NombreE from pintor where NombreE like '%sevillana%');
   