CREATE PROCEDURE [dbo].[DW_MergeDimCustomer]
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE dc
    SET
        dc.[CompanyName]   = stg.[CompanyName],
        dc.[ContactName]   = stg.[ContactName],
        dc.[ContactTitle]  = stg.[ContactTitle],
        dc.[Address]       = stg.[Address],
        dc.[City]          = stg.[City],
        dc.[Region]        = stg.[Region],
        dc.[PostalCode]    = stg.[PostalCode],
        dc.[Country]       = stg.[Country],
        dc.[Phone]         = stg.[Phone],
        dc.[Fax]           = stg.[Fax],
        dc.[CustomerType]  = stg.[CustomerType]
    FROM [dbo].[DimCustomer] AS dc
    INNER JOIN [staging].[customer] AS stg
        ON dc.[CustomerID] = stg.[CustomerSK];
END
GO