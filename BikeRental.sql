USE [master]
GO
/****** Object:  Database [BikeRental]    Script Date: 8/10/2019 9:20:38 AM ******/
CREATE DATABASE [BikeRental]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BikeRental', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\BikeRental.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BikeRental_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\BikeRental_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [BikeRental] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BikeRental].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BikeRental] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BikeRental] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BikeRental] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BikeRental] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BikeRental] SET ARITHABORT OFF 
GO
ALTER DATABASE [BikeRental] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BikeRental] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BikeRental] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BikeRental] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BikeRental] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BikeRental] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BikeRental] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BikeRental] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BikeRental] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BikeRental] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BikeRental] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BikeRental] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BikeRental] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BikeRental] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BikeRental] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BikeRental] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BikeRental] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BikeRental] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BikeRental] SET  MULTI_USER 
GO
ALTER DATABASE [BikeRental] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BikeRental] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BikeRental] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BikeRental] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BikeRental] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BikeRental] SET QUERY_STORE = OFF
GO
USE [BikeRental]
GO
/****** Object:  Table [dbo].[Bike]    Script Date: 8/10/2019 9:20:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bike](
	[BikeID] [int] IDENTITY(1,1) NOT NULL,
	[Model] [nvarchar](50) NULL,
	[Maker] [nvarchar](50) NULL,
	[RegistrationNumber] [nvarchar](50) NULL,
	[RentPerDay] [decimal](10, 3) NULL,
 CONSTRAINT [PK_Bike] PRIMARY KEY CLUSTERED 
(
	[BikeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 8/10/2019 9:20:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[Phone] [nchar](10) NULL,
	[LicenseNo] [nvarchar](50) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Login]    Script Date: 8/10/2019 9:20:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Login](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
 CONSTRAINT [PK_Login] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rent]    Script Date: 8/10/2019 9:20:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rent](
	[RentID] [int] IDENTITY(1,1) NOT NULL,
	[BikeID] [int] NULL,
	[CustomerID] [int] NULL,
	[IssueDate] [date] NULL,
 CONSTRAINT [PK_Rent] PRIMARY KEY CLUSTERED 
(
	[RentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Returned]    Script Date: 8/10/2019 9:20:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Returned](
	[RentID] [int] NOT NULL,
	[BikeModel] [nvarchar](50) NULL,
	[CustomerName] [nvarchar](50) NULL,
	[IssueDate] [date] NULL,
	[ReturnDate] [date] NULL,
	[TotalRent] [decimal](10, 3) NULL,
 CONSTRAINT [PK_Returned] PRIMARY KEY CLUSTERED 
(
	[RentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Bike] ON 

INSERT [dbo].[Bike] ([BikeID], [Model], [Maker], [RegistrationNumber], [RentPerDay]) VALUES (1, N'BMW 310R', N'BMW', N'HR26BBQ', CAST(20.500 AS Decimal(10, 3)))
INSERT [dbo].[Bike] ([BikeID], [Model], [Maker], [RegistrationNumber], [RentPerDay]) VALUES (2, N'BMW 800R', N'BMW', N'HR26BBQ', CAST(20.500 AS Decimal(10, 3)))
INSERT [dbo].[Bike] ([BikeID], [Model], [Maker], [RegistrationNumber], [RentPerDay]) VALUES (4, N'BMW F750GS', N'BMW', N'HRTR457', CAST(9.800 AS Decimal(10, 3)))
INSERT [dbo].[Bike] ([BikeID], [Model], [Maker], [RegistrationNumber], [RentPerDay]) VALUES (5, N'BMW G310', N'BMW', N'ABC7869', CAST(11.000 AS Decimal(10, 3)))
INSERT [dbo].[Bike] ([BikeID], [Model], [Maker], [RegistrationNumber], [RentPerDay]) VALUES (6, N'BMW K1600B', N'BMW', N'MJJ8789', CAST(15.400 AS Decimal(10, 3)))
INSERT [dbo].[Bike] ([BikeID], [Model], [Maker], [RegistrationNumber], [RentPerDay]) VALUES (7, N'BMW R NINE T', N'BMW', N'HA63BSJ', CAST(29.500 AS Decimal(10, 3)))
INSERT [dbo].[Bike] ([BikeID], [Model], [Maker], [RegistrationNumber], [RentPerDay]) VALUES (8, N'CB Hornet 160R', N'Honda', N'HUR5655', CAST(7.500 AS Decimal(10, 3)))
SET IDENTITY_INSERT [dbo].[Bike] OFF
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([CustomerID], [FirstName], [LastName], [Address], [Phone], [LicenseNo]) VALUES (1, N'Sahib', N'Singh', N'Wellington', N'9876788765', N'DV77564')
INSERT [dbo].[Customer] ([CustomerID], [FirstName], [LastName], [Address], [Phone], [LicenseNo]) VALUES (2, N'Balbir', N'Singh', N'Auckland', N'7677265552', N'DV76567')
INSERT [dbo].[Customer] ([CustomerID], [FirstName], [LastName], [Address], [Phone], [LicenseNo]) VALUES (3, N'Balbir', N'Singh', N'Auckland', N'8977265552', N'DB78567')
INSERT [dbo].[Customer] ([CustomerID], [FirstName], [LastName], [Address], [Phone], [LicenseNo]) VALUES (5, N'Amrik', N'Multani', N'Piha', N'2237265565', N'JQ96567')
INSERT [dbo].[Customer] ([CustomerID], [FirstName], [LastName], [Address], [Phone], [LicenseNo]) VALUES (6, N'Joginder', N'Singh', N'Pahia', N'8767768552', N'AB76567')
INSERT [dbo].[Customer] ([CustomerID], [FirstName], [LastName], [Address], [Phone], [LicenseNo]) VALUES (7, N'Varinder', N'Singh', N'Hamilton', N'8787265552', N'DT76500')
INSERT [dbo].[Customer] ([CustomerID], [FirstName], [LastName], [Address], [Phone], [LicenseNo]) VALUES (9, N'Jasbir', N'Sandhu', N'Manukau', N'9877265552', N'VV78967')
INSERT [dbo].[Customer] ([CustomerID], [FirstName], [LastName], [Address], [Phone], [LicenseNo]) VALUES (1011, N'Jong', N'Cheng', N'Xyz', N'8763562   ', N'BJ876787')
SET IDENTITY_INSERT [dbo].[Customer] OFF
SET IDENTITY_INSERT [dbo].[Login] ON 

INSERT [dbo].[Login] ([Id], [UserName], [Password]) VALUES (1, N'Admin', N'Admin')
SET IDENTITY_INSERT [dbo].[Login] OFF
SET IDENTITY_INSERT [dbo].[Rent] ON 

INSERT [dbo].[Rent] ([RentID], [BikeID], [CustomerID], [IssueDate]) VALUES (1, 5, 2, CAST(N'2019-10-04' AS Date))
INSERT [dbo].[Rent] ([RentID], [BikeID], [CustomerID], [IssueDate]) VALUES (5, 2, 1, CAST(N'2019-10-04' AS Date))
INSERT [dbo].[Rent] ([RentID], [BikeID], [CustomerID], [IssueDate]) VALUES (6, 8, 5, CAST(N'2019-10-02' AS Date))
SET IDENTITY_INSERT [dbo].[Rent] OFF
INSERT [dbo].[Returned] ([RentID], [BikeModel], [CustomerName], [IssueDate], [ReturnDate], [TotalRent]) VALUES (2, N'BMW G310', N'Balbir', CAST(N'2019-10-01' AS Date), CAST(N'2019-10-06' AS Date), CAST(66.000 AS Decimal(10, 3)))
INSERT [dbo].[Returned] ([RentID], [BikeModel], [CustomerName], [IssueDate], [ReturnDate], [TotalRent]) VALUES (4, N'BMW G310', N'Balbir', CAST(N'2019-10-02' AS Date), CAST(N'2019-10-06' AS Date), CAST(55.000 AS Decimal(10, 3)))
ALTER TABLE [dbo].[Rent]  WITH CHECK ADD  CONSTRAINT [FK_Rent_Bike] FOREIGN KEY([BikeID])
REFERENCES [dbo].[Bike] ([BikeID])
GO
ALTER TABLE [dbo].[Rent] CHECK CONSTRAINT [FK_Rent_Bike]
GO
ALTER TABLE [dbo].[Rent]  WITH CHECK ADD  CONSTRAINT [FK_Rent_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[Rent] CHECK CONSTRAINT [FK_Rent_Customer]
GO
USE [master]
GO
ALTER DATABASE [BikeRental] SET  READ_WRITE 
GO
