-- Añadir Llave primaria - Manualmente
-- Se deben verificar que no haya datos fuplicados en el campo que se quiere hacer llave primaria
alter table
    country
add
    PRIMARY key (code);


-- * Recodar que si permitimos basura en nuestra base, pues basura vamos a tener
-- Añadir un Constraint (Check)
-- Se requiere añadir una regla para los valores de la columna surfacearea que sean solo 
-- positivos
select * from country where code = 'ABW';

ALTER TABLE country add CHECK (
	surfacearea >= 0
);

-- Se requiere añadir una restricción o check que prevenga la insercion de continentes 
-- que no están dentro del listado que ya existe 

ALTER TABLE -- este lo hice yo
    country
add
    CHECK (
        continent in (
            'Asia',
            'South America',
            'North America',
            'Oceania',
            'Antarctica',
            'Africa',
            'Europe'
        )
    )
ALTER TABLE country add CHECK (
           (continent = 'Asia' :: text)
        or (continent = 'South America' :: text)
        or (continent = 'North America' :: text)
        or (continent = 'Oceania' :: text)
        or (continent = 'Antarctica' :: text)
        or (continent = 'Africa' :: text)
        or (continent = 'Europe' :: text)
    );
    
-- Tarea añadir la regla para los de centro America
-- Lo que se sugiere es borrar la regla y crearla de nuevo

ALTER TABLE country DROP CONSTRAINT "country_continent_check"; -- TOMAR EN CUENTA QUE ES CON COMILLAS DOBLES
-- Se lo vuelve a crear
ALTER TABLE country add CHECK (
           (continent = 'Asia' :: text)
        or (continent = 'South America' :: text)
        or (continent = 'North America' :: text)
        or (continent = 'Oceania' :: text)
        or (continent = 'Antarctica' :: text)
        or (continent = 'Africa' :: text)
        or (continent = 'Europe' :: text)
        or (continent = 'Central America' :: text)
    );

-- En los gestores de bases puedo observar en caso de que se requiera pues como estan creadas las restricciones

-- Creando Indices
create unique index "unique_country_name" on
country(name);

create index "country_continent" on
country(continent);
);


-- Creacion  de un index compuesto
create unique index "unique_name_countrycode_district" on city (
	name, countrycode, district
)

-- Crear otro indice que indique que no es unico el distrito
create  index "index_district" on city (
	district
);

-- Creando llaves foraneas

-- Se hicieron las siguientes sentencias para poder crear la regla de llaves foraneas ya que no tenian registros para establecer la relacion
insert into country values('AFG','Afghanistan','Asia','Southern Asia',652860,1919,40000000,62,69000000,null,'Afghanistan','Totalitarian',null,null,'AF');
insert into country values('NAM','Namibia','Africa','Africa Austral',825625,1990,2606971,65.1,12800000.00,13300000.00,'Namibia','Presidencialist Republic','Hage Geingob',2,'NA');
alter table city 
	add constraint fk_country_code
	foreign key (countrycode)
	references country (code);

-- Nota : La BD es suficientemente inteligente como para saber e inferir las relaciones muchos a uno en este caso producto de crear las llaves foráneas 

-- Llave foránea con countrylanguage
alter table countrylanguage  
	add constraint fk_country_code
	foreign key (countrycode)
	references country (code);
