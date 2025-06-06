USE clinica_odontologica;

INSERT INTO `usuario` (`IDUSER`, `PASSWORD`, `ROLE`, `USERNAME`, `ODONTOLOGIST_ID`, `SECRETARY_ID`) VALUES 
(NULL, '123', 'admin', 'admin', NULL, NULL),
(NULL, '123', 'user', 'user', NULL, NULL);

INSERT INTO `horario` (`IDWORKSCHEDULE`, `ENTRYTIME`, `EXITTIME`, `NAME`) VALUES 
(NULL, '09:00', '16:00', 'morning'),
(NULL, '14:00', '21:00', 'evening');

INSERT IGNORE INTO id_generator (gen_name, gen_value) VALUES ('professional_id', 1);

START TRANSACTION;
SET @next_id = (SELECT gen_value FROM id_generator WHERE gen_name = 'professional_id');
INSERT INTO `odontologo` (`ID`, `ADDRESS`, `BIRTHDATE`, `DNI`, `NAME`, `PHONE`, `SPECIALIZATION`, `SURNAME`, `USER_IDUSER`, `id_work_schedule`) VALUES 
(@next_id, 'Av. Siempre Viva 123', '1985-06-15', '12345678A', 'Carlos', '987654321', 'Ortodoncia', 'Pérez', NULL, 1);
UPDATE id_generator SET gen_value = gen_value + 1 WHERE gen_name = 'professional_id';
COMMIT;

START TRANSACTION;
SET @next_id = (SELECT gen_value FROM id_generator WHERE gen_name = 'professional_id');
INSERT INTO `odontologo` (`ID`, `ADDRESS`, `BIRTHDATE`, `DNI`, `NAME`, `PHONE`, `SPECIALIZATION`, `SURNAME`, `USER_IDUSER`, `id_work_schedule`) VALUES 
(@next_id, 'Calle Falsa 456', '1990-09-22', '87654321B', 'Lucía', '349876543210', 'Endodoncia', 'Gómez', NULL, 1);
UPDATE id_generator SET gen_value = gen_value + 1 WHERE gen_name = 'professional_id';
COMMIT;

START TRANSACTION;
SET @next_id = (SELECT gen_value FROM id_generator WHERE gen_name = 'professional_id');
INSERT INTO `odontologo` (`ID`, `ADDRESS`, `BIRTHDATE`, `DNI`, `NAME`, `PHONE`, `SPECIALIZATION`, `SURNAME`, `USER_IDUSER`, `id_work_schedule`) VALUES 
(@next_id, 'Boulevard Central 789', '1982-12-05', '23456789C', 'Javier', '112233445566', 'Implantología', 'Ramírez', NULL, 2);
UPDATE id_generator SET gen_value = gen_value + 1 WHERE gen_name = 'professional_id';
COMMIT;

START TRANSACTION;
SET @next_id = (SELECT gen_value FROM id_generator WHERE gen_name = 'professional_id');
INSERT INTO `odontologo` (`ID`, `ADDRESS`, `BIRTHDATE`, `DNI`, `NAME`, `PHONE`, `SPECIALIZATION`, `SURNAME`, `USER_IDUSER`, `id_work_schedule`) VALUES 
(@next_id, 'Plaza Mayor 321', '1995-04-30', '76543210D', 'Elena', '654321987', 'Periodoncia', 'Fernández', NULL, 2);
UPDATE id_generator SET gen_value = gen_value + 1 WHERE gen_name = 'professional_id';
COMMIT;

START TRANSACTION;
SET @next_id = (SELECT gen_value FROM id_generator WHERE gen_name = 'professional_id');
INSERT INTO `secretario` (`ID`, `ADDRESS`, `BIRTHDATE`, `DNI`, `FLOOR`, `NAME`, `PHONE`, `SURNAME`, `USER_IDUSER`) VALUES 
(@next_id, 'Av. Libertad 456', '1993-07-18', '56781234E', 'Recepción', 'Sofía', '987654321', 'Martínez', NULL);
UPDATE id_generator SET gen_value = gen_value + 1 WHERE gen_name = 'professional_id';
COMMIT;

START TRANSACTION;
SET @next_id = (SELECT gen_value FROM id_generator WHERE gen_name = 'professional_id');
INSERT INTO `secretario` (`ID`, `ADDRESS`, `BIRTHDATE`, `DNI`, `FLOOR`, `NAME`, `PHONE`, `SURNAME`, `USER_IDUSER`) VALUES 
(@next_id, 'Calle del Sol 789', '1988-11-25', '34567812F', 'Atención al Paciente', 'Diego', '349876543210', 'López', NULL);
UPDATE id_generator SET gen_value = gen_value + 1 WHERE gen_name = 'professional_id';
COMMIT;

START TRANSACTION;
SET @id_responsable = (SELECT gen_value FROM id_generator WHERE gen_name = 'professional_id');
INSERT INTO `responsable` (`ID`, `ADDRESS`, `BIRTHDATE`, `DNI`, `NAME`, `PHONE`, `RELATIONSHIP`, `SURNAME`) VALUES 
(@id_responsable, 'Calle Mayor 123', '1980-05-10', '87654321G', 'Laura', '987654321', 'grade1', 'González');
UPDATE id_generator SET gen_value = gen_value + 1 WHERE gen_name = 'professional_id';

SET @next_id = (SELECT gen_value FROM id_generator WHERE gen_name = 'professional_id');
INSERT INTO `paciente` (`ID`, `ADDRESS`, `BIRTHDATE`, `BLOODTYPE`, `DNI`, `NAME`, `PHONE`, `PREPAIDHEALTH`, `SURNAME`, `GUARDIAN_ID`) VALUES
(@next_id, 'Calle Mayor 123', '2010-07-15', 'A-', '23456789J', 'Lucía', '112233445566', '0', 'González', @id_responsable);
UPDATE id_generator SET gen_value = gen_value + 1 WHERE gen_name = 'professional_id';
COMMIT;

START TRANSACTION;
SET @next_id = (SELECT gen_value FROM id_generator WHERE gen_name = 'professional_id');
INSERT INTO `paciente` (`ID`, `ADDRESS`, `BIRTHDATE`, `BLOODTYPE`, `DNI`, `NAME`, `PHONE`, `PREPAIDHEALTH`, `SURNAME`, `GUARDIAN_ID`) VALUES 
(@next_id, 'Avenida Central 456', '1992-08-20', 'O+', '12345678H', 'Marcos', '349876543210', '1', 'López', NULL);
UPDATE id_generator SET gen_value = gen_value + 1 WHERE gen_name = 'professional_id';
COMMIT;

INSERT INTO `usuario` (`IDUSER`, `PASSWORD`, `ROLE`, `USERNAME`, `ODONTOLOGIST_ID`, `SECRETARY_ID`) VALUES
(NULL, '123', 'admin', 'carlos.perez', NULL, NULL),
(NULL, '123', 'user', 'lucia.gomez', NULL, NULL),
(NULL, '123', 'user', 'javier.ramirez', NULL, NULL),
(NULL, '123', 'user', 'elena.fernandez', NULL, NULL),
(NULL, '123', 'admin', 'sofia.martinez', NULL, NULL),
(NULL, '123', 'user', 'diego.lopez', NULL, NULL);