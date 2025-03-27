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

-- Enunciado 1:
-- Obtener todos los cuadros de un pintor específico, mostrando el título del cuadro, 
-- la técnica utilizada,
-- las dimensiones 
--  el nombre de la pinacoteca donde está exhibido.
	SELECT c.Ncuadro AS Titulo, 
	c.Tecnica, 
	c.Alto AS Alto_cm, 
	c.Ancho AS Ancho_cm, 
	c.NPinacoteca AS Pinacoteca
	FROM cuadro c
	WHERE c.NPintor = 'Picasso'; 

-- Enunciado 2:
-- Obtener una lista de las pinacotecas con más de 3 salas, 
-- mostrando su nombre, 
-- ciudad y
 -- número de salas.
 
	SELECT p.NPinacoteca, p.Ciudad, 
	COUNT(s.numSala) AS NumeroDeSalas
	FROM pinacoteca p
	JOIN salas s ON p.NPinacoteca = s.NPinacoteca
	GROUP BY p.NPinacoteca, p.Ciudad
	HAVING  COUNT(s.numSala) > 3;
 -- Enunciado 3:
-- Mostrar los pintores que fueron protegidos por mecenas,
--  junto con la fecha de inicio de la protección y 
-- el nombre del mecenas.
	SELECT 
		m.NombreM AS Mecenasmecenas, 
		p.Npintor AS Pintor, 
		pr.FInicio AS FechaInicio
	FROM protege pr
	JOIN mecenas m ON pr.NMecenas = m.NombreM
	JOIN pintor p ON pr.NPintor = p.Npintor;
-- Enunciado 4:
-- Listar los cuadros más grandes (en términos de superficie) de la pinacoteca "Museo del Prado", 
-- mostrando el título,
-- el pintor, 
-- las dimensiones y 
-- la técnica.
	SELECT c.Ncuadro AS Titulo, 
		c.NPintor AS Pintor, 
		c.Alto * c.Ancho AS Superficie, 
		c.Tecnica
	FROM cuadro c
	JOIN pinacoteca p ON c.NPinacoteca = p.NPinacoteca
	WHERE p.NPinacoteca = 'Museo del Prado'
	ORDER BY Superficie  DESC
	LIMIT 5;
-- Enunciado 5
-- Encontrar los pintores que tienen obras en más de dos pinacotecas diferentes.
	SELECT p.Npintor AS Pintor, 
		COUNT(DISTINCT c.NPinacoteca) AS NumeroPinacotecas
		FROM pintor p
		JOIN cuadro c ON p.Npintor = c.NPintor
		GROUP BY p.Npintor
		HAVING COUNT(DISTINCT c.NPinacoteca) > 2;
-- como hace la profe este ejercicio
	SELECT Npintor, COUNT(DISTINCT npinacoteca) AS 'numero de pinacotecas'
	FROM cuadro
	GROUP BY Npintor
	HAVING count(DISTINCT NPinacoteca) > 2;

-- Enunciado 6
-- Obtener la lista de escuelas que han formado pintores,
--  mostrando el nombre de la escuela y 
-- la cantidad de pintores que han pasado por ella.
	SELECT e.NEscuela AS Escuela, 
	COUNT(p.Npintor) AS NumeroPintores
	FROM escuela e
	JOIN pintor p ON e.NEscuela = p.NombreE
	GROUP BY e.NEscuela;

-- muestra el numero de cuadros que hay en cada museo, de todos los museos.(agrupado)
	SELECT NPinacoteca, COUNT(*) AS num_cuadros
	FROM cuadro
	GROUP BY NPinacoteca;
-- muestra los pintores que no tengan obra
	SELECT p.Npintor, p.NombreE, p.Ciudadpintor, p.PaisPintor
	FROM pintor p
	LEFT JOIN cuadro c ON p.Npintor = c.NPintor
	WHERE c.CodCuadro IS NULL;
-- otra manera de hacerlo
	 SELECT Npintor
	 FROM pintor
	 WHERE NPintor NOT IN (SELECT DISTINCT NPintor FROM cuadro);

-- muestra la superficie total de los cuadros que hay en cada museo (con todos los museos)
	SELECT c.NPinacoteca, 
		   SUM(CASE 
				   WHEN c.Alto IS NOT NULL AND c.Ancho IS NOT NULL THEN c.Alto * c.Ancho
				   ELSE 0
			   END) AS SuperficieTotal
	FROM cuadro c
	GROUP BY c.NPinacoteca;
-- una manera muchisimo mas facil
	SELECT SUM(Ancho)*SUM(Alto), Npinacoteca FROM cuadro GROUP BY NPinacoteca;
-- Muestra todos los pintores
-- su pais de origen,
-- escuela a la que pertenecieron
-- pais de esa escuela
	 SELECT 
		p.Npintor, 
		p.PaisPintor, 
		p.NombreE AS Escuela, 
		(SELECT e.Pais FROM escuela e WHERE e.NEscuela = p.NombreE) AS PaisEscuela
	FROM pintor p;
-- la manera de la profe para hacer este ejercicio
	 SELECT NPintor, PaisPintor, NombreE, Pais
	 FROM pintor, escuela
	 WHERE pintor.NombreE= escuela.NEscuela;

-- Visualiza el titulo de las obras cuyos autores nacieron en Marzo de 1905
	SELECT Ncuadro, cuadro.NPintor, Fnac
	FROM cuadro,pintor 
	WHERE pintor.Npintor= cuadro.NPintor AND YEAR(Fnac)= 1905 AND MONTH(Fnac)=03;	

