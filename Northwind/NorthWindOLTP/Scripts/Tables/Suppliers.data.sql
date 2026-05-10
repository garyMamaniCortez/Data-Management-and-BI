-- ===============================================
-- Insertar 20 Proveedores en OLTP
-- ===============================================

INSERT INTO [dbo].[Suppliers] ([CompanyName], [ContactName], [ContactTitle], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax], [HomePage])
VALUES 
    ('Exotic Liquids', 'Charlotte Cooper', 'Purchasing Manager', '49 Gilbert St.', 'London', 'London', 'EC1 4SD', 'UK', '(171) 555-2222', '(171) 555-2222', 'www.exoticliquids.com'),
    ('New Orleans Cajun Delights', 'Shelley Burke', 'Order Administrator', 'P.O. Box 78934', 'New Orleans', 'LA', '70117', 'USA', '(100) 555-4822', '(100) 555-4822', 'www.cajun.com'),
    ('Grandma Kellys Homestead', 'Regina Murphy', 'Sales Representative', '707 Oxford Rd.', 'Ann Arbor', 'MI', '48104', 'USA', '(313) 555-5735', '(313) 555-5735', 'www.grandmakellys.com'),
    ('Tokyo Traders', 'Yoshi Nagase', 'Marketing Manager', 'Japan', 'Tokyo', 'Tokyo', '100', 'Japan', '(03) 3555-5011', '(03) 3555-5011', 'www.tokyotraders.co.jp'),
    ('Cooperativa de Quesos', 'Antonio del Valle', 'Export Administrator', 'Carrera 80 # 45-95', 'Barranquilla', 'Atlántico', '050001', 'Colombia', '(5) 555-1340', '(5) 555-1340', 'www.quesesdelcabras.com'),
    ('Mayumi Foods', 'Mayumi Ohno', 'Marketing Director', '92 Setsuko Chuo-ku', 'Osaka', 'Osaka', '545', 'Japan', '(06) 431-7555', '(06) 431-7555', 'www.mayumifoods.jp'),
    ('Pavlova, Ltd.', 'Ian Devling', 'Marketing Manager', '74 Rose St. Moonie', 'Melbourne', 'Victoria', '3058', 'Australia', '(03) 444-2343', '(03) 444-2343', 'www.pavlova.com.au'),
    ('Specialty Biscuits Ltd', 'Peter Wilson', 'Sales Representative', '29 King''s Way', 'Manchester', 'Lancashire', 'M14 6AS', 'UK', '(161) 555-4448', '(161) 555-4448', 'www.specialtybiscuits.co.uk'),
    ('PB Knäckebröd AB', 'Lars Peterson', 'Sales Agent', 'Kaloadagatan 13', 'Göteborg', 'Västra Götaland', 'S-411 20', 'Sweden', '031-987 65 43', '031-987 65 43', 'www.pbknackebrod.se'),
    ('Refrescos Americanos SA', 'Carlos Diaz', 'Marketing Manager', 'Av. das Americanas 2500', 'São Paulo', 'SP', '05033-100', 'Brazil', '(11) 954500', '(11) 954500', 'www.refrescosamericanos.com.br'),
    ('Heli Süßwaren GmbH Co KG', 'Petra Winkler', 'Sales Manager', 'Tiergartenstraße 5', 'Berlin', 'Berlin', '10785', 'Germany', '(030) 61740700', '(030) 61740700', 'www.helisuswaren.de'),
    ('Plutzer Lebensmittel AG', 'Martin Bein', 'Sales Manager', 'Bogenallee 51', 'Frankfurt', 'Hesse', '60311', 'Germany', '(069) 992755', '(069) 992755', 'www.plutzer.de'),
    ('Nord-Ost-Fisch GmbH', 'Sven Petersen', 'Coordinator', 'Frahmredder 112a', 'Cuxhaven', 'Lower Saxony', '27472', 'Germany', '(4721) 8713', '(4721) 8713', 'www.nordostfisch.de'),
    ('Formaggi Fortini srl', 'Elio Rossi', 'Sales Representative', 'Viale Dante, 75', 'Ravenna', 'Emilia-Romagna', '48100', 'Italy', '(0544) 60323', '(0544) 60323', 'www.formaggifortini.it'),
    ('Norske Meierier', 'Beate Vileid', 'Marketing Manager', 'Hatlevegen 5', 'Sandvika', 'Akershus', '1320', 'Norway', '(0)2 953010', '(0)2 953010', 'www.norskemeierier.no'),
    ('Bigfoot Breweries', 'Cheryl Saylor', 'Regional Account Rep', '3400 - 8th Avenue Suite', 'Bend', 'OR', '97101', 'USA', '(503) 555-9931', '(503) 555-9931', 'www.bigfootbreweries.com'),
    ('Seacrests Farms', 'Uca Seroney', 'Sales Representative', 'Capital City 2222', 'Seattle', 'WA', '98104', 'USA', '(206) 555-9857', '(206) 555-9857', 'www.seacrestsfarms.com'),
    ('Golden Delicious', 'Martha Chen', 'Sales Associate', 'Golden Plaza 228 Seventh', 'New York', 'NY', '10011', 'USA', '212-555-0500', '212-555-0500', 'www.goldendelicious.com'),
    ('Leka Trading', 'Nirav Patel', 'Account Manager', 'Mehta Building Sohrabji', 'Mumbai', 'Maharashtra', '400005', 'India', '+91-22-5555-4444', '+91-22-5555-4444', 'www.lekatrading.in'),
    ('Worldwide Imports', 'Jennifer Long', 'Sales Manager', '123 Import St.', 'Portland', 'OR', '97214', 'USA', '(503) 555-2167', '(503) 555-2167', 'www.worldwideimports.com');

PRINT '✓ Se insertaron 20 Proveedores';
