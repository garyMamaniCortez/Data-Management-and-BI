CREATE TABLE [dbo].[CustomerDemographics] (
    [CustomerTypeID] NCHAR(10)     NOT NULL,
    [CustomerDesc]   NVARCHAR(MAX) NULL,
    [rowversion]    timestamp     NULL,
    CONSTRAINT [PK_CustomerDemographics] PRIMARY KEY CLUSTERED ([CustomerTypeID] ASC)
);
GO