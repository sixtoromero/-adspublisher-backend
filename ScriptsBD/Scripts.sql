USE [master]
GO
/****** Object:  Database [AdsPublisher]    Script Date: 5/06/2020 11:26:20 p. m. ******/
CREATE DATABASE [AdsPublisher]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AdsPublisher', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\AdsPublisher.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AdsPublisher_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\AdsPublisher_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [AdsPublisher] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AdsPublisher].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AdsPublisher] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AdsPublisher] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AdsPublisher] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AdsPublisher] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AdsPublisher] SET ARITHABORT OFF 
GO
ALTER DATABASE [AdsPublisher] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AdsPublisher] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AdsPublisher] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AdsPublisher] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AdsPublisher] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AdsPublisher] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AdsPublisher] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AdsPublisher] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AdsPublisher] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AdsPublisher] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AdsPublisher] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AdsPublisher] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AdsPublisher] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AdsPublisher] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AdsPublisher] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AdsPublisher] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AdsPublisher] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AdsPublisher] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [AdsPublisher] SET  MULTI_USER 
GO
ALTER DATABASE [AdsPublisher] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AdsPublisher] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AdsPublisher] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AdsPublisher] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AdsPublisher] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AdsPublisher] SET QUERY_STORE = OFF
GO
USE [AdsPublisher]
GO
/****** Object:  Table [dbo].[Calificacion_MicroEmpresa]    Script Date: 5/06/2020 11:26:20 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Calificacion_MicroEmpresa](
	[IDCalificacion] [int] IDENTITY(1,1) NOT NULL,
	[Puntuacion] [int] NULL,
	[Comentario] [nvarchar](500) NULL,
	[IDMicroEmpresa] [int] NULL,
 CONSTRAINT [PK_Calificacion_MicroEmpresa] PRIMARY KEY CLUSTERED 
(
	[IDCalificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 5/06/2020 11:26:20 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorias](
	[IDCategoria] [int] NOT NULL,
	[Descripcion] [nvarchar](250) NULL,
	[FechaCreacion] [datetime] NULL,
 CONSTRAINT [PK_Categorias] PRIMARY KEY CLUSTERED 
(
	[IDCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategoriasPorMicroEmpresas]    Script Date: 5/06/2020 11:26:20 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoriasPorMicroEmpresas](
	[IDCatMicroEmpresa] [int] IDENTITY(1,1) NOT NULL,
	[IDCategoria] [int] NULL,
	[IDSubCategoria] [int] NOT NULL,
	[IDMicroEmpresa] [int] NOT NULL,
	[FechaCreacion] [datetime] NULL,
 CONSTRAINT [PK_CategoriasPorMicroEmpresas] PRIMARY KEY CLUSTERED 
(
	[IDCatMicroEmpresa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clases]    Script Date: 5/06/2020 11:26:20 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clases](
	[IDClase] [int] NOT NULL,
	[Descripcion] [nvarchar](250) NULL,
	[FechaCreacion] [datetime] NULL,
 CONSTRAINT [PK_Clases] PRIMARY KEY CLUSTERED 
(
	[IDClase] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 5/06/2020 11:26:20 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[IDCliente] [int] IDENTITY(1,1) NOT NULL,
	[Nombres] [nvarchar](250) NULL,
	[Apellidos] [nvarchar](250) NULL,
	[Sexo] [int] NULL,
	[FechaCumpleanos] [datetime] NULL,
	[Correo] [nvarchar](250) NULL,
	[FechaCreacion] [datetime] NULL,
	[Activo] [bit] NULL,
	[Foto] [nvarchar](500) NULL,
 CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED 
(
	[IDCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Facturas]    Script Date: 5/06/2020 11:26:20 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Facturas](
	[IDFactura] [int] IDENTITY(1,1) NOT NULL,
	[IDCliente] [int] NULL,
	[IDPlan] [int] NULL,
	[Valor_Plan_Actual] [decimal](16, 3) NULL,
	[FechaCreacion] [datetime] NULL,
 CONSTRAINT [PK_Facturas] PRIMARY KEY CLUSTERED 
(
	[IDFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Historial_Pagos]    Script Date: 5/06/2020 11:26:20 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Historial_Pagos](
	[IDHistorialPago] [int] IDENTITY(1,1) NOT NULL,
	[IDFactura] [int] NULL,
	[Valor_Pago] [decimal](16, 3) NULL,
	[FechaCreacion] [datetime] NULL,
	[FechaCulminacion] [datetime] NULL,
	[Estado] [bit] NULL,
 CONSTRAINT [PK_Historial_Pagos] PRIMARY KEY CLUSTERED 
(
	[IDHistorialPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Historial_Registro]    Script Date: 5/06/2020 11:26:20 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Historial_Registro](
	[IDHistorialReg] [int] IDENTITY(1,1) NOT NULL,
	[IDMicroempresa] [int] NOT NULL,
	[Descripcion] [nvarchar](250) NULL,
	[FechaCreacion] [datetime] NULL,
 CONSTRAINT [PK_Historial_Registro] PRIMARY KEY CLUSTERED 
(
	[IDHistorialReg] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MessageError]    Script Date: 5/06/2020 11:26:20 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MessageError](
	[Descripcion] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MicroEmpresas]    Script Date: 5/06/2020 11:26:20 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MicroEmpresas](
	[IDMicroEmpresa] [int] IDENTITY(1,1) NOT NULL,
	[IDCliente] [int] NOT NULL,
	[Nombre] [nvarchar](250) NULL,
	[Descripcion] [nvarchar](max) NULL,
	[Fax] [nvarchar](80) NULL,
	[Telefono] [nvarchar](80) NULL,
	[Celular] [nvarchar](80) NULL,
	[Direccion] [nvarchar](250) NULL,
	[Longitud] [nvarchar](250) NULL,
	[Latitud] [nvarchar](250) NULL,
	[FechaCreacion] [datetime] NULL,
	[Estado] [bit] NULL,
	[IDCategoria] [int] NULL,
 CONSTRAINT [PK_MicroEmpresas] PRIMARY KEY CLUSTERED 
(
	[IDMicroEmpresa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Parametros]    Script Date: 5/06/2020 11:26:20 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Parametros](
	[IDParametro] [int] IDENTITY(1,1) NOT NULL,
	[IDClase] [int] NOT NULL,
	[Descripcion] [nvarchar](250) NOT NULL,
	[FechaCreacion] [datetime] NULL,
 CONSTRAINT [PK_Parametros] PRIMARY KEY CLUSTERED 
(
	[IDParametro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Perfil_Usuario]    Script Date: 5/06/2020 11:26:20 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Perfil_Usuario](
	[IDPerfilUsuario] [int] IDENTITY(1,1) NOT NULL,
	[IDRol] [int] NOT NULL,
	[IDPerfil] [int] NOT NULL,
	[IDUsuario] [int] NOT NULL,
	[Descripcion] [nvarchar](250) NULL,
	[FechaCreacion] [datetime] NULL,
 CONSTRAINT [PK_Perfil_Usuario] PRIMARY KEY CLUSTERED 
(
	[IDPerfilUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Perfiles]    Script Date: 5/06/2020 11:26:20 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Perfiles](
	[IDPerfil] [int] NOT NULL,
	[Descripcion] [nvarchar](250) NULL,
	[FechaCreacion] [datetime] NULL,
 CONSTRAINT [PK_Perfiles] PRIMARY KEY CLUSTERED 
(
	[IDPerfil] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Planes]    Script Date: 5/06/2020 11:26:20 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Planes](
	[IDPlan] [int] NOT NULL,
	[Titulo] [nvarchar](80) NOT NULL,
	[Descripcion] [nvarchar](250) NULL,
	[Precio] [decimal](18, 3) NOT NULL,
	[Detalle] [nvarchar](max) NULL,
	[FechaCreacion] [datetime] NULL,
	[Estado] [bit] NULL,
	[NroMeses] [int] NULL,
 CONSTRAINT [PK_Planes] PRIMARY KEY CLUSTERED 
(
	[IDPlan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PQRS]    Script Date: 5/06/2020 11:26:20 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PQRS](
	[IDPQRS] [int] IDENTITY(1,1) NOT NULL,
	[IDParametro] [int] NOT NULL,
	[Asunto] [nvarchar](250) NULL,
	[Descripcion] [nvarchar](max) NULL,
	[IDCliente] [int] NOT NULL,
	[Estado] [nchar](1) NULL,
	[FechaCreacion] [datetime] NULL,
 CONSTRAINT [PK_PQRS] PRIMARY KEY CLUSTERED 
(
	[IDPQRS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 5/06/2020 11:26:20 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[IDRol] [int] NOT NULL,
	[Descripcion] [nvarchar](250) NULL,
	[FechaCreacion] [datetime] NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[IDRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubCategoria]    Script Date: 5/06/2020 11:26:20 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubCategoria](
	[IDSubCategoria] [int] IDENTITY(1,1) NOT NULL,
	[IDCategoria] [int] NULL,
	[Descripcion] [nvarchar](250) NULL,
	[FechaCreacion] [datetime] NULL,
 CONSTRAINT [PK_SubCategoria] PRIMARY KEY CLUSTERED 
(
	[IDSubCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 5/06/2020 11:26:20 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[IDUsuario] [int] IDENTITY(1,1) NOT NULL,
	[IDCliente] [int] NOT NULL,
	[Usuario] [nvarchar](250) NULL,
	[Password] [nvarchar](max) NULL,
	[FechaCreacion] [datetime] NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[IDUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Calificacion_MicroEmpresa]  WITH CHECK ADD  CONSTRAINT [FK_Calificacion_MicroEmpresa_MicroEmpresas] FOREIGN KEY([IDMicroEmpresa])
REFERENCES [dbo].[MicroEmpresas] ([IDMicroEmpresa])
GO
ALTER TABLE [dbo].[Calificacion_MicroEmpresa] CHECK CONSTRAINT [FK_Calificacion_MicroEmpresa_MicroEmpresas]
GO
ALTER TABLE [dbo].[CategoriasPorMicroEmpresas]  WITH CHECK ADD  CONSTRAINT [FK_CategoriasPorMicroEmpresas_MicroEmpresas] FOREIGN KEY([IDMicroEmpresa])
REFERENCES [dbo].[MicroEmpresas] ([IDMicroEmpresa])
GO
ALTER TABLE [dbo].[CategoriasPorMicroEmpresas] CHECK CONSTRAINT [FK_CategoriasPorMicroEmpresas_MicroEmpresas]
GO
ALTER TABLE [dbo].[CategoriasPorMicroEmpresas]  WITH CHECK ADD  CONSTRAINT [FK_CategoriasPorMicroEmpresas_SubCategoria] FOREIGN KEY([IDSubCategoria])
REFERENCES [dbo].[SubCategoria] ([IDSubCategoria])
GO
ALTER TABLE [dbo].[CategoriasPorMicroEmpresas] CHECK CONSTRAINT [FK_CategoriasPorMicroEmpresas_SubCategoria]
GO
ALTER TABLE [dbo].[Facturas]  WITH CHECK ADD  CONSTRAINT [FK_Facturas_Clientes] FOREIGN KEY([IDCliente])
REFERENCES [dbo].[Clientes] ([IDCliente])
GO
ALTER TABLE [dbo].[Facturas] CHECK CONSTRAINT [FK_Facturas_Clientes]
GO
ALTER TABLE [dbo].[Facturas]  WITH CHECK ADD  CONSTRAINT [FK_Facturas_Planes] FOREIGN KEY([IDPlan])
REFERENCES [dbo].[Planes] ([IDPlan])
GO
ALTER TABLE [dbo].[Facturas] CHECK CONSTRAINT [FK_Facturas_Planes]
GO
ALTER TABLE [dbo].[Historial_Registro]  WITH CHECK ADD  CONSTRAINT [FK_Historial_Registro_MicroEmpresas] FOREIGN KEY([IDHistorialReg])
REFERENCES [dbo].[MicroEmpresas] ([IDMicroEmpresa])
GO
ALTER TABLE [dbo].[Historial_Registro] CHECK CONSTRAINT [FK_Historial_Registro_MicroEmpresas]
GO
ALTER TABLE [dbo].[MicroEmpresas]  WITH CHECK ADD  CONSTRAINT [FK_MicroEmpresas_Clientes] FOREIGN KEY([IDCliente])
REFERENCES [dbo].[Clientes] ([IDCliente])
GO
ALTER TABLE [dbo].[MicroEmpresas] CHECK CONSTRAINT [FK_MicroEmpresas_Clientes]
GO
ALTER TABLE [dbo].[Parametros]  WITH CHECK ADD  CONSTRAINT [FK_Parametros_Clases] FOREIGN KEY([IDClase])
REFERENCES [dbo].[Clases] ([IDClase])
GO
ALTER TABLE [dbo].[Parametros] CHECK CONSTRAINT [FK_Parametros_Clases]
GO
ALTER TABLE [dbo].[Perfil_Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Perfil_Usuario_Perfiles] FOREIGN KEY([IDPerfil])
REFERENCES [dbo].[Perfiles] ([IDPerfil])
GO
ALTER TABLE [dbo].[Perfil_Usuario] CHECK CONSTRAINT [FK_Perfil_Usuario_Perfiles]
GO
ALTER TABLE [dbo].[Perfil_Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Perfil_Usuario_Roles] FOREIGN KEY([IDRol])
REFERENCES [dbo].[Roles] ([IDRol])
GO
ALTER TABLE [dbo].[Perfil_Usuario] CHECK CONSTRAINT [FK_Perfil_Usuario_Roles]
GO
ALTER TABLE [dbo].[Perfil_Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Perfil_Usuario_Usuarios] FOREIGN KEY([IDUsuario])
REFERENCES [dbo].[Usuarios] ([IDUsuario])
GO
ALTER TABLE [dbo].[Perfil_Usuario] CHECK CONSTRAINT [FK_Perfil_Usuario_Usuarios]
GO
ALTER TABLE [dbo].[PQRS]  WITH CHECK ADD  CONSTRAINT [FK_PQRS_Clientes] FOREIGN KEY([IDCliente])
REFERENCES [dbo].[Clientes] ([IDCliente])
GO
ALTER TABLE [dbo].[PQRS] CHECK CONSTRAINT [FK_PQRS_Clientes]
GO
ALTER TABLE [dbo].[PQRS]  WITH CHECK ADD  CONSTRAINT [FK_PQRS_Parametros] FOREIGN KEY([IDParametro])
REFERENCES [dbo].[Parametros] ([IDParametro])
GO
ALTER TABLE [dbo].[PQRS] CHECK CONSTRAINT [FK_PQRS_Parametros]
GO
ALTER TABLE [dbo].[SubCategoria]  WITH CHECK ADD  CONSTRAINT [FK_SubCategoria_Categorias] FOREIGN KEY([IDCategoria])
REFERENCES [dbo].[Categorias] ([IDCategoria])
GO
ALTER TABLE [dbo].[SubCategoria] CHECK CONSTRAINT [FK_SubCategoria_Categorias]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Usuarios_Clientes1] FOREIGN KEY([IDCliente])
REFERENCES [dbo].[Clientes] ([IDCliente])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_Usuarios_Clientes1]
GO
/****** Object:  StoredProcedure [dbo].[getClientes]    Script Date: 5/06/2020 11:26:20 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
#Fecha: 27-Marzo-2020
#Descripción: Procedimiento encargado de listar todos los clientes.
#Desarrollador por: Sixto José Romero Martínez
*/
--EXEC getClientes
CREATE PROCEDURE [dbo].[getClientes]
AS
	SELECT IDCliente
	,Nombres
	,Apellidos
	,Sexo	
	,FechaCumpleanos
	,Correo
	,Foto
	,FechaCreacion FROM [dbo].[Clientes]
