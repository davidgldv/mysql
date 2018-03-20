DROP DATABASE IF EXISTS Ejercicio1;
CREATE DATABASE Ejercicio1;
USE Ejercicio1;
CREATE TABLE CLIENTES (
	DNI CHAR (9), 
	nombre VARCHAR(20), 
	apellidos VARCHAR(50), 
	telefono CHAR(9), 
	email TEXT, 
	CONSTRAINT PK_CLIENTES PRIMARY KEY (DNI)
);
CREATE TABLE TIENDAS (
	nombre VARCHAR (20), 
	provincia VARCHAR (20), 
	localidad VARCHAR (20), 
	dirección VARCHAR (20), 
	teléfono CHAR(9), 
	díaapertura ENUM (
			'Lunes',
			'Martes',
			'Miércoles',
			'Jueves',
			'Viernes',
			'Sábado',
			'Domingo'), 
	díacierre ENUM (
			'Lunes',
			'Martes',
			'Miércoles',
			'Jueves',
			'Viernes',
			'Sábado',
			'Domingo'), 
	horaapertura TIME NOT NULL, 
	horacierre TIME NOT NULL, 
	CONSTRAINT PK_TIENDAS PRIMARY KEY (nombre)
);
CREATE TABLE OPERADORAS (
	nombre VARCHAR (20), 
	colorlogo VARCHAR (20), 
	porcentajecobertura INT (2), 
	frecuenciasGSM FLOAT (4,1), 
	paginaWeb TEXT,
	CONSTRAINT PK_OPERADORAS PRIMARY KEY (nombre)
);
CREATE TABLE TARIFAS (
	nombre VARCHAR (20),
	nombre_OPERADORAS VARCHAR (20),
	tamañoDatos INT (2) UNSIGNED,
	tipoDatos CHAR (2),
	minutosGratis INT (3) UNSIGNED,
	SMSgratis INT (3) UNSIGNED,
	CONSTRAINT PK_TARIFAS PRIMARY KEY (nombre),
	CONSTRAINT FK_OPERADORAS FOREIGN KEY (nombre_OPERADORAS) REFERENCES OPERADORAS (nombre) 
);
CREATE TABLE MOVILES (
	marca VARCHAR (20), 
	modelo VARCHAR (20),
	descripción TEXT,
	SO VARCHAR (20),
	RAM INT (3) UNSIGNED,
	pulgadasPantalla INT (3),
	camaraMpx INT (2),
	CONSTRAINT PK_MOVILES PRIMARY KEY (marca, modelo)
);
CREATE TABLE MOVILLIBRE (
	marca_MOVILES VARCHAR (20),
	modelo_MOVILES VARCHAR (20),
	precio INT,
	CONSTRAINT FK_MOVILES FOREIGN KEY (marca_MOVILES, modelo_MOVILES) REFERENCES MOVILES (marca, modelo)
);
CREATE TABLE MOVILCONTRATO (
	marca_MOVILES VARCHAR (20),
	modelo_MOVILES VARCHAR (20),
	nombre_OPERADORAS VARCHAR (20),
	precio INT,
	CONSTRAINT FK_MOVILES2 FOREIGN KEY (marca_MOVILES, modelo_MOVILES) REFERENCES MOVILES (marca, modelo),
	CONSTRAINT FK_OPERADORAS2 FOREIGN KEY (nombre_OPERADORAS) REFERENCES OPERADORAS (nombre)
);
CREATE TABLE OFERTAS (
	nombre_OPERADORAS_TARIFAS VARCHAR (20),
	nombre_TARIFAS VARCHAR (20),
	marca_MOVILCONTRATO VARCHAR (20),
	modelo_MOVILCONTRATO VARCHAR (20),
	CONSTRAINT FK_TARIFAS FOREIGN KEY (nombre_OPERADORAS_TARIFAS, nombre_TARIFAS) REFERENCES TARIFAS (nombre_OPERADORAS, nombre),
	CONSTRAINT FK_CONTRATO FOREIGN KEY (marca_MOVILCONTRATO, modelo_MOVILCONTRATO) REFERENCES MOVILCONTRATO (marca_MOVILES, modelo_MOVILES)
);
CREATE TABLE COMPRAS (
	DNI_CLIENTES CHAR (9),
	nombre_TIENDAS VARCHAR (20),
	marca_MOVILLIBRE VARCHAR (20),
	modelo_MOVILLIBRE VARCHAR (20),
	Dia DATE,
	CONSTRAINT FK_CLIENTES FOREIGN KEY (DNI_CLIENTES) REFERENCES CLIENTES (DNI),
	CONSTRAINT FK_TIENDAS FOREIGN KEY (nombre_TIENDAS) REFERENCES TIENDAS (nombre),
	CONSTRAINT FK_LIBRE FOREIGN KEY (marca_MOVILLIBRE, modelo_MOVILLIBRE) REFERENCES MOVILLIBRE (marca_MOVILES, modelo_MOVILES)
);
CREATE TABLE CONTRATOS (
	DNI_CLIENTES CHAR (9),
	nombre_TIENDAS VARCHAR (20),
	nombre_OPERADORAS_TARIFAS_OFERTAS VARCHAR (20),
	nombre_TARIFAS_OFERTAS VARCHAR (20),
	marca_MOVILCONTRATO_OFERTAS VARCHAR (20),
	modelo_MOVILCONTRATO_OFERTAS VARCHAR (20),
	dia DATE,
	CONSTRAINT FK_CLIENTES2 FOREIGN KEY (DNI_CLIENTES) REFERENCES CLIENTES (DNI),
	CONSTRAINT FK_TIENDAS2 FOREIGN KEY (nombre_TIENDAS) REFERENCES TIENDAS (nombre),
	CONSTRAINT FK_OFERTAS FOREIGN KEY (nombre_OPERADORAS_TARIFAS_OFERTAS, nombre_TARIFAS_OFERTAS) REFERENCES OFERTAS (nombre_OPERADORAS_TARIFAS, nombre_TARIFAS),
	CONSTRAINT FK_OFERTAS2 FOREIGN KEY (marca_MOVILCONTRATO_OFERTAS, modelo_MOVILCONTRATO_OFERTAS) REFERENCES OFERTAS (marca_MOVILCONTRATO, modelo_MOVILCONTRATO)
);
	
	
	
	
	
	
	
	
	 	

	

