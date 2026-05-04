USE [master]
GO

DROP DATABASE IF EXISTS [NorthWindOLTP];
GO

CREATE DATABASE [NorthWindOLTP]
GO

USE [NorthWindOLTP]
GO

CREATE TABLE [dbo].[Customers] (
    [CustomerID]    NCHAR(5)      NOT NULL,
    [CompanyName]   NVARCHAR(40)  NOT NULL,
    [ContactName]   NVARCHAR(30)  NULL,
    [ContactTitle]  NVARCHAR(30)  NULL,
    [Address]       NVARCHAR(60)  NULL,
    [City]          NVARCHAR(15)  NULL,
    [Region]        NVARCHAR(15)  NULL,
    [PostalCode]    NVARCHAR(10)  NULL,
    [Country]       NVARCHAR(15)  NULL,
    [Phone]         NVARCHAR(24)  NULL,
    [Fax]           NVARCHAR(24)  NULL,
    [rowversion]    timestamp     NULL,
    CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED ([CustomerID] ASC)
);
GO

CREATE TABLE [dbo].[Suppliers] (
    [SupplierID]   INT           IDENTITY(1,1) NOT NULL,
    [CompanyName]  NVARCHAR(40)  NOT NULL,
    [ContactName]  NVARCHAR(30)  NULL,
    [ContactTitle] NVARCHAR(30)  NULL,
    [Address]      NVARCHAR(60)  NULL,
    [City]         NVARCHAR(15)  NULL,
    [Region]       NVARCHAR(15)  NULL,
    [PostalCode]   NVARCHAR(10)  NULL,
    [Country]      NVARCHAR(15)  NULL,
    [Phone]        NVARCHAR(24)  NULL,
    [Fax]          NVARCHAR(24)  NULL,
    [HomePage]     NVARCHAR(MAX) NULL,
    [rowversion]    timestamp     NULL,
    CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED ([SupplierID] ASC)
);
GO

CREATE TABLE [dbo].[Categories] (
    [CategoryID]   INT           IDENTITY(1,1) NOT NULL,
    [CategoryName] NVARCHAR(15)  NOT NULL,
    [Description]  NVARCHAR(MAX) NULL,
    [Picture]      IMAGE         NULL,
    [rowversion]    timestamp     NULL,
    CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED ([CategoryID] ASC)
);
GO

CREATE TABLE [dbo].[Products] (
    [ProductID]       INT           IDENTITY(1,1) NOT NULL,
    [ProductName]     NVARCHAR(40)  NOT NULL,
    [SupplierID]      INT           NULL,
    [CategoryID]      INT           NULL,
    [QuantityPerUnit] NVARCHAR(20)  NULL,
    [UnitPrice]       MONEY         NULL,
    [UnitsInStock]    SMALLINT      NULL,
    [UnitsOnOrder]    SMALLINT      NULL,
    [ReorderLevel]    SMALLINT      NULL,
    [Discontinued]    BIT           NOT NULL,
    [rowversion]    timestamp     NULL,
    CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED ([ProductID] ASC),
    CONSTRAINT [FK_Products_Categories] FOREIGN KEY ([CategoryID]) REFERENCES [Categories]([CategoryID]),
    CONSTRAINT [FK_Products_Suppliers]  FOREIGN KEY ([SupplierID])  REFERENCES [Suppliers]([SupplierID]),
    CONSTRAINT [CK_Products_UnitPrice]  CHECK ([UnitPrice] >= 0),
    CONSTRAINT [CK_Products_UnitsInStock] CHECK ([UnitsInStock] >= 0),
    CONSTRAINT [CK_Products_UnitsOnOrder] CHECK ([UnitsOnOrder] >= 0),
    CONSTRAINT [CK_Products_ReorderLevel] CHECK ([ReorderLevel] >= 0)
);
GO

CREATE TABLE [dbo].[Employees] (
    [EmployeeID]      INT           IDENTITY(1,1) NOT NULL,
    [LastName]        NVARCHAR(20)  NOT NULL,
    [FirstName]       NVARCHAR(10)  NOT NULL,
    [Title]           NVARCHAR(30)  NULL,
    [TitleOfCourtesy] NVARCHAR(25)  NULL,
    [BirthDate]       DATETIME      NULL,
    [HireDate]        DATETIME      NULL,
    [Address]         NVARCHAR(60)  NULL,
    [City]            NVARCHAR(15)  NULL,
    [Region]          NVARCHAR(15)  NULL,
    [PostalCode]      NVARCHAR(10)  NULL,
    [Country]         NVARCHAR(15)  NULL,
    [HomePhone]       NVARCHAR(24)  NULL,
    [Extension]       NVARCHAR(4)   NULL,
    [Photo]           IMAGE         NULL,
    [Notes]           NVARCHAR(MAX) NULL,
    [ReportsTo]       INT           NULL,
    [PhotoPath]       NVARCHAR(255) NULL,
    [rowversion]    timestamp     NULL,
    CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED ([EmployeeID] ASC),
    CONSTRAINT [FK_Employees_Employees] FOREIGN KEY ([ReportsTo]) REFERENCES [Employees]([EmployeeID]),
    CONSTRAINT [CK_Birthdate] CHECK ([BirthDate] < GETDATE())
);
GO

CREATE TABLE [dbo].[Shippers] (
    [ShipperID]   INT           IDENTITY(1,1) NOT NULL,
    [CompanyName] NVARCHAR(40)  NOT NULL,
    [Phone]       NVARCHAR(24)  NULL,
    [rowversion]    timestamp     NULL,
    CONSTRAINT [PK_Shippers] PRIMARY KEY CLUSTERED ([ShipperID] ASC)
);
GO

