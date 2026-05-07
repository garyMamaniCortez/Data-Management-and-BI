
CREATE TABLE [dbo].[DimProduct](
	[ProductSK] [int] IDENTITY(1,1) NOT NULL,					
	[ProductID] [int] NOT NULL,									
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
	[SupplierCountry] [nvarchar](15) NULL,						
 CONSTRAINT [PK_DimProduct] PRIMARY KEY CLUSTERED 
(
	[ProductSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