GO
/****** Object:  StoredProcedure [dbo].[getClientesByID]    Script Date: 5/06/2020 11:26:20 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
#Fecha: 21-Mayo-2020
#Descripción: Procedimiento encargado de listar un cliente
#Desarrollador por: Sixto José Romero Martínez
*/
--EXEC getClientesByID 1
CREATE PROCEDURE [dbo].[getClientesByID]
	@IDCliente int
AS
SELECT c.IDCliente
      ,c.Nombres
      ,c.Apellidos
      ,c.Sexo
      ,c.FechaCumpleanos
      ,c.Correo
      ,c.FechaCreacion
      ,c.Activo	  
	  ,c.Foto
	  ,u.Password
  FROM [dbo].[Clientes] c
  INNER JOIN [dbo].[Usuarios] u
  ON c.IDCliente = u.IDCliente
  WHERE c.IDCliente = @IDCliente
  

GO
/****** Object:  StoredProcedure [dbo].[getMicroEmpresas]    Script Date: 5/06/2020 11:26:20 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
#Fecha: 09-Abril-2020
#Descripción: Procedimiento encargado de listar todas las MicroEmpresas por IDCliente.
#Desarrollador por: Sixto José Romero Martínez
*/
--EXEC getMicroEmpresas 11
CREATE PROCEDURE [dbo].[getMicroEmpresas]
	@IDCliente INT
