USE [master]
GO

DROP DATABASE IF EXISTS [NorthWindOLAP];
GO

CREATE DATABASE [NorthWindOLAP]
GO

USE [NorthWindOLAP]
GO

CREATE SCHEMA [staging];
GO

CREATE TABLE [staging].[customer] (
    [CustomerID]        NCHAR(5)      NOT NULL,               -- Clave negocio (original)
    [CompanyName]       NVARCHAR(40)  NOT NULL,
    [ContactName]       NVARCHAR(30)  NULL,
    [ContactTitle]      NVARCHAR(30)  NULL,
    [Address]           NVARCHAR(60)  NULL,
    [City]              NVARCHAR(15)  NULL,
    [Region]            NVARCHAR(15)  NULL,
    [PostalCode]        NVARCHAR(10)  NULL,
    [Country]           NVARCHAR(15)  NULL,
    [Phone]             NVARCHAR(24)  NULL,
    [Fax]               NVARCHAR(24)  NULL,
    [CustomerType]      NVARCHAR(100) NULL
);
GO

CREATE TABLE [staging].[employee] (
    [EmployeeID]       INT           NOT NULL,
    [FullName]         NVARCHAR(31)  NOT NULL,
    [LastName]         NVARCHAR(20)  NOT NULL,
    [FirstName]        NVARCHAR(10)  NOT NULL,
    [Title]            NVARCHAR(30)  NULL,
    [TitleOfCourtesy]  NVARCHAR(25)  NULL,
    [BirthDate]        DATETIME      NULL,
    [HireDate]         DATETIME      NULL,
    [City]             NVARCHAR(15)  NULL,
    [Region]           NVARCHAR(15)  NULL,
    [Country]          NVARCHAR(15)  NULL,
    [ReportsTo]        INT           NULL,
    [ManagerFullName]  NVARCHAR(31)  NULL
);
GO

CREATE TABLE [staging].[product] (
    [ProductID]        INT           NOT NULL,
    [ProductName]      NVARCHAR(40)  NOT NULL,
    [QuantityPerUnit]  NVARCHAR(20)  NULL,
    [UnitPrice]        MONEY         NULL,
    [UnitsInStock]     SMALLINT      NULL,
    [UnitsOnOrder]     SMALLINT      NULL,
    [ReorderLevel]     SMALLINT      NULL,
    [Discontinued]     BIT           NOT NULL,
    [CategoryID]       INT           NULL,
    [CategoryName]     NVARCHAR(15)  NOT NULL,
    [SupplierID]       INT           NULL,
    [SupplierCompanyName] NVARCHAR(40) NOT NULL,
    [SupplierContactName] NVARCHAR(30) NULL,
    [SupplierCity]     NVARCHAR(15)  NULL,
    [SupplierCountry]  NVARCHAR(15)  NULL
);
GO

CREATE TABLE [staging].[shipper] (
    [ShipperID]        INT           NOT NULL,
    [CompanyName]      NVARCHAR(40)  NOT NULL,
    [Phone]            NVARCHAR(24)  NULL
);
GO

CREATE TABLE [staging].[sales] (
    -- Claves foráneas a ensiones (la "estrella")
    [OrderDateSK]      INT           NOT NULL, -- Fecha del pedido (Date)
    [RequiredDateSK]   INT           NULL,     -- Fecha requerida (Date)
    [ShippedDateSK]    INT           NULL,     -- Fecha de envío (Date)
    [CustomerSK]       INT           NOT NULL,
    [ProductSK]        INT           NOT NULL,
    [EmployeeSK]       INT           NOT NULL,
    [ShipperSK]        INT           NOT NULL,
    
    -- Claves de negocio (para trazabilidad, no se usan en joins)
    [OrderID]          INT           NOT NULL,
    [ProductID]        INT           NOT NULL,
    
    -- Medidas (facts, métricas numéricas agregables)
    [Quantity]         INT           NOT NULL,        -- Cantidad de productos
    [UnitPrice]        MONEY         NOT NULL,        -- Precio unitario (en el momento)
    [Discount]         REAL          NOT NULL,        -- Descuento aplicado
    [DiscountAmount]   MONEY         NOT NULL,        -- (UnitPrice * Quantity * Discount) - Precalculado
    [NetSales]         MONEY         NOT NULL,        -- (UnitPrice * Quantity * (1-Discount)) - Precalculado
    [Freight]          MONEY         NULL,            -- Flete (valor total del pedido, se repite en cada línea)
    [GrossRevenue]     MONEY         NOT NULL,        -- (UnitPrice * Quantity)
);
GO

