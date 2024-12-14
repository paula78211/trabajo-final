-- Crear la base de datos CuteCulture
CREATE DATABASE CuteCulture;
USE CuteCulture;

-- Tabla Clientes
CREATE TABLE Clientes (
    idCliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    ubicacion POINT NOT NULL,
    SPATIAL INDEX (ubicacion)
);

-- Tabla Productos
CREATE TABLE Productos (
    idProducto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL,
    stockMinimo INT NOT NULL
);

-- Tabla Compras
CREATE TABLE Compras (
    idCompra INT AUTO_INCREMENT PRIMARY KEY,
    idCliente INT NOT NULL,
    idProducto INT NOT NULL,
    cantidad INT NOT NULL,
    fecha DATETIME NOT NULL,
    direccion TEXT NOT NULL,
    telefono VARCHAR(15) NOT NULL,
    descripcionCasa TEXT NOT NULL,
    valorTotal DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (idCliente) REFERENCES Clientes(idCliente),
    FOREIGN KEY (idProducto) REFERENCES Productos(idProducto),
    INDEX (idCliente),
    INDEX (idProducto),
    INDEX (fecha)
);

CREATE TABLE Devoluciones (
    idDevolucion INT AUTO_INCREMENT PRIMARY KEY,
    idCompra INT NOT NULL,
    motivo TEXT NOT NULL,
    descripcionMotivo TEXT NOT NULL,
    fecha DATETIME NOT NULL,
    FOREIGN KEY (idCompra) REFERENCES Compras(idCompra)
);

-- Tabla Sucursales
CREATE TABLE Sucursales (
    idSucursal INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    direccion TEXT NOT NULL,
    coordenadas POINT NOT NULL,
    SPATIAL INDEX (coordenadas)
);

-- Crear tabla para alertas de stock bajo
CREATE TABLE AlertaStockBajo (
    idAlerta INT AUTO_INCREMENT PRIMARY KEY,
    idProducto INT NOT NULL,
    mensaje TEXT NOT NULL,
    fecha DATETIME NOT NULL,
    FOREIGN KEY (idProducto) REFERENCES Productos(idProducto)
);