AS
SELECT TOP (1000) [IDMicroEmpresa]
      ,[IDCliente]
      ,[Nombre]
      ,[Descripcion]
      ,[Fax]
      ,[Telefono]
      ,[Celular]
      ,[Direccion]
      ,[Longitud]
      ,[Latitud]
      ,[FechaCreacion]
  FROM [AdsPublisher].[dbo].[MicroEmpresas] WHERE  IDCliente = @IDCliente
GO
/****** Object:  StoredProcedure [dbo].[TableToClass]    Script Date: 5/06/2020 11:26:20 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sixto José Romero Martínez
-- Create date: 21/03/2020
-- Description:	Exporta clases en C# en base a una tabla
-- How Exec: exec TableToClass @TableName = 'Banks'
-- =============================================
CREATE PROCEDURE [dbo].[TableToClass]
	-- Add the parameters for the stored procedure here
	@TableName sysname 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	declare @Result varchar(max) = 'public class ' + @TableName + '
{'

select @Result = @Result + '
    public ' + ColumnType + NullableSign + ' ' + ColumnName + ' { get; set; }
'
from
(
    select 
        replace(col.name, ' ', '_') ColumnName,
        column_id ColumnId,
        case typ.name 
            when 'bigint' then 'long'
            when 'binary' then 'byte[]'
            when 'bit' then 'bool'
            when 'char' then 'string'
            when 'date' then 'DateTime'
            when 'datetime' then 'DateTime'
            when 'datetime2' then 'DateTime'
            when 'datetimeoffset' then 'DateTimeOffset'
            when 'decimal' then 'decimal'
            when 'float' then 'float'
            when 'image' then 'byte[]'
            when 'int' then 'int'
            when 'money' then 'decimal'
            when 'nchar' then 'string'
            when 'ntext' then 'string'
            when 'numeric' then 'decimal'
            when 'nvarchar' then 'string'
            when 'real' then 'double'
            when 'smalldatetime' then 'DateTime'
            when 'smallint' then 'short'
            when 'smallmoney' then 'decimal'
            when 'text' then 'string'
            when 'time' then 'TimeSpan'
            when 'timestamp' then 'DateTime'
            when 'tinyint' then 'byte'
            when 'uniqueidentifier' then 'Guid'
            when 'varbinary' then 'byte[]'
            when 'varchar' then 'string'
            else 'UNKNOWN_' + typ.name
        end ColumnType,
        case 
            when col.is_nullable = 1 and typ.name in ('bigint', 'bit', 'date', 'datetime', 'datetime2', 'datetimeoffset', 'decimal', 'float', 'int', 'money', 'numeric', 'real', 'smalldatetime', 'smallint', 'smallmoney', 'time', 'tinyint', 'uniqueidentifier') 
            then '?' 
            else '' 
        end NullableSign
    from sys.columns col
        join sys.types typ on
            col.system_type_id = typ.system_type_id AND col.user_type_id = typ.user_type_id
    where object_id = object_id(@TableName)
) t
order by ColumnId

set @Result = @Result  + '
}'

print @Result
END
GO
/****** Object:  StoredProcedure [dbo].[uspClientesInfoUpdate]    Script Date: 5/06/2020 11:26:20 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
#Fecha: 26-Mayo-2020
#Descripción: Procedimiento encargado de actualizar los clientes
#Desarrollador por: Sixto José Romero Martínez
*/
--EXEC uspClientesInfoUpdate 'Diomedez', 'Díaz Maestre', 1, 75, '26/03/1951', 'maestre@hotmail.com', '123456'
CREATE PROCEDURE [dbo].[uspClientesInfoUpdate]
	@IDCliente int
	,@Nombres nvarchar(250)
	,@Apellidos nvarchar(250)
	,@Sexo int	
	,@FechaCumpleanos datetime	
