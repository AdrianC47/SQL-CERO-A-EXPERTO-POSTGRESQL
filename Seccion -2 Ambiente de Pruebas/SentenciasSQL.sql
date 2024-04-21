-- Adri á n Cabrera -- -- Seguimiento curso SQL DevTalles 
-- create table users (name VARCHAR(10) unique);


select * from users u 

-- Usar comillas simples

INSERT INTO USERS (name) values ('Kurt'); 
INSERT INTO USERS (name) values ('Axl');
INSERT INTO USERS (name) values ('Mike');
INSERT INTO USERS (name) values ('Billie');
INSERT INTO USERS (name) values ('Enrique');
-- Se puede o no especificar las columnas de la tabla, pero se debe saber el orden
INSERT INTO USERS values ('John');