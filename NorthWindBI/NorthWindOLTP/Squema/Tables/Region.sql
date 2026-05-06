CREATE TABLE [dbo].[Region] (
    [RegionID]          INT          NOT NULL,
    [RegionDescription] NCHAR(50)    NOT NULL,
    [rowversion]    timestamp     NULL,
    CONSTRAINT [PK_Region] PRIMARY KEY CLUSTERED ([RegionID] ASC)
);
GO