CREATE PROCEDURE [dbo].[GetSalesChangesByRowVersion]
(
    @startRow BIGINT,
    @endRow   BIGINT
)
AS
BEGIN

    SET NOCOUNT ON;

    SELECT
        O.[OrderID],
        OD.[ProductID],

        O.[CustomerID],
        O.[EmployeeID],
        O.[ShipVia] AS ShipperID,

        CONVERT(INT, CONVERT(CHAR(8), O.[OrderDate], 112)) AS OrderDateSK,
        CASE 
            WHEN O.[RequiredDate] IS NULL THEN NULL
            ELSE CONVERT(INT, CONVERT(CHAR(8), O.[RequiredDate], 112))
        END AS RequiredDateSK,
        CASE 
            WHEN O.[ShippedDate] IS NULL THEN NULL
            ELSE CONVERT(INT, CONVERT(CHAR(8), O.[ShippedDate], 112))
        END AS ShippedDateSK,

        O.[Freight],

        OD.[UnitPrice],
        OD.[Quantity],
        OD.[Discount],

        OD.[UnitPrice] * OD.[Quantity] AS GrossRevenue,
        OD.[UnitPrice] * OD.[Quantity] * OD.[Discount] AS DiscountAmount,
        OD.[UnitPrice] * OD.[Quantity] * (1 - OD.[Discount]) AS NetSales

    FROM [dbo].[Orders] O

    INNER JOIN [dbo].[OrderDetails] OD
        ON O.[OrderID] = OD.[OrderID]

    WHERE 
        (
            O.[rowversion] > CONVERT(ROWVERSION, @startRow)
            AND O.[rowversion] <= CONVERT(ROWVERSION, @endRow)
        )
        OR
        (
            OD.[rowversion] > CONVERT(ROWVERSION, @startRow)
            AND OD.[rowversion] <= CONVERT(ROWVERSION, @endRow)
        )

    ORDER BY 
        O.[OrderID],
        OD.[ProductID];

END
GO
