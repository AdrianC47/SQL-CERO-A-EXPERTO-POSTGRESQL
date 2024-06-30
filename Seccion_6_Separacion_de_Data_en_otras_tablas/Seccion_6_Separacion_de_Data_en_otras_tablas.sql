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