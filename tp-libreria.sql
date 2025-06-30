CREATE DATABASE Libreria;
USE Libreria;

-- Tabla CLIENTES
CREATE TABLE Clientes (
    codigo_cliente INT(8) PRIMARY KEY,
    email VARCHAR(30),
    nombres VARCHAR(30),
    apellidos VARCHAR(30)
);

-- Tabla PROVEEDORES
CREATE TABLE Proveedores (
    codigo_proveedor INT(8) PRIMARY KEY,
    nombre VARCHAR(30),
    direccion VARCHAR(30),
    cuit bigINT(11),
    email VARCHAR(30),
    telefono INT(10)
);

-- Tabla LIBROS
CREATE TABLE Libros (
    isbn VARCHAR(30) PRIMARY KEY,
    nombre VARCHAR(30),
    autor VARCHAR(30),
    editorial VARCHAR(30),
    año INT(4),
    precio_compra REAL(9,2),
    precio_venta REAL(9,2),
    cantidad INT(4),
    codigo_genero INT(2),
    FOREIGN KEY (codigo_genero) REFERENCES Generos(codigo_genero)  
);

-- Tabla VENTAS (relación entre Clientes y Libros)
CREATE TABLE Ventas (
    codigo_venta INT(8) PRIMARY KEY,
    codigo_cliente INT(8),
    isbn VARCHAR(30),
    fecha DATE,
    FOREIGN KEY (codigo_cliente) REFERENCES Clientes(codigo_cliente),
    FOREIGN KEY (isbn) REFERENCES Libros(isbn)
);

-- Tabla SUMINISTROS (relación entre Proveedores y Libros)
CREATE TABLE Suministros (
    codigo_suministro INT(8) PRIMARY KEY,
    codigo_proveedor INT(8),
    isbn VARCHAR(30),
    fecha DATE,
    cantidad INT(4),
    FOREIGN KEY (codigo_proveedor) REFERENCES Proveedores(codigo_proveedor),
    FOREIGN KEY (isbn) REFERENCES Libros(isbn)
);


CREATE TABLE Generos (
codigo_genero INT(2) PRIMARY key, 
categoria VARCHAR(20)
);



-- Insert en las tablas

INSERT INTO Clientes (codigo_cliente, email, nombres, apellidos) VALUES
(10001, 'juanperez@gmail.com', 'Juan', 'Perez'),
(20002, 'florenciaro93@gmail.com', 'Florencia', 'Rodriguez'),
(30003, 'horacio_carbone@gmail.com', 'Horacio', 'Carbone'),
(40004, 'torres_daniela1308@gmail.com', 'Daniela', 'Torres'),
(50005, 'lucasgomez87@gmail.com', 'Lucas', 'Gomez'),
(60006, 'maria_fernandez@gmail.com', 'María', 'Fernandez'),
(70007, 'martin.rey@gmail.com', 'Martín', 'Rey'),
(80008, 'anab.moreno@gmail.com', 'Ana Belén', 'Moreno'),
(90009, 'federico_soto@gmail.com', 'Federico', 'Soto'),
(100010, 'carla.vega@gmail.com', 'Carla', 'Vega');

SELECT * FROM clientes;


INSERT INTO Libros (isbn, nombre, autor, editorial, año, precio_compra, precio_venta, cantidad, codigo_genero) VALUES
('9789871138001', 'Ficciones', 'Jorge L. Borges', 'Emecé', 1944, 15000.00, 25000.00, 10, 2),
('9789871138002', 'El Aleph', 'Jorge L. Borges', 'Emecé', 1949, 16000.00, 26000.00, 8, 1),
('9789870431050', 'Rayuela', 'Julio Cortázar', 'Sudamericana', 1963, 18000.00, 28000.00, 12, 3),
('9789500720001', 'Final del juego', 'Julio Cortázar', 'Sudamericana', 1956, 14000.00, 23000.00, 7, 2),
('9789878420001', 'Los siete locos', 'Roberto Arlt', 'Losada', 1929, 13000.00, 22000.00, 5, 9),
('9789878420002', 'Los lanzallamas', 'Roberto Arlt', 'Losada', 1931, 13500.00, 22500.00, 5, 9),
('9789876510012', 'Plata quemada', 'R. Piglia', 'Planeta', 1997, 17000.00, 27000.00, 9, 7),
('9789876510013', 'Respiración artif.', 'R. Piglia', 'Planeta', 1980, 16000.00, 26000.00, 6, 10),
('9789876293150', 'Las cosas que perd.', 'M. Enríquez', 'Anagrama', 2016, 19000.00, 30000.00, 10, 5),
('9789876293151', 'Nuestra parte de n.', 'M. Enríquez', 'Anagrama', 2019, 21000.00, 32000.00, 10, 5),
('9789500730001', 'Distancia de resc.', 'S. Schweblin', 'Random House', 2015, 18000.00, 29000.00, 7, 6),
('9789500730002', 'Kentukis', 'S. Schweblin', 'Random House', 2018, 18500.00, 29500.00, 6, 6),
('9789877380001', 'Elena sabe', 'C. Piñeiro', 'Alfaguara', 2007, 17000.00, 27000.00, 10, 8),
('9789877380002', 'Viudas de jueves', 'C. Piñeiro', 'Alfaguara', 2005, 16500.00, 26500.00, 9, 7),
('9789873600001', 'El túnel', 'E. Sábato', 'Losada', 1948, 15000.00, 25000.00, 8, 10),
('9789873600002', 'Héroes y tumbas', 'E. Sábato', 'Losada', 1961, 16000.00, 26000.00, 7, 10),
('9789870920001', 'El entenado', 'J. J. Saer', 'Seix Barral', 1983, 15500.00, 25500.00, 6, 1),
('9789870920002', 'Pasos perdidos', 'A. Carpentier', 'Seix Barral', 1953, 14500.00, 24500.00, 5, 4),
('9789871122001', 'Secreto de sus ojos', 'E. Sacheri', 'Alfaguara', 2005, 16500.00, 26500.00, 9, 7),
('9789871122002', 'Betibú', 'C. Piñeiro', 'Alfaguara', 2011, 17000.00, 27000.00, 8, 8);

