DROP DATABASE IF EXISTS biblioteca;
CREATE DATABASE biblioteca;
USE biblioteca;

CREATE TABLE Editoriales (
    id_editorial INT PRIMARY KEY,
    nombre VARCHAR(255)
);

INSERT INTO Editoriales (id_editorial, nombre) VALUES
(1, 'Penguin Random House'),
(2, 'HarperCollins'),
(3, 'Macmillan Publishers'),
(4, 'Simon & Schuster'),
(5, 'Hachette Livre'),
(6, 'Scholastic'),
(7, 'Bloomsbury'),
(8, 'Oxford University Press'),
(9, 'Cambridge University Press'),
(10, 'Springer');

CREATE TABLE Libros (
    id_libro INT PRIMARY KEY,
    titulo VARCHAR(255),
    anio_publicacion INT,
    genero VARCHAR(255),
    id_editorial INT,
    FOREIGN KEY (id_editorial) REFERENCES Editoriales(id_editorial)
);

INSERT INTO Libros (id_libro, titulo, anio_publicacion, genero, id_editorial) VALUES
(1, 'Cien Años de Soledad', 1967, 'Novela', 1),
(2, 'Don Quijote de la Mancha', 1605, 'Novela', 2),
(3, '1984', 1949, 'Ciencia Ficción', 3),
(4, 'El Principito', 1943, 'Fábula', 4),
(5, 'Harry Potter y la Piedra Filosofal', 1997, 'Fantasía', 5),
(6, 'Orgullo y Prejuicio', 1813, 'Novela Romántica', 6),
(7, 'Matar a un Ruiseñor', 1960, 'Novela', 7),
(8, 'La Odisea', -800, 'Épico', 8),
(9, 'La Metamorfosis', 1915, 'Novela', 9),
(10, 'Ulises', 1922, 'Novela', 10);

CREATE TABLE Autores (
    id_autor INT PRIMARY KEY,
    nombre VARCHAR(255)
);

INSERT INTO Autores (id_autor, nombre) VALUES
(1, 'Gabriel García Márquez'),
(2, 'Miguel de Cervantes'),
(3, 'George Orwell'),
(4, 'Antoine de Saint-Exupéry'),
(5, 'J.K. Rowling'),
(6, 'Jane Austen'),
(7, 'Harper Lee'),
(8, 'Homero'),
(9, 'Franz Kafka'),
(10, 'James Joyce');

CREATE TABLE Ejemplares (
    id_ejemplar INT PRIMARY KEY,
    id_libro INT,
    ubicacion VARCHAR(255),
    estado VARCHAR(50),
    FOREIGN KEY (id_libro) REFERENCES Libros(id_libro)
);

INSERT INTO Ejemplares (id_ejemplar, id_libro, ubicacion, estado) VALUES
(1, 1, 'Estante A1', 'Disponible'),
(2, 1, 'Estante A1', 'Prestado'),
(3, 2, 'Estante B2', 'Disponible'),
(4, 3, 'Estante C3', 'Disponible'),
(5, 4, 'Estante D4', 'Dañado'),
(6, 5, 'Estante E5', 'Disponible'),
(7, 6, 'Estante F6', 'Prestado'),
(8, 7, 'Estante G7', 'Disponible'),
(9, 8, 'Estante H8', 'Disponible'),
(10, 9, 'Estante I9', 'Prestado');

CREATE TABLE LibroAutor (
    id_libro INT,
    id_autor INT,
    FOREIGN KEY (id_libro) REFERENCES Libros(id_libro),
    FOREIGN KEY (id_autor) REFERENCES Autores(id_autor)
);

INSERT INTO LibroAutor (id_libro, id_autor) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);