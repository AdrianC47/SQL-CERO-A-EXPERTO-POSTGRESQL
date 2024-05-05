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