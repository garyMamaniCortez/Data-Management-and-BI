CREATE TABLE [dbo].[Territories] (
    [TerritoryID]          NVARCHAR(20) NOT NULL,
    [TerritoryDescription] NCHAR(50)    NOT NULL,
    [RegionID]             INT          NOT NULL,
    [rowversion]    timestamp     NULL,
    CONSTRAINT [PK_Territories] PRIMARY KEY CLUSTERED ([TerritoryID] ASC),
    CONSTRAINT [FK_Territories_Region] FOREIGN KEY ([RegionID]) REFERENCES [Region]([RegionID])
);
GO