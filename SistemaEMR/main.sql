USE sistemaehr;

EXEC SP_createTables;

EXEC SP_insertMockData;


-- EXEC sp_MSforeachtable @command1 = 'SELECT * FROM ?';


-- Obetener consultas en rango de tiempo
EXEC SP_getConsultationsInTimeRange 
	@tiempoInicio='2021-01-09 08:00:00.000',
	@tiempoFin='2021-06-25 13:00:00.000'
;


-- Obtener tiempo actual
DECLARE @now DATETIME;
SET @now = GETUTCDATE();

-- Obtener una curp
DECLARE @curpPaciente CHAR(18)
SET @curpPaciente = (SELECT TOP 1
	curp
FROM paciente);

-- Obtener un rfc
DECLARE @rfcMedico CHAR(13)
SET @rfcMedico = (SELECT TOP 1
	rfc
FROM medico);


-- Insertar consulta en 5 minutos
INSERT INTO consulta
	(curpPaciente, rfcMedico, numHabitacion, tiempoInicio, tiempoFin)
VALUES
	(
		@curpPaciente,
		@rfcMedico,
		(SELECT TOP 1
			numero
		FROM habitacion),
		(@now + '00:05:00'),
		(@now + '02:00:00')
);


-- SELECT * FROM consulta WHERE curpPaciente = @curpPaciente AND rfcMedico = @rfcMedico;


EXEC SP_getNextConsultation;


-- P1 Consultas recetas de cada médico
SELECT
	m.primerNombre AS nombreMedico,
	m.apellidoPaterno AS apellidoMedico,
	r.id AS idReceta,
	r.curpPaciente as curpPaciente
FROM
	receta AS r
	LEFT JOIN medico AS m
	ON 
	r.rfcMedico = m.rfc;

-- P2 Número de consultas por médico
SELECT
	m.primerNombre,
	m.apellidoPaterno,
	COUNT(*) AS numeroConsultas
FROM consulta AS c LEFT JOIN paciente AS p
	ON c.curpPaciente =p.curp
	LEFT JOIN medico AS m ON c.rfcMedico = m.rfc
GROUP BY
	c.rfcMedico, 
	m.primerNombre, 
	m.apellidoPaterno;

-- P3 Todas las consultas futuras
SELECT *
FROM consulta AS c
WHERE c.tiempoFin > GETUTCDATE();


-- P4 Habitación con mayor uso (número total de consultas)
SELECT TOP 1
	h.numero AS numHabitacion, COUNT(*)
AS numeroConsultas
FROM consulta AS c LEFT JOIN habitacion AS h
	ON c.numHabitacion = h.numero
GROUP BY h.numero
ORDER BY
numeroConsultas DESC;


-- P5 Fecha, médico, paciente e indicaciones de todas las recetas
SELECT
	r.fecha,
	CONCAT(m.primerNombre, ' ', m.apellidoPaterno) AS medico,
	CONCAT(p.primerNombre, ' ', p.apellidoPaterno) AS paciente,
	r.indicaciones
FROM receta  AS r
	LEFT JOIN paciente AS p
	ON p.curp = r.curpPaciente
	LEFT JOIN medico AS m
	ON r.rfcMedico = m.rfc;


-- P6  Todos los pacientes con Gmail
SELECT *
FROM paciente AS p
WHERE p.correo LIKE '%@gmail%';


-- P7 Obtener todos los pacientes con teléfono lada de Hermosillo
SELECT *
FROM paciente AS p
WHERE p.numTel LIKE '662%';


-- P8 Obtener todos los pacientes entre 20 y 25 años
SELECT 
	p.primerNombre, 
	p.apellidoPaterno, 
	DATEDIFF(YEAR, p.fechaNac, GETUTCDATE()) AS edad
FROM paciente AS p
WHERE DATEDIFF(YEAR, p.fechaNac, GETUTCDATE()) BETWEEN 20 AND 25
ORDER BY edad;



-- G1 Consultar todas las habitaciones
SELECT *
FROM consulta
WHERE consulta.numHabitacion = '1001';

-- G2 Consultar todas las habitaciones de tipo quirofano
SELECT *
FROM habitacion
where habitacion.tipo = 'QUIROFANO';

-- G3 Consultar el nombre y primer apellido de todas las mujeres ordenado por fecha de nacimiento
SELECT p.primerNombre, p.segundoNombre, p.apellidoPaterno, p.apellidoMaterno, p.fechaNac
FROM paciente AS p
WHERE p.sexo = 'F'
ORDER BY p.fechaNac;

-- G4 Obtener paciente con mayor número de visitas totales
SELECT TOP 1
	p.primerNombre, p.apellidoPaterno, COUNT(*) numeroVisitas
FROM consulta AS c LEFT JOIN paciente AS p
	ON c.curpPaciente = p.curp
GROUP BY c.curpPaciente, p.primerNombre, p.apellidoPaterno
ORDER BY numeroVisitas DESC;

-- G5 Consultar a todos los pacientes masculino y su receta
SELECT p.primerNombre, p.apellidoPaterno, r.indicaciones
FROM paciente AS p
	LEFT JOIN receta  as r
	ON p.curp = r.curpPaciente
WHERE p.sexo = 'M';

-- G6 Consultar la consulta de Alexa
SELECT
	c.numHabitacion,
	CONCAT(m.primerNombre, ' ', m.apellidoPaterno) AS medico,
	CONCAT(p.primerNombre, ' ', p.apellidoPaterno) AS paciente,
	c.tiempoFin AS hora
FROM consulta AS c LEFT JOIN paciente AS p
	ON c.curpPaciente = p.curp
	LEFT JOIN medico AS m
	ON c.rfcMedico = m.rfc
WHERE p.primerNombre = 'Alexa'


-- G7 Consultar a todos los solteros y solteras
SELECT p.primerNombre, p.numTel
FROM paciente AS p
WHERE p.estadoMarital = 'SOLTERO';

-- G8 Consultar
SELECT m.rfc, m.primerNombre, m.apellidoPaterno
FROM medico AS m
WHERE m.puesto = 'MEDICO_GENERAL';


SELECT *
FROM medico;

SELECT *
FROM paciente;

SELECT *
FROM consulta;

SELECT *
FROM habitacion;

SELECT *
FROM receta;