AS
BEGIN
SET NOCOUNT ON;
BEGIN 	
BEGIN TRANSACTION
	BEGIN TRY	
		
		UPDATE [dbo].[Clientes] SET Nombres = @Nombres
		,Apellidos = @Apellidos
		,Sexo = @Sexo		
		,FechaCumpleanos = @FechaCumpleanos
		WHERE IDCliente = @IDCliente
		
COMMIT TRANSACTION
	SELECT 'success'
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION
	SELECT ERROR_MESSAGE();	
END CATCH
END
END
GO
/****** Object:  StoredProcedure [dbo].[uspClientesInsert]    Script Date: 5/06/2020 11:26:20 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
#Fecha: 27-Marzo-2020
#Descripción: Procedimiento encargado de crear los clientes y usuarios.
#Desarrollador por: Sixto José Romero Martínez
*/
--EXEC uspClientesInsert 'Sixto José', 'Romero Martínez', 1, '30/04/1982', '1sixto.jose@gmail.com', '123456'
CREATE PROCEDURE [dbo].[uspClientesInsert]
	@Nombres nvarchar(250)
	,@Apellidos nvarchar(250)
	,@Sexo int	
	,@FechaCumpleanos datetime
	,@Correo nvarchar(250)
	,@Password nvarchar(MAX)
AS
BEGIN
SET NOCOUNT ON;
BEGIN TRANSACTION
	BEGIN TRY		
		
		IF OBJECT_ID('tempdb..#TempErr') IS NOT NULL DROP TABLE #TempErr;		
		
		CREATE TABLE #TempErr
		(
			[ID] int IDENTITY(1,1) NOT NULL,
			[Descripcion] nvarchar(20)
		)

		DECLARE @IDCliente INT
		DECLARE @IDUsuario INT
		DECLARE @EMAIL NVARCHAR(500)

		SELECT @EMAIL = Correo FROM [dbo].[Clientes] WHERE Correo = @Correo

		
		IF ISNULL(@EMAIL, '') = ''
		BEGIN
			INSERT INTO [dbo].[Clientes] (Nombres
			,Apellidos
			,Sexo			
			,FechaCumpleanos
			,Correo
			,FechaCreacion
			,Activo
			,Foto)
			VALUES (@Nombres
			,@Apellidos
			,@Sexo			
			,@FechaCumpleanos
			,@Correo
			,GETDATE()
			,0
			,'person.png')

			SELECT @IDCliente = IDENT_CURRENT('[dbo].[Clientes]');

			INSERT INTO [dbo].[Usuarios] (
				IDCliente
				,Usuario
				,Password
				,FechaCreacion)
			VALUES (
				@IDCliente
				,@Correo
				,@Password
				,GETDATE()
			)

			SELECT @IDUsuario = IDENT_CURRENT('[dbo].[Usuarios]');

			INSERT INTO [dbo].[Perfil_Usuario] (IDRol, IDPerfil, IDUsuario, Descripcion, FechaCreacion) VALUES (2, 2, @IDUsuario, 'Buscar Microempresas', GETDATE())
			INSERT INTO [dbo].[Perfil_Usuario] (IDRol, IDPerfil, IDUsuario, Descripcion, FechaCreacion) VALUES (2, 3, @IDUsuario, 'Publicar Microempresa', GETDATE())
			INSERT INTO [dbo].[Perfil_Usuario] (IDRol, IDPerfil, IDUsuario, Descripcion, FechaCreacion) VALUES (2, 4, @IDUsuario, 'Calificar', GETDATE())
			INSERT INTO [dbo].[Perfil_Usuario] (IDRol, IDPerfil, IDUsuario, Descripcion, FechaCreacion) VALUES (2, 5, @IDUsuario, 'Histórico de Visitas', GETDATE())
			INSERT INTO [dbo].[Perfil_Usuario] (IDRol, IDPerfil, IDUsuario, Descripcion, FechaCreacion) VALUES (2, 6, @IDUsuario, 'PQRS', GETDATE())


		END		
		
COMMIT TRANSACTION
	
	INSERT INTO MessageError (Descripcion) values (@EMAIL)

	IF ISNULL(@EMAIL, '') = ''
	BEGIN
		SELECT 'success'
	END
	ELSE
	BEGIN
		--INSERT INTO MessageError (Descripcion) values (ERROR_MESSAGE())
		SELECT  'failed'
	END
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION
	SELECT ERROR_MESSAGE();	
END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[uspClientesUpdate]    Script Date: 5/06/2020 11:26:20 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
#Fecha: 27-Marzo-2020
#Descripción: Procedimiento encargado de actualizar los clientes y usuarios.
#Desarrollador por: Sixto José Romero Martínez
*/
--EXEC uspClientesUpdate 'Diomedez', 'Díaz Maestre', 1, 75, '26/03/1951', 'maestre@hotmail.com', '123456'
CREATE PROCEDURE [dbo].[uspClientesUpdate]
	@IDCliente int
	,@Nombres nvarchar(250)
	,@Apellidos nvarchar(250)
	,@Sexo int	
	,@FechaCumpleanos datetime
	,@Correo nvarchar(250)
	,@Password nvarchar(MAX)
	,@Foto nvarchar(500)
AS
BEGIN
SET NOCOUNT ON;
BEGIN 	
BEGIN TRANSACTION
	BEGIN TRY	
		
		UPDATE [dbo].[Clientes] SET Nombres = @Nombres
		,Apellidos = @Apellidos
		,Sexo = @Sexo		
		,FechaCumpleanos = @FechaCumpleanos
		,Foto = @Foto
		WHERE IDCliente = @IDCliente

		UPDATE [dbo].[Usuarios] SET Password = @Password
		WHERE IDCliente = @IDCliente
		
		
COMMIT TRANSACTION
	SELECT 'success'
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION
	SELECT ERROR_MESSAGE();	