SELECT * FROM libros;



INSERT INTO proveedores (codigo_proveedor, nombre, direccion, cuit, email, telefono ) VALUES
(101001, 'Cuspide Distribuidora', 'Av. Corrientes 1234', 30711234567, 'contacto@cuspide.com', 1145678910),
(101002, 'Grupo Ilhsa S.A.', 'Florida 456', 30543210987, 'ventas@ilhsa.com', 1141234567),
(101003, 'Distrib. Waldhuter', 'Av. Rivadavia 789', 30765432109, 'info@waldhuter.com', 1135678901),
(101004, 'Librería Santa Fe', 'Santa Fe 3210', 30987654321, 'proveedor@santafe.com', 1123456789),
(101005, 'AZ Editora Distrib.', 'Callao 987', 30678901234, 'az@editoradistrib.com', 1167890123);

SELECT cuit FROM proveedores;



INSERT INTO Ventas (codigo_venta, codigo_cliente, isbn, fecha) VALUES
(500001, 10001, '9789871138001', '2023-04-12'),
(500002, 20002, '9789870431050', '2023-05-03'),
(500003, 30003, '9789876293151', '2023-06-15'),
(500004, 40004, '9789500730002', '2023-07-20'),
(500005, 50005, '9789876510012', '2023-09-05'),
(500006, 60006, '9789877380001', '2023-10-11'),
(500007, 70007, '9789873600001', '2023-11-02'),
(500008, 80008, '9789878420001', '2024-01-17'),
(500009, 90009, '9789871122001', '2024-02-28'),
(500010, 100010, '9789870920002', '2024-03-21');

SELECT * FROM ventas;

SELECT clientes.nombres, clientes.apellidos, ventas.codigo_cliente , ventas.codigo_venta FROM clientes LEFT JOIN ventas ON  clientes.codigo_cliente = ventas.codigo_cliente;

INSERT INTO Suministros (codigo_suministro, codigo_proveedor, isbn, fecha, cantidad) VALUES
(700001, 101001, '9789871138001', '2023-03-15', 11),
(700002, 101002, '9789871138002', '2023-03-20', 9),
(700003, 101003, '9789870431050', '2023-04-10', 13),
(700004, 101004, '9789500720001', '2023-04-15', 8),
(700005, 101005, '9789878420001', '2023-05-01', 6),
(700006, 101001, '9789878420002', '2023-05-05', 6),
(700007, 101002, '9789876510012', '2023-05-20', 10),
(700008, 101003, '9789876510013', '2023-06-01', 7),
(700009, 101004, '9789876293150', '2023-06-10', 11),
(700010, 101005, '9789876293151', '2023-06-15', 11),
(700011, 101001, '9789500730001', '2023-07-01', 8),
(700012, 101002, '9789500730002', '2023-07-10', 7),
(700013, 101003, '9789877380001', '2023-07-20', 11),
(700014, 101004, '9789877380002', '2023-07-30', 10),
(700015, 101005, '9789873600001', '2023-08-05', 9),
(700016, 101001, '9789873600002', '2023-08-15', 8),
(700017, 101002, '9789870920001', '2023-08-20', 7),
(700018, 101003, '9789870920002', '2023-08-25', 6),
(700019, 101004, '9789871122001', '2023-09-01', 10),
(700020, 101005, '9789871122002', '2023-09-10', 9);


DESCRIBE suministros;

SELECT * FROM suministros;


INSERT INTO Generos (codigo_genero, categoria) VALUES
(1, 'Ficción'),
(2, 'Cuento'),
(3, 'Novela'),
(4, 'Realismo'),
(5, 'Fantasía oscura'),
(6, 'Ciencia ficción'),
(7, 'Policial'),
(8, 'Suspenso'),
(9, 'Literatura social'),
(10, 'Drama psicológico');