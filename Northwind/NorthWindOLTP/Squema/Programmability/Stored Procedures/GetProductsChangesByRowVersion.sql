CREATE PROCEDURE [dbo].[GetProductChangesByRowVersion]
(
    @startRow BIGINT,
    @endRow   BIGINT
)
AS
BEGIN

    SET NOCOUNT ON;

    SELECT
        P.[ProductID],
        P.[ProductName],
        P.[QuantityPerUnit],
        P.[UnitPrice],
        P.[UnitsInStock],
        P.[UnitsOnOrder],
        P.[ReorderLevel],
        P.[Discontinued],

        C.[CategoryID],
        C.[CategoryName],

        S.[SupplierID],
        S.[CompanyName] AS SupplierCompanyName,
        S.[ContactName] AS SupplierContactName,
        S.[City] AS SupplierCity,
        S.[Country] AS SupplierCountry

    FROM [dbo].[Products] P

    LEFT JOIN [dbo].[Categories] C
        ON P.[CategoryID] = C.[CategoryID]

    LEFT JOIN [dbo].[Suppliers] S
        ON P.[SupplierID] = S.[SupplierID]

    WHERE P.[rowversion] > CONVERT(ROWVERSION, @startRow)
      AND P.[rowversion] <= CONVERT(ROWVERSION, @endRow)

    ORDER BY P.[rowversion];

END
GO