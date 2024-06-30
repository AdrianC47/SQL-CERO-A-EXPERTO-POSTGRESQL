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


-----------------------------------------------------------------------------------------------------------

-- Se crea una tabla para backup

-- Table Definition
CREATE TABLE "public"."country_bk" (
    "code" bpchar(3) NOT NULL,
    "name" text NOT NULL,
    "continent" text NOT NULL,
    "region" text NOT NULL,
    "surfacearea" float4 NOT NULL,
    "indepyear" int2,
    "population" int4 NOT NULL,
    "lifeexpectancy" float4,
    "gnp" numeric(10,2),
    "gnpold" numeric(10,2),
    "localname" text NOT NULL,
    "governmentform" text NOT NULL,
    "headofstate" text,
    "capital" int4,
    "code2" bpchar(2) NOT NULL,
    PRIMARY KEY ("code")
);

-- Se inserta toda la info de una tabla en otra
insert into country_bk (select * from country)

-- Borramos la reestriccion para modifciar los datos en country
alter table country  drop constraint country_continent_check;

-- Lo que se busca ahora es en mi tabla country cambiar el campo del continente por el id ... que esta en la nueva tabla
update
	country a
set continent = ( select code from continent c where c.name = a.continent);

-- Ahora lo que procede es hacer la relacion con la llave foránea  y acoplar el tipo de dato a la tabla origen para la relacion

-- Cambio de datos
alter table country 
alter column continent type int4
using continent::integer; -- en caso de que no funcione usar continent/1s caso contario seria de crear  una nueva columna

