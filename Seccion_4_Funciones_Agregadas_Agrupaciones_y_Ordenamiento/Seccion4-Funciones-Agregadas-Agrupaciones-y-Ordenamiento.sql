-- Operador Between
select
    first_name,
    last_name,
    followers
FROM
    users
WHERE
    --    followers > 4600 --and followers < 4700
    followers BETWEEN 4600
    and 4700
order by
    followers ASC;


-- MAX MIN COUNT ROUND AVG
SELECT COUNT(*) FROM USERS;

SELECT
    count(*) as total_users,-- Saber el total de registros
    min(followers) as min_followers, -- N° de seguidores que tiene como minimo
    max(followers) as max_followers -- N° de seguidores que tiene como maximo
FROM
    USERS;
    

select * from users;
-- Se requiere saber cual es el promedio de seguidores que se tiene
select
    AVG(followers) as avg_followers,--promedio
    ROUND(AVG(followers)) as avg_followers_redondeado,--promedio
    SUM(followers)/count(*) as avg_followers_manual -- promedio manual
from
    users;

-- Se requiere saber cuales son las personas que tienen solo 4 followers y 4999 followers

SELECT first_name, last_name, followers 
from users
where followers = 4 or followers = 4999;

-- Pero si se requiere saber el numero de personas junto con este filtro
-- pero indicando los campos como tal, para eso se usa la sentencia
-- GROUP BY

SELECT COUNT(*), followers
from users
where followers = 4 or followers = 4999
GROUP BY followers -- Especifico la columna que quiero ver
ORDER BY followers ASC;



-- Si se requiere saber el numero de personas por país -- pero de los países 
-- con mayor población 
-- Para solventar esto usaremos la sentencia HAVING la cual va siempre luego del GROUP BY
-- Ojo que siempre que se ponga un count junto con otro campo  
-- se debe añadir la sentencia GROUP BY
SELECT
    COUNT(*) as total, 
    COUNTRY
FROM
    users
GROUP BY
    country
HAVING
    COUNT(*) > 5
ORDER BY
    COUNT(*) ASC;


 
-- Se requiere el listado de todos los paises de forma unica
select
    DISTINCT country
from
    users;
 

-- Group BY con otras funciones

-- Se requiere obtener el dominio del correo electronico y contar cuantos correos hay por dominio
SELECT 
    COUNT(*),
    SUBSTRING(email, POSITION('@' in email) + 1) as domain
from
    users
GROUP BY
    domain
HAVING
    COUNT(*) > 1
ORDER BY COUNT(*) DESC;

-- Seria un error y un falso positivo el poner el group by por email
-- debido a que tiene una estructura inicial definida, entonces debo de agrupar por la nueva
-- estructura que estoy haciendo es decir el substring, 
-- Ojo que se puede mandar el alias como todo el query de substring