USE [master]
GO
/****** Object:  Database [SakilaSA]    Script Date: 19/10/2024 18:24:44 ******/
CREATE DATABASE [SakilaSA]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SakilaSA', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\SakilaSA.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SakilaSA_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\SakilaSA_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [SakilaSA] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SakilaSA].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SakilaSA] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SakilaSA] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SakilaSA] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SakilaSA] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SakilaSA] SET ARITHABORT OFF 
GO
ALTER DATABASE [SakilaSA] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SakilaSA] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SakilaSA] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SakilaSA] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SakilaSA] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SakilaSA] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SakilaSA] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SakilaSA] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SakilaSA] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SakilaSA] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SakilaSA] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SakilaSA] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SakilaSA] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SakilaSA] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SakilaSA] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SakilaSA] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SakilaSA] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SakilaSA] SET RECOVERY FULL 
GO
ALTER DATABASE [SakilaSA] SET  MULTI_USER 
GO
ALTER DATABASE [SakilaSA] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SakilaSA] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SakilaSA] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SakilaSA] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SakilaSA] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SakilaSA] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'SakilaSA', N'ON'
GO
ALTER DATABASE [SakilaSA] SET QUERY_STORE = ON
GO
ALTER DATABASE [SakilaSA] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [SakilaSA]
GO
/****** Object:  Table [dbo].[CustomerSA]    Script Date: 19/10/2024 18:24:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerSA](
	[CustomerId] [int] NOT NULL,
	[StoreId] [int] NULL,
	[FirstName] [varchar](45) NULL,
	[LastName] [varchar](45) NULL,
	[Email] [varchar](50) NULL,
	[AddressId] [int] NULL,
	[Active] [varchar](1) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FilmSA]    Script Date: 19/10/2024 18:24:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FilmSA](
	[FilmId] [int] NULL,
	[FirstName] [varchar](45) NULL,
	[LastName] [varchar](45) NULL,
	[Title] [varchar](255) NULL,
	[Description] [varchar](max) NULL,
	[ReleaseYear] [varchar](4) NULL,
	[LanguageName] [varchar](20) NULL,
	[RentalDuration] [tinyint] NULL,
	[RentalRate] [numeric](4, 2) NULL,
	[Length] [smallint] NULL,
	[ReplacementCost] [numeric](5, 2) NULL,
	[Rating] [varchar](10) NULL,
	[SpecialFeatures] [varchar](255) NULL,
	[LastUpdate] [datetime] NULL,
	[CategoryName] [varchar](25) NULL,
	[StoreId] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LocationSA]    Script Date: 19/10/2024 18:24:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LocationSA](
	[CountryName] [varchar](50) NULL,
	[CityName] [varchar](50) NULL,
	[AddressLine] [varchar](50) NULL,
	[PostalCode] [varchar](10) NULL,
	[AddressId] [int] NOT NULL,
	[LastUpdate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[AddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RentalSA]    Script Date: 19/10/2024 18:24:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RentalSA](
	[CustomerId] [int] NULL,
	[StaffId] [tinyint] NULL,
	[RentalId] [int] NOT NULL,
	[Amount] [numeric](5, 2) NULL,
	[PaymentDate] [datetime] NULL,
	[RentalDate] [datetime] NULL,
	[ReturnDate] [datetime] NULL,
	[LastUpdate] [datetime] NULL,
	[FilmId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[RentalId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StaffSA]    Script Date: 19/10/2024 18:24:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StaffSA](
	[StaffId] [tinyint] NOT NULL,
	[FirstName] [varchar](45) NULL,
	[LastName] [varchar](45) NULL,
	[AddressId] [int] NULL,
	[Picture] [varbinary](max) NULL,
	[Email] [varchar](50) NULL,
	[StoreId] [int] NULL,
	[Active] [bit] NULL,
	[Username] [varchar](16) NULL,
	[Password] [varchar](40) NULL,
	[LastUpdate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[StaffId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StoreSA]    Script Date: 19/10/2024 18:24:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StoreSA](
	[StoreId] [int] NOT NULL,
	[AddressId] [int] NULL,
	[ManagerFirstName] [varchar](45) NULL,
	[ManagerLastName] [varchar](45) NULL,
	[ManagerEmail] [varchar](50) NULL,
	[StoreLastUpdate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[StoreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [SakilaSA] SET  READ_WRITE 
GO
