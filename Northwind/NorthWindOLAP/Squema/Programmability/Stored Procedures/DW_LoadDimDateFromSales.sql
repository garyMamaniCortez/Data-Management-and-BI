CREATE PROCEDURE [dbo].[DW_LoadDimDateFromSales]
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO dbo.DimDate (
        DateSK,
        FullDate,
        [Year],
        [Quarter],
        [Month],
        MonthName,
        [Day],
        WeekOfYear,
        IsWeekend
    )
    SELECT DISTINCT
        d.DateSK,
        CONVERT(DATE, CONVERT(CHAR(8), d.DateSK)) AS FullDate,
        YEAR(CONVERT(DATE, CONVERT(CHAR(8), d.DateSK))) AS [Year],
        DATEPART(QUARTER, CONVERT(DATE, CONVERT(CHAR(8), d.DateSK))) AS [Quarter],
        MONTH(CONVERT(DATE, CONVERT(CHAR(8), d.DateSK))) AS [Month],
        DATENAME(MONTH, CONVERT(DATE, CONVERT(CHAR(8), d.DateSK))) AS MonthName,
        DAY(CONVERT(DATE, CONVERT(CHAR(8), d.DateSK))) AS [Day],
        DATEPART(WEEK, CONVERT(DATE, CONVERT(CHAR(8), d.DateSK))) AS WeekOfYear,
        CASE 
            WHEN DATENAME(WEEKDAY, CONVERT(DATE, CONVERT(CHAR(8), d.DateSK))) IN ('Saturday', 'Sunday')
            THEN 1 ELSE 0 
        END AS IsWeekend
    FROM (
        SELECT OrderDateSK AS DateSK 
        FROM staging.sales

        UNION

        SELECT RequiredDateSK 
        FROM staging.sales 
        WHERE RequiredDateSK IS NOT NULL

        UNION

        SELECT ShippedDateSK 
        FROM staging.sales 
        WHERE ShippedDateSK IS NOT NULL
    ) d
    WHERE NOT EXISTS (
        SELECT 1
        FROM dbo.DimDate dd
        WHERE dd.DateSK = d.DateSK
    );
END
GO