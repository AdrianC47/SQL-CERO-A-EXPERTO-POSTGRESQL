-- Resolución por Adrián Cabrera
-- 1. Cuantos usuarios tenemos con cuentas @google.com
-- Tip: count, like

SELECT
    COUNT(*)
FROM
    users
WHERE
    email LIKE '%@google.com';

-- 2. De qué países son los usuarios con cuentas de @google.com
-- Tip: distinct

SELECT
    DISTINCT(country)
FROM
    users
WHERE
    email LIKE '%@google.com';
-- 3. Cuantos usuarios hay por país (country)
-- Tip: Group by
SELECT
    COUNT(*) as total_usuarios_pais,
    country
FROM
    users
GROUP BY
    country
ORDER BY
    total_usuarios_pais DESC;
    
-- 4. Listado de direcciones IP de todos los usuarios de Iceland
-- Campos requeridos first_name, last_name, country, last_connection
SELECT
    first_name,
    last_name,
    country,
    last_connection
from
    users
WHERE
    country like 'Iceland';
-- 5. Cuantos de esos usuarios (query anterior) tiene dirección IP
-- que incia en 112.XXX.XXX.XXX
SELECT
    COUNT(*)
from
    users
WHERE
    country like 'Iceland'
    and last_connection like '112.%';
    
-- 6. Listado de usuarios de Iceland, tienen dirección IP
-- que inicia en 112 ó 28 ó 188
-- Tip: Agrupar condiciones entre paréntesis
-- que incia en 112.XXX.XXX.XXX

SELECT
    first_name,
    last_name,
    country
from
    users
WHERE
    country like 'Iceland'
    and (
        last_connection like '112.%'
        or last_connection like '28.%'
        or last_connection like '188.%'
    );
    
-- Ojo con el uso de los parentesis para unir condiciones
-- 7. Ordene el resultado anterior, por apellido (last_name) ascendente
-- y luego el first_name ascendentemente también
SELECT
    first_name,
    last_name,
    country
from
    users
WHERE
    country like 'Iceland'
    and (
        last_connection like '112.%'
        or last_connection like '28.%'
        or last_connection like '188.%'
    )
ORDER BY
    last_name ASC , first_name ASC;
     
-- 8. Listado de personas cuyo país está en este listado
-- ('Mexico', 'Honduras', 'Costa Rica')
-- Ordenar los resultados de por País asc, Primer nombre asc, apellido asc
-- Tip: Investigar IN
-- Tip2: Ver Operadores de Comparación en la hoja de atajos (primera página)
SELECT
    country
    first_name,
    last_name

FROM
    USERS
WHERE
    country in ('Mexico', 'Honduras', 'Costa Rica')
ORDER BY
    country ASC,
    first_name asc,
    last_name asc;
    
-- 9. Del query anterior, cuente cuántas personas hay por país
-- Ordene los resultados por País asc

SELECT
    COUNT(*) as total,
    COUNTRY
FROM
    USERS
WHERE
    country in ('Mexico', 'Honduras', 'Costa Rica')
GROUP BY
	COUNTRY
ORDER BY
    country ASC;