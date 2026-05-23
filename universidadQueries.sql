SHOW DATABASES;
USE universidad;

-- Consulta 1: Listado de alumnos ordenado por apellidos y nombre
SELECT apellido1, apellido2, nombre
FROM persona
WHERE tipo = 'alumno'
ORDER BY apellido1, apellido2, nombre;

-- Consulta 2: Alumnos sin teléfono
SELECT nombre, apellido1, apellido2
FROM persona
WHERE tipo = 'alumno' 
AND telefono IS NULL;

-- Consulta 3: Alumnos nacidos en 1999
SELECT id, nombre, apellido1, apellido2, fecha_nacimiento
FROM persona
WHERE tipo = 'alumno' 
AND YEAR(fecha_nacimiento) = 1999;

-- Consulta 4: Profesores sin teléfono y NIF termina en K
SELECT p.nombre, p.apellido1, p.apellido2, p.nif
FROM persona p
JOIN profesor pr 
ON p.id = pr.id_profesor
WHERE p.telefono IS NULL 
AND p.nif LIKE '%K';

-- Consulta 5: Asignaturas de grado
SELECT id, nombre, cuatrimestre, curso, id_grado
FROM asignatura
WHERE cuatrimestre = 1 
AND curso = 3 
AND id_grado = 7;

-- Consulta 6: Profesores con su departamento
SELECT pe.apellido1, pe.apellido2, pe.nombre, d.nombre AS departamento
FROM profesor p
JOIN persona pe 
ON p.id_profesor = pe.id
JOIN departamento d 
ON p.id_departamento = d.id
ORDER BY pe.apellido1, pe.apellido2, pe.nombre;

-- Consulta 7: Asignaturas de alumno por NIF
SELECT a.nombre, ce.anyo_inicio, ce.anyo_fin
FROM persona p
JOIN alumno_se_matricula_asignatura am 
ON p.id = am.id_alumno
JOIN asignatura a 
ON am.id_asignatura = a.id
JOIN curso_escolar ce 
ON am.id_curso_escolar = ce.id
WHERE p.nif = '26902806M';

-- Consulta 8
SELECT DISTINCT d.nombre
FROM departamento d
JOIN profesor p 
ON d.id = p.id_departamento
JOIN asignatura a 
ON p.id_profesor = a.id_profesor
JOIN grado g 
ON a.id_grado = g.id
WHERE g.nombre = 'Grado en Ingeniería Informática (Plan 2015)';

-- Consulta 9
SELECT DISTINCT p.nombre, p.apellido1, p.apellido2
FROM persona p
JOIN alumno_se_matricula_asignatura am 
ON p.id = am.id_alumno
JOIN curso_escolar ce 
ON am.id_curso_escolar = ce.id
WHERE ce.anyo_inicio = 2018 AND ce.anyo_fin = 2019;

-- Consulta 10: Profesores con departamento (incluyendo sin)
SELECT d.nombre AS departamento, pe.apellido1, pe.apellido2, pe.nombre
FROM profesor p
LEFT JOIN persona pe 
ON p.id_profesor = pe.id
LEFT JOIN departamento d 
ON p.id_departamento = d.id
ORDER BY d.nombre, pe.apellido1, pe.apellido2, pe.nombre;

-- Consulta 11: Profesores sin departamento
SELECT pe.apellido1, pe.apellido2, pe.nombre
FROM profesor p
JOIN persona pe 
ON p.id_profesor = pe.id
LEFT JOIN departamento d 
ON p.id_departamento = d.id
WHERE d.id IS NULL;

-- comprobación
SELECT p.id_profesor, p.id_departamento
FROM profesor p;

-- Consulta 12: Departamentos sin profesores
SELECT d.nombre
FROM departamento d 
LEFT JOIN profesor p
ON d.id = p.id_departamento
WHERE p.id_profesor IS NULL;

