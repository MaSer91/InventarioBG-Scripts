USE InventarioBG
GO

CREATE TABLE Categorias (
    CategoriaID INT PRIMARY KEY IDENTITY,  -- Identificador único de la categoría
    Nombre NVARCHAR(255) NOT NULL,         -- Nombre de la categoría
    Descripcion NVARCHAR(500)              -- Descripción de la categoría
);


CREATE TABLE Responsables (
    ResponsableID INT PRIMARY KEY IDENTITY, -- Identificador único del responsable
    Nombre NVARCHAR(255) NOT NULL,          -- Nombre completo del responsable
    Cargo NVARCHAR(100),                   -- Cargo o puesto del responsable
    Email NVARCHAR(255)                    -- Correo electrónico del responsable
);


CREATE TABLE Productos (
    ProductoID INT PRIMARY KEY IDENTITY, -- Identificador único del producto
    Nombre NVARCHAR(255) NOT NULL,       -- Nombre del producto
    Descripcion NVARCHAR(500),           -- Descripción del producto
    Precio DECIMAL(18, 2) NOT NULL,      -- Precio del producto
    Estado NVARCHAR(50),                 -- Estado del producto (Ej: "Nuevo", "Usado")
    Stock INT NOT NULL DEFAULT 0,        -- Cantidad disponible en inventario
    StockUsados INT NOT NULL DEFAULT 0,  -- Cantidad de productos usados en inventario
    StockNuevos INT NOT NULL DEFAULT 0,  -- Cantidad de productos nuevos en inventario
    Imagen NVARCHAR(255),                -- Ruta o nombre de archivo de la imagen del producto
    FechaIngreso DATETIME,               -- Fecha de ingreso al inventario
    FechaSalida DATETIME,                -- Fecha de salida o venta del producto
    ResponsableID INT,                   -- ID del responsable de la gestión del inventario
    CONSTRAINT FK_Responsable FOREIGN KEY (ResponsableID) REFERENCES Responsables(ResponsableID)
);

CREATE TABLE Auditoria (
    AuditoriaID INT PRIMARY KEY IDENTITY,    -- Identificador único del registro de auditoría
    ProductoID INT,                          -- ID del producto afectado
    FechaAccion DATETIME,                    -- Fecha y hora de la acción
    TipoAccion NVARCHAR(50),                 -- Tipo de acción (Ej: "Ingreso", "Salida", "Ajuste")
    Cantidad INT,                            -- Cantidad afectada
    Usuario NVARCHAR(255),                   -- Usuario responsable de la acción
    CONSTRAINT FK_Producto FOREIGN KEY (ProductoID) REFERENCES Productos(ProductoID)
);


CREATE TABLE Producto_Categoria (
    ProductoID INT,                         -- ID del producto
    CategoriaID INT,                        -- ID de la categoría
    CONSTRAINT PK_ProductoCategoria PRIMARY KEY (ProductoID, CategoriaID),
    CONSTRAINT FK_ProductoRef FOREIGN KEY (ProductoID) REFERENCES Productos(ProductoID),
    CONSTRAINT FK_Categoria FOREIGN KEY (CategoriaID) REFERENCES Categorias(CategoriaID)
);



CREATE TABLE Usuarios (
    UsuarioID INT PRIMARY KEY IDENTITY,        -- Identificador único del usuario
    Usuario NVARCHAR(255) NOT NULL UNIQUE,      -- Nombre de usuario (único)
    Contrasena NVARCHAR(255) NOT NULL,          -- Contraseña del usuario (deberías almacenar una versión cifrada)
    NombreCompleto NVARCHAR(255) NOT NULL,      -- Nombre completo del usuario
    FechaNacimiento DATE,                       -- Fecha de nacimiento
    Edad INT,                                   -- Edad calculada
    Sexo CHAR(1),                               -- Sexo del usuario (M para Masculino, F para Femenino, O para Otro)
    FechaCreacion DATETIME DEFAULT GETDATE(),   -- Fecha de creación de la cuenta
    Estado NVARCHAR(50) DEFAULT 'Activo',       -- Estado del usuario (Ej: Activo, Inactivo)
    CONSTRAINT CHK_Sexo CHECK (Sexo IN ('M', 'F', 'O'))  -- Restricción para el campo Sexo
);

--select * from Usuarios 
