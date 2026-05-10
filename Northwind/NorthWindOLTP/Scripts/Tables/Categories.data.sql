-- ===============================================
-- Insertar 20 Categorías en OLTP
-- ===============================================

INSERT INTO [dbo].[Categories] ([CategoryName], [Description])
VALUES 
    ('Beverages', 'Soft drinks, coffees, teas, beers, and ales'),
    ('Condiments', 'Sweet and savory sauces, relishes, spreads, and seasonings'),
    ('Confections', 'Desserts, candies, and sweet breads'),
    ('Dairy Products', 'Cheeses and milk-based products'),
    ('Grains/Cereals', 'Breads, cereals, and pasta'),
    ('Meat/Poultry', 'Prepared meats and poultry'),
    ('Produce', 'Dried fruit and bean curd'),
    ('Seafood', 'Seaweed and fish'),
    ('Snacks', 'Crackers, cookies, and chips'),
    ('Spices', 'Seasonings and spices'),
    ('Vegetables', 'Fresh and frozen vegetables'),
    ('Fruits', 'Fresh and dried fruits'),
    ('Oils', 'Cooking and olive oils'),
    ('Sauces', 'Various sauces and marinades'),
    ('Breakfast', 'Cereals, granola, and breakfast mixes'),
    ('Frozen Foods', 'Frozen meals and prepared dishes'),
    ('Organic', 'Organic and natural food items'),
    ('World Foods', 'Foods from around the world'),
    ('Health Foods', 'Vitamins, supplements, and health foods'),
    ('Gourmet', 'Premium and specialty food items');

PRINT '✓ Se insertaron 20 Categorías';
