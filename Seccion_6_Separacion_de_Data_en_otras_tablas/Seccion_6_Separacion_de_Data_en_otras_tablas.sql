-- De esta forma inserto en una tabla valores que son producto de un SELECT
-- En otra tabla
INSERT INTO CONTINENT (name)  
(
    SELECT
        DISTINCT continent
    FROM
        country
    order by
        continent ASC
)

