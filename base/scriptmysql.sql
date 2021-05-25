CREATE TABLE Materias
(
	carrera              VARCHAR(20) NULL,
	profesor_Iid         INTEGER NULL,
	decripcion           VARCHAR(20) NULL,
	materia              VARCHAR(20) NOT NULL,
	PRIMARY KEY (materia)
);

CREATE TABLE Grupos
(
	grupo_id             INTEGER NOT NULL,
	materia              VARCHAR(20) NULL,
	PRIMARY KEY (grupo_id),
	FOREIGN KEY R_6 (materia) REFERENCES Materias (materia)
);

CREATE TABLE Horario
(
	materia              VARCHAR(20) NULL,
	grupo_id             INTEGER NULL,
	lapso                DATE NOT NULL,
	PRIMARY KEY (lapso),
	FOREIGN KEY R_9 (grupo_id) REFERENCES Grupos (grupo_id)
);

CREATE TABLE Profesores
(
	profesor_name        VARCHAR(20) NULL,
	profesor_lname       VARCHAR(20) NULL,
	profesor_email       VARCHAR(20) NULL,
	profesor_id          INTEGER NOT NULL,
	PRIMARY KEY (profesor_id)
);

CREATE TABLE Faculdad
(
	facultad             VARCHAR(20) NOT NULL,
	decripcion           VARCHAR(20) NULL,
	PRIMARY KEY (facultad)
);

CREATE TABLE Carrera
(
	facultad             VARCHAR(20) NULL,
	carrera              VARCHAR(20) NOT NULL,
	descripcion          VARCHAR(20) NULL,
	PRIMARY KEY (carrera),
	FOREIGN KEY R_13 (facultad) REFERENCES Faculdad (facultad)
);

CREATE TABLE Alumnos
(
	alumno_name          VARCHAR(20) NULL,
	alumno_lname         VARCHAR(20) NULL,
	alumno_email         VARCHAR(20) NULL,
	alumno_id            INTEGER NOT NULL,
	carrera              VARCHAR(20) NULL,
	PRIMARY KEY (alumno_id),
	FOREIGN KEY R_11 (carrera) REFERENCES Carrera (carrera)
);

CREATE TABLE Calificaciones
(
	calificacion         INTEGER NOT NULL,
	materia              VARCHAR(20) NULL,
	alumno_id            INTEGER NULL,
	PRIMARY KEY (calificacion),
	FOREIGN KEY R_3 (alumno_id) REFERENCES Alumnos (alumno_id),
	FOREIGN KEY R_5 (materia) REFERENCES Materias (materia)
);

CREATE TABLE Kardex
(
	calificacion         INTEGER NULL,
	materia              VARCHAR(20) NULL,
	decripcion           VARCHAR(20) NOT NULL,
	PRIMARY KEY (decripcion),
	FOREIGN KEY R_1 (calificacion) REFERENCES Calificaciones (calificacion)
);