CREATE TABLE [dbo].[DimEmployee] (
    [EmployeeSK]       INT           IDENTITY(1,1) NOT NULL,
    [EmployeeID]       INT           NOT NULL,
    [FullName]         NVARCHAR(31)  NOT NULL, -- LastName + FirstName
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
    [ManagerFullName]  NVARCHAR(31)  NULL,
    CONSTRAINT [PK_DimEmployee] PRIMARY KEY CLUSTERED ([EmployeeSK] ASC)
);
GO