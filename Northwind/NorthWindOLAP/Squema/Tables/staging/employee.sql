CREATE TABLE [staging].[employee] (
    [EmployeeSK]       INT           NOT NULL,
    [FullName]         NVARCHAR(31)  NOT NULL,
    [LastName]         NVARCHAR(20)  NOT NULL,
    [FirstName]        NVARCHAR(10)  NOT NULL,
    [Title]            NVARCHAR(30)  NULL,
    [TitleOfCourtesy]  NVARCHAR(25)  NULL,
    [BirthDate]        DATETIME      NULL,
    [HireDate]         DATETIME      NULL,
    [City]             NVARCHAR(15)  NULL,
    [Region]           NVARCHAR(15)  NULL,
    [Country]          NVARCHAR(15)  NULL,
    [ReportsTo]        INT           NULL,
    [ManagerFullName]  NVARCHAR(31)  NULL
);
GO