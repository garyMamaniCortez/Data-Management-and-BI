-- Tabla: Suppliers
-- Descripcion: Tabla de proveedores de productos
-- Contiene informacion de contacto y ubicacion de todas las empresas proveedoras
-- Proposito: Gestionar informacion de proveedores y facilitar comunicacion
-- Uso: Ordenes de compra, contacto de proveedores, reportes de proveedores

CREATE TABLE [dbo].[Suppliers](
	[SupplierID] [int] IDENTITY(1,1) NOT NULL,					-- Clave primaria del proveedor
	[CompanyName] [nvarchar](40) NOT NULL,						-- Nombre de la empresa proveedora
	[ContactName] [nvarchar](30) NULL,							-- Nombre del contacto principal
	[ContactTitle] [nvarchar](30) NULL,							-- Titulo o cargo del contacto
	[Address] [nvarchar](60) NULL,								-- Direccion de la empresa
	[City] [nvarchar](15) NULL,									-- Ciudad donde esta ubicada la empresa
	[Region] [nvarchar](15) NULL,								-- Provincia o region
	[PostalCode] [nvarchar](10) NULL,							-- Codigo postal
	[Country] [nvarchar](15) NULL,								-- Pais del proveedor
	[Phone] [nvarchar](24) NULL,								-- Numero de telefono
	[Fax] [nvarchar](24) NULL,									-- Numero de fax
	[HomePage] [nvarchar](max) NULL,							-- Sitio web o pagina del proveedor
	[rowversion] [timestamp] NULL,								-- Control de concurrencia y versionado
 CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO