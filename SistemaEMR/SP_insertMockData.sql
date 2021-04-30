CREATE OR ALTER PROC SP_insertMockData AS 
BEGIN
	BEGIN TRAN
		BEGIN TRY
			
			ALTER TABLE paciente NOCHECK CONSTRAINT ALL;
			ALTER TABLE medico NOCHECK CONSTRAINT ALL;
			ALTER TABLE receta NOCHECK CONSTRAINT ALL;
			ALTER TABLE consulta NOCHECK CONSTRAINT ALL;
			ALTER TABLE habitacion NOCHECK CONSTRAINT ALL;
			

			DELETE paciente;
			DELETE medico;
			DELETE receta;
			DELETE consulta;
			DELETE habitacion;
			INSERT INTO paciente (
  				curp,
   				primerNombre, 
   				segundoNombre, 
   				apellidoPaterno, 
   				apellidoMaterno, 
				direccion, 
   				numTel, 
   				correo, 
   				fechaNac, 
   				estadoMarital, 
   				sexo
			) VALUES
				('VAPJ970423MJCLNS00', 'Jesus',     'Emilio',    'Valdez',      'Pino',       'Providencia 4a. Secc 44639 Guadalajara Jal.',   '5564134785',   'jesus@gmail.com',      CONVERT( DATE, '1997-4-23', 102),  'SOLTERO',   'M'),
				('CULF930406MJCRNR06', 'Maria',     'Fernanda',  'Cruz',        'Landin',     'Mezquitan Country 44260 Guadalajara Jal.',      '5534957234',   'marifer@gmail.com',    CONVERT( DATE, '1993-4-6', 102),  'CASADO',    'F'),
				('PIDE830415HJCLZM02', 'Jose',      'Emilio',    'Pliego',      'Diaz',       'Sta. Eduwiges 44580 Guadalajara Jal.',          '5562908427',   'emiliopd@gmail.com',   CONVERT( DATE, '1983-4-15', 102),  'SOLTERO',   'M'),
				('MAHM860729HSRRRN06', 'Manuel',    null,        'Martinez',    'Hernandez',  'Marsella Residencial 83288 Hermosillo Son.',    '6622459758',   'manuelito@gmail.com',  CONVERT( DATE, '1983-7-29', 102),  'SOLTERO',   'M'),
				('DAMR000809MSRVNBA3', 'Rebeca',    null,        'Davila',      'Monge',      'Balderrama 83180 Hermosillo Son.',              '6623678390',   'rbkita@gmail.com',     CONVERT( DATE, '2000-8-9', 102),  'SOLTERO',   'F'),
				('OIGA001227MSRLLLA2', 'Alexa',    'Ivette',     'Olivas',      'Glaus',      'Villa Satelite 83200 Hermosillo Son.',          '6621389256',   'ivette@outlook.com',   CONVERT( DATE, '2000-12-27', 102),  'SOLTERO',   'F'),
				('GABI980221HSRMRS09', 'Isaac',    'David',      'Gamez',       'Barcelo',    'Casa Grande 83401 Hermosillo Son.',             '6622910538',   'isak@hotmail.com',     CONVERT( DATE, '1998-2-21', 102),  'CASADO',    'M'),
				('IXVN950901MSRBLN07', 'Nancy',     null,        'Iby',         'Villanueva', 'Villa de Parras 83309 Hermosillo Son.',         '6624537821',   'nancy@outllook.com',   CONVERT( DATE, '1995-9-1', 102),  'SOLTERO',   'F'),
				('DIGA990324HJCZML00', 'Alejandro', null,        'Diaz',        'Gomez',      'Valle Real 45019 Zapopan Jal.',                 '5578190356',   'alex@gmail.com',       CONVERT( DATE, '1999-3-23', 102),  'SOLTERO',   'M'),
				('SAOD980106MSRMRN00', 'Denisse',   null,        'Samaniego',   'Orozco',     'Santa Fe 83675 Hermosillo Son.',                '6621490258',   'den@gmail.com',        CONVERT( DATE, '1998-1-6', 102),  'CASADO',    'F'),
				('MOCJ801009HJCNHN04', 'Juan',      null,        'Monreal',     'Chavez',     'Av. Aviación 5950 Zapopan Jal.',                '5544094871',   'juang@outlook.com',    CONVERT( DATE, '1980-10-9', 102),  'CASADO',    'M'),
				('HORD841123HJCYSG02', 'Diego',     'Pablo',     'Hoyos',       'Rios',       'Sendero de las Galeanas 45116 Zapopan Jal.',    '5544068756',   'diego@gmail.com',      CONVERT( DATE, '1984-11-23', 102),  'CASADO',    'M'),
				('LORA960804MSRPGL07', 'Alexa',     null,        'Lopez',       'Regil',      'Valle Verde 83209 Hermosillo Son.',             '6621340958',   'alexal@outlook.com',   CONVERT( DATE, '1996-8-4', 102),  'SOLTERO',   'F'),
				('HECM980908HJCRRR06', 'Marco',     'Antonio',   'Hernandez',   'Carrillo',   'Santa Rita 45140 Zapopan Jal.',                 '5543098149',   'markitos@gmail.com',   CONVERT( DATE, '1998-9-8', 102),  'SOLTERO',   'M'),
				('OARD870907MSRLSN05', 'Diana',     null,        'Playa',       'Rascon',     'El torreon 83605 Hermosillo Son.',              '6622123906',   'dianita@gmail.com',    CONVERT( DATE, '1987-9-7', 102),  'CASADO',    'F');
			
			INSERT INTO medico (
    				rfc,
    				primerNombre,
    				segundoNombre,
    				apellidoPaterno,
    				apellidoMaterno,
    				puesto
			) VALUES 
   				('LOPJ9106122A8',  'Juan',    null,  'Lopez',     'Perez',   'PEDIATRA'),
   				('GUVS93102844A',  'Susana',  null,  'Gutierrez', 'Villa',   'MEDICO_GENERAL'),
   				('SIBP850814RD0',  'Pierre',  null,  'Siraudeau', 'Beton',   'ESPECIALISTA'),
   				('AABM860812UZ9',  'Monica',  null,  'Almada',    'Benitez', 'MEDICO_GENERAL');
			
			INSERT INTO habitacion(
  				numero,
   				tipo
			) VALUES 
   				('1001','CONSULTORIO'),
   				('1002','CONSULTORIO'),
   				('1003','CONSULTORIO'),
   				('2001','QUIROFANO');
			INSERT INTO consulta (
   				curpPaciente,
   				rfcMedico,
   				numHabitacion,
   				tiempoInicio,
   				tiempoFin
			) VALUES
   				('VAPJ970423MJCLNS00',  'GUVS93102844A',  '1001',   CONVERT( DATETIME, '2021-12-28 9:00:00',  102),   CONVERT( DATETIME, '2021-2-12 11:00:00',  102) ),
   				('IXVN950901MSRBLN07',  'GUVS93102844A',  '1001',   CONVERT( DATETIME, '2021-5-24 9:00:00',   102),   CONVERT( DATETIME, '2021-2-5 11:00:00',   102) ),
   				('GABI980221HSRMRS09',  'LOPJ9106122A8',  '1002',   CONVERT( DATETIME, '2021-6-3 15:00:00',   102),   CONVERT( DATETIME, '2021-6-3 15:40:00',   102) ),
   				('DIGA990324HJCZML00',  'SIBP850814RD0',  '1003',   CONVERT( DATETIME, '2021-6-25 13:00:00',  102),   CONVERT( DATETIME, '2021-2-6 14:00:00',   102) ),
   				('SAOD980106MSRMRN00',  'SIBP850814RD0',  '1003',   CONVERT( DATETIME, '2021-6-29 16:00:00',  102),   CONVERT( DATETIME, '2021-2-6 17:00:00',   102) ),
   				('DIGA990324HJCZML00',  'GUVS93102844A',  '1001',   CONVERT( DATETIME, '2021-7-6 9:00:00',    102),   CONVERT( DATETIME, '2021-7-6 10:30:00',   102) ),
   				('PIDE830415HJCLZM02',  'LOPJ9106122A8',  '1002',   CONVERT( DATETIME, '2021-8-3 10:00:00',   102),   CONVERT( DATETIME, '2021-8-3 10:20:00',   102) ),
   				('MAHM860729HSRRRN06',  'AABM860812UZ9',  '1001',   CONVERT( DATETIME, '2021-8-10 11:00:00',  102),   CONVERT( DATETIME, '2021-1-8 11:30:00',   102) ),
   				('VAPJ970423MJCLNS00',  'GUVS93102844A',  '1001',   CONVERT( DATETIME, '2021-8-16 12:00:00',  102),   CONVERT( DATETIME, '2021-1-8 13:30:00',   102) ),
   				('CULF930406MJCRNR06',  'SIBP850814RD0',  '1003',   CONVERT( DATETIME, '2021-8-23 14:00:00',  102),   CONVERT( DATETIME, '2021-2-8 14:40:00',   102) ),
   				('OARD870907MSRLSN05',  'AABM860812UZ9',  '1001',   CONVERT( DATETIME, '2021-9-8 11:00:00',   102),   CONVERT( DATETIME, '2021-9-8 12:00:00',   102) ),
   				('HECM980908HJCRRR06',  'LOPJ9106122A8',  '1002',   CONVERT( DATETIME, '2021-9-10 6:00:00',   102),   CONVERT( DATETIME, '2021-1-9 8:00:00',    102) ),
   				('DAMR000809MSRVNBA3',  'SIBP850814RD0',  '1003',   CONVERT( DATETIME, '2021-9-14 7:00:00',   102),   CONVERT( DATETIME, '2021-1-9 8:00:00',    102) ),
   				('IXVN950901MSRBLN07',  'GUVS93102844A',  '1001',   CONVERT( DATETIME, '2021-9-22 11:00:00',  102),   CONVERT( DATETIME, '2021-2-9 13:40:00',   102) ),
   				('VAPJ970423MJCLNS00',  'SIBP850814RD0',  '1003',   CONVERT( DATETIME, '2021-9-29 9:00:00',   102),   CONVERT( DATETIME, '2021-2-9 10:00:00',   102) ),
   				('DAMR000809MSRVNBA3',  'GUVS93102844A',  '1001',   CONVERT( DATETIME, '2021-10-1 11:00:00',  102),   CONVERT( DATETIME, '2021-10-1 11:40:00',  102) ),
   				('MOCJ801009HJCNHN04',  'GUVS93102844A',  '1001',   CONVERT( DATETIME, '2021-10-12 9:00:00',  102),   CONVERT( DATETIME, '2021-1-10 10:00:00',  102) ),
   				('OIGA001227MSRLLLA2',  'GUVS93102844A',  '1001',   CONVERT( DATETIME, '2021-10-15 6:00:00', 102),   CONVERT( DATETIME,  '2021-1-10 7:00:00',   102) ),
   				('OIGA001227MSRLLLA2',  'LOPJ9106122A8',  '1002',   CONVERT( DATETIME, '2021-10-22 13:00:00', 102),   CONVERT( DATETIME, '2021-2-10 13:40:00',  102) ),
   				('OARD870907MSRLSN05',  'LOPJ9106122A8',  '1002',   CONVERT( DATETIME, '2021-11-8 15:00:00',  102),   CONVERT( DATETIME, '2021-11-8 16:00:00',  102) );
			

			INSERT INTO receta (
   				curpPaciente,
				rfcMedico,
   				fecha,
   				indicaciones
			) VALUES
   				('VAPJ970423MJCLNS00',  'GUVS93102844A',   CONVERT( DATETIME, '2021-12-28 11:00:00', 102 ), 'Paracetamol cada 8 horas por tres dias.' ),
   				('IXVN950901MSRBLN07',  'GUVS93102844A',   CONVERT( DATETIME, '2021-5-24 11:00:00',  102 ), 'Paracetamol cada 8 horas por tres dias.' ),
   				('GABI980221HSRMRS09',  'LOPJ9106122A8',   CONVERT( DATETIME, '2021-6-3 15:40:00',   102 ), 'Paracetamol cada 8 horas por tres dias.' ),
   				('DIGA990324HJCZML00',  'SIBP850814RD0',   CONVERT( DATETIME, '2021-6-25 14:00:00',  102 ), 'Paracetamol cada 8 horas por tres dias.' ),
   				('SAOD980106MSRMRN00',  'SIBP850814RD0',   CONVERT( DATETIME, '2021-6-29 17:00:00',  102 ), 'Paracetamol cada 8 horas por tres dias.' ),
   				('DIGA990324HJCZML00',  'GUVS93102844A',   CONVERT( DATETIME, '2021-7-6 10:30:00',   102 ), 'Paracetamol cada 8 horas por tres dias.' ),
   				('PIDE830415HJCLZM02',  'LOPJ9106122A8',   CONVERT( DATETIME, '2021-8-3 10:20:00',   102 ), 'Paracetamol cada 8 horas por tres dias.' ),
   				('MAHM860729HSRRRN06',  'AABM860812UZ9',   CONVERT( DATETIME, '2021-8-10 11:30:00',  102 ), 'Paracetamol cada 8 horas por tres dias.' ),
   				('VAPJ970423MJCLNS00',  'GUVS93102844A',   CONVERT( DATETIME, '2021-8-16 13:30:00',  102 ), 'Paracetamol cada 8 horas por tres dias.' ),
   				('CULF930406MJCRNR06',  'SIBP850814RD0',   CONVERT( DATETIME, '2021-8-23 14:40:00',  102 ), 'Paracetamol cada 8 horas por tres dias.' ),
   				('OARD870907MSRLSN05',  'AABM860812UZ9',   CONVERT( DATETIME, '2021-9-8 12:00:00',   102 ), 'Paracetamol cada 8 horas por tres dias.' ),
   				('HECM980908HJCRRR06',  'LOPJ9106122A8',   CONVERT( DATETIME, '2021-9-10 8:00:00',   102 ), 'Paracetamol cada 8 horas por tres dias.' ),
   				('DAMR000809MSRVNBA3',  'SIBP850814RD0',   CONVERT( DATETIME, '2021-9-14 8:00:00',   102 ), 'Paracetamol cada 8 horas por tres dias.' ),
   				('IXVN950901MSRBLN07',  'GUVS93102844A',   CONVERT( DATETIME, '2021-9-22 13:40:00',  102 ), 'Paracetamol cada 8 horas por tres dias.' ),
   				('VAPJ970423MJCLNS00',  'SIBP850814RD0',   CONVERT( DATETIME, '2021-9-29 10:00:00',  102 ), 'Paracetamol cada 8 horas por tres dias.' ),
   				('DAMR000809MSRVNBA3',  'GUVS93102844A',   CONVERT( DATETIME, '2021-10-1 11:40:00',  102 ), 'Paracetamol cada 8 horas por tres dias.' ),
   				('MOCJ801009HJCNHN04',  'GUVS93102844A',   CONVERT( DATETIME, '2021-10-12 10:00:00', 102 ), 'Paracetamol cada 8 horas por tres dias.' ),
   				('OIGA001227MSRLLLA2',  'GUVS93102844A',   CONVERT( DATETIME, '2021-10-15 7:00:00',  102 ), 'Paracetamol cada 8 horas por tres dias.' ),
   				('OIGA001227MSRLLLA2',  'LOPJ9106122A8',   CONVERT( DATETIME, '2021-10-22 13:40:00', 102 ), 'Paracetamol cada 8 horas por tres dias.' ),
   				('OARD870907MSRLSN05',  'LOPJ9106122A8',   CONVERT( DATETIME, '2021-11-8 16:00:00',  102 ), 'Paracetamol cada 8 horas por tres dias.' );

			ALTER TABLE paciente   WITH CHECK CHECK CONSTRAINT ALL;
			ALTER TABLE medico     WITH CHECK CHECK CONSTRAINT ALL;
			ALTER TABLE receta     WITH CHECK CHECK CONSTRAINT ALL;
			ALTER TABLE consulta   WITH CHECK CHECK CONSTRAINT ALL;
			ALTER TABLE habitacion WITH CHECK CHECK CONSTRAINT ALL;
			
			COMMIT TRAN;
		END TRY
		BEGIN CATCH
			BEGIN
				ROLLBACK TRAN;
				PRINT 'ROLLBACK';
				EXEC sp_MSforeachtable 
					@command1 = 'ALTER TABLE ? WITH CHECK CHECK CONSTRAINT ALL';
				SELECT 
					error_message() as errormessage,
					error_number() as erronumber,
					error_state() as errorstate,
					error_procedure() as errorprocedure,
					error_line() as errorline;
				
			END
		END CATCH
END
