CREATE TABLE [dbo].[DimDate] (
    [DateSK]           INT           NOT NULL, -- Formato YYYYMMDD (ej. 19970101)
    [FullDate]         DATE          NOT NULL,
    [Year]             INT           NOT NULL,
    [Quarter]          INT           NOT NULL,
    [Month]            INT           NOT NULL,
    [MonthName]        NVARCHAR(10)  NOT NULL,
    [Day]              INT           NOT NULL,
    [WeekOfYear]       INT           NOT NULL,
    [IsWeekend]        BIT           NOT NULL,
    CONSTRAINT [PK_DimDate] PRIMARY KEY CLUSTERED ([DateSK] ASC)
);
GO