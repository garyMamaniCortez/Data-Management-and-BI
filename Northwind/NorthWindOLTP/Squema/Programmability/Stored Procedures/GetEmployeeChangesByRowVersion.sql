CREATE PROCEDURE [dbo].[GetEmployeeChangesByRowVersion]
(
    @startRow BIGINT,
    @endRow   BIGINT
)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        e.[EmployeeID],

        -- Nuevo campo FullName
        (e.[LastName] + ' ' + e.[FirstName]) AS [FullName],

        e.[LastName],
        e.[FirstName],
        e.[Title],
        e.[TitleOfCourtesy],
        e.[BirthDate],
        e.[HireDate],
        e.[Address],
        e.[City],
        e.[Region],
        e.[PostalCode],
        e.[Country],
        e.[HomePhone],
        e.[Extension],
        e.[Notes],
        e.[ReportsTo],

        -- Nuevo campo ManagerFullName
        (m.[LastName] + ' ' + m.[FirstName]) AS [ManagerFullName],

        e.[PhotoPath]

    FROM [dbo].[Employees] e
    LEFT JOIN [dbo].[Employees] m
        ON e.[ReportsTo] = m.[EmployeeID]

    WHERE e.[rowversion] > CONVERT(ROWVERSION, @startRow)
      AND e.[rowversion] <= CONVERT(ROWVERSION, @endRow)

    ORDER BY e.[rowversion];

END
GO