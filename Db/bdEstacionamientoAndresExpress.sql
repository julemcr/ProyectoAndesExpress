USE [master]
GO
/****** Object:  Database [bdEstacionamientoAndesExpress]    Script Date: 13/06/2025 16:40:04 ******/
CREATE DATABASE [bdEstacionamientoAndesExpress]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'bdEstacionamientoAndesExpress', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER2019\MSSQL\DATA\bdEstacionamientoAndesExpress.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'bdEstacionamientoAndesExpress_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER2019\MSSQL\DATA\bdEstacionamientoAndesExpress_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [bdEstacionamientoAndesExpress] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [bdEstacionamientoAndesExpress].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [bdEstacionamientoAndesExpress] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [bdEstacionamientoAndesExpress] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [bdEstacionamientoAndesExpress] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [bdEstacionamientoAndesExpress] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [bdEstacionamientoAndesExpress] SET ARITHABORT OFF 
GO
ALTER DATABASE [bdEstacionamientoAndesExpress] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [bdEstacionamientoAndesExpress] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [bdEstacionamientoAndesExpress] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [bdEstacionamientoAndesExpress] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [bdEstacionamientoAndesExpress] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [bdEstacionamientoAndesExpress] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [bdEstacionamientoAndesExpress] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [bdEstacionamientoAndesExpress] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [bdEstacionamientoAndesExpress] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [bdEstacionamientoAndesExpress] SET  DISABLE_BROKER 
GO
ALTER DATABASE [bdEstacionamientoAndesExpress] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [bdEstacionamientoAndesExpress] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [bdEstacionamientoAndesExpress] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [bdEstacionamientoAndesExpress] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [bdEstacionamientoAndesExpress] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [bdEstacionamientoAndesExpress] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [bdEstacionamientoAndesExpress] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [bdEstacionamientoAndesExpress] SET RECOVERY FULL 
GO
ALTER DATABASE [bdEstacionamientoAndesExpress] SET  MULTI_USER 
GO
ALTER DATABASE [bdEstacionamientoAndesExpress] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [bdEstacionamientoAndesExpress] SET DB_CHAINING OFF 
GO
ALTER DATABASE [bdEstacionamientoAndesExpress] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [bdEstacionamientoAndesExpress] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [bdEstacionamientoAndesExpress] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [bdEstacionamientoAndesExpress] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'bdEstacionamientoAndesExpress', N'ON'
GO
ALTER DATABASE [bdEstacionamientoAndesExpress] SET QUERY_STORE = OFF
GO
USE [bdEstacionamientoAndesExpress]
GO
/****** Object:  Table [dbo].[tAsignacionPlaza]    Script Date: 13/06/2025 16:40:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tAsignacionPlaza](
	[IdAsignacionPlaza] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[IdPlazaEstacionamiento] [decimal](18, 0) NOT NULL,
	[IdVehiculo] [decimal](18, 0) NOT NULL,
	[FechaInicio] [smalldatetime] NOT NULL,
	[FechaFin] [smalldatetime] NULL,
	[TotalTiempo] [varchar](5) NULL,
	[Estado] [int] NOT NULL,
	[Observaciones] [text] NULL,
	[UsuarioUpdate] [decimal](18, 0) NULL,
	[FechaUpdate] [smalldatetime] NULL,
 CONSTRAINT [PK_tAsignacionPlaza] PRIMARY KEY CLUSTERED 
(
	[IdAsignacionPlaza] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tCliente]    Script Date: 13/06/2025 16:40:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tCliente](
	[IdCliente] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[IdTipoDocumento] [decimal](18, 0) NULL,
	[NroDocumento] [nvarchar](20) NULL,
	[NombreCliente] [nvarchar](150) NULL,
	[DireccionCliente] [text] NULL,
	[Telefono] [nvarchar](20) NULL,
	[Correo] [nvarchar](50) NULL,
	[Observaciones] [text] NULL,
	[Estado] [int] NULL,
	[UsuarioUpdate] [decimal](18, 0) NULL,
	[FechaUpdate] [smalldatetime] NULL,
 CONSTRAINT [PK_tCliente] PRIMARY KEY CLUSTERED 
(
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tMarca]    Script Date: 13/06/2025 16:40:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tMarca](
	[IdMarca] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[Marca] [nvarchar](50) NULL,
	[Descripcion] [text] NULL,
	[Estado] [int] NULL,
	[UsuarioUpdate] [decimal](18, 0) NULL,
	[FechaUpdate] [smalldatetime] NULL,
 CONSTRAINT [PK_tMarca] PRIMARY KEY CLUSTERED 
(
	[IdMarca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tPlaya]    Script Date: 13/06/2025 16:40:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tPlaya](
	[IdPlaya] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[NombrePlaya] [nvarchar](50) NOT NULL,
	[Estado] [int] NOT NULL,
	[UsuarioUpdate] [decimal](18, 0) NULL,
	[FechaUpdate] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_tPlaya] PRIMARY KEY CLUSTERED 
(
	[IdPlaya] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tPlazaEstacionamiento]    Script Date: 13/06/2025 16:40:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tPlazaEstacionamiento](
	[IdPlazaEstacionamiento] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[IdPlaya] [decimal](18, 0) NOT NULL,
	[CodigoPlaza] [nvarchar](5) NOT NULL,
	[UbicacionPlaza] [nvarchar](50) NOT NULL,
	[EstadoActual] [int] NOT NULL,
	[Estado] [int] NOT NULL,
	[UsuarioUpdate] [decimal](18, 0) NULL,
	[FechaUpdate] [smalldatetime] NULL,
 CONSTRAINT [PK_tPlazaEstacionamiento] PRIMARY KEY CLUSTERED 
(
	[IdPlazaEstacionamiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tTipoDocumentoIdentidad]    Script Date: 13/06/2025 16:40:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tTipoDocumentoIdentidad](
	[IdTipoDocumento] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[TipoDocumento] [nvarchar](50) NOT NULL,
	[Estado] [int] NOT NULL,
	[UsuarioUpdate] [decimal](18, 0) NULL,
	[FechaUpdate] [smalldatetime] NULL,
 CONSTRAINT [PK_tTipoDocumentoIdentidad] PRIMARY KEY CLUSTERED 
(
	[IdTipoDocumento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tTipoVehiculo]    Script Date: 13/06/2025 16:40:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tTipoVehiculo](
	[IdTipoVehiculo] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[CodTipoVehiculo] [nvarchar](5) NOT NULL,
	[TipoVehiculo] [nvarchar](50) NOT NULL,
	[Observaciones] [text] NULL,
	[Estado] [int] NOT NULL,
	[UsuarioUpdate] [decimal](18, 0) NULL,
	[FechaUpdate] [smalldatetime] NULL,
 CONSTRAINT [PK_tTipoVehiculo] PRIMARY KEY CLUSTERED 
(
	[IdTipoVehiculo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tUsuario]    Script Date: 13/06/2025 16:40:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tUsuario](
	[IdUsuario] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[NombreUsuario] [nvarchar](50) NOT NULL,
	[Clave] [nvarchar](50) NOT NULL,
	[Correo] [nvarchar](50) NOT NULL,
	[Estado] [int] NOT NULL,
	[UsuarioUpdate] [decimal](18, 0) NULL,
	[FechaUpdate] [smalldatetime] NULL,
 CONSTRAINT [PK_tUsuario] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tVehiculo]    Script Date: 13/06/2025 16:40:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tVehiculo](
	[IdVehiculo] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[IdCliente] [decimal](18, 0) NOT NULL,
	[IdMarca] [decimal](18, 0) NOT NULL,
	[IdTipoVehiculo] [decimal](18, 0) NOT NULL,
	[PlacaVehiculo] [nvarchar](10) NOT NULL,
	[PlacaNueva] [nvarchar](10) NULL,
	[Observaciones] [text] NULL,
	[Estado] [int] NOT NULL,
	[UsuarioUpdate] [decimal](18, 0) NULL,
	[FechaUpdate] [smalldatetime] NULL,
 CONSTRAINT [PK_tVehiculo] PRIMARY KEY CLUSTERED 
(
	[IdVehiculo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tAsignacionPlaza] ON 

INSERT [dbo].[tAsignacionPlaza] ([IdAsignacionPlaza], [IdPlazaEstacionamiento], [IdVehiculo], [FechaInicio], [FechaFin], [TotalTiempo], [Estado], [Observaciones], [UsuarioUpdate], [FechaUpdate]) VALUES (CAST(1 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(N'2025-06-12T08:30:00' AS SmallDateTime), CAST(N'2025-06-12T10:45:00' AS SmallDateTime), N'2.45', 1, N'pruebas de edicion postman, PRUEBA DE ELIMINAR', CAST(1 AS Decimal(18, 0)), CAST(N'2025-06-13T10:58:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[tAsignacionPlaza] OFF
GO
SET IDENTITY_INSERT [dbo].[tCliente] ON 

INSERT [dbo].[tCliente] ([IdCliente], [IdTipoDocumento], [NroDocumento], [NombreCliente], [DireccionCliente], [Telefono], [Correo], [Observaciones], [Estado], [UsuarioUpdate], [FechaUpdate]) VALUES (CAST(1 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), N'11111111', N'CLIENTE 1', N'PRUEBAS', N'123456789', N'cliente1@gmail.com', NULL, 1, CAST(1 AS Decimal(18, 0)), CAST(N'2025-06-11T00:00:00' AS SmallDateTime))
INSERT [dbo].[tCliente] ([IdCliente], [IdTipoDocumento], [NroDocumento], [NombreCliente], [DireccionCliente], [Telefono], [Correo], [Observaciones], [Estado], [UsuarioUpdate], [FechaUpdate]) VALUES (CAST(2 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), N'22222222', N'CLIENTE 2', N'Sin Data', N'222222222', N'cliente2@gmail.com', NULL, 1, CAST(1 AS Decimal(18, 0)), CAST(N'2025-06-11T00:00:00' AS SmallDateTime))
INSERT [dbo].[tCliente] ([IdCliente], [IdTipoDocumento], [NroDocumento], [NombreCliente], [DireccionCliente], [Telefono], [Correo], [Observaciones], [Estado], [UsuarioUpdate], [FechaUpdate]) VALUES (CAST(3 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), N'11111111', N'CLIENTE 3', N'SIN DIRECCION', N'987654321', N'cliente3@gmail.com', N'pruebas', 1, CAST(1 AS Decimal(18, 0)), CAST(N'2025-06-13T15:25:00' AS SmallDateTime))
INSERT [dbo].[tCliente] ([IdCliente], [IdTipoDocumento], [NroDocumento], [NombreCliente], [DireccionCliente], [Telefono], [Correo], [Observaciones], [Estado], [UsuarioUpdate], [FechaUpdate]) VALUES (CAST(8 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), N'70485568', N'CLIENTE 8', N'Sin Direccion', N'935018060', N'correo@gmail.com', N'PRUEBAS', 1, CAST(1 AS Decimal(18, 0)), CAST(N'2025-06-13T15:30:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[tCliente] OFF
GO
SET IDENTITY_INSERT [dbo].[tMarca] ON 

INSERT [dbo].[tMarca] ([IdMarca], [Marca], [Descripcion], [Estado], [UsuarioUpdate], [FechaUpdate]) VALUES (CAST(1 AS Decimal(18, 0)), N'Toyota', NULL, 1, NULL, NULL)
INSERT [dbo].[tMarca] ([IdMarca], [Marca], [Descripcion], [Estado], [UsuarioUpdate], [FechaUpdate]) VALUES (CAST(2 AS Decimal(18, 0)), N'Kia', NULL, 1, NULL, NULL)
INSERT [dbo].[tMarca] ([IdMarca], [Marca], [Descripcion], [Estado], [UsuarioUpdate], [FechaUpdate]) VALUES (CAST(3 AS Decimal(18, 0)), N'Hyundai', NULL, 1, NULL, NULL)
INSERT [dbo].[tMarca] ([IdMarca], [Marca], [Descripcion], [Estado], [UsuarioUpdate], [FechaUpdate]) VALUES (CAST(4 AS Decimal(18, 0)), N'Nissan', NULL, 1, NULL, NULL)
INSERT [dbo].[tMarca] ([IdMarca], [Marca], [Descripcion], [Estado], [UsuarioUpdate], [FechaUpdate]) VALUES (CAST(5 AS Decimal(18, 0)), N'Chevrolet', NULL, 1, NULL, NULL)
INSERT [dbo].[tMarca] ([IdMarca], [Marca], [Descripcion], [Estado], [UsuarioUpdate], [FechaUpdate]) VALUES (CAST(6 AS Decimal(18, 0)), N'Suzuki', NULL, 1, NULL, NULL)
INSERT [dbo].[tMarca] ([IdMarca], [Marca], [Descripcion], [Estado], [UsuarioUpdate], [FechaUpdate]) VALUES (CAST(7 AS Decimal(18, 0)), N'Volkswagen', NULL, 1, NULL, NULL)
INSERT [dbo].[tMarca] ([IdMarca], [Marca], [Descripcion], [Estado], [UsuarioUpdate], [FechaUpdate]) VALUES (CAST(8 AS Decimal(18, 0)), N'Mitsubishi', NULL, 1, NULL, NULL)
INSERT [dbo].[tMarca] ([IdMarca], [Marca], [Descripcion], [Estado], [UsuarioUpdate], [FechaUpdate]) VALUES (CAST(9 AS Decimal(18, 0)), N'Ford ', NULL, 1, NULL, NULL)
INSERT [dbo].[tMarca] ([IdMarca], [Marca], [Descripcion], [Estado], [UsuarioUpdate], [FechaUpdate]) VALUES (CAST(10 AS Decimal(18, 0)), N'Renault', NULL, 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[tMarca] OFF
GO
SET IDENTITY_INSERT [dbo].[tPlaya] ON 

INSERT [dbo].[tPlaya] ([IdPlaya], [NombrePlaya], [Estado], [UsuarioUpdate], [FechaUpdate]) VALUES (CAST(1 AS Decimal(18, 0)), N'PLAYA 1', 1, CAST(1 AS Decimal(18, 0)), CAST(N'2025-06-11T00:00:00' AS SmallDateTime))
INSERT [dbo].[tPlaya] ([IdPlaya], [NombrePlaya], [Estado], [UsuarioUpdate], [FechaUpdate]) VALUES (CAST(2 AS Decimal(18, 0)), N'PLAYA 2', 1, CAST(1 AS Decimal(18, 0)), CAST(N'2025-06-11T00:00:00' AS SmallDateTime))
INSERT [dbo].[tPlaya] ([IdPlaya], [NombrePlaya], [Estado], [UsuarioUpdate], [FechaUpdate]) VALUES (CAST(3 AS Decimal(18, 0)), N'PLAYA 3', 1, CAST(1 AS Decimal(18, 0)), CAST(N'2025-06-11T00:00:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[tPlaya] OFF
GO
SET IDENTITY_INSERT [dbo].[tPlazaEstacionamiento] ON 

INSERT [dbo].[tPlazaEstacionamiento] ([IdPlazaEstacionamiento], [IdPlaya], [CodigoPlaza], [UbicacionPlaza], [EstadoActual], [Estado], [UsuarioUpdate], [FechaUpdate]) VALUES (CAST(1 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), N'P1E1', N'Primer Piso - P1E1', 1, 1, NULL, NULL)
INSERT [dbo].[tPlazaEstacionamiento] ([IdPlazaEstacionamiento], [IdPlaya], [CodigoPlaza], [UbicacionPlaza], [EstadoActual], [Estado], [UsuarioUpdate], [FechaUpdate]) VALUES (CAST(3 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), N'P1E2', N'Primer Piso - P1E2', 1, 1, NULL, NULL)
INSERT [dbo].[tPlazaEstacionamiento] ([IdPlazaEstacionamiento], [IdPlaya], [CodigoPlaza], [UbicacionPlaza], [EstadoActual], [Estado], [UsuarioUpdate], [FechaUpdate]) VALUES (CAST(5 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), N'P1E3', N'Primer Piso - P1E3', 1, 1, NULL, NULL)
INSERT [dbo].[tPlazaEstacionamiento] ([IdPlazaEstacionamiento], [IdPlaya], [CodigoPlaza], [UbicacionPlaza], [EstadoActual], [Estado], [UsuarioUpdate], [FechaUpdate]) VALUES (CAST(6 AS Decimal(18, 0)), CAST(2 AS Decimal(18, 0)), N'P2E1', N'Zona A - P2E1', 1, 1, NULL, NULL)
INSERT [dbo].[tPlazaEstacionamiento] ([IdPlazaEstacionamiento], [IdPlaya], [CodigoPlaza], [UbicacionPlaza], [EstadoActual], [Estado], [UsuarioUpdate], [FechaUpdate]) VALUES (CAST(7 AS Decimal(18, 0)), CAST(2 AS Decimal(18, 0)), N'P2E2', N'Zona A - P2E2', 1, 1, NULL, NULL)
INSERT [dbo].[tPlazaEstacionamiento] ([IdPlazaEstacionamiento], [IdPlaya], [CodigoPlaza], [UbicacionPlaza], [EstadoActual], [Estado], [UsuarioUpdate], [FechaUpdate]) VALUES (CAST(8 AS Decimal(18, 0)), CAST(2 AS Decimal(18, 0)), N'P2E3', N'Zona A - P2E3', 1, 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[tPlazaEstacionamiento] OFF
GO
SET IDENTITY_INSERT [dbo].[tTipoDocumentoIdentidad] ON 

INSERT [dbo].[tTipoDocumentoIdentidad] ([IdTipoDocumento], [TipoDocumento], [Estado], [UsuarioUpdate], [FechaUpdate]) VALUES (CAST(1 AS Decimal(18, 0)), N'DNI', 1, NULL, NULL)
INSERT [dbo].[tTipoDocumentoIdentidad] ([IdTipoDocumento], [TipoDocumento], [Estado], [UsuarioUpdate], [FechaUpdate]) VALUES (CAST(2 AS Decimal(18, 0)), N'RUC', 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[tTipoDocumentoIdentidad] OFF
GO
SET IDENTITY_INSERT [dbo].[tTipoVehiculo] ON 

INSERT [dbo].[tTipoVehiculo] ([IdTipoVehiculo], [CodTipoVehiculo], [TipoVehiculo], [Observaciones], [Estado], [UsuarioUpdate], [FechaUpdate]) VALUES (CAST(1 AS Decimal(18, 0)), N'SED', N'SEDÁN', NULL, 1, NULL, NULL)
INSERT [dbo].[tTipoVehiculo] ([IdTipoVehiculo], [CodTipoVehiculo], [TipoVehiculo], [Observaciones], [Estado], [UsuarioUpdate], [FechaUpdate]) VALUES (CAST(2 AS Decimal(18, 0)), N'SUV', N'SUV', NULL, 1, NULL, NULL)
INSERT [dbo].[tTipoVehiculo] ([IdTipoVehiculo], [CodTipoVehiculo], [TipoVehiculo], [Observaciones], [Estado], [UsuarioUpdate], [FechaUpdate]) VALUES (CAST(4 AS Decimal(18, 0)), N'SWG', N'STATION WAGON', NULL, 1, NULL, NULL)
INSERT [dbo].[tTipoVehiculo] ([IdTipoVehiculo], [CodTipoVehiculo], [TipoVehiculo], [Observaciones], [Estado], [UsuarioUpdate], [FechaUpdate]) VALUES (CAST(5 AS Decimal(18, 0)), N'PUP', N'PICK UP', NULL, 1, NULL, NULL)
INSERT [dbo].[tTipoVehiculo] ([IdTipoVehiculo], [CodTipoVehiculo], [TipoVehiculo], [Observaciones], [Estado], [UsuarioUpdate], [FechaUpdate]) VALUES (CAST(6 AS Decimal(18, 0)), N'MIC', N'MICROBÚS', NULL, 1, NULL, NULL)
INSERT [dbo].[tTipoVehiculo] ([IdTipoVehiculo], [CodTipoVehiculo], [TipoVehiculo], [Observaciones], [Estado], [UsuarioUpdate], [FechaUpdate]) VALUES (CAST(7 AS Decimal(18, 0)), N'MIN', N'MINIBÚS', NULL, 1, NULL, NULL)
INSERT [dbo].[tTipoVehiculo] ([IdTipoVehiculo], [CodTipoVehiculo], [TipoVehiculo], [Observaciones], [Estado], [UsuarioUpdate], [FechaUpdate]) VALUES (CAST(8 AS Decimal(18, 0)), N'MTO', N'MOTOCICLETA', NULL, 1, NULL, NULL)
INSERT [dbo].[tTipoVehiculo] ([IdTipoVehiculo], [CodTipoVehiculo], [TipoVehiculo], [Observaciones], [Estado], [UsuarioUpdate], [FechaUpdate]) VALUES (CAST(9 AS Decimal(18, 0)), N'MTT', N'MOTO TODO TERRENO', NULL, 1, NULL, NULL)
INSERT [dbo].[tTipoVehiculo] ([IdTipoVehiculo], [CodTipoVehiculo], [TipoVehiculo], [Observaciones], [Estado], [UsuarioUpdate], [FechaUpdate]) VALUES (CAST(10 AS Decimal(18, 0)), N'FUR', N'FURGÓN', NULL, 1, NULL, NULL)
INSERT [dbo].[tTipoVehiculo] ([IdTipoVehiculo], [CodTipoVehiculo], [TipoVehiculo], [Observaciones], [Estado], [UsuarioUpdate], [FechaUpdate]) VALUES (CAST(11 AS Decimal(18, 0)), N'CMT', N'CUATRIMOTO', NULL, 1, NULL, NULL)
INSERT [dbo].[tTipoVehiculo] ([IdTipoVehiculo], [CodTipoVehiculo], [TipoVehiculo], [Observaciones], [Estado], [UsuarioUpdate], [FechaUpdate]) VALUES (CAST(12 AS Decimal(18, 0)), N'BMT', N'BICIMOTO', NULL, 1, NULL, NULL)
INSERT [dbo].[tTipoVehiculo] ([IdTipoVehiculo], [CodTipoVehiculo], [TipoVehiculo], [Observaciones], [Estado], [UsuarioUpdate], [FechaUpdate]) VALUES (CAST(13 AS Decimal(18, 0)), N'OTR', N'OTROS USOS ESPECIALES', NULL, 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[tTipoVehiculo] OFF
GO
SET IDENTITY_INSERT [dbo].[tUsuario] ON 

INSERT [dbo].[tUsuario] ([IdUsuario], [NombreUsuario], [Clave], [Correo], [Estado], [UsuarioUpdate], [FechaUpdate]) VALUES (CAST(1 AS Decimal(18, 0)), N'admin', N'admin', N'admin@gmail.com', 1, NULL, NULL)
INSERT [dbo].[tUsuario] ([IdUsuario], [NombreUsuario], [Clave], [Correo], [Estado], [UsuarioUpdate], [FechaUpdate]) VALUES (CAST(2 AS Decimal(18, 0)), N'demo', N'demo', N'demo@gmail.com', 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[tUsuario] OFF
GO
SET IDENTITY_INSERT [dbo].[tVehiculo] ON 

INSERT [dbo].[tVehiculo] ([IdVehiculo], [IdCliente], [IdMarca], [IdTipoVehiculo], [PlacaVehiculo], [PlacaNueva], [Observaciones], [Estado], [UsuarioUpdate], [FechaUpdate]) VALUES (CAST(1 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(9 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), N'AAA-001', N'AAA-222', N'MODIFICADO', 1, CAST(1 AS Decimal(18, 0)), CAST(N'2025-06-13T16:22:00' AS SmallDateTime))
INSERT [dbo].[tVehiculo] ([IdVehiculo], [IdCliente], [IdMarca], [IdTipoVehiculo], [PlacaVehiculo], [PlacaNueva], [Observaciones], [Estado], [UsuarioUpdate], [FechaUpdate]) VALUES (CAST(2 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(3 AS Decimal(18, 0)), CAST(5 AS Decimal(18, 0)), N'DEF-456', N'DEF-488', NULL, 1, CAST(1 AS Decimal(18, 0)), CAST(N'2025-06-13T16:18:00' AS SmallDateTime))
INSERT [dbo].[tVehiculo] ([IdVehiculo], [IdCliente], [IdMarca], [IdTipoVehiculo], [PlacaVehiculo], [PlacaNueva], [Observaciones], [Estado], [UsuarioUpdate], [FechaUpdate]) VALUES (CAST(4 AS Decimal(18, 0)), CAST(2 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(5 AS Decimal(18, 0)), N'DEF-456', N'-', N'', 1, CAST(1 AS Decimal(18, 0)), CAST(N'2025-06-13T16:23:00' AS SmallDateTime))
INSERT [dbo].[tVehiculo] ([IdVehiculo], [IdCliente], [IdMarca], [IdTipoVehiculo], [PlacaVehiculo], [PlacaNueva], [Observaciones], [Estado], [UsuarioUpdate], [FechaUpdate]) VALUES (CAST(5 AS Decimal(18, 0)), CAST(3 AS Decimal(18, 0)), CAST(5 AS Decimal(18, 0)), CAST(13 AS Decimal(18, 0)), N'AAA-002', N'', N'', 1, CAST(1 AS Decimal(18, 0)), CAST(N'2025-06-13T16:24:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[tVehiculo] OFF
GO
/****** Object:  StoredProcedure [dbo].[sp_editarAsignacionplazas]    Script Date: 13/06/2025 16:40:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_editarAsignacionplazas]
	@pIdAsignacionPlaza AS decimal = null,
	@pIdPlazaEstacionamiento AS decimal = null,
	@pIdVehiculo AS decimal = null,
	@pFechaInicio AS varchar(20) = null,
	@pFechaFin AS varchar(20) = null,
	@pTotalTiempo as varchar(5) = null,
	@pEstado as int = null,
	@pObservaciones as text = null,
	@pUsuarioUpdate as decimal = null
AS
BEGIN
	SET NOCOUNT ON;
	UPDATE [dbo].[tAsignacionPlaza]
	   SET [IdPlazaEstacionamiento] = @pIdPlazaEstacionamiento
		  ,[IdVehiculo] =@pIdVehiculo
		  ,[FechaInicio] = @pFechaInicio 
		  ,[FechaFin] = @pFechaFin
		  ,[TotalTiempo] = @pTotalTiempo
		  ,[Estado] = @pEstado
		  ,[Observaciones] = @pObservaciones
		  ,[UsuarioUpdate] = @pUsuarioUpdate
		  ,[FechaUpdate] = GETDATE()
	 WHERE IdAsignacionPlaza = @pIdAsignacionPlaza
END
GO
/****** Object:  StoredProcedure [dbo].[sp_editarCliente]    Script Date: 13/06/2025 16:40:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_editarCliente]
	@pIdCliente as decimal = null,
	@pIdTipoDocumento as decimal = null,
	@pNroDocumento as varchar(20) = null,
	@pNombreCliente as varchar(150) = null,
	@pDireccionCliente as text = null,
	@pTelefono as varchar(20) = null,
	@pCorreo as varchar(50) = null,
	@pObservaciones as text = null,
	@pEstado as int = null,
	@pUsuarioUpdate as decimal = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   UPDATE [dbo].[tCliente]
   SET [IdTipoDocumento] = @pIdTipoDocumento
      ,[NroDocumento] = @pNroDocumento
      ,[NombreCliente] = @pNombreCliente
      ,[DireccionCliente] = @pDireccionCliente
      ,[Telefono] = @pTelefono
      ,[Correo] = @pCorreo
      ,[Observaciones] = @pObservaciones
      ,[UsuarioUpdate] = @pUsuarioUpdate
      ,[FechaUpdate] = GETDATE()
	WHERE IdCliente = @pIdCliente
END
GO
/****** Object:  StoredProcedure [dbo].[sp_editarVehiculo]    Script Date: 13/06/2025 16:40:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_editarVehiculo]
	@pIdVehiculo as decimal = null,
	@pIdCliente as decimal = null,
	@pIdMarca as decimal = null,
	@pIdTipoVehiculo as decimal = null,
	@pPlacaVehiculo as varchar(20) = null,
	@pPlacaNueva as varchar(150) = null,
	@pObservaciones as text = null,
	@pEstado as int = null,
	@pUsuarioUpdate as decimal = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [dbo].[tVehiculo]
	  SET [IdCliente] = @pIdCliente
		  ,[IdMarca] = @pIdMarca
		  ,[IdTipoVehiculo] = @pIdTipoVehiculo
		  ,[PlacaVehiculo] = @pPlacaVehiculo
		  ,[PlacaNueva] = @pPlacaNueva
		  ,[Observaciones] = @pObservaciones
		  ,[Estado] = @pEstado
		  ,[UsuarioUpdate] = @pUsuarioUpdate
		  ,[FechaUpdate] = GETDATE()
	 WHERE IdVehiculo = @pIdVehiculo
END
GO
/****** Object:  StoredProcedure [dbo].[sp_eliminarasignacionplazas]    Script Date: 13/06/2025 16:40:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_eliminarasignacionplazas]
	@pIdIdAsignacionPlaza AS decimal = null,
	@pEstado as int = null,
	@pObservaciones as text = null,
	@pUsuarioUpdate as decimal = null
AS
BEGIN
	SET NOCOUNT ON;
	UPDATE [dbo].[tAsignacionPlaza]
	   SET 
		  [Estado] = @pEstado
		  ,[Observaciones] = @pObservaciones
		  ,[UsuarioUpdate] = @pUsuarioUpdate
		  ,[FechaUpdate] = GETDATE()
	 WHERE IdAsignacionPlaza = @pIdIdAsignacionPlaza
END
GO
/****** Object:  StoredProcedure [dbo].[sp_eliminarCliente]    Script Date: 13/06/2025 16:40:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_eliminarCliente]
	@pIdCliente as decimal = null,
	@pObservaciones as text = null,
	@pEstado as int = null,
	@pUsuarioUpdate as decimal = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   UPDATE [dbo].[tCliente]
   SET [Estado] = @pEstado
      ,[UsuarioUpdate] = @pUsuarioUpdate
	  ,[Observaciones] = @pObservaciones
      ,[FechaUpdate] = GETDATE()
	WHERE IdCliente = @pIdCliente
END
GO
/****** Object:  StoredProcedure [dbo].[sp_eliminarVehiculo]    Script Date: 13/06/2025 16:40:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_eliminarVehiculo]
	@pIdVehiculo as decimal = null,
	@pObservaciones as text = null,
	@pEstado as int = null,
	@pUsuarioUpdate as decimal = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [dbo].[tVehiculo]
	  SET 
		  [Observaciones] = @pObservaciones
		  ,[Estado] = @pEstado
		  ,[UsuarioUpdate] = @pUsuarioUpdate
		  ,[FechaUpdate] = GETDATE()
	 WHERE IdVehiculo = @pIdVehiculo
END
GO
/****** Object:  StoredProcedure [dbo].[sp_guardarasignacionplazas]    Script Date: 13/06/2025 16:40:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_guardarasignacionplazas]
	@pIdPlazaEstacionamiento AS decimal = null,
	@pIdVehiculo AS decimal = null,
	@pFechaInicio AS varchar(20) = null,
	@pFechaFin AS varchar(20) = null,
	@pTotalTiempo as varchar(5) = null,
	@pEstado as int = null,
	@pObservaciones as text = null,
	@pUsuarioUpdate as decimal = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[tAsignacionPlaza]
           ([IdPlazaEstacionamiento]
           ,[IdVehiculo]
           ,[FechaInicio]
           ,[FechaFin]
           ,[TotalTiempo]
           ,[Estado]
           ,[Observaciones]
           ,[UsuarioUpdate]
           ,[FechaUpdate])
     VALUES
           (@pIdPlazaEstacionamiento
           ,@pIdVehiculo
           ,@pFechaInicio
           ,@pFechaFin
           ,@pTotalTiempo
           ,@pEstado
           ,@pObservaciones
           ,@pUsuarioUpdate
           ,GETDATE())
END
GO
/****** Object:  StoredProcedure [dbo].[sp_guardarCliente]    Script Date: 13/06/2025 16:40:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_guardarCliente]
	@pIdTipoDocumento as decimal = null,
	@pNroDocumento as varchar(20) = null,
	@pNombreCliente as varchar(150) = null,
	@pDireccionCliente as text = null,
	@pTelefono as varchar(20) = null,
	@pCorreo as varchar(50) = null,
	@pObservaciones as text = null,
	@pEstado as int = null,
	@pUsuarioUpdate as decimal = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[tCliente]
           ([IdTipoDocumento]
           ,[NroDocumento]
           ,[NombreCliente]
           ,[DireccionCliente]
           ,[Telefono]
           ,[Correo]
           ,[Observaciones]
           ,[Estado]
           ,[UsuarioUpdate]
           ,[FechaUpdate])
     VALUES
           (@pIdTipoDocumento
           ,@pNroDocumento
           ,@pNombreCliente
           ,@pDireccionCliente
           ,@pTelefono
           ,@pCorreo
           ,@pObservaciones
           ,@pEstado
           ,@pUsuarioUpdate
           ,GETDATE())
END
GO
/****** Object:  StoredProcedure [dbo].[sp_guardarVehiculo]    Script Date: 13/06/2025 16:40:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_guardarVehiculo]
	@pIdVehiculo as decimal = null,
	@pIdCliente as decimal = null,
	@pIdMarca as decimal = null,
	@pIdTipoVehiculo as decimal = null,
	@pPlacaVehiculo as varchar(20) = null,
	@pPlacaNueva as varchar(150) = null,
	@pObservaciones as text = null,
	@pEstado as int = null,
	@pUsuarioUpdate as decimal = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[tVehiculo]
           ([IdCliente]
           ,[IdMarca]
           ,[IdTipoVehiculo]
           ,[PlacaVehiculo]
           ,[PlacaNueva]
           ,[Observaciones]
           ,[Estado]
           ,[UsuarioUpdate]
           ,[FechaUpdate])
     VALUES
           (@pIdCliente
		   ,@pIdMarca
           ,@pIdTipoVehiculo
           ,@pPlacaVehiculo
           ,@pPlacaNueva
           ,@pObservaciones
           ,@pEstado
		   ,@pUsuarioUpdate
           ,GETDATE())
END
GO
/****** Object:  StoredProcedure [dbo].[sp_listarasignacionplazas]    Script Date: 13/06/2025 16:40:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE	PROCEDURE [dbo].[sp_listarasignacionplazas]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT 
		tAsignacionPlaza.*,
		tPlazaEstacionamiento.CodigoPlaza,
		tPlazaEstacionamiento.UbicacionPlaza,
		tPlazaEstacionamiento.EstadoActual,
		tPlaya.IdPlaya,
		tPlaya.NombrePlaya,
		tVehiculo.PlacaVehiculo,
		tVehiculo.PlacaNueva,
		tMarca.IdMarca,
		tMarca.Marca,
		tTipoVehiculo.IdTipoVehiculo,
		tTipoVehiculo.TipoVehiculo,
		tTipoDocumentoIdentidad.IdTipoDocumento,
		tTipoDocumentoIdentidad.TipoDocumento,
		tCliente.IdCliente,
		tCliente.NroDocumento,
		tCliente.NombreCliente
	FROM tAsignacionPlaza 
	INNER JOIN tPlazaEstacionamiento on tAsignacionPlaza.IdPlazaEstacionamiento = tPlazaEstacionamiento.IdPlazaEstacionamiento
	INNER JOIN tPlaya on tPlazaEstacionamiento.IdPlaya = tPlaya.IdPlaya
	INNER JOIN tVehiculo on tAsignacionPlaza.IdVehiculo = tVehiculo.IdVehiculo
	INNER JOIN tMarca on tVehiculo.IdMarca = tMarca.IdMarca
	INNER JOIN tTipoVehiculo on tVehiculo.IdTipoVehiculo = tTipoVehiculo.IdTipoVehiculo
	INNER JOIN tCliente on tVehiculo.IdCliente = tCliente.IdCliente
	INNER JOIN tTipoDocumentoIdentidad on tCliente.IdTipoDocumento = tTipoDocumentoIdentidad.IdTipoDocumento
	WHERE tAsignacionPlaza.Estado = 1
	ORDER BY IdAsignacionPlaza desc
	--SELECT tVehiculo.*,tMarca.Marca,tTipoVehiculo.TipoVehiculo from tasis
	--INNER JOIN tMarca on tVehiculo.IdMarca = tMarca.IdMarca
	--INNER JOIN tTipoVehiculo on tVehiculo.IdTipoVehiculo = tTipoVehiculo.IdTipoVehiculo
	--where tVehiculo.Estado = 1
END
GO
/****** Object:  StoredProcedure [dbo].[sp_listarasignacionplazasId]    Script Date: 13/06/2025 16:40:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_listarasignacionplazasId]
	@pIdAsignacionPlaza AS decimal = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT 
		tAsignacionPlaza.*,
		tPlazaEstacionamiento.CodigoPlaza,
		tPlazaEstacionamiento.UbicacionPlaza,
		tPlazaEstacionamiento.EstadoActual,
		tPlaya.IdPlaya,
		tPlaya.NombrePlaya,
		tVehiculo.PlacaVehiculo,
		tVehiculo.PlacaNueva,
		tMarca.IdMarca,
		tMarca.Marca,
		tTipoVehiculo.IdTipoVehiculo,
		tTipoVehiculo.TipoVehiculo,
		tTipoDocumentoIdentidad.IdTipoDocumento,
		tTipoDocumentoIdentidad.TipoDocumento,
		tCliente.IdCliente,
		tCliente.NroDocumento,
		tCliente.NombreCliente
	FROM tAsignacionPlaza 
	INNER JOIN tPlazaEstacionamiento on tAsignacionPlaza.IdPlazaEstacionamiento = tPlazaEstacionamiento.IdPlazaEstacionamiento
	INNER JOIN tPlaya on tPlazaEstacionamiento.IdPlaya = tPlaya.IdPlaya
	INNER JOIN tVehiculo on tAsignacionPlaza.IdVehiculo = tVehiculo.IdVehiculo
	INNER JOIN tMarca on tVehiculo.IdMarca = tMarca.IdMarca
	INNER JOIN tTipoVehiculo on tVehiculo.IdTipoVehiculo = tTipoVehiculo.IdTipoVehiculo
	INNER JOIN tCliente on tVehiculo.IdCliente = tCliente.IdCliente
	INNER JOIN tTipoDocumentoIdentidad on tCliente.IdTipoDocumento = tTipoDocumentoIdentidad.IdTipoDocumento
	WHERE tAsignacionPlaza.IdAsignacionPlaza = @pIdAsignacionPlaza
	order by IdAsignacionPlaza desc
END
GO
/****** Object:  StoredProcedure [dbo].[sp_listarClientes]    Script Date: 13/06/2025 16:40:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_listarClientes]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT tTipoDocumentoIdentidad.TipoDocumento,tCliente.* from tCliente
	INNER JOIN tTipoDocumentoIdentidad on tCliente.IdTipoDocumento = tTipoDocumentoIdentidad.IdTipoDocumento
	where tCliente.Estado = 1
	order by IdCliente desc
END
GO
/****** Object:  StoredProcedure [dbo].[sp_listarClientesId]    Script Date: 13/06/2025 16:40:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_listarClientesId]
	@pIdCliente AS decimal = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT tTipoDocumentoIdentidad.TipoDocumento,tCliente.* from tCliente
	INNER JOIN tTipoDocumentoIdentidad on tCliente.IdTipoDocumento = tTipoDocumentoIdentidad.IdTipoDocumento
	WHERE IdCliente = @pIdCliente
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ListarUsuarioId]    Script Date: 13/06/2025 16:40:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_ListarUsuarioId]
	@pIdUsuario decimal(10,0) = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	begin
		SELECT * from tUsuario where IdUsuario = @pIdUsuario
	end
		
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ListarUsuarios]    Script Date: 13/06/2025 16:40:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_ListarUsuarios]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT * from tUsuario WHERE Estado = 1 
	order by IdUsuario desc
		
END
GO
/****** Object:  StoredProcedure [dbo].[sp_listarVehiculos]    Script Date: 13/06/2025 16:40:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_listarVehiculos]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT tVehiculo.*,tMarca.Marca,tTipoVehiculo.TipoVehiculo from tVehiculo
	INNER JOIN tMarca on tVehiculo.IdMarca = tMarca.IdMarca
	INNER JOIN tTipoVehiculo on tVehiculo.IdTipoVehiculo = tTipoVehiculo.IdTipoVehiculo
	where tVehiculo.Estado = 1
	ORDER BY IdVehiculo desc
END
GO
/****** Object:  StoredProcedure [dbo].[sp_listarVehiculosCliente]    Script Date: 13/06/2025 16:40:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_listarVehiculosCliente]
	@pIdCliente AS decimal = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	 -- Insert statements for procedure here
	SELECT tVehiculo.*,tMarca.Marca,tTipoVehiculo.TipoVehiculo,tCliente.NombreCliente,tCliente.NroDocumento,tTipoDocumentoIdentidad.TipoDocumento
	from tVehiculo
	INNER JOIN tMarca on tVehiculo.IdMarca = tMarca.IdMarca
	INNER JOIN tTipoVehiculo on tVehiculo.IdTipoVehiculo = tTipoVehiculo.IdTipoVehiculo
	INNER JOIN tCliente on tVehiculo.IdCliente = tCliente.IdCliente
	INNER JOIN tTipoDocumentoIdentidad on tCliente.IdTipoDocumento = tTipoDocumentoIdentidad.IdTipoDocumento
	WHERE tVehiculo.IdCliente = @pIdCliente and tVehiculo.Estado = 1
	order by IdVehiculo desc
END
GO
/****** Object:  StoredProcedure [dbo].[sp_listarVehiculosId]    Script Date: 13/06/2025 16:40:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_listarVehiculosId]
	@pIdVehiculo AS decimal = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT tVehiculo.*,tMarca.Marca,tTipoVehiculo.TipoVehiculo,tCliente.NombreCliente,tCliente.NroDocumento,tTipoDocumentoIdentidad.TipoDocumento
	from tVehiculo
	INNER JOIN tMarca on tVehiculo.IdMarca = tMarca.IdMarca
	INNER JOIN tTipoVehiculo on tVehiculo.IdTipoVehiculo = tTipoVehiculo.IdTipoVehiculo
	INNER JOIN tCliente on tVehiculo.IdCliente = tCliente.IdCliente
	INNER JOIN tTipoDocumentoIdentidad on tCliente.IdTipoDocumento = tTipoDocumentoIdentidad.IdTipoDocumento
	WHERE IdVehiculo = @pIdVehiculo
END
GO
USE [master]
GO
ALTER DATABASE [bdEstacionamientoAndesExpress] SET  READ_WRITE 
GO
