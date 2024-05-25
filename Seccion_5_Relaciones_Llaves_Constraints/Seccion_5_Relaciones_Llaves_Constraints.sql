-- Añadir Llave primaria - Manualmente
-- Se deben verificar que no haya datos fuplicados en el campo que se quiere hacer llave primaria
alter table
    country
add
    PRIMARY key (code);