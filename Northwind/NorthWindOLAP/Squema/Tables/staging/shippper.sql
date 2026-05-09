CREATE SCHEMA [staging];
GO

CREATE TABLE [staging].[shipper] (
    [ShipperSK]        INT           NOT NULL,
    [CompanyName]      NVARCHAR(40)  NOT NULL,
    [Phone]            NVARCHAR(24)  NULL
);
GO