-- Consulta 13: Profesores sin asignaturas
SELECT pe.apellido1, pe.apellido2, pe.nombre
FROM profesor p
JOIN persona pe 
ON p.id_profesor = pe.id
LEFT JOIN asignatura a 
ON p.id_profesor = a.id_profesor
WHERE a.id IS NULL;

-- Consulta 14: Asignaturas sin profesor
SELECT id, nombre
FROM asignatura
WHERE id_profesor IS NULL;

-- Consulta 16: Total alumnos
SELECT COUNT(*) AS total
FROM persona
WHERE tipo = 'alumno';

-- Consulta 18: Número de profesores por departamento
SELECT d.nombre AS departamento, COUNT(p.id_profesor) AS total
FROM departamento d
JOIN profesor p 
ON d.id = p.id_departamento
GROUP BY d.id, d.nombre
ORDER BY total DESC;

-- Consulta 19: Todos los departamentos con número de profesores
SELECT d.nombre AS departamento, COUNT(p.id_profesor) AS total
FROM departamento d
LEFT JOIN profesor p
ON d.id = p.id_departamento
GROUP BY d.id, d.nombre;

-- Consulta 20: Grados con número de asignaturas
SELECT g.nombre AS grau, COUNT(a.id) AS total
FROM grado g
LEFT JOIN asignatura a 
ON g.id = a.id_grado
GROUP BY g.id, g.nombre
ORDER BY total DESC;

-- Consulta 22: Créditos por tipo de asignatura
SELECT g.nombre AS grau, a.tipo AS tipo, SUM(a.creditos) AS total_creditos
FROM grado g
JOIN asignatura a 
ON g.id = a.id_grado
GROUP BY g.id, g.nombre, a.tipo;

-- Consulta 24: Número de asignaturas por profesor
SELECT p.id_profesor AS id, pe.nombre, pe.apellido1, pe.apellido2, COUNT(a.id) AS total
FROM profesor p
JOIN persona pe 
ON p.id_profesor = pe.id
LEFT JOIN asignatura a 
ON p.id_profesor = a.id_profesor
GROUP BY p.id_profesor, pe.nombre, pe.apellido1, pe.apellido2
ORDER BY total DESC, id;

-- Consulta 25: Alumno más joven
SELECT *
FROM persona
WHERE tipo = 'alumno'
ORDER BY fecha_nacimiento DESC
LIMIT 1;

-- Consulta 26: Profesores con departamento pero sin asignaturas
SELECT pe.apellido1, pe.apellido2, pe.nombre
FROM profesor p
JOIN persona pe 
ON p.id_profesor = pe.id
LEFT JOIN asignatura a 
ON p.id_profesor = a.id_profesor
WHERE a.id IS NULL AND p.id_departamento IS NOT NULL;

-- Créditos totales por tipo de asignatura
SELECT tipo, SUM(creditos) AS total_creditos
FROM asignatura
GROUP BY tipo;

-- Alumno de mayor edad 
SELECT nombre, apellido1, apellido2, fecha_nacimiento
FROM persona
WHERE tipo = 'alumno'
ORDER BY fecha_nacimiento ASC
LIMIT 1;

-- 3 alumnos de mayor edad
SELECT nombre, apellido1, apellido2, fecha_nacimiento
FROM persona
WHERE tipo = 'alumno'
ORDER BY fecha_nacimiento ASC
LIMIT 3;

-- Departamentos con más de un profesor
SELECT d.nombre, COUNT(p.id_profesor) AS total
FROM departamento d
LEFT JOIN profesor p
ON d.id = p.id_departamento
GROUP BY d.nombre
HAVING total > 1;

-- Profesores con más de una asignatura
SELECT p.id_profesor, COUNT(a.id) AS total
FROM profesor p
LEFT JOIN asignatura a
ON p.id_profesor = a.id_profesor
GROUP BY p.id_profesor
HAVING total > 1;

