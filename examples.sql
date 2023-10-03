-- ¡Claro! Aquí tienes una serie de ejercicios de consultas, vistas y procedimientos almacenados que podrían ser útiles para una entrevista técnica con la base de datos de una biblioteca en PostgreSQL:

-- **Consultas SQL:**

-- 1. **Consulta de libros prestados:** Encuentra todos los libros que están actualmente prestados, mostrando el título del libro, el nombre del lector y la fecha de préstamo.
SELECT l.titulo, le.nombre, p.fecha_prestamo 
FROM Libros l INNER JOIN Prestamos p ON l.libro_id = p.libro_id
INNER JOIN Lectores le ON p.lector_id = le.lector_id ORDER BY le.lector_id;
-- 2. **Consulta de libros por autor:** Encuentra todos los libros escritos por un autor específico (proporciona el nombre del autor).
SELECT * FROM Autores;
SELECT autor_id FROM Autores WHERE nombre = 'Ana Silva';
SELECT titulo FROM Libros WHERE autor_id = (SELECT autor_id FROM Autores WHERE nombre = 'Ana Silva');
-- 3. **Consulta de lectores con multas:** Encuentra los lectores que tienen multas pendientes y muestra su nombre, dirección de correo electrónico y el monto total de sus multas.
SELECT l.nombre, l.correo_electronico, COUNT(*) AS "Libros sin regresar", COUNT(*) * 20 AS Deuda FROM
Devoluciones d RIGHT JOIN Prestamos p ON d.prestamo_id = p.prestamo_id
INNER JOIN Lectores l ON l.lector_id = p.lector_id
WHERE d.devolucion_id IS NULL GROUP BY l.lector_id
ORDER BY Deuda DESC;
-- 4. **Consulta de libros populares:** Encuentra los libros más populares en función de la cantidad de veces que se han prestado, mostrando el título y el número de préstamos.
SELECT l.titulo, COUNT(*) AS Prestamos FROM 
Libros l INNER JOIN Prestamos p ON l.libro_id = p.libro_id
GROUP BY l.libro_id
ORDER BY Prestamos DESC
LIMIT 10;
-- 5. **Consulta de lectores frecuentes:** Encuentra los lectores que han realizado más préstamos, mostrando su nombre y la cantidad de préstamos que han realizado.

-- **Vistas:**

-- 6. **Vista de libros disponibles:** Crea una vista que muestre todos los libros disponibles para préstamo, incluyendo el título y el estado (si es "disponible").

-- 7. **Vista de lectores con libros prestados:** Crea una vista que muestre el nombre de los lectores y los títulos de los libros que tienen actualmente prestados.

-- **Procedimientos almacenados:**

-- 8. **Procedimiento para registrar préstamo:** Crea un procedimiento almacenado que permita registrar un nuevo préstamo. Deberá tomar como entrada el ID del lector y el ID del libro prestado, y registrar la fecha actual como la fecha de préstamo.

-- 9. **Procedimiento para devolución de libro:** Crea un procedimiento almacenado que permita registrar la devolución de un libro. Deberá tomar como entrada el ID del préstamo y registrar la fecha actual como la fecha de devolución. Además, actualiza el estado del libro a "disponible".

-- 10. **Procedimiento para calcular multas:** Crea un procedimiento almacenado que calcule las multas para todos los lectores que han excedido la fecha de devolución. Deberá calcular la multa como una cantidad fija por día de retraso y registrarla en la base de datos.

-- Estos ejercicios deberían abarcar varios aspectos clave de la administración de bases de datos y la escritura de consultas SQL en PostgreSQL. Puedes adaptarlos según tus necesidades y requerimientos específicos. ¡Buena suerte en tu entrevista técnica!