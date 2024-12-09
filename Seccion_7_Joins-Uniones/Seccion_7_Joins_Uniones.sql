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