CREATE TABLE [dbo].[DimDate] (
    [DateSK]           INT           NOT NULL, -- Formato YYYYMMDD (ej. 19970101)
    [FullDate]         DATE          NOT NULL,
    [Year]             INT           NOT NULL,
    [Quarter]          INT           NOT NULL,
    [Month]            INT           NOT NULL,
    [MonthName]        NVARCHAR(10)  NOT NULL,
    [Day]              INT           NOT NULL,
    [WeekOfYear]       INT           NOT NULL,
    [IsWeekend]        BIT           NOT NULL,
    CONSTRAINT [PK_DimDate] PRIMARY KEY CLUSTERED ([DateSK] ASC)
);
GO

CREATE TABLE [dbo].[DimCustomer] (
    [CustomerSK]        INT           IDENTITY(1,1) NOT NULL, -- Clave sustituta
    [CustomerID]        NCHAR(5)      NOT NULL,               -- Clave negocio (original)
    [CompanyName]       NVARCHAR(40)  NOT NULL,
    [ContactName]       NVARCHAR(30)  NULL,
    [ContactTitle]      NVARCHAR(30)  NULL,
    [Address]           NVARCHAR(60)  NULL,
    [City]              NVARCHAR(15)  NULL,
    [Region]            NVARCHAR(15)  NULL,
    [PostalCode]        NVARCHAR(10)  NULL,
    [Country]           NVARCHAR(15)  NULL,
    [Phone]             NVARCHAR(24)  NULL,
    [Fax]               NVARCHAR(24)  NULL,
    [CustomerType]      NVARCHAR(100) NULL,
    CONSTRAINT [PK_DimCustomer] PRIMARY KEY CLUSTERED ([CustomerSK] ASC)
);
GO

CREATE TABLE [dbo].[DimEmployee] (
    [EmployeeSK]       INT           IDENTITY(1,1) NOT NULL,
    [EmployeeID]       INT           NOT NULL,
    [FullName]         NVARCHAR(31)  NOT NULL, -- LastName + FirstName
    [LastName]         NVARCHAR(20)  NOT NULL,
    [FirstName]        NVARCHAR(10)  NOT NULL,
    [Title]            NVARCHAR(30)  NULL,
    [TitleOfCourtesy]  NVARCHAR(25)  NULL,
    [BirthDate]        DATETIME      NULL,
    [HireDate]         DATETIME      NULL,
    [City]             NVARCHAR(15)  NULL,
    [Region]           NVARCHAR(15)  NULL,
    [Country]          NVARCHAR(15)  NULL,
    [ReportsTo]        INT           NULL,
    [ManagerFullName]  NVARCHAR(31)  NULL,
    CONSTRAINT [PK_DimEmployee] PRIMARY KEY CLUSTERED ([EmployeeSK] ASC)
);
GO

CREATE TABLE [dbo].[DimProduct] (
    [ProductSK]        INT           IDENTITY(1,1) NOT NULL,
    [ProductID]        INT           NOT NULL,
    [ProductName]      NVARCHAR(40)  NOT NULL,
    [QuantityPerUnit]  NVARCHAR(20)  NULL,
    [UnitPrice]        MONEY         NULL,
    [UnitsInStock]     SMALLINT      NULL,
    [UnitsOnOrder]     SMALLINT      NULL,
    [ReorderLevel]     SMALLINT      NULL,
    [Discontinued]     BIT           NOT NULL,
    [CategoryID]       INT           NULL,
    [CategoryName]     NVARCHAR(15)  NOT NULL,
    [SupplierID]       INT           NULL,
    [SupplierCompanyName] NVARCHAR(40) NOT NULL,
    [SupplierContactName] NVARCHAR(30) NULL,
    [SupplierCity]     NVARCHAR(15)  NULL,
    [SupplierCountry]  NVARCHAR(15)  NULL,
    CONSTRAINT [PK_DimProduct] PRIMARY KEY CLUSTERED ([ProductSK] ASC)
);
GO

