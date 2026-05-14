CREATE PROCEDURE [dbo].[DW_MergeFactSales]
AS
BEGIN
    SET NOCOUNT ON;

    MERGE [dbo].[FactSales] AS fs
    USING [staging].[sales] AS ss
        ON fs.[OrderID] = ss.[OrderID]
       AND fs.[ProductID] = ss.[ProductID]

    WHEN MATCHED THEN
        UPDATE SET
            fs.[OrderDateSK]    = ss.[OrderDateSK],
            fs.[RequiredDateSK] = ss.[RequiredDateSK],
            fs.[ShippedDateSK]  = ss.[ShippedDateSK],
            fs.[CustomerSK]     = ss.[CustomerSK],
            fs.[ProductSK]      = ss.[ProductSK],
            fs.[EmployeeSK]     = ss.[EmployeeSK],
            fs.[ShipperSK]      = ss.[ShipperSK],
            fs.[Quantity]       = ss.[Quantity],
            fs.[UnitPrice]      = ss.[UnitPrice],
            fs.[Discount]       = ss.[Discount],
            fs.[DiscountAmount] = ss.[DiscountAmount],
            fs.[NetSales]       = ss.[NetSales],
            fs.[Freight]        = ss.[Freight],
            fs.[GrossRevenue]   = ss.[GrossRevenue]

    WHEN NOT MATCHED BY TARGET THEN
        INSERT (
            [OrderDateSK],
            [RequiredDateSK],
            [ShippedDateSK],
            [CustomerSK],
            [ProductSK],
            [EmployeeSK],
            [ShipperSK],
            [OrderID],
            [ProductID],
            [Quantity],
            [UnitPrice],
            [Discount],
            [DiscountAmount],
            [NetSales],
            [Freight],
            [GrossRevenue]
        )
        VALUES (
            ss.[OrderDateSK],
            ss.[RequiredDateSK],
            ss.[ShippedDateSK],
            ss.[CustomerSK],
            ss.[ProductSK],
            ss.[EmployeeSK],
            ss.[ShipperSK],
            ss.[OrderID],
            ss.[ProductID],
            ss.[Quantity],
            ss.[UnitPrice],
            ss.[Discount],
            ss.[DiscountAmount],
            ss.[NetSales],
            ss.[Freight],
            ss.[GrossRevenue]
        );
END
GO