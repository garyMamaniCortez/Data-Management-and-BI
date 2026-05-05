CREATE TABLE [staging].[sales](
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
	[GrossRevenue] [money] NOT NULL
) ON [PRIMARY]
GO

