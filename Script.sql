-- 1. Mostrar todos los clientes registrados
SELECT * FROM clientes;

-- 2. Mostrar todos los productos disponibles
SELECT * FROM productos;

-- 3. Mostrar todas las ventas realizadas
SELECT * FROM ventas;

-- 4. Mostrar solo nombre y email de clientes
SELECT nombre, email
FROM clientes;

-- 5. Mostrar solo nombre y precio de productos
SELECT nombre, precio
FROM productos;

-- 6. Productos con precio mayor a 50000
SELECT *
FROM productos
WHERE precio > 50000;

-- 7. Ventas realizadas el 2026-04-02
SELECT *
FROM ventas
WHERE fecha = '2026-04-02';

-- 8. Productos ordenados de mayor a menor precio
SELECT *
FROM productos
ORDER BY precio DESC;

-- 9. Clientes ordenados por nombre
SELECT *
FROM clientes
ORDER BY nombre ASC;

-- 10. Detalles de venta con cantidad >= 2
SELECT *
FROM detalle_venta
WHERE cantidad >= 2;

-- 11. Total de clientes
SELECT COUNT(*) AS total_clientes
FROM clientes;

-- 12. Total de productos
SELECT COUNT(*) AS total_productos
FROM productos;

-- 13. Total de ventas
SELECT COUNT(*) AS total_ventas
FROM ventas;

-- 14. Precio promedio de productos
SELECT AVG(precio) AS precio_promedio
FROM productos;

-- 15. Suma total de precios de productos
SELECT SUM(precio) AS suma_precios
FROM productos;

-- 16. Mostrar venta + nombre del cliente + fecha
SELECT v.id_venta,
       c.nombre,
       v.fecha
FROM ventas v
JOIN clientes c
ON v.id_cliente = c.id_cliente;

-- 17. Mostrar detalle de ventas con id_venta + nombre producto + cantidad
SELECT dv.id_venta,
       p.nombre,
       dv.cantidad
FROM detalle_venta dv
JOIN productos p
ON dv.id_producto = p.id_producto;

-- 18. Mostrar nombre del cliente + id de venta + fecha
SELECT c.nombre,
       v.id_venta,
       v.fecha
FROM clientes c
JOIN ventas v
ON c.id_cliente = v.id_cliente;

-- 19. Mostrar nombre del producto + cantidad vendida + id de venta
SELECT p.nombre,
       dv.cantidad,
       dv.id_venta
FROM productos p
JOIN detalle_venta dv
ON p.id_producto = dv.id_producto;

-- 20. Mostrar cuántas ventas ha realizado cada cliente
SELECT c.nombre,
       COUNT(v.id_venta) AS cantidad_ventas
FROM clientes c
JOIN ventas v
ON c.id_cliente = v.id_cliente
GROUP BY c.id_cliente, c.nombre;

-- 21. Mostrar solo los clientes con más de una venta
SELECT c.nombre,
       COUNT(v.id_venta) AS cantidad_ventas
FROM clientes c
JOIN ventas v
ON c.id_cliente = v.id_cliente
GROUP BY c.id_cliente, c.nombre
HAVING COUNT(v.id_venta) > 1;

-- 22. Mostrar cuántas veces aparece cada producto en detalle_venta
SELECT p.nombre,
       COUNT(*) AS apariciones
FROM productos p
JOIN detalle_venta dv
ON p.id_producto = dv.id_producto
GROUP BY p.id_producto, p.nombre;

-- 23. Mostrar solo los productos que aparecen más de una vez
SELECT p.nombre,
       COUNT(*) AS apariciones
FROM productos p
JOIN detalle_venta dv
ON p.id_producto = dv.id_producto
GROUP BY p.id_producto, p.nombre
HAVING COUNT(*) > 1;

-- 24. Mostrar las ventas que tienen más de un producto asociado
SELECT id_venta,
       COUNT(*) AS cantidad_productos
FROM detalle_venta
GROUP BY id_venta
HAVING COUNT(*) > 1;

-- 25. Mostrar clientes cuya suma total de unidades compradas sea mayor a 2
SELECT c.nombre,
       SUM(dv.cantidad) AS total_unidades
FROM clientes c
JOIN ventas v
ON c.id_cliente = v.id_cliente
JOIN detalle_venta dv
ON v.id_venta = dv.id_venta
GROUP BY c.id_cliente, c.nombre
HAVING SUM(dv.cantidad) > 2;

-- 26. Consulta trampa que no devuelva resultados
SELECT *
FROM productos
WHERE precio < 0;