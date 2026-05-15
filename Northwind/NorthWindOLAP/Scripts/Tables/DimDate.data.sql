IF NOT EXISTS(SELECT TOP(1) 1
              FROM [dbo].[DimDate])
BEGIN
    BEGIN TRAN 
        DECLARE @startdate DATE = '2016-01-01',
                @enddate   DATE = '2027-01-01';
        DECLARE @datelist TABLE(FullDate DATE);

    IF @startdate IS NULL
        BEGIN
            SELECT TOP 1 
                   @startdate = FullDate
            FROM dbo.DimDate 
            ORDER BY DateSK ASC;
        END

    WHILE (@startdate <= @enddate)
    BEGIN 
        INSERT INTO @datelist(FullDate)
        SELECT @startdate

        SET @startdate = DATEADD(dd, 1, @startdate);
    END

    INSERT INTO dbo.DimDate(
        DateSK,
        FullDate,
        [Year],
        Quarter,
        [Month],
        MonthName,
        [Day],
        WeekOfYear,
        IsWeekend
    )
    SELECT 
        DateSK           = CONVERT(INT, CONVERT(VARCHAR, dl.FullDate, 112)),
        FullDate         = dl.FullDate,
        [Year]           = YEAR(dl.FullDate),
        Quarter          = DATEPART(qq, dl.FullDate),
        [Month]          = MONTH(dl.FullDate),
        MonthName        = DATENAME(MONTH, dl.FullDate),
        [Day]            = DATEPART(dd, dl.FullDate),
        WeekOfYear       = DATEPART(wk, dl.FullDate),
        IsWeekend        = CASE 
                              WHEN DATEPART(dw, dl.FullDate) IN (1, 7) THEN 1  -- Domingo(1) o Sábado(7)
                              ELSE 0 
                           END
    FROM @datelist dl 
    LEFT OUTER JOIN dbo.DimDate dd ON (dl.FullDate = dd.FullDate)
    WHERE dd.FullDate IS NULL;
    
    COMMIT TRAN
END
GO