use pinacoteca;

-- Visualizar todas las obras pintadas en el siglo XX junto c el autor 
-- la fecha en que fueron pintadas,
--  ordenadas de + reciente a + antigua.
	SELECT Ncuadro, FCuadro, NPintor
	FROM cuadro
	WHERE YEAR(FCuadro) between 1900 and 1999
	ORDER BY Fcuadro desc;

-- Visualizar todas las obras del siglo XX que no sean óleos.
	SELECT *
	FROM cuadro
	WHERE tecnica NOT LIKE '%OLEO%'
	AND YEAR(FCuadro) between 1900 and 1999;

-- Visualiza  el nombre y la edad hasta la que vivieron, pintores españoles solo.
	SELECT NPintor AS nombre,(YEAR (Ffall)-YEAR(Fnac)) AS edad 
	FROM pintor
	WHERE PaisPintor 
	LIKE '%ESPA%';

-- Calcula y visualiza el numero cuadros de Picasso,
-- que hay en el Reina Sofia
	SELECT * 
	FROM cuadro
	WHERE NPintor LIKE 'Picasso' 
	AND NPinacoteca LIKE '%sof%';
    
    SELECT COUNT(*), Npintor, Npinacoteca
    FROM cuadro 
    WHERE NPintor LIKE 'pica%' AND NPinacoteca LIKE '%sofia%'
    GROUP BY Npintor, NPinacoteca;
    
-- Visualiza el nombre de cada pinacoteca 
-- con el numero total de cuadros que hay en ella.
	SELECT NPinacoteca, COUNT(CodCuadro)
	FROM cuadro
	GROUP BY NPinacoteca
	ORDER BY COUNT(CodCuadro);

-- Ordena las pinacoteca
