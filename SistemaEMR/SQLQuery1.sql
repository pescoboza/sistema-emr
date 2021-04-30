

CREATE OR ALTER PROC SP_reagendarConsulta(
	@idConsulta INT,
	@nuevoTiempoInicio DATETIME,
	@nuevoTiempoFin DATETIME,
	@nuevoRfcMedico CHAR(13) = NULL,
	@nuevoNumHabitacion CHAR(4) = NULL
) AS 
BEGIN
	BEGIN TRAN
		BEGIN TRY
			
			IF EXISTS(SELECT id FROM consulta WHERE id = @idConsulta ) BEGIN
			
				UPDATE consulta
				SET tiempoInicio = @nuevoTiempoInicio,
					tiempoFin = @nuevoTiempoFin
				WHERE id = @idConsulta;

				IF @nuevoNumHabitacion != NULL BEGIN
					UPDATE consulta
					SET numHabitacion = @nuevoNumHabitacion
					WHERE id = @idConsulta;
				END

				IF @nuevoRfcMedico != NULL BEGIN
					UPDATE consulta
					SET rfcMedico = @nuevoRfcMedico
					WHERE id = @idConsulta;
				END
			
			END ELSE BEGIN
				SELECT 'NO_EXISTE' AS ERROR
			END

		END TRY 
		BEGIN CATCH
			
			ROLLBACK TRAN

		END CATCH
	COMMIT TRAN
END;


DECLARE @idC INT;
SET @idC = 22;

DECLARE @now DATETIME;
SET @now = '2021-04-27 20:11:54.127';

DECLARE @later DATETIME;
SET @later = '2021-04-27 21:11:54.127';

EXEC SP_reagendarConsulta
@idConsulta = @idC,
@nuevoTiempoInicio = @now,
@nuevoTiempoFin = @later;



