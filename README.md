# IFCD0112 MF0226 SQL RDB 4 DDL y DML
BD de empleados y departamentos en SQL: creación de tablas y relaciones (DDL) y carga, modificación y eliminación de datos (DML) con INSERT, UPDATE y DELETE.

## Enunciado:
Se debe crear una base de datos para una empresa, tenemos que disponer de los datos de los empleados y los departamentos a los que pertenecen con su presupuesto.
- Pregunta 1. Selecciona el lenguaje adecuado para codificar la base de datos.
- Pregunta 2. Analiza los requisitos del usuario:
a. Crea las tablas con los atributos que consideres adecuados
b. Selecciona el lenguaje adecuado para la codificación
c. Establece la relación adecuada entre tablas mediante el código
- Pregunta 3. Realiza la carga de datos utilizando lenguaje DML
- Pregunta 4. Realiza modificaciones de datos mediante lenguaje DML (COMANDO UPDATE)
- Pregunta 5. Realiza eliminación de datos mediante lenguaje DML

## Desarrollo:
### Pregunta 1. Lenguaje adecuado:
Uso SQL, el lenguaje estándar de las bases de datos relacionales, en MariaDB. Dentro de SQL, cada parte del ejercicio usa un sublenguaje:
- DDL para crear la estructura (base de datos, tablas, relaciones).
- DML para trabajar con los datos (insertar, modificar, eliminar).

### Pregunta 2. Análisis y creación de tablas:
Requisitos: la tienda necesita guardar sus clientes, sus artículos y los pedidos que hace cada cliente. Un cliente puede hacer muchos pedidos, y cada pedido es de un artículo.

b. Para crear las tablas uso DDL (CREATE), porque estoy definiendo estructura, no datos.
a. y c. Tablas y relaciones:

[Ver código SQL](tablas.sql)

La relación se establece con las claves ajenas de PEDIDOS: cod_cliente apunta a CLIENTES y cod_articulo a ARTICULOS. Así no se puede hacer un pedido de un cliente o un artículo que no existan. Uso AUTO_INCREMENT para que los códigos se generen solos, DECIMAL para el precio porque tiene que ser exacto, y DEFAULT CURRENT_TIMESTAMP para que la fecha del pedido se rellene sola.

### Pregunta 3. Carga de datos (INSERT)
Lo meto en una transacción para que se cargue todo o nada:
[Ver código SQL](transaccion.sql)

Los códigos no los indico porque los genera el AUTO_INCREMENT, y la fecha tampoco, porque tiene valor por defecto. El orden importa: primero clientes y artículos, y después los pedidos, porque estos apuntan a ellos.

### Pregunta 4. Modificación de datos (UPDATE):
```sql
-- Subir un 10% el precio de la camiseta
UPDATE ARTICULOS SET precio_venta = precio_venta * 1.10 WHERE cod_articulo = 1;

-- Cambiar el email de un cliente
UPDATE CLIENTES SET email = 'ana.lopez@gmail.com' WHERE cod_cliente = 1;
```
El WHERE es fundamental: sin él, el cambio se aplicaría a todas las filas de la tabla.

### Pregunta 5. Eliminación de datos (DELETE):
```sql
-- Eliminar el pedido de Luis
DELETE FROM PEDIDOS WHERE cod_pedido = 2;

-- Ahora ya se puede eliminar a Luis
DELETE FROM CLIENTES WHERE cod_cliente = 2;
```

Primero borro el pedido y después el cliente. Si intentara borrar a Luis antes, MariaDB no me dejaría, porque tiene un pedido que apunta a él (la clave ajena lo impide). Igual que con UPDATE, sin WHERE se borrarían todas las filas.

## Feedback del profesor:
Estimado/a LAURA GIL ORTIZ,
Te informamos que tienes nuevas calificaciones disponibles referentes a UF2176_UD 2#Actividad 7_Caso práctico correspondiente al grupo ED24-ED1-MF0226 - PROGRAMACIÓN DE BASES DE DATOS RELACIONALES (IFCD0112).

Dicha tarea ha sido evaluada con una nota de: 10

Mensaje: Tu código SQL está muy bien construido y las explicaciones sobre el uso de transacciones, claves ajenas y la importancia de la cláusula WHERE demuestran que dominas la parte técnica, aunque hayas diseñado la base de datos de una tienda (clientes, artículos y pedidos) en lugar de la de una empresa con empleados y departamentos con su presupuesto que se pedía. En todo caso, el ejercicio está muy bien hecho.

Para cualquier consulta que se te plantee puedes contactar con el departamento académico a través de cualquiera de las vías que tienes a tu disposición.

Recibe un cordial saludo (TUTOR) MARIANO HOMERO GIRALDEZ RUBISTEIN .
