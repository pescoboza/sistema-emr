

CREATE PROC SP_newPatient(
	@curp CHAR(18),
	@primerNombre VARCHAR(30),
	@segundoNombre VARCHAR(30) = NULL,
	@apellidoPaterno VARCHAR(30),
	@apellidoMaterno VARCHAR(30),
	@direccion VARCHAR(200),
	@numTel VARCHAR(16),
	@correo VARCHAR(100),
	@fechaNac DATE,
	@estadoMarital VARCHAR(10)
)
AS
BEGIN
	INSERT INTO paciente
		(
		curp,
		primerNombre,
		segundoNombre,
		apellidoPaterno,
		direccion,
		numTel,
		correo,
		fechaNac,
		estadoMarital
		)
	VALUES(
			@curp,
			@primerNombre,
			@segundoNombre,
			@apellidoPaterno,
			@direccion,
			@numTel,
			@correo,
			@fechaNac,
			@estadoMarital
	);
END