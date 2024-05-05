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

