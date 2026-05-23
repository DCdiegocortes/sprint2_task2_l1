USE tienda;

-- query 1: nombres de producto 
SELECT nombre FROM producto;

-- query 2: nombre + precio 
SELECT nombre, precio FROM producto;

-- query 3 entidad completa 
SELECT * FROM producto;

-- query 4 : precio €1=u$s1
SELECT nombre, precio AS precio_eur, precio AS precio_usd
FROM producto;

-- query 5: € a $ y redondeo a 2 decimales 
SELECT nombre,
       precio AS euros, 
       ROUND(precio * 1.1, 2) AS dolares
FROM producto;

-- query 6: fila nombre de entidad producto a MAYUS
SELECT UPPER(nombre) , precio FROM producto;

-- query 7: fila nombre de entidad produco a MINUS
SELECT LOWER(nombre) , precio FROM producto;

-- query 8: Iniciales de fila nombre entidad fabricante MAYUS+ 2 PRIMERAS
SELECT nombre, UPPER(LEFT(nombre, 2)) AS iniciales
FROM fabricante;

-- query 9: precio redondeado 
SELECT nombre, ROUND(precio) FROM producto;

-- query 10: precio truncado 
SELECT nombre, TRUNCATE(precio, 0) FROM producto;

-- query 11: COD fabricante repetidos 
SELECT codigo_fabricante FROM producto;

-- query 12: COD fabricante unicos 
SELECT DISTINCT codigo_fabricante FROM producto;

-- query 13: orden fila nombre de entidad fabricante ASCENDENTE 
SELECT nombre FROM fabricante ORDER BY nombre ASC;

-- query 14:orden fila nombre de entidad fabricante DESCENDENTE
SELECT nombre FROM fabricante ORDER BY nombre DESC;

-- query 15: Ordenar de entidad producto fila nombre ASCENDENTE y fila precio DESCENDENTE <->(si hay varios productos con el mismo nombre) 
SELECT nombre, precio
FROM producto
ORDER BY nombre ASC, precio DESC;

-- query 16: primeros 5 fabricantes de la entidad fabricante (todo*)
SELECT * FROM fabricante LIMIT 5;

-- query 17: de la entidad fabricante  2 filas desde la 4 
SELECT * FROM fabricante LIMIT 3, 2;

-- query 18: de la entidad producto el precio mas barato + nombre 
SELECT nombre, precio
FROM producto
ORDER BY precio ASC
LIMIT 1;

-- query 19:  de la entidad procducto el precio mas caro + nombre 
SELECT nombre, precio
FROM producto
ORDER BY precio DESC
LIMIT 1;

-- query 20: seleccion desde  entidad producto el nombre con el codigo: fabricante 2 
SELECT nombre
FROM producto
WHERE codigo_fabricante = 2;

-- query 21: JOIN > resolver mediante la  relacion  producto 1:n  fabricante > obtener nombre fabricante 
SELECT p.nombre, p.precio, f.nombre
FROM producto p
JOIN fabricante f
ON p.codigo_fabricante = f.codigo; 

-- query 22: JOIN > query 21 ordenada por nombre 
SELECT p.nombre, p.precio, f.nombre
FROM producto p
JOIN fabricante f
ON p.codigo_fabricante = f.codigo
ORDER BY p.nombre;

-- query 23 filas nombre de producto  y frabricante con sus codigos 
SELECT p.codigo, p.nombre, f.codigo, f.nombre
FROM producto p
JOIN fabricante f
ON p.codigo_fabricante = f.codigo;

-- query 24: el producto mas barato + nombre del fabricante
SELECT p.nombre, p.precio, f.nombre
FROM producto p
JOIN fabricante f
ON p.codigo_fabricante = f.codigo
ORDER BY p.precio ASC
LIMIT 1;

-- query 25: el producto mas caro + nombre del  fabricante
SELECT p.nombre, p.precio, f.nombre
FROM producto p
JOIN fabricante f
ON p.codigo_fabricante = f.codigo
ORDER BY p.precio DESC
LIMIT 1;

-- query 26: buscar productos de LENOVO 
SELECT p.nombre, p.precio, f.nombre 
FROM producto p
JOIN fabricante f
ON p.codigo_fabricante = f.codigo
WHERE f.nombre = 'Lenovo';

-- query 27: mostrar productos CRUCIAL > 200 
SELECT p.nombre, p.precio, f.nombre
FROM producto p
JOIN fabricante f
ON p.codigo_fabricante = f.codigo
WHERE f.nombre = 'Crucial' AND p.precio > 200;

-- query 28: consulta sin OR 
SELECT p.nombre, p.precio, f.nombre
FROM producto p
JOIN fabricante f
ON p.codigo_fabricante = f.codigo
WHERE f.nombre = 'Asus'
   OR f.nombre = 'Hewlett-Packard'
   OR f.nombre = 'Seagate';

-- query 29: consulta con IN
SELECT p.nombre, p.precio, f.nombre
FROM producto p
JOIN fabricante f
ON p.codigo_fabricante = f.codigo
WHERE f.nombre IN ('Asus', 'Hewlett-Packard', 'Seagate');