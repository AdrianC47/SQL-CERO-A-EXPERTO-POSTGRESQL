select 'Adrian' as nombre;

select now(),
       CURRENT_DATE,
       CURRENT_TIME,
       date_part('hours', now()) as hours,
       date_part('minutes', now()) as minutes,
       date_part('seconds', now()) as seconds,
       date_part('days', now()) as days,
       date_part('months', now()) as months,
       date_part('years', now()) as years;

-- Funcion now() devuelve la fecha y hora actual de la DB no de la PC
-- Funcion CURRENT_DATE devuelve la fecha actual de la DB no de la PC
-- Funcion CURRENT_TIME devuelve la hora actual de la DB no de la PC
-- Funcion date_part('year', now()) se utiliza para extraer una parte especifica de una fecha o marca de tiempo