CREATE TABLE [dbo].[Orders] (
    [OrderID]        INT           IDENTITY(1,1) NOT NULL,
    [CustomerID]     NCHAR(5)      NULL,
    [EmployeeID]     INT           NULL,
    [OrderDate]      DATETIME      NULL,
    [RequiredDate]   DATETIME      NULL,
    [ShippedDate]    DATETIME      NULL,
    [ShipVia]        INT           NULL,  -- FK a Shippers
    [Freight]        MONEY         NULL,
    [ShipName]       NVARCHAR(40)  NULL,  -- Estos atributos NO dependen de ShipVia
    [ShipAddress]    NVARCHAR(60)  NULL,  -- Dependen DIRECTAMENTE de OrderID
    [ShipCity]       NVARCHAR(15)  NULL,  -- Por lo tanto, están en 3FN
    [ShipRegion]     NVARCHAR(15)  NULL,
    [ShipPostalCode] NVARCHAR(10)  NULL,
    [ShipCountry]    NVARCHAR(15)  NULL,
    [rowversion]    timestamp     NULL,
    CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED ([OrderID] ASC),
    CONSTRAINT [FK_Orders_Customers] FOREIGN KEY ([CustomerID]) REFERENCES [Customers]([CustomerID]),
    CONSTRAINT [FK_Orders_Employees] FOREIGN KEY ([EmployeeID])  REFERENCES [Employees]([EmployeeID]),
    CONSTRAINT [FK_Orders_Shippers]  FOREIGN KEY ([ShipVia])     REFERENCES [Shippers]([ShipperID])
);
GO

CREATE TABLE [dbo].[OrderDetails] (
    [OrderID]    INT      NOT NULL,
    [ProductID]  INT      NOT NULL,
    [UnitPrice]  MONEY    NOT NULL,
    [Quantity]   SMALLINT NOT NULL,
    [Discount]   REAL     NOT NULL,
    [rowversion]    timestamp     NULL,
    CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED ([OrderID] ASC, [ProductID] ASC),
    CONSTRAINT [FK_OrderDetails_Orders]   FOREIGN KEY ([OrderID])   REFERENCES [Orders]([OrderID]),
    CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY ([ProductID]) REFERENCES [Products]([ProductID]),
    CONSTRAINT [CK_OrderDetails_UnitPrice] CHECK ([UnitPrice] >= 0),
    CONSTRAINT [CK_OrderDetails_Quantity]  CHECK ([Quantity] > 0),
    CONSTRAINT [CK_OrderDetails_Discount]  CHECK ([Discount] >= 0 AND [Discount] <= 1)
);
GO

CREATE TABLE [dbo].[CustomerDemographics] (
    [CustomerTypeID] NCHAR(10)     NOT NULL,
    [CustomerDesc]   NVARCHAR(MAX) NULL,
    [rowversion]    timestamp     NULL,
    CONSTRAINT [PK_CustomerDemographics] PRIMARY KEY CLUSTERED ([CustomerTypeID] ASC)
);
GO

-- Relación muchos-a-muchos entre Customers y CustomerDemographics
CREATE TABLE [dbo].[CustomerCustomerDemo] (
    [CustomerID]     NCHAR(5) NOT NULL,
    [CustomerTypeID] NCHAR(10) NOT NULL,
    [rowversion]    timestamp     NULL,
    CONSTRAINT [PK_CustomerCustomerDemo] PRIMARY KEY CLUSTERED ([CustomerID] ASC, [CustomerTypeID] ASC),
    CONSTRAINT [FK_CustomerCustomerDemo_Customers] FOREIGN KEY ([CustomerID]) REFERENCES [Customers]([CustomerID]),
    CONSTRAINT [FK_CustomerCustomerDemo_Demographics] FOREIGN KEY ([CustomerTypeID]) REFERENCES [CustomerDemographics]([CustomerTypeID])
);
GO

CREATE TABLE [dbo].[Region] (
    [RegionID]          INT          NOT NULL,
    [RegionDescription] NCHAR(50)    NOT NULL,
    [rowversion]    timestamp     NULL,
    CONSTRAINT [PK_Region] PRIMARY KEY CLUSTERED ([RegionID] ASC)
);
GO

CREATE TABLE [dbo].[Territories] (
    [TerritoryID]          NVARCHAR(20) NOT NULL,
    [TerritoryDescription] NCHAR(50)    NOT NULL,
    [RegionID]             INT          NOT NULL,
    [rowversion]    timestamp     NULL,
    CONSTRAINT [PK_Territories] PRIMARY KEY CLUSTERED ([TerritoryID] ASC),
    CONSTRAINT [FK_Territories_Region] FOREIGN KEY ([RegionID]) REFERENCES [Region]([RegionID])
);
GO


-- Relación muchos-a-muchos entre Employees y Territories
CREATE TABLE [dbo].[EmployeeTerritories] (
    [EmployeeID]  INT          NOT NULL,
    [TerritoryID] NVARCHAR(20) NOT NULL,
    [rowversion]    timestamp     NULL,
    CONSTRAINT [PK_EmployeeTerritories] PRIMARY KEY CLUSTERED ([EmployeeID] ASC, [TerritoryID] ASC),
    CONSTRAINT [FK_EmployeeTerritories_Employees]  FOREIGN KEY ([EmployeeID])  REFERENCES [Employees]([EmployeeID]),
    CONSTRAINT [FK_EmployeeTerritories_Territories] FOREIGN KEY ([TerritoryID]) REFERENCES [Territories]([TerritoryID])
);
GO
