CREATE OR ALTER PROC SP_createTables AS
BEGIN 
	BEGIN TRAN
		BEGIN TRY

		EXEC sp_MSforeachtable 
			@command1 = 'ALTER TABLE ? NOCHECK CONSTRAINT ALL';
			
		EXEC sp_MSforeachtable 
			@command1 = 'DROP TABLE ?';
			


		CREATE TABLE medico (
			rfc CHAR(13) NOT NULL,
			primerNombre VARCHAR(30) NOT NULL,
			segundoNombre VARCHAR(30),
			apellidoPaterno VARCHAR(30)  NOT NULL,
			apellidoMaterno VARCHAR(30) NOT NULL,
			puesto VARCHAR(30) NOT NULL

			CONSTRAINT PK_medico PRIMARY KEY (rfc)
		);


		CREATE TABLE paciente (
			curp CHAR(18) NOT NULL,
			primerNombre VARCHAR(30) NOT NULL,
			segundoNombre VARCHAR(30),
			apellidoPaterno VARCHAR(30)  NOT NULL,
			apellidoMaterno VARCHAR(30) NOT NULL,
			direccion VARCHAR(200),
			numTel VARCHAR(16),
			correo VARCHAR(100),
			fechaNac DATE NOT NULL,
			estadoMarital VARCHAR(10),
			sexo CHAR(1),

			CONSTRAINT PK_paciente PRIMARY KEY (curp)
		);


		CREATE TABLE habitacion (
			numero CHAR(4),
			tipo VARCHAR(30),

			CONSTRAINT PK_habitacion PRIMARY KEY (numero)
		);


		CREATE TABLE consulta (
			id INT IDENTITY(1,1),
			curpPaciente CHAR(18) NOT NULL,
			rfcMedico CHAR(13) NOT NULL,
			numHabitacion CHAR(4) NOT NULL,
			tiempoInicio DATETIME NOT NULL,
			tiempoFin DATETIME NOT NULL,
	
			CONSTRAINT FK_consultaCurpPaciente FOREIGN KEY (curpPaciente) REFERENCES paciente(curp),
			CONSTRAINT FK_consultaRfcMedico FOREIGN KEY (rfcMedico) REFERENCES medico(rfc),
			CONSTRAINT FK_consultaNumHabitacion FOREIGN KEY (numHabitacion) REFERENCES habitacion(numero)
		);


		CREATE TABLE receta(
			id INT IDENTITY(1,1),
			rfcMedico CHAR(13) NOT NULL,
			curpPaciente CHAR(18) NOT NULL,
			fecha DATETIME NOT NULL DEFAULT GETUTCDATE(),
			indicaciones VARCHAR(250)

			CONSTRAINT PK_receta PRIMARY KEY (id),
			CONSTRAINT FK_recetaRfcMedico FOREIGN KEY (rfcMedico) REFERENCES medico (rfc),
			CONSTRAINT FK_recetaCurpPaciente FOREIGN KEY (curpPaciente) REFERENCES paciente (curp)
		);
		
		EXEC sp_MSforeachtable 
			@command1 = 'ALTER TABLE ? WITH CHECK CHECK CONSTRAINT ALL';

	COMMIT TRAN;
		END TRY
		BEGIN CATCH
			BEGIN
				ROLLBACK TRAN;
				EXEC SP_enableConstraintCheck;
			END
		END CATCH
END 




