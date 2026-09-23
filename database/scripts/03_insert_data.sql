USE ElectroHogar;
GO

-- =========================================
-- DATOS INICIALES
-- =========================================

INSERT INTO Brand (id_brand, name, country_of_origin)
VALUES
(1, 'Samsung', 'Corea del Sur'),
(2, 'LG', 'Corea del Sur'),
(3, 'Whirlpool', 'Estados Unidos');
GO

INSERT INTO Category (id_category, name)
VALUES
(1, 'Refrigeradoras'),
(2, 'Lavadoras'),
(3, 'Televisores');
GO

INSERT INTO Customer
(id_customer, name, last_name, document_number, email, address)
VALUES
(1, 'Juan', 'Perez', '71234567', 'juan@gmail.com', 'Av. Lima 123'),
(2, 'Maria', 'Gomez', '72345678', 'maria@gmail.com', 'Jr. Los Olivos 456'),
(3, 'Carlos', 'Torres', '73456789', 'carlos@gmail.com', 'Av. San Martin 789');
GO

INSERT INTO Customer_Phone
(id_phone, id_customer, phone_number, phone_type, Customer_id_customer)
VALUES
(1, 1, '987654321', 'Celular', 1),
(2, 2, '986543210', 'Celular', 2),
(3, 3, '985432109', 'Celular', 3);
GO

INSERT INTO Supplier
(id_supplier, ruc, business_name, phone, email)
VALUES
(1, '20123456789', 'Distribuidora Samsung Peru', '999111222', 'ventas@samsung.com'),
(2, '20234567890', 'Importaciones LG Peru', '999222333', 'ventas@lg.com'),
(3, '20345678901', 'ElectroDistribuciones SAC', '999333444', 'ventas@electrodistribuciones.com');
GO

INSERT INTO Warehouse
(id_warehouse, name, address, district, province)
VALUES
(1, 'Almacen Central', 'Av. Industrial 100', 'Lima', 'Lima'),
(2, 'Almacen Sur', 'Av. Los Heroes 200', 'San Juan de Miraflores', 'Lima');
GO

INSERT INTO Product
(id_product, id_category, id_brand, product_code, name, model,
list_price, status, warranty_months, requires_serial_number,
capacity, capacity_unit, Category_id_category, Brand_id_brand)
VALUES
(1, 1, 1, 'REF001', 'Refrigeradora Samsung', 'RT38',
2499.90, 1, 24, 1, 382, 'Litros', 1, 1),
(2, 2, 2, 'LAV001', 'Lavadora LG', 'WT18',
1899.90, 1, 24, 1, 18, 'Kg', 2, 2),
(3, 3, 1, 'TV001', 'Televisor Samsung', 'CU7000',
1599.90, 1, 12, 1, 55, 'Pulgadas', 3, 1);
GO

INSERT INTO Product_Supplier
(id_product, id_supplier, purchase_price, delivery_days,
Product_id_product, Supplier_id_supplier)
VALUES
(1, 1, 2000.00, 5, 1, 1),
(2, 2, 1500.00, 7, 2, 2),
(3, 1, 1200.00, 4, 3, 1);
GO

-- Inventory se mantiene vacío en la implementación actual.

INSERT INTO Serialized_Unit
(id_unit, id_product, id_warehouse, serial_number, status,
Product_id_product, Warehouse_id_warehouse)
VALUES
(1, 1, 1, 'SN-REF-0001', 'Disponible', 1, 1),
(2, 1, 1, 'SN-REF-0002', 'Disponible', 1, 1),
(3, 2, 1, 'SN-LAV-0001', 'Disponible', 2, 1),
(4, 3, 2, 'SN-TV-0001', 'Disponible', 3, 2);
GO

INSERT INTO Sale
(id_sale, id_customer, sale_date, sales_channel, Customer_id_customer)
VALUES
(1, 1, GETDATE(), 'STORE', 1),
(2, 2, GETDATE(), 'WEB', 2);
GO

INSERT INTO Sale_Detail
(id_sale_detail, id_sale, id_product, quantity, unit_price,
discount_percentage, Sale_id_sale, Product_id_product)
VALUES
(1, 1, 1, 1, 2499.90, 0, 1, 1),
(2, 2, 3, 1, 1599.90, 5, 2, 3);
GO

INSERT INTO Sale_Seirial_unit
(id_detail, id_unit, Sale_Detail_id_sale_detail, Serialized_Unit_id_unit)
VALUES
(1, 1, 1, 1),
(2, 4, 2, 4);
GO

INSERT INTO Payment
(id_payment, id_sale, payment_date, amount, payment_method,
transaction_code, Sale_id_sale)
VALUES
(1, 1, GETDATE(), 2499.90, 'CARD', 'TRX001', 1),
(2, 2, GETDATE(), 1519.91, 'CASH', 'TRX002', 2);
GO

INSERT INTO Delivery
(id_delivery, id_sale, address, scheduled_date, status,
tracking_code, Sale_id_sale)
VALUES
(1, 2, 'Jr. Los Olivos 456', DATEADD(DAY, 2, GETDATE()),
'Pendiente', 'TRK001', 2);
GO

INSERT INTO Warranty
(id_warranty, id_unit, id_detail, start_date, end_date,
Serialized_Unit_id_unit)
VALUES
(1, 1, 1, CAST(GETDATE() AS DATE),
DATEADD(MONTH, 24, CAST(GETDATE() AS DATE)), 1),
(2, 4, 2, CAST(GETDATE() AS DATE),
DATEADD(MONTH, 12, CAST(GETDATE() AS DATE)), 4);
GO