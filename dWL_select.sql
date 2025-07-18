--HISTORIAS DE USUARIO
--1.Encuentra el cliente que ha realizado la mayor cantidad de alquileres en los últimos 6 meses.

SELECT 
    a.id_cliente,
    c.nombre,
    c.apellidos,
    COUNT(*) AS total_alquileres
FROM alquiler a
JOIN cliente c ON a.id_cliente = c.id_cliente
WHERE a.fecha_alquiler >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH)
GROUP BY a.id_cliente
ORDER BY total_alquileres DESC
LIMIT 1;

-- 2. Cinco películas más alquiladas en el último año

SELECT 
    p.titulo,
    COUNT(*) AS total_alquileres
FROM alquiler a
JOIN inventario i ON a.id_inventario = i.id_inventario
JOIN pelicula p ON i.id_pelicula = p.id_pelicula
WHERE a.fecha_alquiler >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR)
GROUP BY p.id_pelicula
ORDER BY total_alquileres DESC
LIMIT 5;

--3 . Ingresos y cantidad de alquileres por categoría

SELECT 
    cat.nombre AS categoria,
    COUNT(*) AS total_alquileres,
    SUM(p.total) AS total_ingresos
FROM alquiler a
JOIN pago p ON a.id_alquiler = p.id_pago
JOIN inventario i ON a.id_inventario = i.id_inventario
JOIN pelicula_categoria pc ON i.id_pelicula = pc.id_pelicula
JOIN categoria cat ON pc.id_categoria = cat.id_categoria
GROUP BY cat.id_categoria;

--4 Clientes que han alquilado por idioma en un mes específico

SELECT 
    i.id_idioma,
    idi.nombre AS idioma,
    COUNT(DISTINCT a.id_cliente) AS total_clientes
FROM alquiler a
JOIN inventario inv ON a.id_inventario = inv.id_inventario
JOIN pelicula i ON inv.id_pelicula = i.id_pelicula
JOIN idioma idi ON i.id_idioma = idi.id_idioma
WHERE MONTH(a.fecha_alquiler) = 7 AND YEAR(a.fecha_alquiler) = 2025
GROUP BY i.id_idioma;

