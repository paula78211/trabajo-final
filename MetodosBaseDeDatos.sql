USE CuteCulture;

DELIMITER $$

CREATE PROCEDURE RegistrarCompra(
    IN idCliente INT,
    IN idProducto INT,
    IN cantidad INT,
    IN direccion VARCHAR(255),
    IN telefono VARCHAR(50),
    IN descripcionCasa TEXT
)
BEGIN
    DECLARE precioUnitario DECIMAL(10, 2);
    DECLARE total DECIMAL(10, 2);
    DECLARE stockDisponible INT;

    -- Obtener el precio del producto
    SELECT precio INTO precioUnitario 
    FROM Productos 
    WHERE idProducto = idProducto LIMIT 1;

    -- Verificar si se obtuvo un precio (por si no existe el producto)
    IF precioUnitario IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Producto no encontrado';
    END IF;

    -- Obtener el stock disponible del producto
    SELECT stock INTO stockDisponible 
    FROM Productos 
    WHERE idProducto = idProducto LIMIT 1;

    -- Validación: Asegurarse de que haya suficiente stock
    IF stockDisponible < cantidad THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No hay suficiente stock disponible';
    END IF;

    -- Calcular el total
    SET total = precioUnitario * cantidad;

    -- Registrar la compra
    INSERT INTO Compras (idCliente, idProducto, cantidad, fecha, direccion, telefono, descripcionCasa, valorTotal)
    VALUES (idCliente, idProducto, cantidad, NOW(), direccion, telefono, descripcionCasa, total);

END $$

DELIMITER ;



DELIMITER $$

CREATE PROCEDURE RegistrarDevolucion(
    IN p_idCompra INT,
    IN p_motivo TEXT,
    IN p_descripcionMotivo TEXT
)
BEGIN
    DECLARE cantidad INT;
    DECLARE direccion VARCHAR(255);

    -- Verificar si la compra existe
    IF NOT EXISTS (SELECT 1 FROM Compras WHERE idCompra = p_idCompra) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Compra no encontrada';
    END IF;

    -- Obtener los datos de la compra: cantidad y direccion
    SELECT cantidad, direccion
    INTO cantidad, direccion
    FROM Compras
    WHERE idCompra = p_idCompra;

    -- Registrar la devolución
    INSERT INTO Devoluciones (idCompra, motivo, descripcionMotivo, fecha)
    VALUES (p_idCompra, p_motivo, p_descripcionMotivo, NOW());
END $$

DELIMITER ;

-- Generar reporte de la devolución
DELIMITER $$

CREATE PROCEDURE GenerarReporteDevolucion(
    IN p_idCompra INT
)
BEGIN
    SELECT 
        D.idDevolucion,
        D.motivo,
        D.descripcionMotivo,
        D.fecha,
        CL.nombre AS cliente,
        C.direccion AS direccion,
        C.telefono AS telefono,
        C.valorTotal AS valorTotal,
        C.cantidad AS cantidad
    FROM Devoluciones D
    JOIN Compras C ON D.idCompra = C.idCompra
    JOIN Clientes CL ON C.idCliente = CL.idCliente
    WHERE D.idCompra = p_idCompra;
END $$

DELIMITER ;




DELIMITER $$
CREATE TRIGGER ActualizarInventarioCompra
AFTER INSERT ON Compras
FOR EACH ROW
BEGIN
    UPDATE Productos
    SET stock = stock - NEW.cantidad
    WHERE idProducto = NEW.idProducto;
END $$
DELIMITER ;

-- Trigger: Notificación automática para productos con stock bajo
DELIMITER $$
CREATE TRIGGER NotificarStockBajo
AFTER UPDATE ON Productos
FOR EACH ROW
BEGIN
    IF NEW.stock < NEW.stockMinimo THEN
        INSERT INTO AlertaStockBajo (idProducto, mensaje, fecha)
        VALUES (NEW.idProducto, 'Producto con stock bajo', NOW());
    END IF;
END $$
DELIMITER ;



DELIMITER $$
CREATE TRIGGER ActualizarInventarioDevolucion
AFTER INSERT ON Devoluciones
FOR EACH ROW
BEGIN
    DECLARE v_cantidad INT;
    DECLARE v_idProducto INT;
    
    -- Obtener la cantidad y el producto de la compra asociada a la devolución
    SELECT cantidad, idProducto 
    INTO v_cantidad, v_idProducto
    FROM Compras
    WHERE idCompra = NEW.idCompra;
    -- Actualizar el stock del producto
    UPDATE Productos
    SET stock = stock + v_cantidad
    WHERE idProducto = v_idProducto;
END $$
DELIMITER ;


