CREATE OR ALTER PROC SP_getConsultationsInTimeRange(
	@tiempoInicio DATETIME,
	@tiempoFin  DATETIME
)
AS BEGIN
	
	SELECT * FROM consulta 
	WHERE tiempoInicio BETWEEN @tiempoInicio AND @tiempoFin 
	
	
END