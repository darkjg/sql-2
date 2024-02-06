/* Relación tipo 1:1 */
-- PASO 1
-- Tu código aquí
create table usuarios (
    id_usuario int primary key auto_increment,
    nombre varchar(50),
    apellido  varchar(100),
    email varchar(100),
    edad int 
)
INSERT INTO usuarios (nombre, apellido, email, edad) VALUES
('Juan', 'Gomez', 'juan.gomez@example.com', 28),
('Maria', 'Lopez', 'maria.lopez@example.com', 32),
('Carlos', 'Rodriguez', 'carlos.rodriguez@example.com', 25),
('Laura', 'Fernandez', 'laura.fernandez@example.com', 30),
('Pedro', 'Martinez', 'pedro.martinez@example.com', 22),
('Ana', 'Hernandez', 'ana.hernandez@example.com', 35),
('Miguel', 'Perez', 'miguel.perez@example.com', 28),
('Sofia', 'Garcia', 'sofia.garcia@example.com', 26),
('Javier', 'Diaz', 'javier.diaz@example.com', 31),
('Luis', 'Sanchez', 'luis.sanchez@example.com', 27),
('Elena', 'Moreno', 'elena.moreno@example.com', 29),
('Daniel', 'Romero', 'daniel.romero@example.com', 33),
('Paula', 'Torres', 'paula.torres@example.com', 24),
('Alejandro', 'Ruiz', 'alejandro.ruiz@example.com', 28),
('Carmen', 'Vega', 'carmen.vega@example.com', 29),
('Adrian', 'Molina', 'adrian.molina@example.com', 34),
('Isabel', 'Gutierrez', 'isabel.gutierrez@example.com', 26),
('Hector', 'Ortega', 'hector.ortega@example.com', 30),
('Raquel', 'Serrano', 'raquel.serrano@example.com', 32),
('Alberto', 'Reyes', 'alberto.reyes@example.com', 28);


-- PASO 2
-- Tu código aquí
create table roles (
id_rol int primary key auto_increment,
nombre_rol varchar(50)
)
INSERT INTO roles (nombre_rol) VALUES
('Bronce'),
('Plata'),
('Oro'),
('Platino');

-- PASO 3
-- Tu código aquí

ALTER TABLE usuarios ADD FOREIGN KEY (id_rol) REFERENCES roles(id_rol);


-- PASO 4
-- Tu código aquí
select   usuarios.id_usuario, usuarios.nombre, usuarios.apellido, usuarios.email, usuarios.edad, roles.nombre_rol from usuarios INNER JOIN roles on usuarios.id_rol = roles.id_rol

/* Relación tipo 1:N */
-- PASO 1
-- Tu código aquí
create table categorias(
id_categoria int primary key auto_increment,
nombre_categoria varchar(100) not null
);
INSERT INTO categorias (nombre_categoria) VALUES
('Electrónicos'),
('Ropa y Accesorios'),
('Libros'),
('Hogar y Cocina'),
('Deportes y aire libre'),
('Salud y cuidado personal'),
('Herramientas y mejoras para el hogar'),
('Juguetes y juegos'),
('Automotriz'),
('Música y Películas');

-- PASO 2
-- Tu código aquí
ALTER TABLE usuarios ADD id_categoria int ; 

-- PASO 3
-- Tu código aquí
UPDATE usuarios SET id_categoria = 1 WHERE id_usuario IN (1, 5, 9, 13, 17);
UPDATE usuarios SET id_categoria = 2 WHERE id_usuario IN (2, 4, 6, 18, 8);
UPDATE usuarios SET id_categoria = 3 WHERE id_usuario IN (3, 7, 9, 11, 13);
UPDATE usuarios SET id_categoria = 4 WHERE id_usuario = 10;
UPDATE usuarios SET id_categoria = 5 WHERE id_usuario = 12;
UPDATE usuarios SET id_categoria = 6 WHERE id_usuario = 14;
UPDATE usuarios SET id_categoria = 7 WHERE id_usuario = 15;
UPDATE usuarios SET id_categoria = 8 WHERE id_usuario =16;
UPDATE usuarios SET id_categoria = 9 WHERE id_usuario = 19;
UPDATE usuarios SET id_categoria = 10 WHERE id_usuario = 20;

-- PASO 4
-- Tu código aquí
select  usuarios.id_usuario, usuarios.nombre, usuarios.apellido, usuarios.email, usuarios.edad, roles.nombre_rol, categorias.nombre_categoria  from usuarios 
left  join roles on usuarios.id_usuario = roles.id_rol 
 left  join categorias on usuarios.id_categoria = categorias.id_categoria 


/* Relación tipo N:M */
-- PASO 1
-- Tu código aquí
create table usuarios_categorias(
id_usuario_categoria int primary key auto_increment,
id_usuario int,
id_categoria int


)
ALTER TABLE usuarios_categorias ADD  FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
ALTER TABLE usuarios_categorias ADD  FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
-- PASO 2
-- Tu código aquí
INSERT INTO usuarios_categorias (id_usuario, id_categoria) VALUES
(1, 1), (1, 2), (1, 3),
(2, 4), (2, 5),
(3, 6), (3, 7),
(4, 8), (4, 9), (4, 10)
-- PASO 3
-- Tu código aquí
