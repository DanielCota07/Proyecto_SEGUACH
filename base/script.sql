
CREATE TABLE Materias
(
	carrera              VARCHAR2(20) NULL ,
	profesor_Iid         INTEGER NULL ,
	decripcion           VARCHAR2(20) NULL ,
	materia              VARCHAR2(20) NOT NULL ,
CONSTRAINT  XPKMaterias PRIMARY KEY (materia)
);

CREATE UNIQUE INDEX XPKMaterias ON Materias
(materia   ASC);

CREATE TABLE Grupos
(
	grupo_id             INTEGER NOT NULL ,
	materia              VARCHAR2(20) NULL ,
CONSTRAINT  XPKGrupos PRIMARY KEY (grupo_id),
CONSTRAINT R_6 FOREIGN KEY (materia) REFERENCES Materias (materia) ON DELETE SET NULL
);

CREATE UNIQUE INDEX XPKGrupos ON Grupos
(grupo_id   ASC);

CREATE TABLE Horario
(
	materia              VARCHAR2(20) NULL ,
	grupo_id             INTEGER NULL ,
	lapso                DATE NOT NULL ,
CONSTRAINT  XPKHorario PRIMARY KEY (lapso),
CONSTRAINT R_9 FOREIGN KEY (grupo_id) REFERENCES Grupos (grupo_id) ON DELETE SET NULL
);

CREATE UNIQUE INDEX XPKHorario ON Horario
(lapso   ASC);

CREATE TABLE Profesores
(
	profesor_name        VARCHAR2(20) NULL ,
	profesor_lname       VARCHAR2(20) NULL ,
	profesor_email       VARCHAR2(20) NULL ,
	profesor_id          INTEGER NOT NULL ,
CONSTRAINT  XPKProfesores PRIMARY KEY (profesor_id)
);

CREATE UNIQUE INDEX XPKProfesores ON Profesores
(profesor_id   ASC);

CREATE TABLE Faculdad
(
	facultad             VARCHAR2(20) NOT NULL ,
	decripcion           VARCHAR2(20) NULL ,
CONSTRAINT  XPKFaculdad PRIMARY KEY (facultad)
);

CREATE UNIQUE INDEX XPKFaculdad ON Faculdad
(facultad   ASC);

CREATE TABLE Carrera
(
	facultad             VARCHAR2(20) NULL ,
	carrera              VARCHAR2(20) NOT NULL ,
	descripcion          VARCHAR2(20) NULL ,
CONSTRAINT  XPKCarrera PRIMARY KEY (carrera),
CONSTRAINT R_13 FOREIGN KEY (facultad) REFERENCES Faculdad (facultad) ON DELETE SET NULL
);

CREATE UNIQUE INDEX XPKCarrera ON Carrera
(carrera   ASC);

CREATE TABLE Alumnos
(
	alumno_name          VARCHAR2(20) NULL ,
	alumno_lname         VARCHAR2(20) NULL ,
	alumno_email         VARCHAR2(20) NULL ,
	alumno_id            INTEGER NOT NULL ,
	carrera              VARCHAR2(20) NULL ,
CONSTRAINT  XPKAlumnos PRIMARY KEY (alumno_id),
CONSTRAINT R_11 FOREIGN KEY (carrera) REFERENCES Carrera (carrera) ON DELETE SET NULL
);

CREATE UNIQUE INDEX XPKAlumnos ON Alumnos
(alumno_id   ASC);

CREATE TABLE Calificaciones
(
	calificacion         INTEGER NOT NULL ,
	materia              VARCHAR2(20) NULL ,
	alumno_id            INTEGER NULL ,
CONSTRAINT  XPKCalificaciones PRIMARY KEY (calificacion),
CONSTRAINT R_3 FOREIGN KEY (alumno_id) REFERENCES Alumnos (alumno_id) ON DELETE SET NULL,
CONSTRAINT R_5 FOREIGN KEY (materia) REFERENCES Materias (materia) ON DELETE SET NULL
);

CREATE UNIQUE INDEX XPKCalificaciones ON Calificaciones
(calificacion   ASC);

CREATE TABLE Kardex
(
	calificacion         INTEGER NULL ,
	materia              VARCHAR2(20) NULL ,
	decripcion           VARCHAR2(20) NOT NULL ,
CONSTRAINT  XPKKardex PRIMARY KEY (decripcion),
CONSTRAINT R_1 FOREIGN KEY (calificacion) REFERENCES Calificaciones (calificacion) ON DELETE SET NULL
);

CREATE UNIQUE INDEX XPKKardex ON Kardex
(decripcion   ASC);

