CREATE TABLE [dbo].[CustomerCustomerDemo] (
    [CustomerID]     NCHAR(5) NOT NULL,
    [CustomerTypeID] NCHAR(10) NOT NULL,
    [rowversion]    timestamp     NULL,
    CONSTRAINT [PK_CustomerCustomerDemo] PRIMARY KEY CLUSTERED ([CustomerID] ASC, [CustomerTypeID] ASC),
    CONSTRAINT [FK_CustomerCustomerDemo_Customers] FOREIGN KEY ([CustomerID]) REFERENCES [Customers]([CustomerID]),
    CONSTRAINT [FK_CustomerCustomerDemo_Demographics] FOREIGN KEY ([CustomerTypeID]) REFERENCES [CustomerDemographics]([CustomerTypeID])
);
GO