USE `pinacoteca`;
--  Visualiza el nombre y la edad hasta la que vivieron, para los pintores españoles.
select year(Ffall)-year(Fnac), Npintor, PaisPintor from pintor 
where year(Ffall) is not null and year(Fnac) is not null 
and Ffall>Fnac 
and PaisPintor like '%esp%'; 
--  Visualiza el nombre y la edad del pintor español más longevo. Idem para el menos longevo.
select year(Ffall)-year(Fnac) as edad, Npintor, PaisPintor from pintor 
where year(Ffall) is not null and year(Fnac) is not null 
and Ffall>Fnac 
and PaisPintor like '%esp%'
order by edad desc; 
select year(Ffall)-year(Fnac) as edad, Npintor, PaisPintor from pintor 
where year(Ffall) is not null and year(Fnac) is not null 
and Ffall>Fnac 
and PaisPintor like '%esp%'
order by edad asc; 
-- Visualiza el valor medio de la edad de los pintores españoles.
select avg(year(Ffall)-year(Fnac)), Npintor, PaisPintor from pintor 
where year(Ffall) is not null and year(Fnac) is not null 
and Ffall>Fnac 
and PaisPintor like '%esp%'; 
--  Calcula y visualiza el número total de cuadros de Goya registrados en nuestras pinacotecas.
select count(Ncuadro), Npintor from cuadro 
where Npintor like '%goya%';

 