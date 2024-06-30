-- Tarea con countryLanguage

-- Crear la tabla de language

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS language_code_seq;


-- Table Definition
CREATE TABLE "public"."language" (
    "code" int4 NOT NULL DEFAULT 	nextval('language_code_seq'::regclass),
    "name" text NOT NULL,
    PRIMARY KEY ("code")
);

-- Crear una columna en countrylanguage
ALTER TABLE countrylanguage
ADD COLUMN languagecode varchar(3);

-- Empezar con el select para confirmar lo que vamos a actualizar
-- Ojo que el id se genera automaticamente
insert
	into
	"language" (name)
select
	distinct("language")
from
	countrylanguage c
order by
	c."language" asc;


-- Actualizar todos los registros
update countrylanguage c
set languagecode  = (select l.code from "language" l
where l.name = c."language")
-- Cambiar tipo de dato en countrylanguage - languagecode por int4
alter table countrylanguage 
alter column languagecode   type int4 
using languagecode::integer,
alter column  languagecode SET NOT NULL;

-- Crear el foreing key y constraints de no nulo el language_code
ALTER TABLE public.countrylanguage ADD CONSTRAINT countrylanguage_language_fk 
FOREIGN KEY (languagecode) REFERENCES public."language"(code);

-- Revisar lo creado

select * from countrylanguage c ;