END CATCH
END
END
GO
/****** Object:  StoredProcedure [dbo].[uspDelMicroEmpresa]    Script Date: 5/06/2020 11:26:20 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
#Fecha: 10-Abril-2020
#Descripción: Procedimiento encargado de eliminar la microempresa seleccionada.
#Desarrollador por: Sixto José Romero Martínez
*/
--EXEC uspDelMicroEmpresa 4010
CREATE PROCEDURE [dbo].[uspDelMicroEmpresa]
	@IDMicroEmpresa INT
AS
BEGIN
SET NOCOUNT ON;
BEGIN TRANSACTION
	BEGIN TRY		

	DELETE FROM [dbo].[CategoriasPorMicroEmpresas] WHERE IDMicroEmpresa = @IDMicroEmpresa
	DELETE FROM [dbo].[MicroEmpresas] WHERE IDMicroEmpresa = @IDMicroEmpresa

	COMMIT TRANSACTION

	SELECT 'success'

END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION
	SELECT ERROR_MESSAGE();	
END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[uspDelPQRS]    Script Date: 5/06/2020 11:26:20 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
#Fecha: 13-Abril-2020
#Descripción: Procedimiento encargado de eliminar la pqrs seleccionada
#Desarrollador por: Sixto José Romero Martínez
*/
--EXEC uspDelPQRS 1
CREATE PROCEDURE [dbo].[uspDelPQRS]
	@IDPQRS INT
AS
DELETE FROM [dbo].[PQRS] WHERE IDPQRS = @IDPQRS
GO
/****** Object:  StoredProcedure [dbo].[uspFacturasUpdate]    Script Date: 5/06/2020 11:26:20 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
#Fecha: 27-Marzo-2020
#Descripción: Procedimiento encargado de actualizar la factura por IDMicroEmpresa
#Desarrollador por: Sixto José Romero Martínez
*/
--EXEC uspFacturasUpdate 11,2,25400
CREATE PROCEDURE [dbo].[uspFacturasUpdate]
	@IDCliente int	
	,@IDPlan int	
	,@Valor_Plan_Actual decimal(16,3)
AS
BEGIN
SET NOCOUNT ON;
BEGIN 	
BEGIN TRANSACTION
	BEGIN TRY	
		DECLARE @Count int
			
		SELECT @Count = COUNT(*)  FROM [dbo].[Facturas] f		
		WHERE f.IDCliente = @IDCliente

		IF @Count = 0 
		BEGIN
			INSERT INTO [dbo].[Facturas]  (IDCliente
										,IDPlan
										,Valor_Plan_Actual
										,FechaCreacion)
			VALUES (@IDCliente, @IDPlan, @Valor_Plan_Actual, GETDATE())
		END
		ELSE
		BEGIN
			UPDATE [dbo].[Facturas] SET IDPlan = @IDPlan
			,Valor_Plan_Actual = @Valor_Plan_Actual
			WHERE IDCliente = @IDCliente
		END
		
COMMIT TRANSACTION
	SELECT 'success'
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION
	SELECT ERROR_MESSAGE();	
END CATCH
END
END
GO
/****** Object:  StoredProcedure [dbo].[UspgetCategorias]    Script Date: 5/06/2020 11:26:20 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
#Fecha: 21-Abril-2020
#Descripción: Procedimiento encargado de Listar los planes
#Desarrollador por: Sixto José Romero Martínez
*/
--EXEC [dbo].[UspgetCategorias]
CREATE PROCEDURE [dbo].[UspgetCategorias]
AS
	SELECT IDCategoria
,Descripcion
,FechaCreacion FROM [dbo].[Categorias]
GO
/****** Object:  StoredProcedure [dbo].[UspgetFacturasByID]    Script Date: 5/06/2020 11:26:20 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
#Fecha: 10-Abril-2020
#Descripción: Procedimiento encargado de Listar las facturas de la emrpesa
#Desarrollador por: Sixto José Romero Martínez
*/
--EXEC [dbo].[UspgetFacturasByID] 11
CREATE PROCEDURE [dbo].[UspgetFacturasByID]
	@IDCliente INT
AS
	SELECT f.IDFactura
	,f.IDCliente
	,f.IDPlan
	,f.Valor_Plan_Actual
	,f.FechaCreacion FROM [dbo].[Facturas] f 
	--INNER JOIN [dbo].[MicroEmpresas] m
	--ON f.IDCliente= m.IDCliente	
	WHERE f.IDCliente = @IDCliente
GO
/****** Object:  StoredProcedure [dbo].[UspGetFiltroMicroEmpresas]    Script Date: 5/06/2020 11:26:20 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
#Fecha: 09-Abril-2020
#Descripción: Procedimiento encargado de listar todas las MicroEmpresas por IDCliente.
#Desarrollador por: Sixto José Romero Martínez
*/
--EXEC UspGetFiltroMicroEmpresas '7,8,9', ''
CREATE PROCEDURE [dbo].[UspGetFiltroMicroEmpresas]
	@SubCategorias nvarchar(80),
	@Direccion nvarchar(250),
	@Microempresa nvarchar(250)
AS

IF LEN(@SubCategorias) > 0
BEGIN

	SELECT Distinct
		me.IDMicroEmpresa, me.Nombre, me.Descripcion, me.Telefono, me.Celular, me.Direccion, me.Longitud, me.Latitud 
	FROM [dbo].[MicroEmpresas] me
	INNER JOIN [dbo].[CategoriasPorMicroEmpresas] cm 
	ON me.IDMicroEmpresa = cm.IDMicroEmpresa 
	WHERE cm.IDSubCategoria IN (SELECT value
			FROM STRING_SPLIT(@SubCategoriaS, ',')  
			WHERE RTRIM(value) <> '') AND me.Direccion LIKE '%' + @Direccion + '%' AND Nombre LIKE '%' + @Microempresa + '%' AND me.Estado = 1

END
ELSE
BEGIN

	SELECT Distinct
		me.IDMicroEmpresa, me.Nombre, me.Descripcion, me.Telefono, me.Celular, me.Direccion, me.Longitud, me.Latitud 
	FROM [dbo].[MicroEmpresas] me
	INNER JOIN [dbo].[CategoriasPorMicroEmpresas] cm 
	ON me.IDMicroEmpresa = cm.IDMicroEmpresa 
	WHERE me.Direccion LIKE '%' + @Direccion + '%' AND  Nombre LIKE '%' + @Microempresa + '%' AND me.Estado = 1

END
GO
/****** Object:  StoredProcedure [dbo].[UspgetHistorialPagosByID]    Script Date: 5/06/2020 11:26:20 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
#Fecha: 29-Abril-2020
#Descripción: Procedimiento encargado de listar el historial de pago
#Desarrollador por: Sixto José Romero Martínez
*/
--EXEC UspgetHistorialPagosByID 11
CREATE PROCEDURE [dbo].[UspgetHistorialPagosByID]
	@IDCliente int
