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