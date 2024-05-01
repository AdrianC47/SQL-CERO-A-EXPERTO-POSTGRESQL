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

