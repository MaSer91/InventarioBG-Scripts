-- Insertar registros en la tabla Responsables
INSERT INTO Responsables (Nombre, Cargo, Email)
VALUES
('Juan P�rez', 'Gerente de Inventario', 'juan.perez@empresa.com'),
('Ana G�mez', 'Asistente de Inventario', 'ana.gomez@empresa.com'),
('Luis Rodr�guez', 'Supervisor de Almac�n', 'luis.rodriguez@empresa.com'),
('Maria S�nchez', 'Responsable de Log�stica', 'maria.sanchez@empresa.com'),
('Carlos Mart�nez', 'Jefe de Almac�n', 'carlos.martinez@empresa.com');

-- Insertar registros en la tabla Categorias
INSERT INTO Categorias (Nombre, Descripcion)
VALUES
('Electr�nica', 'Productos electr�nicos como computadoras, tel�fonos, etc.'),
('Muebles', 'Muebles para oficina y hogar'),
('Ropa', 'Ropa para hombres, mujeres y ni�os'),
('Alimentos', 'Productos alimenticios envasados'),
('Herramientas', 'Herramientas manuales y el�ctricas para uso dom�stico');

-- Insertar registros en la tabla Productos
INSERT INTO Productos (Nombre, Descripcion, Precio, Estado, Stock, StockUsados, StockNuevos, Imagen, FechaIngreso, FechaSalida, ResponsableID)
VALUES
('Laptop Dell XPS 13', 'Laptop de alto rendimiento con pantalla 13"', 1200.00, 'Nuevo', 50, 0, 50, 'laptop_dell_xps.jpg', '2024-12-01', NULL, 1),
('Silla de Oficina', 'Silla ergon�mica para oficina, color negro', 150.00, 'Nuevo', 200, 0, 200, 'silla_oficina.jpg', '2024-12-02', NULL, 2),
('Camiseta Adidas', 'Camiseta deportiva, talla L', 25.00, 'Nuevo', 100, 0, 100, 'camiseta_adidas.jpg', '2024-12-03', NULL, 3),
('Cereal Integral', 'Cereal saludable para desayuno', 5.00, 'Nuevo', 300, 0, 300, 'cereal_integral.jpg', '2024-12-04', NULL, 4),
('Martillo', 'Martillo de acero, 500 gramos', 10.00, 'Usado', 50, 50, 0, 'martillo_usado.jpg', '2024-12-05', NULL, 5);

--select * from Productos
-- Insertar registros en la tabla Auditoria
INSERT INTO Auditoria (ProductoID, FechaAccion, TipoAccion, Cantidad, Usuario)
VALUES
(2, '2024-12-01', 'Ingreso', 50, 'Juan P�rez'),
(3, '2024-12-02', 'Ingreso', 200, 'Ana G�mez'),
(4, '2024-12-03', 'Ingreso', 100, 'Luis Rodr�guez'),
(5, '2024-12-04', 'Ingreso', 300, 'Maria S�nchez'),
(6, '2024-12-05', 'Ingreso', 50, 'Carlos Mart�nez');

-- Insertar registros en la tabla Producto_Categoria
INSERT INTO Producto_Categoria (ProductoID, CategoriaID)
VALUES
(2, 1), -- Laptop Dell XPS 13 en Electr�nica
(3, 2), -- Silla de Oficina en Muebles
(4, 3), -- Camiseta Adidas en Ropa
(5, 4), -- Cereal Integral en Alimentos
(6, 5); -- Martillo en Herramientas

INSERT INTO Usuarios(Usuario, Contrasena, NombreCompleto, FechaNacimiento, Edad, Sexo, FechaCreacion, Estado)
VALUES
('mayerve','mario1591','Mario Sergio Ayerve Estrella', '15-02-1991',33,'M', GETDATE(), 'Activo')

select * from Usuarios