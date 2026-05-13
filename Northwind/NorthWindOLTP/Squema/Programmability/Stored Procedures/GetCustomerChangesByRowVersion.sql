/*
Plantilla de script posterior a la implementación							
--------------------------------------------------------------------------------------
 Este archivo contiene instrucciones de SQL que se anexarán al script de compilación.		
 Use la sintaxis de SQLCMD para incluir un archivo en el script posterior a la implementación.			
 Ejemplo:      :r .\miArchivo.sql								
 Use la sintaxis de SQLCMD para hacer referencia a una variable en el script posterior a la implementación.		
 Ejemplo:      :setvar TableName miTabla							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/
CREATE PROCEDURE [dbo].[GetCustomerChangesByRowVersion]
(
    @startRow BIGINT,
    @endRow   BIGINT
)
AS
BEGIN

    SET NOCOUNT ON;

    SELECT
        C.[CustomerID],
        C.[CompanyName],
        C.[ContactName],
        C.[ContactTitle],
        C.[Address],
        C.[City],
        C.[Region],
        C.[PostalCode],
        C.[Country],
        C.[Phone],
        C.[Fax]

    FROM [dbo].[Customers] C

    WHERE C.[rowversion] > CONVERT(ROWVERSION, @startRow)
      AND C.[rowversion] <= CONVERT(ROWVERSION, @endRow)

    ORDER BY C.[rowversion];

END
GO