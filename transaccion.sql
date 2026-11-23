START TRANSACTION;

INSERT INTO CLIENTES (nombre, email) VALUES
('Ana López', 'ana@gmail.com'),
('Luis Pérez', 'luis@gmail.com');

INSERT INTO ARTICULOS (descripcion, precio_venta, stock) VALUES
('Camiseta', 15.00, 50),
('Pantalón', 35.00, 20);

INSERT INTO PEDIDOS (cod_cliente, cod_articulo, cantidad) VALUES
(1, 1, 2),
(2, 2, 1);

COMMIT;