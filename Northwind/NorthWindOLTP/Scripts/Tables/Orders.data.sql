-- ===============================================
-- Insertar 20 Órdenes en OLTP
-- ===============================================

SET IDENTITY_INSERT [dbo].[Orders] ON;

INSERT INTO [dbo].[Orders]
([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry])
VALUES
(10001, 'C0001', 1, '2026-05-01', '2026-05-05', '2026-05-03', 1, 25.00, 'TechStore Bolivia', 'Av. America 123', 'Cochabamba', 'CBB', '3000', 'Bolivia'),
(10002, 'C0002', 2, '2026-05-02', '2026-05-06', '2026-05-04', 2, 18.50, 'Mundo Gamer SRL', 'Calle Sucre 456', 'La Paz', 'LPZ', '1000', 'Bolivia'),
(10003, 'C0003', 3, '2026-05-03', '2026-05-07', '2026-05-05', 3, 30.00, 'SmartHome Market', 'Av. Blanco Galindo 789', 'Cochabamba', 'CBB', '3000', 'Bolivia'),
(10004, 'C0004', 4, '2026-05-04', '2026-05-08', '2026-05-06', 4, 22.75, 'ElectroMarket Web', 'Av. Banzer 250', 'Santa Cruz', 'SCZ', '7000', 'Bolivia'),
(10005, 'C0005', 5, '2026-05-05', '2026-05-09', '2026-05-07', 5, 15.90, 'Digital Store Bolivia', 'Calle Ballivian 98', 'Sucre', 'CHQ', '2000', 'Bolivia'),
(10006, 'C0006', 6, '2026-05-06', '2026-05-10', '2026-05-08', 6, 40.00, 'Gadget House', 'Av. Alemana 500', 'Santa Cruz', 'SCZ', '7000', 'Bolivia'),
(10007, 'C0007', 7, '2026-05-07', '2026-05-11', '2026-05-09', 7, 12.50, 'CompuCenter Online', 'Av. America 777', 'Cochabamba', 'CBB', '3000', 'Bolivia'),
(10008, 'C0008', 8, '2026-05-08', '2026-05-12', '2026-05-10', 8, 28.30, 'Mobile Shop Bolivia', 'Calle Murillo 23', 'La Paz', 'LPZ', '1000', 'Bolivia'),
(10009, 'C0009', 9, '2026-05-09', '2026-05-13', '2026-05-11', 9, 35.00, 'ElectroPlus Ecommerce', 'Av. Cristo Redentor 100', 'Santa Cruz', 'SCZ', '7000', 'Bolivia'),
(10010, 'C0010', 10, '2026-05-10', '2026-05-14', '2026-05-12', 10, 19.75, 'NextGen Tech', 'Calle Junin 40', 'Tarija', 'TJA', '6000', 'Bolivia'),
(10011, 'C0011', 11, '2026-05-11', '2026-05-15', '2026-05-13', 11, 32.00, 'Laptop Store Bolivia', 'Av. Busch 321', 'Cochabamba', 'CBB', '3000', 'Bolivia'),
(10012, 'C0012', 12, '2026-05-12', '2026-05-16', '2026-05-14', 12, 24.40, 'Audio & Gaming Shop', 'Zona Sur 88', 'La Paz', 'LPZ', '1000', 'Bolivia'),
(10013, 'C0013', 13, '2026-05-13', '2026-05-17', '2026-05-15', 13, 27.60, 'Home Office Market', 'Av. Irala 76', 'Santa Cruz', 'SCZ', '7000', 'Bolivia'),
(10014, 'C0014', 14, '2026-05-14', '2026-05-18', '2026-05-16', 14, 21.00, 'TecnoExpress Bolivia', 'Calle Colon 55', 'Potosi', 'PTS', '5000', 'Bolivia'),
(10015, 'C0015', 15, '2026-05-15', '2026-05-19', '2026-05-17', 15, 16.80, 'Mega Accesorios', 'Av. Mutualista 87', 'Santa Cruz', 'SCZ', '7000', 'Bolivia'),
(10016, 'C0016', 16, '2026-05-16', '2026-05-20', '2026-05-18', 16, 38.20, 'Click Compra Bolivia', 'Calle Mercado 40', 'La Paz', 'LPZ', '1000', 'Bolivia'),
(10017, 'C0017', 17, '2026-05-17', '2026-05-21', '2026-05-19', 17, 26.90, 'Office Tech Store', 'Av. Libertad 901', 'Santa Cruz', 'SCZ', '7000', 'Bolivia'),
(10018, 'C0018', 18, '2026-05-18', '2026-05-22', '2026-05-20', 18, 29.50, 'Zona Gamer Bolivia', 'Av. America 1000', 'Cochabamba', 'CBB', '3000', 'Bolivia'),
(10019, 'C0019', 19, '2026-05-19', '2026-05-23', '2026-05-21', 19, 33.10, 'Smart Devices Market', 'Av. Paraguá 100', 'Santa Cruz', 'SCZ', '7000', 'Bolivia'),
(10020, 'C0020', 20, '2026-05-20', '2026-05-24', '2026-05-22', 20, 17.95, 'Online Tech Hub', 'Calle Aroma 230', 'Oruro', 'ORU', '4000', 'Bolivia');

SET IDENTITY_INSERT [dbo].[Orders] OFF;

PRINT '✓ Se insertaron 20 Órdenes';
