/*
	Pedro Escoboza A01251531
	Regresa la entrada de la tabla 'consulta' más pr+oxima al tiempo
	especificado en '@now'. Admite cambiar el número de entradas
	devueltas con el valor '@limit'.
*/


CREATE OR ALTER PROC SP_getNextConsultation (
	@now DATETIME = NULL,
	@limit INT = 1
) AS 
BEGIN
	BEGIN TRY
		BEGIN TRAN
			IF @now = NULL BEGIN
				SET @now = GETUTCDATE();
			END 

			SELECT TOP (@limit) * FROM consulta 
			WHERE tiempoInicio > @now
			ORDER BY tiempoInicio;
		
		COMMIT TRAN
	END TRY
	BEGIN CATCH
	
		ROLLBACK TRAN;
		PRINT'[ERROR] SP_getNextConsultation: Rolling back';
	
	END CATCH
END

