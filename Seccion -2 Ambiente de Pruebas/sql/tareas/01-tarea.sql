-- Adrián Cabrera - Ingeniero en Ciencias de la Computación
-- Universidad Politécnica Salesiana
-- Banco del Austro
-- 1. Ver todos los registros

SELECT * FROM USERS order by id;

-- 2. Ver el registro cuyo id sea igual a 10

SELECT * FROM USERS WHERE id = 10;

-- 3. Quiero todos los registros que cuyo primer nombre sea Jim (engañosa)

SELECT * FROM USERS WHERE name LIKE 'Jim %';
-- 4. Todos los registros cuyo segundo nombre es Alexander
SELECT * FROM USERS WHERE name LIKE '% Alexander';

-- 5. Cambiar el nombre del registro con id = 1, por tu nombre Ej:'Fernando Herrera'
UPDATE  USERS SET NAME = 'Fernando Herrera' WHERE id = 1;

-- 6. Borrar el último registro de la tabla

DELETE FROM USERS 
WHERE id = (SELECT max(id) from users);