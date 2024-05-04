-- Adri á n Cabrera -- -- Seguimiento curso SQL DevTalles 
-- create table users (name VARCHAR(10) unique);


select * from users u 

-- Usar comillas simples

INSERT INTO USERS (name) values ('Kurt'); 
INSERT INTO USERS (name) values ('Axl');
INSERT INTO USERS (name) values ('Mike');
INSERT INTO USERS (name) values ('Billie');
INSERT INTO USERS (name) values ('Enrique');

INSERT INTO USERS (name) values ('Fernanda');

-- Se puede o no especificar las columnas de la tabla, pero se debe saber el orden
INSERT INTO USERS values ('John');

-- Actualización de Registros

UPDATE USERS 
SET 
	"name" = 'Bob Dylan'
WHERE "name" = 'John' 


-- Es recomendable desactivar el auto commit

-- Para listar todos los registros de una tabla 
SELECT * FROM USERS;

-- Para limitar todos los registros que se muestran obtenidos de un select

SELECT * FROM USERS LIMIT 10;

-- Para limiar los registros y ademas saltarme registros se hace uso del OFFSET

SELECT * FROM USERS LIMIT 2 OFFSET 2;


-- Se debe usar comilla simple
SELECT * FROM users where name = 'Kurt'; 

-- Nombre inicie con B
SELECT * FROM USERS WHERE NAME LIKE 'B%';

-- Todos los registros que tengan la letra I
SELECT * FROM USERS WHERE NAME LIKE '%i%';


-- Todos los registros que terminen con n
SELECT * FROM USERS WHERE  "name" LIKE '%n';


-- Todos los registros que sean como Adrián pero no se sabe si
-- la primera A está en mayúscula o minúscula entonces se hace lo siguiente
SELECT * FROM USERS WHERE  "name" LIKE  '%_drián'

--Puede iniciar con cualquier letra  seguido de "ik" y cualquier cosa después
SELECT * FROM USERS WHERE "name" LIKE '_ik%';

-- Eliminación de registros
DELETE FROM USERS WHERE name like 'Fernanda';

-- Mucho cuidado con hacer un delete from users sin un where
-- eso borrara todos los registros

--Para desactivar el autocommit, necesitas manejar las transacciones de manera explícita. Esto se hace utilizando los comandos BEGIN y COMMIT (o ROLLBACK). 
--Es decir se usa el BEGIN antes de la sentencia para posteriormente usar
--el COMMIT y confirmar la transacción 


-- Para elminar la tabla usamos
DROP TABLE users; -- esto la destruye la elimina por completo
TRUNCATE TABLE users; -- Esto unicamente lo que hace es eliminar sus registros