AS
	SELECT hp.IDHistorialPago
	,hp.IDFactura
	,hp.Valor_Pago
	,hp.FechaCreacion
	,hp.FechaCulminacion
	,hp.Estado 
	,P.IDPlan
	,p.Titulo
	,P.Descripcion
	,p.Precio
	,p.NroMeses FROM [dbo].[Historial_Pagos] hp
	INNER JOIN [dbo].[Facturas] f ON hp.IDFactura = f.IDFactura
	INNER JOIN [dbo].[Clientes] c ON c.IDCliente = f.IDCliente
	INNER JOIN [dbo].[Planes] p ON f.IDPlan = p.IDPlan
	WHERE c.IDCliente = @IDCliente AND Convert(VARCHAR(10), hp.FechaCulminacion, 101) >= Convert(VARCHAR(10), GETDATE(), 101)
	ORDER BY hp.IDHistorialPago DESC
GO
/****** Object:  StoredProcedure [dbo].[uspGetLogin]    Script Date: 5/06/2020 11:26:20 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
#Fecha: 27-Marzo-2020
#Descripción: Procedimiento encargado de listar todos los clientes.
*/
--EXEC uspGetLogin 'sixto.jose@gmail.com', '51x70'
CREATE PROCEDURE [dbo].[uspGetLogin]
	@Usuario nvarchar(500),
	@Password nvarchar(max)
AS
SELECT c.IDCliente
      ,c.Nombres
      ,c.Apellidos
      ,c.Sexo
      ,c.FechaCumpleanos
      ,c.Correo
      ,c.FechaCreacion
      ,c.Activo
	  ,c.Foto
  FROM [dbo].[Clientes] c
  INNER JOIN [dbo].[Usuarios] u on c.IDCliente = u.IDCliente
  WHERE u.Usuario = @Usuario and Password = @Password and c.Activo = 1

  
  
GO
/****** Object:  StoredProcedure [dbo].[UspgetMicroEmpresaByID]    Script Date: 5/06/2020 11:26:20 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
#Fecha: 09-Abril-2020
#Descripción: Procedimiento encargado de consultar la microempresa por IDMicroEmpresa
#Desarrollador por: Sixto José Romero Martínez
*/
--EXEC UspgetMicroEmpresaByID 11
CREATE PROCEDURE [dbo].[UspgetMicroEmpresaByID]
	@IDMicroEmpresa INT
AS
SELECT IDMicroEmpresa
,IDCliente
,Nombre
,Descripcion
,Fax
,Telefono
,Celular
,Direccion
,Longitud
,Latitud
,FechaCreacion
,IDCategoria FROM [dbo].[MicroEmpresas] WHERE IDMicroEmpresa = @IDMicroEmpresa
GO
/****** Object:  StoredProcedure [dbo].[UspGetMicroEmpresas]    Script Date: 5/06/2020 11:26:20 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
#Fecha: 09-Abril-2020
#Descripción: Procedimiento encargado de listar todas las MicroEmpresas por IDCliente.
#Desarrollador por: Sixto José Romero Martínez
*/
--EXEC UspGetMicroEmpresas 11
CREATE PROCEDURE [dbo].[UspGetMicroEmpresas]
	@IDCliente INT
AS
SELECT m.IDMicroEmpresa
      ,m.IDCliente
      ,m.Nombre
      ,m.Descripcion
      ,m.Fax
      ,m.Telefono
      ,m.Celular
      ,m.Direccion
      ,m.Longitud
      ,m.Latitud
      ,m.FechaCreacion
	  ,f.IDPlan
	  ,m.IDCategoria
  FROM  [dbo].[MicroEmpresas] m 
  INNER JOIN [dbo].[Facturas] f
  ON m.IDCliente = f.IDCliente
  WHERE  m.IDCliente = @IDCliente
GO
/****** Object:  StoredProcedure [dbo].[UspGetParametros]    Script Date: 5/06/2020 11:26:20 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
#Fecha: 11-Abril-2020
#Descripción: Procedimiento encargado de listar los parámetros por IDClase
#Desarrollador por: Sixto José Romero Martínez
*/
--EXEC UspGetParametros 1
CREATE PROCEDURE [dbo].[UspGetParametros]
	@IDClase INT
AS
SELECT IDParametro
,IDClase
,Descripcion
,FechaCreacion FROM [dbo].[Parametros] WHERE IDClase = @IDClase
GO
/****** Object:  StoredProcedure [dbo].[uspGetParametrosByIDClase]    Script Date: 5/06/2020 11:26:20 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
#Fecha: 10-Abril-2020
#Descripción: Procedimiento encargado de Listar los parámetros por el ID de la clase
#Desarrollador por: Sixto José Romero Martínez
*/
--EXEC uspGetParametrosByIDClase 1
CREATE PROCEDURE [dbo].[uspGetParametrosByIDClase]
	@IDClase INT
AS
SELECT IDParametro
,IDClase
,Descripcion
,FechaCreacion FROM 
[dbo].[Parametros] WHERE IDClase = @IDClase
GO
/****** Object:  StoredProcedure [dbo].[UspgetPlanes]    Script Date: 5/06/2020 11:26:20 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
#Fecha: 21-Abril-2020
#Descripción: Procedimiento encargado de Listar los planes
#Desarrollador por: Sixto José Romero Martínez
*/
--EXEC [dbo].[UspgetPlanes] 1
CREATE PROCEDURE [dbo].[UspgetPlanes]
AS
	SELECT IDPlan
		,Titulo
		,Descripcion
		,Precio
		,Detalle
		,FechaCreacion
		,Estado	FROM [dbo].[Planes] WHERE Estado = 1
GO
/****** Object:  StoredProcedure [dbo].[UspgetPlanesByID]    Script Date: 5/06/2020 11:26:20 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
#Fecha: 25-Abril-2020
#Descripción: Procedimiento encargado de listar el plan por IDPlan
#Desarrollador por: Sixto José Romero Martínez
*/
--EXEC UspgetPlanesByID 3
CREATE PROCEDURE [dbo].[UspgetPlanesByID]
	@IDPlan INT
AS
SELECT * FROM [dbo].[Planes] WHERE IDPlan = @IDPlan
GO
/****** Object:  StoredProcedure [dbo].[UspGetPQRS]    Script Date: 5/06/2020 11:26:20 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
#Fecha: 10-Abril-2020
#Descripción: Procedimiento encargado de Listar las PQRS
#Desarrollador por: Sixto José Romero Martínez
*/
--EXEC [dbo].[UspGetPQRS] 1
CREATE PROCEDURE [dbo].[UspGetPQRS]
	@IDCliente INT	
AS
	SELECT q.IDPQRS
		,q.IDParametro
		,q.Asunto
		,q.Descripcion
		,q.IDCliente
		,q.FechaCreacion
		,P.Descripcion AS TipoPeticion	FROM [dbo].[PQRS] q		
	INNER JOIN [dbo].[Parametros] p
	ON q.IDParametro = P.IDParametro
	WHERE IDCliente = @IDCliente
