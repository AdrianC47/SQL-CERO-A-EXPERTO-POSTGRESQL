Diferencia entre Super key y Composite key
En PostgreSQL, una superclave y una clave compuesta tienen similitudes pero también diferencias fundamentales. 
Ambas se utilizan para identificar registros únicos en una tabla.

Una superclave es un conjunto de atributos (columnas) que, tomados individualmente o en combinación, 
permiten identificar un registro único en una tabla. Por lo tanto, una superclave es un subconjunto de las claves candidatas de una tabla.

Por otro lado, una clave compuesta es un conjunto de atributos que, tomados en conjunto, permiten identificar un registro único en una tabla. 
En otras palabras, una clave compuesta es una clave candidata que se compone de más de un atributo.


La principal diferencia entre una superclave y una clave compuesta radica en el número de atributos que conforman la clave.

Una superclave puede ser formada por uno o más atributos, mientras que una clave compuesta debe contener al menos dos atributos para cumplir con su propósito.


Supongamos una tabla Estudiantes con las siguientes columnas:

EstudianteID
Nombre
Apellido
Email

- Superkey
{EstudianteID}
{EstudianteID, Nombre}
{EstudianteID, Email}
{Email, Nombre, Apellido}

- Composite Key
{Nombre, Email} (si asumimos que la combinación de Nombre y Email es única para cada estudiante)