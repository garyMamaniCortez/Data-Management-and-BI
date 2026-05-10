CREATE PROCEDURE [dbo].[DW_MergeDimEmployee]
AS
BEGIN
    SET NOCOUNT ON;

    /* =========================================
       UPDATE registros existentes
       ========================================= */
    UPDATE de
       SET de.[FullName]        = se.[FullName],
           de.[LastName]        = se.[LastName],
           de.[FirstName]       = se.[FirstName],
           de.[Title]           = se.[Title],
           de.[TitleOfCourtesy] = se.[TitleOfCourtesy],
           de.[BirthDate]       = se.[BirthDate],
           de.[HireDate]        = se.[HireDate],
           de.[City]            = se.[City],
           de.[Region]          = se.[Region],
           de.[Country]         = se.[Country],
           de.[ReportsTo]       = se.[ReportsTo],
           de.[ManagerFullName] = se.[ManagerFullName]
    FROM [dbo].[DimEmployee] de
    INNER JOIN [staging].[employee] se
        ON de.[EmployeeID] = se.[EmployeeSK];

END
GO