GO
/****** Object:  StoredProcedure [dbo].[UspgetPQRSByID]    Script Date: 5/06/2020 11:26:20 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
#Fecha: 10-Abril-2020
#Descripción: Procedimiento encargado de Listar las PQRS
#Desarrollador por: Sixto José Romero Martínez
*/
--EXEC [dbo].[UspgetPQRSByID] 1
CREATE PROCEDURE [dbo].[UspgetPQRSByID]
	@IDPQRS INT	
AS
	SELECT IDPQRS
		,IDParametro
		,Asunto
		,Descripcion
		,IDCliente
		,FechaCreacion FROM [dbo].[PQRS]
		
	WHERE IDPQRS = @IDPQRS

	
GO
/****** Object:  StoredProcedure [dbo].[UspgetSubCategorias]    Script Date: 5/06/2020 11:26:20 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
#Fecha: 04-Mayo-2020
#Descripción: Procedimiento encargado de Listar las subcategorías por Categoría
#Desarrollador por: Sixto José Romero Martínez
*/
--EXEC [dbo].[UspgetSubCategorias] 1
CREATE PROCEDURE [dbo].[UspgetSubCategorias]
	@IDCategoria int
AS
	SELECT 
		IDSubCategoria
		,IDCategoria
		,Descripcion
		,FechaCreacion
	FROM [dbo].[SubCategoria] WHERE IDCategoria = @IDCategoria
GO
/****** Object:  StoredProcedure [dbo].[UspgetSubCategoriasById]    Script Date: 5/06/2020 11:26:20 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
#Fecha: 09-Abril-2020
#Descripción: Procedimiento encargado de consultar las subcategorías por IDEmpresa
#Desarrollador por: Sixto José Romero Martínez
*/
--EXEC UspgetSubCategoriasById 4005
CREATE PROCEDURE [dbo].[UspgetSubCategoriasById]
	@IDMicroEmpresa INT
AS
SELECT IDCatMicroEmpresa
,c.IDCategoria
,c.IDSubCategoria
,c.IDMicroEmpresa
,c.FechaCreacion
,s.Descripcion FROM [dbo].[CategoriasPorMicroEmpresas]  c
INNER JOIN [dbo].[SubCategoria] s 
ON c.IDSubCategoria = s.IDSubCategoria
WHERE IDMicroEmpresa = @IDMicroEmpresa
GO
/****** Object:  StoredProcedure [dbo].[uspHistorialPagosInsert]    Script Date: 5/06/2020 11:26:20 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
#Fecha: 25-Abril-2020
#Descripción: Procedimiento encargado de crear los clientes y usuarios.
#Desarrollador por: Sixto José Romero Martínez
*/
--EXEC [dbo].[uspHistorialPagosInsert] 
CREATE PROCEDURE [dbo].[uspHistorialPagosInsert]
	@IDFactura INT
	,@Valor_Pago DECIMAL(16,3)
	,@NroMeses INT
AS
BEGIN
SET NOCOUNT ON;
BEGIN 	
BEGIN TRANSACTION
	BEGIN TRY				
		
		INSERT INTO [dbo].[Historial_Pagos] (
			IDFactura
			,Valor_Pago
			,FechaCreacion
			,FechaCulminacion
			,Estado
		) VALUES (
			@IDFactura
			,@Valor_Pago
			,GETDATE()
			,DATEADD(MONTH, @NroMeses, GETDATE())
			,1
		)		
		

COMMIT TRANSACTION
			SELECT 'success'
		END TRY
		BEGIN CATCH
			ROLLBACK TRANSACTION
			SELECT ERROR_MESSAGE();
		END CATCH
	END
END
GO
/****** Object:  StoredProcedure [dbo].[uspMicroEmpresaInsert]    Script Date: 5/06/2020 11:26:20 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
#Fecha: 27-Marzo-2020
#Descripción: Procedimiento encargado de crear los clientes y usuarios.
#Desarrollador por: Sixto José Romero Martínez
*/
--EXEC [dbo].[uspMicroEmpresaInsert] 
CREATE PROCEDURE [dbo].[uspMicroEmpresaInsert]
	@IDCliente INT
	,@Nombre NVARCHAR(250)
	,@Descripcion NVARCHAR(250)
	,@Fax NVARCHAR(80)
	,@Telefono NVARCHAR(80)
	,@Celular NVARCHAR(80)
	,@Direccion NVARCHAR(250)
	,@Longitud NVARCHAR(250)
	,@Latitud NVARCHAR(250)
	,@subcategorias NVARCHAR(150)
	,@IDCategoria INT
AS
BEGIN
SET NOCOUNT ON;
BEGIN 	
BEGIN TRANSACTION
	BEGIN TRY
		
		DECLARE @IDMicroEmpresa INT
		DECLARE @IDPlan INT
		DECLARE @IDFactura INT
		
		INSERT INTO [dbo].[MicroEmpresas] (
		IDCliente
		,Nombre
		,Descripcion
		,Fax
		,Telefono
		,Celular
		,Direccion
		,Longitud
		,Latitud
		,FechaCreacion
		,IDCategoria
		,Estado
		) VALUES (
		@IDCliente
		,@Nombre
		,@Descripcion
		,@Fax
		,@Telefono
		,@Celular
		,@Direccion
		,@Longitud
		,@Latitud
		,getdate()
		,@IDCategoria
		,1
		)

		SELECT @IDMicroEmpresa = IDENT_CURRENT('[dbo].[MicroEmpresas]');
		
		DECLARE @Count int
			
		SELECT @Count = COUNT(*)  FROM [dbo].[Facturas] f
		INNER JOIN [dbo].[MicroEmpresas] m 
		ON f.IDCliente = m.IDCliente
		INNER JOIN [dbo].[Clientes] c
		ON c.IDCliente = m.IDCliente
		WHERE c.IDCliente = @IDCliente

		IF @Count = 0 
		BEGIN
			INSERT INTO [dbo].[Facturas]  (IDCliente
										,IDPlan
										,Valor_Plan_Actual
										,FechaCreacion)
			VALUES (@IDCliente, 1, 0, GETDATE())

			--SELECT @IDFactura = IDENT_CURRENT('[dbo].[Facturas]');

			--INSERT INTO [dbo].[Historial_Pagos] (IDFactura
			--,FechaCreacion
			--,FechaCulminacion) VALUES (
			--	@IDFactura, 
			--	GETDATE(),
			--	DATEADD(MONTH, 1, GETDATE())
			--)

		END
		

		INSERT INTO [dbo].[CategoriasPorMicroEmpresas] 
		(	
			IDCategoria
			,IDSubCategoria
			,IDMicroEmpresa
			,FechaCreacion
		)
		SELECT @IDCategoria, value, @IDMicroEmpresa, getdate()
		FROM STRING_SPLIT(@subcategorias, ',')  
		WHERE RTRIM(value) <> '';