-- Visualiza titulo,autor y pinacoteca de las obras expuestas en Barcelona
-- Cada columna debe encabezarse en los términos "Titulo", "Autor" y "Pinacoteca"

	 SELECT Ncuadro AS Titulo, NPintor AS Autor, cuadro.NPinacoteca AS Pinacoteca
	 FROM cuadro,pinacoteca
	 WHERE cuadro.NPinacoteca = pinacoteca.NPinacoteca AND ciudad LIKE '%barcelona%';

-- Visualiza la escuela y 
-- el país de dicha escuela a la que pertenecen los pintores de las pinacotecas españolas 
-- que han usado OLEO. (podria hacer un JOIN pero no, se hacen subconsultas)
-- (chatgpt)
	SELECT e.NEscuela, e.Pais FROM escuela e WHERE e.NEscuela IN 
    (SELECT p.NombreE FROM pintor p WHERE p.Npintor 
    IN ( SELECT c.NPintor FROM cuadro c WHERE c.Tecnica = 'Oleo'
    AND c.NPinacoteca IN (SELECT pi.NPinacoteca FROM pinacoteca pi WHERE pi.Ciudad IN ('Madrid', 'Barcelona', 'Toledo', 'Zaragoza')
			  )
		)
	);

-- la profe.
SELECT NombreE, Pais
FROM cuadro, pintor, escuela
WHERE cuadro.NPintor = pintor.Npintor AND  pintor.NombreE = escuela. NEscuela AND Tecnica LIKE '%OLEO%';

-- Visualiza nombre, direccion, ciudad 
-- de aquellas pinacotecas que exponen obras de la misma tecnica que las creadas por los pintores
-- de la escuela 'Sevillana'
SELECT * FROM cuadro WHERE Npintor IN ( SELECT Npintor FROM pintor WHERE NombreE LIKE '%sevillana%');

-- media de edad de los pintores nacidos en Sevilla

SELECT AVG(YEAR(Ffall)-YEAR(Fnac)) FROM pintor WHERE Ciudadpintor LIKE '%sevi%';

-- muestra la superficie de la sala que se muestra la "maja desnuda"
SELECT metros,cuadro.numsala,cuadro.NPinacoteca, Ncuadro
FROM salas,cuadro
WHERE cuadro.NPinacoteca = salas.NPinacoteca
AND Ncuadro like '%desnud%' ;

-- cuadros con alto y ancho = NULL 
-- si pongo "IS NULL", NO HACE FALTA PONER "="
SELECT Ncuadro
FROM cuadro
WHERE alto IS NULL 
AND ancho IS NULL ;

use pinacoteca;
--  Seleccionar el nombre de todas las obras que tenemos en el Museo del Prado.
	SELECT Ncuadro 
	FROM cuadro
	WHERE NPinacoteca = 'Museo del Prado';
--  Visualizar todas las obras pintadas en el siglo XX junto con el autor que las pintó.
	SELECT c.Ncuadro, c.Fcuadro, p.Npintor
	FROM cuadro c
	JOIN pintor p ON c.NPintor = p.Npintor
	WHERE YEAR(c.Fcuadro) BETWEEN 1901 AND 2000;
 -- Visualizar todas las obras pintadas en el siglo XX junto con el autor que las pintó y la fecha en que
--  fueron pintadas, ordenadas de más reciente a más antigua
		SELECT c.Ncuadro, p.Npintor, c.Fcuadro
		FROM cuadro c
		JOIN pintor p ON c.NPintor = p.Npintor
		WHERE YEAR(c.Fcuadro) BETWEEN 1901 AND 2000
		ORDER BY c.Fcuadro DESC;
    -- Visualizar todos los datos de los pintores extranjeros nacidos en el siglo XX
		SELECT *
		FROM pintor
		WHERE YEAR(Fnac) BETWEEN 1901 AND 2000
		AND PaisPintor not like '%España%';
-- Visualizar el nombre de aquellos pintores españoles que han tenido pintor maestro, junto con el
 -- nombre de dicho maestro
	SELECT Npintor
	FROM pintor 
    WHERE NpintorMaestro IS NOT NULL
    AND PaisPintor LIKE '%España%';
--  Mostrar las escuelas de pintura, y el país al que pertenecen, en orden cronológico
	SELECT NEscuela, Pais
	FROM escuela
	ORDER BY Fecha ASC;
--  Visualizar el cuadro más reciente que hay en nuestras pinacotecas, junto con su autor, fecha y la
-- pinacoteca donde se encuentra. Idem con el más antiguo
	SELECT Ncuadro, Fcuadro, NPintor, NPinacoteca
	FROM cuadro
	ORDER BY Fcuadro DESC
	LIMIT 1;
-- el mas antiguo
	SELECT Ncuadro, Fcuadro, NPintor, NPinacoteca
	FROM cuadro
	ORDER BY Fcuadro ASC
	LIMIT 1;
-- Visualizar el nombre del cuadro y del autor de todas las obras del Museo Reina Sofía, que no sean de
 -- Picasso
	SELECT Ncuadro,NPintor 
	FROM cuadro 
	WHERE NPinacoteca like '%Museo Reina Sofía%' 
	AND NPintor NOT LIKE '%Picasso%';
--  Visualizar todas las obras del siglo XX que no sean óleos.
	SELECT Ncuadro, Fcuadro
	FROM cuadro
	WHERE Fcuadro BETWEEN '1900-01-01' AND '1999-12-31'
	AND tecnica NOT LIKE  '%Óleo%';
-- Mostrar pintores ordenados descendentemente por edad
	SELECT Npintor, Ciudadpintor, PaisPintor, Fnac
	FROM pintor
	ORDER BY Fnac ASC;
    
   
    SElect YEAR(Ffall)-year(Fnac) AS edad, NPintor FROM pintor
    WHERE Fnac IS NOT NULL
    AND Ffall IS NOT NULL
    AND Ffall>fnac
    ORDER BY Edad DESC;