CREATE TABLE [dbo].[DimShipper] (
    [ShipperSK]        INT           IDENTITY(1,1) NOT NULL,
    [ShipperID]        INT           NOT NULL,
    [CompanyName]      NVARCHAR(40)  NOT NULL,
    [Phone]            NVARCHAR(24)  NULL,
    CONSTRAINT [PK_DimShipper] PRIMARY KEY CLUSTERED ([ShipperSK] ASC)
);
GO

CREATE TABLE [dbo].[FactSales] (
    -- Claves foráneas a dimensiones (la "estrella")
    [OrderDateSK]      INT           NOT NULL, -- Fecha del pedido (DimDate)
    [RequiredDateSK]   INT           NULL,     -- Fecha requerida (DimDate)
    [ShippedDateSK]    INT           NULL,     -- Fecha de envío (DimDate)
    [CustomerSK]       INT           NOT NULL,
    [ProductSK]        INT           NOT NULL,
    [EmployeeSK]       INT           NOT NULL,
    [ShipperSK]        INT           NOT NULL,
    
    -- Claves de negocio (para trazabilidad, no se usan en joins)
    [OrderID]          INT           NOT NULL,
    [ProductID]        INT           NOT NULL,
    
    -- Medidas (facts, métricas numéricas agregables)
    [Quantity]         INT           NOT NULL,        -- Cantidad de productos
    [UnitPrice]        MONEY         NOT NULL,        -- Precio unitario (en el momento)
    [Discount]         REAL          NOT NULL,        -- Descuento aplicado
    [DiscountAmount]   MONEY         NOT NULL,        -- (UnitPrice * Quantity * Discount) - Precalculado
    [NetSales]         MONEY         NOT NULL,        -- (UnitPrice * Quantity * (1-Discount)) - Precalculado
    [Freight]          MONEY         NULL,            -- Flete (valor total del pedido, se repite en cada línea)
    [GrossRevenue]     MONEY         NOT NULL,        -- (UnitPrice * Quantity)
    
    CONSTRAINT [PK_FactSales] PRIMARY KEY ([OrderID], [ProductID]),
    
    -- Restricciones de integridad referencial
    CONSTRAINT [FK_FactSales_DimDate_OrderDate] FOREIGN KEY ([OrderDateSK])    REFERENCES [DimDate]([DateSK]),
    CONSTRAINT [FK_FactSales_DimDate_RequiredDate] FOREIGN KEY ([RequiredDateSK]) REFERENCES [DimDate]([DateSK]),
    CONSTRAINT [FK_FactSales_DimDate_ShippedDate] FOREIGN KEY ([ShippedDateSK]) REFERENCES [DimDate]([DateSK]),
    CONSTRAINT [FK_FactSales_DimCustomer] FOREIGN KEY ([CustomerSK]) REFERENCES [DimCustomer]([CustomerSK]),
    CONSTRAINT [FK_FactSales_DimProduct]  FOREIGN KEY ([ProductSK])  REFERENCES [DimProduct]([ProductSK]),
    CONSTRAINT [FK_FactSales_DimEmployee] FOREIGN KEY ([EmployeeSK]) REFERENCES [DimEmployee]([EmployeeSK]),
    CONSTRAINT [FK_FactSales_DimShipper]  FOREIGN KEY ([ShipperSK])  REFERENCES [DimShipper]([ShipperSK])
);
GO

CREATE TABLE [dbo].[PackageConfig]
(
	[PackageID] [int] IDENTITY(1,1) NOT NULL CONSTRAINT PK_PackageConfig PRIMARY KEY,
	[TableName] [varchar](50) NOT NULL,
	[LastRowVersion] [bigint] NULL
);
GO