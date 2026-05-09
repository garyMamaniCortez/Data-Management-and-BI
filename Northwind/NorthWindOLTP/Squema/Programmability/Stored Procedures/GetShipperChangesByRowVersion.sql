CREATE PROCEDURE [dbo].[GetShipperChangesByRowVersion]
(
    @startRow BIGINT,
    @endRow   BIGINT
)
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT 
        [ShipperID],
        [CompanyName],
        [Phone]
    FROM [dbo].[Shippers]
    WHERE [rowversion] > CONVERT(ROWVERSION, @startRow) 
      AND [rowversion] <= CONVERT(ROWVERSION, @endRow)
    ORDER BY [rowversion];
    
END
GO