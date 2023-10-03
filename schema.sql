--creating tables

CREATE TABLE Autores(
	autor_id serial PRIMARY KEY,
	nombre VARCHAR(100),
	nacionalidad VARCHAR(100)
);

CREATE TABLE  Libros(
	libro_id serial PRIMARY KEY,
	titulo VARCHAR(200),
	isbn VARCHAR(20),
	autor_id INT REFERENCES Autores(autor_id),
	genero VARCHAR(50),
	ano_publicacion INT
);

CREATE TABLE Lectores(
	lector_id serial PRIMARY KEY,
	nombre VARCHAR(100),
	direccion VARCHAR(200),
	correo_electronico VARCHAR(100)
);

CREATE TABLE Prestamos(
	prestamo_id serial PRIMARY KEY,
	lector_id INT REFERENCES Lectores(lector_id),
	libro_id INT REFERENCES Libros(libro_id),
	fecha_prestamo DATE,
	fecha_devolucion DATE
);

CREATE TABLE Devoluciones(
	devolucion_id serial PRIMARY KEY,
	prestamo_id INT REFERENCES Prestamos(prestamo_id),
	fecha_devolucion DATE,
	estado VARCHAR(100)
);

--inserting data into tables from CSVs:
COPY Autores(nombre, nacionalidad) FROM '<REPO>\sources\autores.csv' DELIMITER ',' HEADER CSV;
COPY Libros(titulo, isbn, autor_id, genero, ano_publicacion) FROM '<REPO>\sources\libros.csv' DELIMITER ',' HEADER CSV;
COPY Lectores(nombre, direccion, correo_electronico) FROM '<REPO>\sources\lectores.csv' DELIMITER ',' HEADER CSV;
COPY Prestamos(lector_id, libro_id, fecha_prestamo, fecha_devolucion) FROM '<REPO>\sources\prestamos.csv' DELIMITER ',' HEADER CSV;
COPY Devoluciones(prestamo_id, fecha_devolucion, estado) FROM '<REPO>\sources\devoluciones.csv' DELIMITER ',' HEADER CSV;

