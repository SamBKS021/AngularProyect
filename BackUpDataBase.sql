USE [master]
GO
/****** Object:  Database [DDCrudAngular]    Script Date: 15/12/2024 09:28:03 p. m. ******/
CREATE DATABASE [DDCrudAngular]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DDCrudAngular', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\DDCrudAngular.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DDCrudAngular_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\DDCrudAngular_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [DDCrudAngular] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DDCrudAngular].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DDCrudAngular] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DDCrudAngular] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DDCrudAngular] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DDCrudAngular] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DDCrudAngular] SET ARITHABORT OFF 
GO
ALTER DATABASE [DDCrudAngular] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DDCrudAngular] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DDCrudAngular] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DDCrudAngular] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DDCrudAngular] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DDCrudAngular] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DDCrudAngular] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DDCrudAngular] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DDCrudAngular] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DDCrudAngular] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DDCrudAngular] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DDCrudAngular] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DDCrudAngular] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DDCrudAngular] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DDCrudAngular] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DDCrudAngular] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DDCrudAngular] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DDCrudAngular] SET RECOVERY FULL 
GO
ALTER DATABASE [DDCrudAngular] SET  MULTI_USER 
GO
ALTER DATABASE [DDCrudAngular] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DDCrudAngular] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DDCrudAngular] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DDCrudAngular] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DDCrudAngular] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DDCrudAngular] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DDCrudAngular', N'ON'
GO
ALTER DATABASE [DDCrudAngular] SET QUERY_STORE = ON
GO
ALTER DATABASE [DDCrudAngular] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [DDCrudAngular]
GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 15/12/2024 09:28:04 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleado](
	[IdEmpleado] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Correo] [varchar](50) NULL,
	[Sueldo] [decimal](10, 2) NULL,
	[FechaContrato] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Empleado] ON 

INSERT [dbo].[Empleado] ([IdEmpleado], [Nombre], [Correo], [Sueldo], [FechaContrato]) VALUES (1, N'Samuel Alejandro', N'samuelba888@gmail.com', CAST(21000.45 AS Decimal(10, 2)), CAST(N'2023-12-23' AS Date))
INSERT [dbo].[Empleado] ([IdEmpleado], [Nombre], [Correo], [Sueldo], [FechaContrato]) VALUES (2, N'Ana Gómez', N'ana.gomez@example.com', CAST(30000.50 AS Decimal(10, 2)), CAST(N'2023-10-25' AS Date))
INSERT [dbo].[Empleado] ([IdEmpleado], [Nombre], [Correo], [Sueldo], [FechaContrato]) VALUES (3, N'Carlos López', N'carlos.lopez@example.com', CAST(18000.00 AS Decimal(10, 2)), CAST(N'2023-09-05' AS Date))
INSERT [dbo].[Empleado] ([IdEmpleado], [Nombre], [Correo], [Sueldo], [FechaContrato]) VALUES (4, N'María Rodríguez', N'maria.rodriguez@example.com', CAST(22000.00 AS Decimal(10, 2)), CAST(N'2024-01-01' AS Date))
INSERT [dbo].[Empleado] ([IdEmpleado], [Nombre], [Correo], [Sueldo], [FechaContrato]) VALUES (5, N'Luis Fernández', N'luis.fernandez@example.com', CAST(27500.00 AS Decimal(10, 2)), CAST(N'2026-07-15' AS Date))
INSERT [dbo].[Empleado] ([IdEmpleado], [Nombre], [Correo], [Sueldo], [FechaContrato]) VALUES (6, N'Elena Castillo', N'elena.castillo@example.com', CAST(19500.00 AS Decimal(10, 2)), CAST(N'2023-06-10' AS Date))
INSERT [dbo].[Empleado] ([IdEmpleado], [Nombre], [Correo], [Sueldo], [FechaContrato]) VALUES (7, N'Pedro Hernández', N'pedro.hernandez@example.com', CAST(32000.00 AS Decimal(10, 2)), CAST(N'2023-11-30' AS Date))
INSERT [dbo].[Empleado] ([IdEmpleado], [Nombre], [Correo], [Sueldo], [FechaContrato]) VALUES (8, N'Sofía Martínez', N'sofia.martinez@example.com', CAST(28500.00 AS Decimal(10, 2)), CAST(N'2023-08-20' AS Date))
SET IDENTITY_INSERT [dbo].[Empleado] OFF
GO
/****** Object:  StoredProcedure [dbo].[EmpleadoAdd]    Script Date: 15/12/2024 09:28:04 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EmpleadoAdd]
@Nombre VARCHAR(100),
@Correo VARCHAR(250),
@Sueldo DECIMAL(15,2),
@FechaContrato DATE
AS
BEGIN
	INSERT INTO Empleado
		(Nombre, Correo, Sueldo, FechaContrato)
		VALUES
		(@Nombre, @Correo, @Sueldo,
		@FechaContrato)	 
END
GO
/****** Object:  StoredProcedure [dbo].[EmpleadoDelete]    Script Date: 15/12/2024 09:28:04 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EmpleadoDelete]
@IdEmpleado INT
AS
BEGIN
	DELETE FROM Empleado 
	WHERE IdEmpleado = @IdEmpleado
END
GO
/****** Object:  StoredProcedure [dbo].[EmpleadoGetAll]    Script Date: 15/12/2024 09:28:04 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EmpleadoGetAll]
AS
BEGIN
	SELECT
		IdEmpleado,
		Nombre,
		Correo,
		Sueldo,
		FechaContrato
	FROM Empleado
END
GO
/****** Object:  StoredProcedure [dbo].[EmpleadoGetById]    Script Date: 15/12/2024 09:28:04 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[EmpleadoGetById] 
@IdEmpleado INT
AS
BEGIN
	SELECT 
		IdEmpleado,
		Nombre,
		Correo,
		Sueldo,
		FechaContrato
	FROM Empleado
	WHERE IdEmpleado = @IdEmpleado
END
GO
/****** Object:  StoredProcedure [dbo].[EmpleadoUpdate]    Script Date: 15/12/2024 09:28:04 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EmpleadoUpdate]
@IdEmpleado INT,
@Nombre VARCHAR(50),
@Correo VARCHAR(256),
@Sueldo DECIMAL(15,5),
@FechaContrato DATE
AS
BEGIN

	UPDATE Empleado SET
		Nombre = @Nombre,
		Correo = @Correo,
		Sueldo = @Sueldo,
		FechaContrato = @FechaContrato
	WHERE IdEmpleado = @IdEmpleado
	 
END

GO
USE [master]
GO
ALTER DATABASE [DDCrudAngular] SET  READ_WRITE 
GO
