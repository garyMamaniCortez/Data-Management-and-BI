-- Tabla: Categories
-- Descripcion: Tabla de categorias de productos
-- Contiene las clasificaciones o grupos a los que pertenecen los productos
-- Proposito: Organizar productos por tipo o categoria
-- Uso: Clasificacion de productos, reportes y navegacion

CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,					-- Clave primaria de la categoria
	[CategoryName] [nvarchar](15) NOT NULL,						-- Nombre descriptivo de la categoria
	[Description] [nvarchar](max) NULL,							-- Descripcion detallada de la categoria
	[Picture] [image] NULL,										-- Imagen o icono de la categoria
	[rowversion] [timestamp] NULL,								-- Control de concurrencia y versionado
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO