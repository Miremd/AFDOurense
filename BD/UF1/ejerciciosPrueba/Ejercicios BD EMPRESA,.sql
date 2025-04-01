-- Lista los nombres de las provincias en las que vive mas de un empleado
use empresaN_datos_sinCP;

SELECT count(NIFemp), proemp
FROM templeados
GROUP BY proemp
HAVING count(NIFemp) > 1

-- 