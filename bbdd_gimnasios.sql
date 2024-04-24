-- 1. Creación de BBDD
CREATE DATABASE bbdd_gimnassios;

-- 2.Conexión a la BBDD
USE bbdd_gimnasios;

-- 3. Creación tabla clientes

CREATE TABLE clientes(
    id INT,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    rut INT NOT NULL,
    email VARCHAR(80) NOT NULL
);

-- 4. Agregar PK al id

ALTER TABLE clientes ADD PRIMARY KEY(id);

ALTER TABLE clientes MODIFY id INT AUTO_INCREMENT;

-- 5. Creación tabla matrículas

CREATE TABLE matriculas(
    ID INT PRIMARY KEY AUTO_INCREMENT,
    monto INT NOT NULL,
    estado BOOLEAN,
    cliente_id INT REFERENCES clientes(id)
);

-- 6. Inserción de datos tabla clientes

INSERT INTO clientes(nombre, apellido, rut, email)
VALUES ('nombre1', 'apellido1', 111111111, 'cliente1@email.com'),
       ('nombre2', 'apellido2', 222222222, 'cliente2@email.com'),
       ('nombre3', 'apellido3', 333333333, 'cliente3@email.com'),
       ('nombre4', 'apellido4', 444444444, 'cliente4@email.com'),
       ('nombre5', 'apellido5', 555555555, 'cliente5@email.com');

-- 6. Inserción de datos tabla matrículas

INSERT INTO matriculas(monto, estado, cliente_id)
VALUES (40000,TRUE,1),
       (40000,FALSE,2),
       (55000,TRUE,5),
       (35000,TRUE,3),
       (60000,FALSE,4);

-- 8. Inner Join para mostrar registros relacionados

SELECT email, cliente_id, monto, estado FROM clientes
INNER JOIN matriculas ON clientes.ID = cliente_id;

-- 9. Orden ascendente

SELECT email, cliente_id, monto, estado FROM clientes
INNER JOIN matriculas ON clientes.ID = cliente_id ORDER BY matriculas.monto;

-- 10. Se añade nueva matrícula a RUT existente

INSERT INTO matriculas(monto, estado, cliente_id)
VALUES  (30000,TRUE,1);

--  Consulta clientes con más de 1 matricula
SELECT monto, COUNT(monto) FROM matriculas GROUP BY monto HAVING COUNT(monto) >=2;

-- 11. Consulta clientes con más de 1 matrícula, pero con sus datos

SELECT email, rut, m.monto, m.estado, COUNT(m.monto) FROM clientes
INNER JOIN matriculas m on clientes.id = cliente_id GROUP BY email, rut, m.monto, m.estado;

-- 12.
