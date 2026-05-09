CREATE PROCEDURE [dbo].[DW_MergeDimShipper]
AS
BEGIN
    SET NOCOUNT ON;
    
    UPDATE dc
    SET [CompanyName] = sc.[CompanyName],
        [Phone]       = sc.[Phone]
    FROM [dbo].[DimShipper]     dc
    INNER JOIN [staging].[shipper] sc ON (dc.[ShipperID] = sc.[ShipperSK])  
END
GO
