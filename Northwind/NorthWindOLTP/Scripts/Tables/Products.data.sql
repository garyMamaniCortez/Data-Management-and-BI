INSERT INTO [dbo].[Products] ([ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued])
VALUES 
    ('Chai', 1, 1, '10 boxes x 20 bags', 18.00, 39, 0, 10, 0),
    ('Chang', 1, 1, '24 - 12 oz bottles', 19.00, 17, 40, 25, 0),
    ('Aniseed Syrup', 1, 2, '12 - 550 ml bottles', 10.00, 13, 70, 25, 0),
    ('Chef Antón Cajun Seasoning', 2, 2, '48 - 6 oz jars', 22.00, 53, 0, 0, 0),
    ('Chef Antón Gumbo Mix', 2, 2, '36 boxes', 21.35, 0, 0, 0, 1),
    ('Grandma Boysenberry Spread', 3, 2, '12 - 8 oz jars', 25.00, 120, 0, 25, 0),
    ('Uncle Bob Organic Pears', 3, 7, '12 - 1 lb pkgs.', 30.00, 15, 0, 10, 0),
    ('Northwoods Cranberry Sauce', 3, 2, '12 - 12 oz jars', 40.00, 6, 0, 5, 0),
    ('Mishi Kobe Niku', 4, 6, '18 - 500 g pkgs.', 97.00, 29, 0, 0, 1),
    ('Ikura', 4, 8, '12 - 200 ml jars', 31.00, 31, 0, 0, 0),
    ('Queso Cabrales', 5, 4, '1 kg pkg.', 21.00, 22, 30, 30, 0),
    ('Queso Manchego La Pastora', 5, 4, '10 - 500 g pkgs.', 38.00, 86, 0, 0, 0),
    ('Konbu', 6, 8, '2 kg box', 6.00, 24, 0, 5, 0),
    ('Tofu', 6, 7, '40 - 100 g pkgs.', 23.25, 35, 0, 0, 0),
    ('Geitost', 7, 4, '500 g', 2.50, 112, 0, 20, 0),
    ('Sasquatch Ale', 16, 1, '24 - 12 oz bottles', 14.00, 111, 0, 15, 0),
    ('Steeleye Stout', 16, 1, '24 - 12 oz bottles', 18.00, 20, 0, 15, 0),
    ('Inlagd Sill', 9, 8, '24 - 250 g jars', 19.00, 112, 0, 20, 0),
    ('Tunnbröd', 9, 5, '10 - 500 g pkgs.', 9.00, 61, 0, 25, 0),
    ('Guaraná Fantástica', 10, 1, '12 - 355 ml cans', 4.50, 20, 0, 0, 1);

PRINT '✓ Se insertaron 20 Productos';