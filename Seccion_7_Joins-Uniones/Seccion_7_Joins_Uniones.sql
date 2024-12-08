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