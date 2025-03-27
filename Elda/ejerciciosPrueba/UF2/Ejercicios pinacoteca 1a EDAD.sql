USE `pinacoteca`; 
--  Seleccionar el nombre de todas las obras que tenemos en el Museo del Prado.
select Ncuadro from cuadro where NPinacoteca like '%prad%'; 
--  Visualizar todas las obras pintadas en el siglo XX junto con el autor que las pintó  y la fecha en que
 -- fueron pintadas, ordenadas de más reciente a más antigua.
select Ncuadro, NPintor, Fcuadro from cuadro 
where year(Fcuadro) between 1900 and 1999 order by Fcuadro desc; 
-- Visualizar todos los datos de los pintores extranjeros nacidos en el siglo XX
select * from pintor 
where year(Fnac) between 1900 and 1999 
and PaisPintor not like 'esp%';
-- Visualizar el nombre de aquellos pintores españoles que han tenido pintor maestro, junto con el
 -- nombre de dicho maestro. 
 select Npintor, NPintorMaestro from pintor 
 where NPintorMaestro is not null 
 and PaisPintor like '%espa%'; 
 -- Mostrar las escuelas de pintura, y el país al que pertenecen, en orden cronológico
 select NEscuela, Pais from escuela order by Fecha asc; 
 -- Visualizar el cuadro más reciente que hay en nuestras pinacotecas, junto con su autor, fecha y la
 -- pinacoteca donde se encuentra. Idem con el más antiguo.
 select * from cuadro 
 order by Fcuadro asc limit 1; 
 -- Visualizar el nombre del cuadro y del autor de todas las obras del Museo Reina Sofía, que no sean de Picasso
 select Ncuadro, NPintor from cuadro 
 where NPinacoteca like '%sofia%' 
 and NPintor not like '%picas%'; 
 -- Visualizar todas las obras del siglo XX que no sean óleos.
 select Ncuadro, Fcuadro, Tecnica from cuadro 
 where year(Fcuadro) between 1900 and 1999 
 and Tecnica not like '%oleo%'; 
 -- Visualizar el cuadro de mayor tamaño, junto con su pintor 
 -- y la pinacoteca donde se encuentra. Idem con el de menor tamaño.
 select Ncuadro, NPintor, NPinacoteca, (Alto * Ancho) as tamaño
 from cuadro 
 order by tamaño desc limit 1; 
 select Ncuadro, NPintor, NPinacoteca, (Alto * Ancho) as tamaño
 from cuadro 
 order by tamaño asc limit 1; 
-- Mostrar pintores ordenados descendentemente por edad.
select year(Ffall)-year(Fnac) as edad, NPintor from pintor 
WHERE Fnac IS NOT NULL 
  AND Ffall IS NOT NULL
and ffall> fnac 
ORDER BY Edad DESC;


 
 