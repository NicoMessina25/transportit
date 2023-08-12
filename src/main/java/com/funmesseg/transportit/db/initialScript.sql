USE [master]
GO

/****** Object:  Database [transportit]    Script Date: 12/8/2023 15:58:01 ******/
CREATE DATABASE [transportit]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'transportit', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\transportit.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'transportit_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\transportit_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [transportit].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [transportit] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [transportit] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [transportit] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [transportit] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [transportit] SET ARITHABORT OFF 
GO

ALTER DATABASE [transportit] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [transportit] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [transportit] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [transportit] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [transportit] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [transportit] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [transportit] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [transportit] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [transportit] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [transportit] SET  DISABLE_BROKER 
GO

ALTER DATABASE [transportit] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [transportit] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [transportit] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [transportit] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [transportit] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [transportit] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [transportit] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [transportit] SET RECOVERY SIMPLE 
GO

ALTER DATABASE [transportit] SET  MULTI_USER 
GO

ALTER DATABASE [transportit] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [transportit] SET DB_CHAINING OFF 
GO

ALTER DATABASE [transportit] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [transportit] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [transportit] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [transportit] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO

ALTER DATABASE [transportit] SET QUERY_STORE = ON
GO

ALTER DATABASE [transportit] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO

ALTER DATABASE [transportit] SET  READ_WRITE 
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[_user](
	[firstname] [varchar](255) NOT NULL,
	[lastname] [varchar](255) NOT NULL,
	[_document] [bigint] NOT NULL,
	[username] [varchar](255) NOT NULL,
	[mail] [varchar](255) NULL,
	[password] [varchar](255) NOT NULL,
	[_user] [bigint] IDENTITY(1,1) NOT NULL,
	[active] [bit] NOT NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[_user] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[_user] ADD  CONSTRAINT [DF__user_active]  DEFAULT ((1)) FOR [active]
GO

CREATE TABLE [dbo].[city](
	[cityId] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[cityXcity](
	[cityFrom] [bigint] NOT NULL,
	[cityTo] [bigint] NOT NULL,
	[feeCoefficient] [numeric](5, 2) NULL,
	[distanceKm] [numeric](7, 2) NULL,
 CONSTRAINT [PK_cityXcity] PRIMARY KEY CLUSTERED 
(
	[cityFrom] ASC,
	[cityTo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[cityXcity]  WITH CHECK ADD  CONSTRAINT [FK_cityFrom] FOREIGN KEY([cityFrom])
REFERENCES [dbo].[city] ([cityId])
GO

ALTER TABLE [dbo].[cityXcity] CHECK CONSTRAINT [FK_cityFrom]
GO

ALTER TABLE [dbo].[cityXcity]  WITH CHECK ADD  CONSTRAINT [FK_cityTo] FOREIGN KEY([cityTo])
REFERENCES [dbo].[city] ([cityId])
GO

ALTER TABLE [dbo].[cityXcity] CHECK CONSTRAINT [FK_cityTo]
GO

CREATE TABLE [dbo].[customer](
	[customerId] [bigint] IDENTITY(1,1) NOT NULL,
	[firstname] [varchar](20) NOT NULL,
	[lastname] [varchar](20) NOT NULL,
	[document] [bigint] NOT NULL,
	[address] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[customerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[package](
	[packageId] [bigint] IDENTITY(1,1) NOT NULL,
	[weight] [numeric](7, 2) NULL,
	[size] [numeric](7, 2) NULL,
	[requestId] [bigint] NOT NULL,
	[price] [numeric](8, 2) NULL,
	[state] [bigint] NOT NULL,
	[routeMapId] [bigint] NOT NULL,
	[feePricingId] [bigint] NOT NULL,
	[recipientDocument] [bigint] NOT NULL,
	[recipientFirstname] [bigint] NOT NULL,
	[cityFeeCoefficient] [numeric](5, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[packageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[package]  WITH CHECK ADD  CONSTRAINT [FK_package_shippingRequest] FOREIGN KEY([requestId])
REFERENCES [dbo].[shippingRequest] ([requestId])
GO

ALTER TABLE [dbo].[package] CHECK CONSTRAINT [FK_package_shippingRequest]
GO

CREATE TABLE [dbo].[park](
	[parkId] [bigint] IDENTITY(1,1) NOT NULL,
	[cityId] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[parkId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[park]  WITH CHECK ADD  CONSTRAINT [FK_park_city] FOREIGN KEY([cityId])
REFERENCES [dbo].[city] ([cityId])
GO

ALTER TABLE [dbo].[park] CHECK CONSTRAINT [FK_park_city]
GO


CREATE TABLE [dbo].[routeMap](
	[routeMapId] [bigint] IDENTITY(1,1) NOT NULL,
	[state] [int] NOT NULL,
	[payloadVolume] [numeric](12, 2) NOT NULL,
	[price] [numeric](15, 2) NOT NULL,
	[startDate] [date] NOT NULL,
	[driverId] [bigint] NOT NULL,
	[truckId] [bigint] NOT NULL,
	[trailerId] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[routeMapId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[routeMapXCity](
	[routeMapId] [bigint] NOT NULL,
	[cityId] [bigint] NOT NULL,
	[arrivalDate] [date] NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[routeMapXCity]  WITH CHECK ADD  CONSTRAINT [FK_routeMapXCity_city] FOREIGN KEY([cityId])
REFERENCES [dbo].[city] ([cityId])
GO

ALTER TABLE [dbo].[routeMapXCity] CHECK CONSTRAINT [FK_routeMapXCity_city]
GO

ALTER TABLE [dbo].[routeMapXCity]  WITH CHECK ADD  CONSTRAINT [FK_routeMapXCity_routeMap] FOREIGN KEY([routeMapId])
REFERENCES [dbo].[routeMap] ([routeMapId])
GO

ALTER TABLE [dbo].[routeMapXCity] CHECK CONSTRAINT [FK_routeMapXCity_routeMap]
GO


CREATE TABLE [dbo].[shippingRequest](
	[requestId] [bigint] IDENTITY(1,1) NOT NULL,
	[price] [numeric](12, 3) NULL,
	[requestDate] [date] NOT NULL,
	[state] [int] NOT NULL,
	[cityFrom] [bigint] NOT NULL,
	[cityTo] [bigint] NOT NULL,
	[customerId] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[requestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[shippingRequest]  WITH CHECK ADD  CONSTRAINT [FK_shippingRequest_cityFrom] FOREIGN KEY([cityFrom])
REFERENCES [dbo].[city] ([cityId])
GO

ALTER TABLE [dbo].[shippingRequest] CHECK CONSTRAINT [FK_shippingRequest_cityFrom]
GO

ALTER TABLE [dbo].[shippingRequest]  WITH CHECK ADD  CONSTRAINT [FK_shippingRequest_cityTo] FOREIGN KEY([cityTo])
REFERENCES [dbo].[city] ([cityId])
GO

ALTER TABLE [dbo].[shippingRequest] CHECK CONSTRAINT [FK_shippingRequest_cityTo]
GO

ALTER TABLE [dbo].[shippingRequest]  WITH CHECK ADD  CONSTRAINT [FK_shippingRequest_customerId] FOREIGN KEY([customerId])
REFERENCES [dbo].[customer] ([customerId])
GO

ALTER TABLE [dbo].[shippingRequest] CHECK CONSTRAINT [FK_shippingRequest_customerId]
GO

CREATE TABLE [dbo].[trailer](
	[trailerId] [bigint] IDENTITY(1,1) NOT NULL,
	[weight] [numeric](7, 2) NOT NULL,
	[payloadWeight] [numeric](7, 2) NOT NULL,
	[registration] [varchar](16) NOT NULL,
	[available] [bit] NOT NULL,
	[parkId] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[trailerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[trailer] ADD  DEFAULT ((1)) FOR [available]
GO

ALTER TABLE [dbo].[trailer]  WITH CHECK ADD  CONSTRAINT [FK_trailer_park] FOREIGN KEY([parkId])
REFERENCES [dbo].[park] ([parkId])
GO

ALTER TABLE [dbo].[trailer] CHECK CONSTRAINT [FK_trailer_park]
GO