COMMIT TRANSACTION
			SELECT 'success'
		END TRY
		BEGIN CATCH
			ROLLBACK TRANSACTION
			SELECT ERROR_MESSAGE();
		END CATCH
	END
END
GO
/****** Object:  StoredProcedure [dbo].[uspMicroEmpresaUpdate]    Script Date: 5/06/2020 11:26:20 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
#Fecha: 10-Abril-2020
#Descripción: Procedimiento encargado de actualizar la microempresa.
#Desarrollador por: Sixto José Romero Martínez
*/
--EXEC [dbo].[uspMicroEmpresaInsert] 
CREATE PROCEDURE [dbo].[uspMicroEmpresaUpdate]
	@IDMicroEmpresa INT
	,@IDCliente INT
	,@Nombre NVARCHAR(250)
	,@Descripcion NVARCHAR(250)	
	,@Telefono NVARCHAR(80)
	,@Celular NVARCHAR(80)
	,@Direccion NVARCHAR(250)
	,@Longitud NVARCHAR(250)
	,@Latitud NVARCHAR(250)
	,@Subcategorias NVARCHAR(150)
	,@IDCategoria INT
AS
BEGIN
SET NOCOUNT ON;
BEGIN 	
BEGIN TRANSACTION
	BEGIN TRY

	UPDATE [dbo].[MicroEmpresas]
	SET Nombre = @Nombre
	,Descripcion = @Descripcion	
	,Telefono = @Telefono
	,Celular = @Celular
	,Direccion = @Direccion
	,Longitud = @Longitud
	,Latitud = @Latitud 
	,IDCategoria = @IDCategoria WHERE IDMicroEmpresa = @IDMicroEmpresa
	
	DELETE FROM [dbo].[CategoriasPorMicroEmpresas]  WHERE IDMicroEmpresa = @IDMicroEmpresa	

	INSERT INTO [dbo].[CategoriasPorMicroEmpresas] 
	(	
		IDCategoria
		,IDSubCategoria
		,IDMicroEmpresa
		,FechaCreacion
	)
	SELECT @IDCategoria, value, @IDMicroEmpresa, getdate()
	FROM STRING_SPLIT(@Subcategorias, ',')
	WHERE RTRIM(value) <> '';

COMMIT TRANSACTION
			SELECT 'success'
		END TRY
		BEGIN CATCH
			ROLLBACK TRANSACTION
			SELECT ERROR_MESSAGE();
		END CATCH
	END
END
GO
/****** Object:  StoredProcedure [dbo].[uspPQRSInsert]    Script Date: 5/06/2020 11:26:20 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
#Fecha: 10-Abril-2020
#Descripción: Procedimiento encargado de crear las PQRS de el cliente
#Desarrollador por: Sixto José Romero Martínez
*/

--EXEC [dbo].[uspPQRSInsert] 
CREATE PROCEDURE [dbo].[uspPQRSInsert]	
	@IDParametro INT
	,@Asunto NVARCHAR(250)
	,@Descripcion NVARCHAR(MAX)
	,@IDCliente INT	
AS
BEGIN TRY	

	INSERT INTO [dbo].[PQRS] (IDParametro
	,Asunto
	,Descripcion
	,IDCliente
	,Estado
	,FechaCreacion
	) VALUES (
	@IDParametro
	,@Asunto
	,@Descripcion
	,@IDCliente
	,'P'
	,GETDATE())

	SELECT 'success'
END TRY
BEGIN CATCH	
	SELECT ERROR_MESSAGE();
END CATCH

GO
/****** Object:  StoredProcedure [dbo].[uspPQRSUpdate]    Script Date: 5/06/2020 11:26:20 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
#Fecha: 10-Abril-2020
#Descripción: Procedimiento encargado de crear las PQRS de el cliente
#Desarrollador por: Sixto José Romero Martínez
*/
--EXEC [dbo].[uspPQRSUpdate]
CREATE PROCEDURE [dbo].[uspPQRSUpdate]
	@IDPQRS INT
	,@IDParametro INT
	,@Asunto NVARCHAR(250)
	,@Descripcion NVARCHAR(MAX)
	,@IDCliente INT	
AS
BEGIN TRY

	UPDATE [dbo].[PQRS] SET IDParametro = @IDParametro
		,Asunto = @Asunto
		,Descripcion = @Descripcion
		,IDCliente = @IDCliente
	WHERE IDPQRS = @IDPQRS

	SELECT 'success'
END TRY
BEGIN CATCH	
	SELECT ERROR_MESSAGE();
END CATCH

GO
/****** Object:  StoredProcedure [dbo].[uspSetActivate]    Script Date: 5/06/2020 11:26:20 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
#Fecha: 29-Marzo-2020
#Descripción: Procedimiento encargado de Activar el cliente para usar la App.
#Desarrollador por: Sixto José Romero Martínez
*/
--EXEC uspSetActivate 'sixto.jose@gmail.com'
CREATE PROCEDURE [dbo].[uspSetActivate]
	@Correo nvarchar(500)
AS
	UPDATE [dbo].[Clientes] SET Activo = 1 WHERE Correo = @Correo
GO
/****** Object:  StoredProcedure [dbo].[UspSetHistorialPagosCulminados]    Script Date: 5/06/2020 11:26:20 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
#Fecha: 29-Abril-2020
#Descripción: Procedimiento encargado de listar el historial de pago y actualizar el estado en inactivo
#Desarrollador por: Sixto José Romero Martínez
*/
--EXEC UspSetHistorialPagosCulminados
CREATE PROCEDURE [dbo].[UspSetHistorialPagosCulminados]
AS
BEGIN TRY
	UPDATE [dbo].[MicroEmpresas] SET Estado = 0 
	WHERE IDCliente IN (
			SELECT DISTINCT c.IDCliente FROM [dbo].[Historial_Pagos] hp
			INNER JOIN [dbo].[Facturas] f ON hp.IDFactura = f.IDFactura
			INNER JOIN [dbo].[Clientes] c ON c.IDCliente = f.IDCliente
			INNER JOIN [dbo].[Planes] p ON f.IDPlan = p.IDPlan
			WHERE Convert(VARCHAR(10), GETDATE(), 101) > Convert(VARCHAR(10), hp.FechaCulminacion, 101)		
	)

	SELECT 'success'

END TRY
BEGIN CATCH	
	SELECT ERROR_MESSAGE();
END CATCH

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'P = Pendiente, C = Cerrado' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PQRS', @level2type=N'COLUMN',@level2name=N'Estado'
GO
USE [master]
GO
ALTER DATABASE [AdsPublisher] SET  READ_WRITE 
GO
