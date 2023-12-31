USE [master]
GO
/****** Object:  Database [db-gym]    Script Date: 20/10/2023 06:43:07 ******/
CREATE DATABASE [db-gym]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'db-gym', FILENAME = N'C:\SQLData\db-gym.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'db-gym_log', FILENAME = N'C:\SQLData\Logs\db-gym_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [db-gym] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [db-gym].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [db-gym] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [db-gym] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [db-gym] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [db-gym] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [db-gym] SET ARITHABORT OFF 
GO
ALTER DATABASE [db-gym] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [db-gym] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [db-gym] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [db-gym] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [db-gym] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [db-gym] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [db-gym] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [db-gym] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [db-gym] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [db-gym] SET  ENABLE_BROKER 
GO
ALTER DATABASE [db-gym] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [db-gym] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [db-gym] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [db-gym] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [db-gym] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [db-gym] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [db-gym] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [db-gym] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [db-gym] SET  MULTI_USER 
GO
ALTER DATABASE [db-gym] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [db-gym] SET DB_CHAINING OFF 
GO
ALTER DATABASE [db-gym] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [db-gym] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [db-gym] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [db-gym] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [db-gym] SET QUERY_STORE = ON
GO
ALTER DATABASE [db-gym] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [db-gym]
GO
/****** Object:  Table [dbo].[asistencia]    Script Date: 20/10/2023 06:43:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[asistencia](
	[idasistencia] [int] IDENTITY(1,1) NOT NULL,
	[idclases] [int] NOT NULL,
	[idmiembro] [int] NOT NULL,
	[fecha_asistencia] [datetime] NOT NULL,
	[id_estado] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idasistencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[clases]    Script Date: 20/10/2023 06:43:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clases](
	[idclases] [int] IDENTITY(1,1) NOT NULL,
	[idinstructor] [int] NOT NULL,
	[nombre] [varchar](45) NOT NULL,
	[espacio_disponible] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idclases] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[equipo]    Script Date: 20/10/2023 06:43:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[equipo](
	[idequipo] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](45) NOT NULL,
	[cantidad] [varchar](45) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idequipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[estados]    Script Date: 20/10/2023 06:43:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[estados](
	[id_estado] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](80) NOT NULL,
 CONSTRAINT [PK_estados] PRIMARY KEY CLUSTERED 
(
	[id_estado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[instalaciones]    Script Date: 20/10/2023 06:43:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[instalaciones](
	[idinstalacion] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](45) NOT NULL,
	[direccion] [varchar](255) NOT NULL,
	[capacidad] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idinstalacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[instalaciones_equipo]    Script Date: 20/10/2023 06:43:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[instalaciones_equipo](
	[id_instalacion] [int] IDENTITY(1,1) NOT NULL,
	[id_equipo] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_instalacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[instructor]    Script Date: 20/10/2023 06:43:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[instructor](
	[idinstructor] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](45) NOT NULL,
	[apellido] [varchar](45) NOT NULL,
	[telefono] [varchar](45) NOT NULL,
	[correo] [varchar](45) NOT NULL,
	[sueldo] [decimal](15, 2) NOT NULL,
	[id_estado] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idinstructor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[membresia]    Script Date: 20/10/2023 06:43:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[membresia](
	[idmembresia] [int] IDENTITY(1,1) NOT NULL,
	[tipo] [varchar](45) NOT NULL,
	[precio] [decimal](15, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idmembresia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[miembros]    Script Date: 20/10/2023 06:43:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[miembros](
	[idmiembro] [int] IDENTITY(1,1) NOT NULL,
	[idmembresia] [int] NOT NULL,
	[idinstalacion] [int] NOT NULL,
	[dui] [varchar](10) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[apellido] [varchar](100) NOT NULL,
	[telefono] [varchar](15) NOT NULL,
	[correo] [varchar](200) NOT NULL,
	[id_estado] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idmiembro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[asistencia]  WITH CHECK ADD  CONSTRAINT [idclases] FOREIGN KEY([idclases])
REFERENCES [dbo].[clases] ([idclases])
GO
ALTER TABLE [dbo].[asistencia] CHECK CONSTRAINT [idclases]
GO
ALTER TABLE [dbo].[asistencia]  WITH CHECK ADD  CONSTRAINT [idmiembro] FOREIGN KEY([idmiembro])
REFERENCES [dbo].[miembros] ([idmiembro])
GO
ALTER TABLE [dbo].[asistencia] CHECK CONSTRAINT [idmiembro]
GO
ALTER TABLE [dbo].[clases]  WITH CHECK ADD  CONSTRAINT [idinstructor] FOREIGN KEY([idinstructor])
REFERENCES [dbo].[instructor] ([idinstructor])
GO
ALTER TABLE [dbo].[clases] CHECK CONSTRAINT [idinstructor]
GO
ALTER TABLE [dbo].[instalaciones_equipo]  WITH CHECK ADD  CONSTRAINT [id_equipo] FOREIGN KEY([id_equipo])
REFERENCES [dbo].[equipo] ([idequipo])
GO
ALTER TABLE [dbo].[instalaciones_equipo] CHECK CONSTRAINT [id_equipo]
GO
ALTER TABLE [dbo].[instalaciones_equipo]  WITH CHECK ADD  CONSTRAINT [id_instalacion] FOREIGN KEY([id_instalacion])
REFERENCES [dbo].[instalaciones] ([idinstalacion])
GO
ALTER TABLE [dbo].[instalaciones_equipo] CHECK CONSTRAINT [id_instalacion]
GO
ALTER TABLE [dbo].[instructor]  WITH CHECK ADD  CONSTRAINT [instructor_estado] FOREIGN KEY([id_estado])
REFERENCES [dbo].[estados] ([id_estado])
GO
ALTER TABLE [dbo].[instructor] CHECK CONSTRAINT [instructor_estado]
GO
ALTER TABLE [dbo].[miembros]  WITH CHECK ADD  CONSTRAINT [id_estado] FOREIGN KEY([id_estado])
REFERENCES [dbo].[estados] ([id_estado])
GO
ALTER TABLE [dbo].[miembros] CHECK CONSTRAINT [id_estado]
GO
ALTER TABLE [dbo].[miembros]  WITH CHECK ADD  CONSTRAINT [idinstalacion] FOREIGN KEY([idinstalacion])
REFERENCES [dbo].[instalaciones] ([idinstalacion])
GO
ALTER TABLE [dbo].[miembros] CHECK CONSTRAINT [idinstalacion]
GO
ALTER TABLE [dbo].[miembros]  WITH CHECK ADD  CONSTRAINT [idmembresia] FOREIGN KEY([idmembresia])
REFERENCES [dbo].[membresia] ([idmembresia])
GO
ALTER TABLE [dbo].[miembros] CHECK CONSTRAINT [idmembresia]
GO
USE [master]
GO
ALTER DATABASE [db-gym] SET  READ_WRITE 
GO
