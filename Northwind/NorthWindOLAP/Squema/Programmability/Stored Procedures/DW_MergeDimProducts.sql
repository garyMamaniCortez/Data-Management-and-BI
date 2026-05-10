CREATE PROCEDURE [dbo].[DW_MergeDimProduct]
AS
BEGIN

    SET NOCOUNT ON;

    UPDATE dp
    SET
        dp.[ProductName]          = sp.[ProductName],
        dp.[QuantityPerUnit]      = sp.[QuantityPerUnit],
        dp.[UnitPrice]            = sp.[UnitPrice],
        dp.[UnitsInStock]         = sp.[UnitsInStock],
        dp.[UnitsOnOrder]         = sp.[UnitsOnOrder],
        dp.[ReorderLevel]         = sp.[ReorderLevel],
        dp.[Discontinued]         = sp.[Discontinued],
        dp.[CategoryID]           = sp.[CategoryID],
        dp.[CategoryName]         = sp.[CategoryName],
        dp.[SupplierID]           = sp.[SupplierID],
        dp.[SupplierCompanyName]  = sp.[SupplierCompanyName],
        dp.[SupplierContactName]  = sp.[SupplierContactName],
        dp.[SupplierCity]         = sp.[SupplierCity],
        dp.[SupplierCountry]      = sp.[SupplierCountry]

    FROM [dbo].[DimProduct] dp

    INNER JOIN [staging].[product] sp
        ON dp.[ProductID] = sp.[ProductSK];

END
GO