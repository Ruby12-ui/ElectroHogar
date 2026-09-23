USE ElectroHogar;
GO

SELECT 'Brand' AS Tabla, COUNT(*) AS Registros FROM Brand
UNION ALL
SELECT 'Category', COUNT(*) FROM Category
UNION ALL
SELECT 'Customer', COUNT(*) FROM Customer
UNION ALL
SELECT 'Customer_Phone', COUNT(*) FROM Customer_Phone
UNION ALL
SELECT 'Delivery', COUNT(*) FROM Delivery
UNION ALL
SELECT 'Inventory', COUNT(*) FROM Inventory
UNION ALL
SELECT 'Payment', COUNT(*) FROM Payment
UNION ALL
SELECT 'Product', COUNT(*) FROM Product
UNION ALL
SELECT 'Product_Supplier', COUNT(*) FROM Product_Supplier
UNION ALL
SELECT 'Sale', COUNT(*) FROM Sale
UNION ALL
SELECT 'Sale_Detail', COUNT(*) FROM Sale_Detail
UNION ALL
SELECT 'Sale_Seirial_unit', COUNT(*) FROM Sale_Seirial_unit
UNION ALL
SELECT 'Serialized_Unit', COUNT(*) FROM Serialized_Unit
UNION ALL
SELECT 'Supplier', COUNT(*) FROM Supplier
UNION ALL
SELECT 'Warehouse', COUNT(*) FROM Warehouse
UNION ALL
SELECT 'Warranty', COUNT(*) FROM Warranty
ORDER BY Tabla;
GO