-- USO DE UNION

select code, name, '123' from continent where name like '%America%'
union
select 1,'otra cosa',name from continent where code in (3,5)
order by  name asc;

-- es importante que se tengan el mismo numero de columnas entre las partes a unirse
-- se debe mantener el mismo tipo de dato pero dependiendo lo que se necesite
-- puede variar el orden
-- se puede usar el 1, 2 a manera de obtener los valores por orden , por ejemplo en el caso de
-- arriba el 1 haría referencia a code


-- UNION DE TABLAS -- Where

SELECT
  a.name as country,
  b.name as continent
from
  country a,
  continent b
where
  a.continent = b.code
order by
  b.name asc;


-- INNER JOIN
SELECT
  a.name as country,
  b.name as continent
from
  country a
  inner join continent b on a.continent = b.code
order BY
  a.NAME ASC;


-- Alterar Secuencia
alter SEQUENCE continent_code_seq RESTART with 8;

-- FULL OUTER JOIN

-- El uso de OUTER en las consultas es opcional y no afecta el resultado 
-- de la consulta. Tanto RIGHT JOIN como RIGHT OUTER JOIN devuelven los mismos 
-- resultados, incluyendo las filas no coincidentes de la tabla derecha y los 
-- valores nulos de la tabla izquierda cuando no hay coincidencias


-- country a  -- a.name as country , a.continent as  continentCode (codigo numérico)
-- continent b - b.name as continentName

SELECT
  a.name as country,
  a.continent as continentCode,
  b.name as continentName
FROM
  country a
  FULL OUTER JOIN continent b on a.continent = b.code
ORDER BY
  a.NAME DESC;

-- LEFT OUTER JOIN
-- Obtener un listado de todos los continentes
-- que no tienen registros en la tabla de paises

SELECT 
  a.name as country,
  a.continent as continentCode,
  b.name as continentName
FROM
  country a 
  LEFT OUTER JOIN continent b on a.continent = b.code
  ORDER by
    a.name desc;


-- RIGHT OUTER JOIN
-- Obtener un listado de todos los continentes
-- que no tienen registros en la tabla de paises
SELECT
  a.name as country,
  a.continent as continentCode,
  b.name as continentName
FROM
  country a
  RIGHT OUTER JOIN continent b on a.continent = b.code
where
  a.continent is null
ORDER by
  a.name desc;     


-- Aggreations Joins
-- Digamos que se quiere contar cuantos continentes que hay en la tabla country
-- se requiere tambien el nombre del continente y ordenar de acuerdo al conteo
-- Al usar el inner join se obtiene solo los continentes que estan en la tabla country
-- Al usar full outer join se obtienen todos los continentes de la tabla continent que no estan en la tabla country con valor de 1
-- si lo que se busca es cambiar el valor se hace lo siguiente: dividir los scripts

(SELECT count(*) as total, b.name from country a
         INNER JOIN continent b on a.continent = b.code
GROUP BY b.name)
UNION (
SELECT  0 as total, b.name from country a -- aqui se pone en cero para mostrar especificamente los continentes que no estan en la tabla country con valor de 0
         RIGHT JOIN  continent b on a.continent = b.code
WHERE a.continent is null
GROUP BY b.name)
order by total asc;


-- Realizar esta tarea sacar el query del siguiente resultado
-- son todos los continentes menos America y luego unirlo con todo lo demas que coincida con America
-- Count Union - Tarea
-- Total |  Continent
-- 5	  | Antarctica
-- 28	  | Oceania
-- 46	  | Europe
-- 51	  | America
-- 51	  | Asia
-- 58	  | Africa

-- Solucion mia
SELECT COUNT(*) AS Total, c.name as Continent FROM continent c
INNER JOIN country d on c.code = d.continent
WHERE c.name NOT LIKE '%America%'
GROUP BY c.name
union  (
SELECT COUNT(*) AS Total, 'America' AS Continent FROM continent c
INNER JOIN country d on c.code = d.continent
WHERE c.name LIKE '%America%'
GROUP BY c.name='America'
)
ORDER BY Total ASC;

-- Solucion Fernando Herrera

(SELECT  count(*) as Total, b.name as Continent from country a
INNER JOIN continent b on a.continent = b.code
WHERE b.name NOT LIKE '%America%'
GROUP BY b.name
)UNION
(
SELECT count(*) as total, 'America' from country a
INNER JOIN continent b on a.continent = b.code
WHERE b.name LIKE '%America%'
)
ORDER BY Total ASC;

