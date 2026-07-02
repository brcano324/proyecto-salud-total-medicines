USE master;
GO

IF EXISTS (SELECT name FROM sys.databases WHERE name = 'Salud_total')
BEGIN
    ALTER DATABASE Salud_total SET SINGLE_USER WITH ROLLBACK IMMEDIATE; 
    DROP DATABASE Salud_total; 
END
GO

CREATE DATABASE Salud_total;
GO


USE Salud_total;
GO

CREATE TABLE usuarios (
    id_usuario INT PRIMARY KEY IDENTITY(1,1),
    nombre_completo VARCHAR(100) NOT NULL,
    correo VARCHAR(50) NOT NULL UNIQUE,
    [password] VARCHAR(20) NOT NULL,  
    telefono VARCHAR(15) NOT NULL,
    fecha_registro DATETIME DEFAULT GETDATE()

);
GO


CREATE TABLE categorias (
id_categoria INT PRIMARY KEY IDENTITY(1,1),
nombre_categoria VARCHAR(50) NOT NULL UNIQUE,
descripcion TEXT NULL

)

CREATE TABLE productos (
id_producto INT PRIMARY KEY IDENTITY(1,1),
id_categoria INT NOT NULL FOREIGN KEY REFERENCES categorias(id_categoria),
nombre_producto VARCHAR(100) NOT NULL,
descripcion TEXT NULL,
precio DECIMAL(10,2) NOT NULL,
inventario INT NOT NULL,
url_imagen VARCHAR(255) NULL,

)

CREATE TABLE pedidos (
id_pedido INT PRIMARY KEY IDENTITY(1,1),
id_usuario INT NOT NULL FOREIGN KEY REFERENCES usuarios(id_usuario),
fecha_pedido DATETIME DEFAULT GETDATE(),
estado_pedido VARCHAR(20) NOT NULL DEFAULT 'Pendiente',
total DECIMAL(10,2) NOT NULL

)

CREATE TABLE detalle_pedidos (
id_detalle INT PRIMARY KEY IDENTITY(1,1),
id_pedido INT NOT NULL FOREIGN KEY REFERENCES pedidos(id_pedido),
id_producto INT NOT NULL FOREIGN KEY REFERENCES productos(id_producto),
cantidad INT NOT NULL,
precio_unitario DECIMAL(10,2) NOT NULL
)



-- Inserción de Categorías orientadas a Salud Total
INSERT INTO categorias (nombre_categoria, descripcion) VALUES
('Dispositivos Médicos', 'Equipos de monitoreo como tensiómetros, glucómetros y termómetros digitales.'),
('Suplementos y Vitaminas', 'Productos nutricionales, multivitamínicos y proteínas para el bienestar diario.'),
('Cuidado Personal', 'Artículos de higiene, cremas dermatológicas y protección para la piel.'),
('Ortopedia y Soporte', 'Inmovilizadores, rodilleras, fajas y elementos de recuperación física.');
GO

SELECT * FROM categorias;

-- Inserción de Productos (10 Productos de Salud Total)
INSERT INTO productos (id_categoria, nombre_producto, descripcion, precio, inventario) VALUES
-- Categoría 1: Dispositivos Médicos (id_categoria = 1)
(1, 'Tensiómetro Digital de Brazo', 'Monitor de presión arterial automático con memoria para dos usuarios.', 145000.00, 25),
(1, 'Glucómetro de Alta Precisión', 'Kit de medición de glucosa en sangre, incluye 10 lancetas y estuche.', 89900.00, 40),
(1, 'Termómetro Infrarrojo Digital', 'Termómetro de frente sin contacto, medición ultrasónica en 1 segundo.', 65000.00, 50),

-- Categoría 2: Suplementos y Vitaminas (id_categoria = 2)
(2, 'Multivitamínico Gomitas Adulto', 'Frasco por 90 gomitas con vitaminas A, C, D3, E y Zinc para defensas.', 55000.00, 30),
(2, 'Proteína Isolate Clean 2lb', 'Proteína de suero aislada libre de lactosa y azúcar, sabor vainilla.', 189900.00, 15),
(2, 'Cápsulas de Omega 3 1000mg', 'Suplemento de aceite de pescado premium, frasco con 120 cápsulas blandas.', 48000.00, 60),

-- Categoría 3: Cuidado Personal (id_categoria = 3)
(3, 'Bloqueador Dermatológico FPS 50+', 'Protector solar en gel de alta absorción para piel sensible 100ml.', 79900.00, 35),
(3, 'Crema Hidratante Cerámicas', 'Crema restauradora para pieles secas a muy secas, frasco de 400g.', 92000.00, 20),

-- Categoría 4: Ortopedia y Soporte (id_categoria = 4)
(4, 'Rodillera Mecánica Ajustable', 'Soporte de rodilla con estabilizadores laterales para recuperación.', 110000.00, 12),
(4, 'Corrector de Postura Ergonómico', 'Faja correctora ajustable para espalda alta y soporte lumbar.', 59900.00, 28);
GO


SELECT * FROM productos;

-- Inserción de Usuarios (Clientes Simulados para Salud Total)
INSERT INTO usuarios (nombre_completo, correo, [password], telefono) VALUES
('Juan Pérez Gómez', 'juan.perez@saludtotal.com', 'Juan2026*', '3157778899'),
('María Camila Restrepo', 'maria.camila@saludtotal.com', 'Camila2026*', '3004445566'),
('Carlos Mario Giraldo', 'carlos.mario@saludtotal.com', 'Carlos2026*', '3102221100'),
('Ana María Palacio', 'ana.palacio@saludtotal.com', 'Ana2026*', '3125554433');
GO

SELECT * FROM usuarios;

-- Inserción de Pedidos de Ejemplo (Con totales exactos de Salud Total)
INSERT INTO pedidos (id_usuario, fecha_pedido, estado_pedido, total) VALUES
(1, '2026-06-15 10:30:00', 'Procesado', 345000.00), -- Total exacto del pedido 1
(2, '2026-06-20 16:45:00', 'Enviado', 140000.00),    -- Total exacto del pedido 2
(1, '2026-06-25 09:15:00', 'Pendiente', 59900.00);   -- Total exacto del pedido 3
GO


SELECT * FROM pedidos;

-- Inserción de Detalles de Pedidos (Con datos reales de Salud Total)
INSERT INTO detalle_pedidos (id_pedido, id_producto, cantidad, precio_unitario) VALUES
-- Pedido 1: Compró 2 Tensiómetros ($145.000 c/u) y 1 Multivitamínico ($55.000 c/u)
(1, 1, 2, 145000.00), 
(1, 4, 1, 55000.00),

-- Pedido 2: Compró 1 Omega 3 ($48.000 c/u) y 1 Crema Hidratante ($92.000 c/u)
(2, 6, 1, 48000.00),
(2, 8, 1, 92000.00),

-- Pedido 3: Compró 1 Corrector de Postura ($59.900 c/u)
(3, 10, 1, 59900.00);
GO

SELECT * FROM detalle_pedidos;
