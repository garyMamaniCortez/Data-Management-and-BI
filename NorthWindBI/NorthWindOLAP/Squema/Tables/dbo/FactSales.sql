CREATE TABLE [dbo].[FactSales](
	[OrderDateSK] [int] NOT NULL,
	[RequiredDateSK] [int] NULL,
	[ShippedDateSK] [int] NULL,
	[CustomerSK] [int] NOT NULL,
	[ProductSK] [int] NOT NULL,
	[EmployeeSK] [int] NOT NULL,
	[ShipperSK] [int] NOT NULL,
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[UnitPrice] [money] NOT NULL,
	[Discount] [real] NOT NULL,
	[DiscountAmount] [money] NOT NULL,
	[NetSales] [money] NOT NULL,
	[Freight] [money] NULL,
	[GrossRevenue] [money] NOT NULL,
 CONSTRAINT [PK_FactSales] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO