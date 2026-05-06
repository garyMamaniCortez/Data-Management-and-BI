CREATE TABLE [dbo].[EmployeeTerritories] (
    [EmployeeID]  INT          NOT NULL,
    [TerritoryID] NVARCHAR(20) NOT NULL,
    [rowversion]    timestamp     NULL,
    CONSTRAINT [PK_EmployeeTerritories] PRIMARY KEY CLUSTERED ([EmployeeID] ASC, [TerritoryID] ASC),
    CONSTRAINT [FK_EmployeeTerritories_Employees]  FOREIGN KEY ([EmployeeID])  REFERENCES [Employees]([EmployeeID]),
    CONSTRAINT [FK_EmployeeTerritories_Territories] FOREIGN KEY ([TerritoryID]) REFERENCES [Territories]([TerritoryID])
);
GO