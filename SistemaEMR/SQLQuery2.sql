CREATE PROC SP_enableConstraintCheck AS 
BEGIN
	ALTER TABLE paciente WITH CHECK CHECK CONSTRAINT ALL;
	ALTER TABLE medico  WITH CHECK CHECK CONSTRAINT ALL;
	ALTER TABLE consulta WITH CHECK CHECK CONSTRAINT ALL;
	ALTER TABLE habitacion WITH CHECK CHECK CONSTRAINT ALL;
	ALTER TABLE receta WITH CHECK CHECK CONSTRAINT ALL;
END