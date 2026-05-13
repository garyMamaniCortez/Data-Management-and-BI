-- ===============================================
-- Insertar 20 Clientes en OLTP
-- ===============================================

INSERT INTO [dbo].[Customers] 
([CustomerID], [CompanyName], [ContactName], [ContactTitle], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax])
VALUES
('C0001', 'TechStore Bolivia', 'Luis Rojas', 'Owner', 'Av. America 123', 'Cochabamba', 'CBB', '3000', 'Bolivia', '+59170020001', NULL),
('C0002', 'Mundo Gamer SRL', 'Carla Vargas', 'Purchasing Manager', 'Calle Sucre 456', 'La Paz', 'LPZ', '1000', 'Bolivia', '+59170020002', NULL),
('C0003', 'SmartHome Market', 'Diego Salinas', 'Sales Manager', 'Av. Blanco Galindo 789', 'Cochabamba', 'CBB', '3000', 'Bolivia', '+59170020003', NULL),
('C0004', 'ElectroMarket Web', 'Ana Flores', 'Administrator', 'Av. Banzer 250', 'Santa Cruz', 'SCZ', '7000', 'Bolivia', '+59170020004', NULL),
('C0005', 'Digital Store Bolivia', 'Marco Herrera', 'Owner', 'Calle Ballivian 98', 'Sucre', 'CHQ', '2000', 'Bolivia', '+59170020005', NULL),
('C0006', 'Gadget House', 'Lucia Perez', 'Buyer', 'Av. Alemana 500', 'Santa Cruz', 'SCZ', '7000', 'Bolivia', '+59170020006', NULL),
('C0007', 'CompuCenter Online', 'Fernando Castro', 'Manager', 'Av. America 777', 'Cochabamba', 'CBB', '3000', 'Bolivia', '+59170020007', NULL),
('C0008', 'Mobile Shop Bolivia', 'Sofia Medina', 'Owner', 'Calle Murillo 23', 'La Paz', 'LPZ', '1000', 'Bolivia', '+59170020008', NULL),
('C0009', 'ElectroPlus Ecommerce', 'Pedro Gutierrez', 'Purchasing Agent', 'Av. Cristo Redentor 100', 'Santa Cruz', 'SCZ', '7000', 'Bolivia', '+59170020009', NULL),
('C0010', 'NextGen Tech', 'Valeria Molina', 'Sales Lead', 'Calle Junin 40', 'Tarija', 'TJA', '6000', 'Bolivia', '+59170020010', NULL),
('C0011', 'Laptop Store Bolivia', 'Carlos Mendoza', 'Owner', 'Av. Busch 321', 'Cochabamba', 'CBB', '3000', 'Bolivia', '+59170020011', NULL),
('C0012', 'Audio & Gaming Shop', 'Daniela Ortiz', 'Buyer', 'Zona Sur 88', 'La Paz', 'LPZ', '1000', 'Bolivia', '+59170020012', NULL),
('C0013', 'Home Office Market', 'Jorge Navarro', 'Manager', 'Av. Irala 76', 'Santa Cruz', 'SCZ', '7000', 'Bolivia', '+59170020013', NULL),
('C0014', 'TecnoExpress Bolivia', 'Paola Rivera', 'Administrator', 'Calle Colon 55', 'Potosi', 'PTS', '5000', 'Bolivia', '+59170020014', NULL),
('C0015', 'Mega Accesorios', 'Ricardo Arias', 'Owner', 'Av. Mutualista 87', 'Santa Cruz', 'SCZ', '7000', 'Bolivia', '+59170020015', NULL),
('C0016', 'Click Compra Bolivia', 'Camila Campos', 'Marketing Manager', 'Calle Mercado 40', 'La Paz', 'LPZ', '1000', 'Bolivia', '+59170020016', NULL),
('C0017', 'Office Tech Store', 'Luis Herrera', 'Operations Lead', 'Av. Libertad 901', 'Santa Cruz', 'SCZ', '7000', 'Bolivia', '+59170020017', NULL),
('C0018', 'Zona Gamer Bolivia', 'Andrea Suarez', 'Owner', 'Av. America 1000', 'Cochabamba', 'CBB', '3000', 'Bolivia', '+59170020018', NULL),
('C0019', 'Smart Devices Market', 'Miguel Torrez', 'Purchasing Manager', 'Av. Paraguá 100', 'Santa Cruz', 'SCZ', '7000', 'Bolivia', '+59170020019', NULL),
('C0020', 'Online Tech Hub', 'Elena Gutierrez', 'General Manager', 'Calle Aroma 230', 'Oruro', 'ORU', '4000', 'Bolivia', '+59170020020', NULL);

PRINT '✓ Se insertaron 20 Clientes';