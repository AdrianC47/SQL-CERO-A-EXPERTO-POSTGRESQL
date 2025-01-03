

-- ¿Cuál es el idioma (y código del idioma) oficial más hablado por diferentes países en Europa?

select * from countrylanguage where isofficial = true; --tengo countrycode

select * from country;

select * from continent;

Select * from "language";


-- SOLUCION MIA
SELECT count(*) as Total, b.name, b.code from countrylanguage a
INNER JOIN language b on a.languagecode = b.code
INNER JOIN country c on a.countrycode = c.code
INNER JOIN continent d on c.continent = d.code
where a.isofficial = true and c.continent = '5'
GROUP BY b.name, b.code
ORDER BY Total DESC
LIMIT 1;

-- SOLUCION FERNANDO
SELECT count(*), b.languagecode, b.language from country a
INNER JOIN countrylanguage b on a.code = b.countrycode
where a.continent = 5 and b.isofficial = true
group by b.languagecode, b.language
order by count(*) desc
limit  1;



-- Listado de todos los países cuyo idioma oficial es el más hablado de Europa
-- (no hacer subquery, tomar el código anterior)

-- Solucion Mia
SELECT pais.*
FROM (SELECT count(*) as Total, b.name, b.code
      FROM countrylanguage a
               INNER JOIN language b on a.languagecode = b.code
               INNER JOIN country c on a.countrycode = c.code
               INNER JOIN continent d on c.continent = d.code
      WHERE a.isofficial = true
        AND c.continent = '5'
      GROUP BY b.name, b.code
      ORDER BY Total DESC
      LIMIT 1) as grupo1
         INNER JOIN countrylanguage l on grupo1.code = l.languagecode
         INNER JOIN country pais on l.countrycode = pais.code
    and l.isofficial = true;

-- Solucion Fernando


SELECT * from country a
INNER JOIN  countrylanguage b on a.code = b.countrycode
where  a.continent = 5 and b.isofficial = true and b.languagecode = 135;



