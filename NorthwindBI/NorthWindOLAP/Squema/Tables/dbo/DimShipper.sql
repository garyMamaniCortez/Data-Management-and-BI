-- Tabla de Dimension: DimShipper
-- Descripcion: Tabla denormalizada para analisis de empresas de envio en el OLAP
-- Contiene informacion de transportistas optimizada para consultas analiticas
-- Proposito: Analizar patrones de envio y desempenio de empresas transportistas
-- Uso: Business Intelligence y reportes de distribucion y logistica

CREATE TABLE [dbo].[DimShipper] (
    [ShipperSK]        INT           IDENTITY(1,1) NOT NULL,	-- Clave surrogada del transportista
    [ShipperID]        INT           NOT NULL,				-- ID original del transportista
    [CompanyName]      NVARCHAR(40)  NOT NULL,				-- Nombre de la empresa de envios
    [Phone]            NVARCHAR(24)  NULL,					-- Numero de telefono de contacto
    CONSTRAINT [PK_DimShipper] PRIMARY KEY CLUSTERED ([ShipperSK] ASC)
);
GO