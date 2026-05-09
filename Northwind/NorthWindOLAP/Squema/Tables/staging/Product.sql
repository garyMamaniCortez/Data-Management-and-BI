CREATE TABLE [staging].[product](
	[ProductSK] [int] NOT NULL,
	[ProductName] [nvarchar](40) NOT NULL,
	[QuantityPerUnit] [nvarchar](20) NULL,
	[UnitPrice] [money] NULL,
	[UnitsInStock] [smallint] NULL,
	[UnitsOnOrder] [smallint] NULL,
	[ReorderLevel] [smallint] NULL,
	[Discontinued] [bit] NOT NULL,
	[CategoryID] [int] NULL,
	[CategoryName] [nvarchar](15) NOT NULL,
	[SupplierID] [int] NULL,
	[SupplierCompanyName] [nvarchar](40) NOT NULL,
	[SupplierContactName] [nvarchar](30) NULL,
	[SupplierCity] [nvarchar](15) NULL,
	[SupplierCountry] [nvarchar](15) NULL
) ON [PRIMARY]
GO
