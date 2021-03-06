USE [master]
GO
/****** Object:  Database [ProjectDB]    Script Date: 03/11/2020 00:29:43 ******/
CREATE DATABASE [ProjectDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ProjectDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ProjectDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ProjectDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ProjectDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ProjectDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProjectDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProjectDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProjectDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProjectDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProjectDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProjectDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProjectDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ProjectDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProjectDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProjectDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProjectDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProjectDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProjectDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProjectDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProjectDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProjectDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ProjectDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProjectDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProjectDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProjectDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProjectDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProjectDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProjectDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProjectDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ProjectDB] SET  MULTI_USER 
GO
ALTER DATABASE [ProjectDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProjectDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProjectDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProjectDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ProjectDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ProjectDB] SET QUERY_STORE = OFF
GO
USE [ProjectDB]
GO
/****** Object:  UserDefinedFunction [dbo].[Countlikes]    Script Date: 03/11/2020 00:29:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[Countlikes] (
@recipeId varchar (20)
)
returns float
as
begin 
 return (select count (recipe_id) from likes
where recipe_id= @recipeId)
end 
GO
/****** Object:  UserDefinedFunction [dbo].[CountlikeTest]    Script Date: 03/11/2020 00:29:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[CountlikeTest] (
@recipeId varchar (20)
)
returns float
as
begin 
 return (select count (recipe_id) from likes
where recipe_id= @recipeId)
end 
GO
/****** Object:  Table [dbo].[category]    Script Date: 03/11/2020 00:29:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[country]    Script Date: 03/11/2020 00:29:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[country](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ingredient]    Script Date: 03/11/2020 00:29:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ingredient](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[likes]    Script Date: 03/11/2020 00:29:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[likes](
	[user_id] [int] NOT NULL,
	[recipe_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC,
	[recipe_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[recipe]    Script Date: 03/11/2020 00:29:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[recipe](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](100) NOT NULL,
	[description] [varchar](500) NOT NULL,
	[instructions] [varchar](2500) NOT NULL,
	[user_id] [int] NOT NULL,
	[category_id] [int] NOT NULL,
	[imageUrl] [varchar](300) NULL,
	[likes]  AS ([dbo].[Countlikes]([id])),
	[ingredients] [varchar](2000) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[siteuser]    Script Date: 03/11/2020 00:29:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[siteuser](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[surname] [varchar](50) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[password] [varchar](256) NOT NULL,
	[country_id] [int] NOT NULL,
	[is_Admin] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[unit]    Script Date: 03/11/2020 00:29:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[unit](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[uses]    Script Date: 03/11/2020 00:29:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[uses](
	[recipe_id] [int] NOT NULL,
	[ingredient_id] [int] NOT NULL,
	[unit_id] [int] NOT NULL,
	[quantity] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[recipe_id] ASC,
	[ingredient_id] ASC,
	[unit_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[category] ON 

INSERT [dbo].[category] ([id], [name]) VALUES (1, N'Lunch')
INSERT [dbo].[category] ([id], [name]) VALUES (2, N'Drink')
INSERT [dbo].[category] ([id], [name]) VALUES (3, N'breakfast')
INSERT [dbo].[category] ([id], [name]) VALUES (4, N'brunch')
INSERT [dbo].[category] ([id], [name]) VALUES (5, N'dinner')
INSERT [dbo].[category] ([id], [name]) VALUES (6, N'dessert')
INSERT [dbo].[category] ([id], [name]) VALUES (7, N'snack')
INSERT [dbo].[category] ([id], [name]) VALUES (8, N'any time')
INSERT [dbo].[category] ([id], [name]) VALUES (9, N'other')
SET IDENTITY_INSERT [dbo].[category] OFF
GO
SET IDENTITY_INSERT [dbo].[country] ON 

INSERT [dbo].[country] ([id], [name]) VALUES (1, N'Afghanistan')
INSERT [dbo].[country] ([id], [name]) VALUES (2, N'Albania')
INSERT [dbo].[country] ([id], [name]) VALUES (3, N'Algeria')
INSERT [dbo].[country] ([id], [name]) VALUES (4, N'Andorra')
INSERT [dbo].[country] ([id], [name]) VALUES (5, N'Angola')
INSERT [dbo].[country] ([id], [name]) VALUES (6, N'Antigua and Barbuda')
INSERT [dbo].[country] ([id], [name]) VALUES (7, N'Argentina')
INSERT [dbo].[country] ([id], [name]) VALUES (8, N'Armenia')
INSERT [dbo].[country] ([id], [name]) VALUES (9, N'Australia')
INSERT [dbo].[country] ([id], [name]) VALUES (10, N'Austria')
INSERT [dbo].[country] ([id], [name]) VALUES (11, N'Azerbaijan')
INSERT [dbo].[country] ([id], [name]) VALUES (12, N'Bahamas')
INSERT [dbo].[country] ([id], [name]) VALUES (13, N'Bahrain')
INSERT [dbo].[country] ([id], [name]) VALUES (14, N'Bangladesh')
INSERT [dbo].[country] ([id], [name]) VALUES (15, N'Barbados')
INSERT [dbo].[country] ([id], [name]) VALUES (16, N'Belarus')
INSERT [dbo].[country] ([id], [name]) VALUES (17, N'Belgium')
INSERT [dbo].[country] ([id], [name]) VALUES (18, N'Belize')
INSERT [dbo].[country] ([id], [name]) VALUES (19, N'Benin')
INSERT [dbo].[country] ([id], [name]) VALUES (20, N'Bhutan')
INSERT [dbo].[country] ([id], [name]) VALUES (21, N'Bolivia')
INSERT [dbo].[country] ([id], [name]) VALUES (22, N'Bosnia and Herzegovina')
INSERT [dbo].[country] ([id], [name]) VALUES (23, N'Botswana')
INSERT [dbo].[country] ([id], [name]) VALUES (24, N'Brazil')
INSERT [dbo].[country] ([id], [name]) VALUES (25, N'Brunei')
INSERT [dbo].[country] ([id], [name]) VALUES (26, N'Bulgaria')
INSERT [dbo].[country] ([id], [name]) VALUES (27, N'Burkina Faso')
INSERT [dbo].[country] ([id], [name]) VALUES (28, N'Burundi')
INSERT [dbo].[country] ([id], [name]) VALUES (29, N'Cabo Verde')
INSERT [dbo].[country] ([id], [name]) VALUES (30, N'Cambodia')
INSERT [dbo].[country] ([id], [name]) VALUES (31, N'Cameroon')
INSERT [dbo].[country] ([id], [name]) VALUES (32, N'Canada')
INSERT [dbo].[country] ([id], [name]) VALUES (33, N'Central African Republic (CAR)')
INSERT [dbo].[country] ([id], [name]) VALUES (34, N'Chad')
INSERT [dbo].[country] ([id], [name]) VALUES (35, N'Chile')
INSERT [dbo].[country] ([id], [name]) VALUES (36, N'China')
INSERT [dbo].[country] ([id], [name]) VALUES (37, N'Colombia')
INSERT [dbo].[country] ([id], [name]) VALUES (38, N'Comoros')
INSERT [dbo].[country] ([id], [name]) VALUES (39, N'Congo, Democratic Republic of the')
INSERT [dbo].[country] ([id], [name]) VALUES (40, N'Congo, Republic of the')
INSERT [dbo].[country] ([id], [name]) VALUES (41, N'Costa Rica')
INSERT [dbo].[country] ([id], [name]) VALUES (42, N'Cote dIvoire')
INSERT [dbo].[country] ([id], [name]) VALUES (43, N'Croatia')
INSERT [dbo].[country] ([id], [name]) VALUES (44, N'Cuba')
INSERT [dbo].[country] ([id], [name]) VALUES (45, N'Cyprus')
INSERT [dbo].[country] ([id], [name]) VALUES (46, N'Czechia')
INSERT [dbo].[country] ([id], [name]) VALUES (47, N'Denmark')
INSERT [dbo].[country] ([id], [name]) VALUES (48, N'Djibouti')
INSERT [dbo].[country] ([id], [name]) VALUES (49, N'Dominica')
INSERT [dbo].[country] ([id], [name]) VALUES (50, N'Dominican Republic')
INSERT [dbo].[country] ([id], [name]) VALUES (51, N'Ecuador')
INSERT [dbo].[country] ([id], [name]) VALUES (52, N'Egypt')
INSERT [dbo].[country] ([id], [name]) VALUES (53, N'El Salvador')
INSERT [dbo].[country] ([id], [name]) VALUES (54, N'Equatorial Guinea')
INSERT [dbo].[country] ([id], [name]) VALUES (55, N'Eritrea')
INSERT [dbo].[country] ([id], [name]) VALUES (56, N'Estonia')
INSERT [dbo].[country] ([id], [name]) VALUES (57, N'Eswatini (formerly Swaziland)')
INSERT [dbo].[country] ([id], [name]) VALUES (58, N'Ethiopia')
INSERT [dbo].[country] ([id], [name]) VALUES (59, N'Fiji')
INSERT [dbo].[country] ([id], [name]) VALUES (60, N'Finland')
INSERT [dbo].[country] ([id], [name]) VALUES (61, N'France')
INSERT [dbo].[country] ([id], [name]) VALUES (62, N'Gabon')
INSERT [dbo].[country] ([id], [name]) VALUES (63, N'Gambia')
INSERT [dbo].[country] ([id], [name]) VALUES (64, N'Georgia')
INSERT [dbo].[country] ([id], [name]) VALUES (65, N'Germany')
INSERT [dbo].[country] ([id], [name]) VALUES (66, N'Ghana')
INSERT [dbo].[country] ([id], [name]) VALUES (67, N'Greece')
INSERT [dbo].[country] ([id], [name]) VALUES (68, N'Grenada')
INSERT [dbo].[country] ([id], [name]) VALUES (69, N'Guatemala')
INSERT [dbo].[country] ([id], [name]) VALUES (70, N'Guinea')
INSERT [dbo].[country] ([id], [name]) VALUES (71, N'Guinea-Bissau')
INSERT [dbo].[country] ([id], [name]) VALUES (72, N'Guyana')
INSERT [dbo].[country] ([id], [name]) VALUES (73, N'Haiti')
INSERT [dbo].[country] ([id], [name]) VALUES (74, N'Honduras')
INSERT [dbo].[country] ([id], [name]) VALUES (75, N'Hungary')
INSERT [dbo].[country] ([id], [name]) VALUES (76, N'Iceland')
INSERT [dbo].[country] ([id], [name]) VALUES (77, N'India')
INSERT [dbo].[country] ([id], [name]) VALUES (78, N'Indonesia')
INSERT [dbo].[country] ([id], [name]) VALUES (79, N'Iran')
INSERT [dbo].[country] ([id], [name]) VALUES (80, N'Iraq')
INSERT [dbo].[country] ([id], [name]) VALUES (81, N'Ireland')
INSERT [dbo].[country] ([id], [name]) VALUES (82, N'Israel')
INSERT [dbo].[country] ([id], [name]) VALUES (83, N'Italy')
INSERT [dbo].[country] ([id], [name]) VALUES (84, N'Jamaica')
INSERT [dbo].[country] ([id], [name]) VALUES (85, N'Japan')
INSERT [dbo].[country] ([id], [name]) VALUES (86, N'Jordan')
INSERT [dbo].[country] ([id], [name]) VALUES (87, N'Kazakhstan')
INSERT [dbo].[country] ([id], [name]) VALUES (88, N'Kenya')
INSERT [dbo].[country] ([id], [name]) VALUES (89, N'Kiribati')
INSERT [dbo].[country] ([id], [name]) VALUES (90, N'Kosovo')
INSERT [dbo].[country] ([id], [name]) VALUES (91, N'Kuwait')
INSERT [dbo].[country] ([id], [name]) VALUES (92, N'Kyrgyzstan')
INSERT [dbo].[country] ([id], [name]) VALUES (93, N'Laos')
INSERT [dbo].[country] ([id], [name]) VALUES (94, N'Latvia')
INSERT [dbo].[country] ([id], [name]) VALUES (95, N'Lebanon')
INSERT [dbo].[country] ([id], [name]) VALUES (96, N'Lesotho')
INSERT [dbo].[country] ([id], [name]) VALUES (97, N'Liberia')
INSERT [dbo].[country] ([id], [name]) VALUES (98, N'Libya')
INSERT [dbo].[country] ([id], [name]) VALUES (99, N'Liechtenstein')
GO
INSERT [dbo].[country] ([id], [name]) VALUES (100, N'Lithuania')
INSERT [dbo].[country] ([id], [name]) VALUES (101, N'Luxembourg')
INSERT [dbo].[country] ([id], [name]) VALUES (102, N'Madagascar')
INSERT [dbo].[country] ([id], [name]) VALUES (103, N'Malawi')
INSERT [dbo].[country] ([id], [name]) VALUES (104, N'Malaysia')
INSERT [dbo].[country] ([id], [name]) VALUES (105, N'Maldives')
INSERT [dbo].[country] ([id], [name]) VALUES (106, N'Mali')
INSERT [dbo].[country] ([id], [name]) VALUES (107, N'Malta')
INSERT [dbo].[country] ([id], [name]) VALUES (108, N'Marshall Islands')
INSERT [dbo].[country] ([id], [name]) VALUES (109, N'Mauritania')
INSERT [dbo].[country] ([id], [name]) VALUES (110, N'Mauritius')
INSERT [dbo].[country] ([id], [name]) VALUES (111, N'Mexico')
INSERT [dbo].[country] ([id], [name]) VALUES (112, N'Micronesia')
INSERT [dbo].[country] ([id], [name]) VALUES (113, N'Moldova')
INSERT [dbo].[country] ([id], [name]) VALUES (114, N'Monaco')
INSERT [dbo].[country] ([id], [name]) VALUES (115, N'Mongolia')
INSERT [dbo].[country] ([id], [name]) VALUES (116, N'Montenegro')
INSERT [dbo].[country] ([id], [name]) VALUES (117, N'Morocco')
INSERT [dbo].[country] ([id], [name]) VALUES (118, N'Mozambique')
INSERT [dbo].[country] ([id], [name]) VALUES (119, N'Myanmar (formerly Burma)')
INSERT [dbo].[country] ([id], [name]) VALUES (120, N'Namibia')
INSERT [dbo].[country] ([id], [name]) VALUES (121, N'Nauru')
INSERT [dbo].[country] ([id], [name]) VALUES (122, N'Nepal')
INSERT [dbo].[country] ([id], [name]) VALUES (123, N'Netherlands')
INSERT [dbo].[country] ([id], [name]) VALUES (124, N'New Zealand')
INSERT [dbo].[country] ([id], [name]) VALUES (125, N'Nicaragua')
INSERT [dbo].[country] ([id], [name]) VALUES (126, N'Niger')
INSERT [dbo].[country] ([id], [name]) VALUES (127, N'Nigeria')
INSERT [dbo].[country] ([id], [name]) VALUES (128, N'North Korea')
INSERT [dbo].[country] ([id], [name]) VALUES (129, N'North Macedonia (formerly Macedonia)')
INSERT [dbo].[country] ([id], [name]) VALUES (130, N'Norway')
INSERT [dbo].[country] ([id], [name]) VALUES (131, N'Oman')
INSERT [dbo].[country] ([id], [name]) VALUES (132, N'Pakistan')
INSERT [dbo].[country] ([id], [name]) VALUES (133, N'Palau')
INSERT [dbo].[country] ([id], [name]) VALUES (134, N'Palestine')
INSERT [dbo].[country] ([id], [name]) VALUES (135, N'Panama')
INSERT [dbo].[country] ([id], [name]) VALUES (136, N'Papua New Guinea')
INSERT [dbo].[country] ([id], [name]) VALUES (137, N'Paraguay')
INSERT [dbo].[country] ([id], [name]) VALUES (138, N'Peru')
INSERT [dbo].[country] ([id], [name]) VALUES (139, N'Philippines')
INSERT [dbo].[country] ([id], [name]) VALUES (140, N'Poland')
INSERT [dbo].[country] ([id], [name]) VALUES (141, N'Portugal')
INSERT [dbo].[country] ([id], [name]) VALUES (142, N'Qatar')
INSERT [dbo].[country] ([id], [name]) VALUES (143, N'Romania')
INSERT [dbo].[country] ([id], [name]) VALUES (144, N'Russia')
INSERT [dbo].[country] ([id], [name]) VALUES (145, N'Rwanda')
INSERT [dbo].[country] ([id], [name]) VALUES (146, N'Saint Kitts and Nevis')
INSERT [dbo].[country] ([id], [name]) VALUES (147, N'Saint Lucia')
INSERT [dbo].[country] ([id], [name]) VALUES (148, N'Saint Vincent and the Grenadines')
INSERT [dbo].[country] ([id], [name]) VALUES (149, N'Samoa')
INSERT [dbo].[country] ([id], [name]) VALUES (150, N'San Marino')
INSERT [dbo].[country] ([id], [name]) VALUES (151, N'Sao Tome and Principe')
INSERT [dbo].[country] ([id], [name]) VALUES (152, N'Saudi Arabia')
INSERT [dbo].[country] ([id], [name]) VALUES (153, N'Senegal')
INSERT [dbo].[country] ([id], [name]) VALUES (154, N'Serbia')
INSERT [dbo].[country] ([id], [name]) VALUES (155, N'Seychelles')
INSERT [dbo].[country] ([id], [name]) VALUES (156, N'Sierra Leone')
INSERT [dbo].[country] ([id], [name]) VALUES (157, N'Singapore')
INSERT [dbo].[country] ([id], [name]) VALUES (158, N'Slovakia')
INSERT [dbo].[country] ([id], [name]) VALUES (159, N'Slovenia')
INSERT [dbo].[country] ([id], [name]) VALUES (160, N'Solomon Islands')
INSERT [dbo].[country] ([id], [name]) VALUES (161, N'Somalia')
INSERT [dbo].[country] ([id], [name]) VALUES (162, N'South Africa')
INSERT [dbo].[country] ([id], [name]) VALUES (163, N'South Korea')
INSERT [dbo].[country] ([id], [name]) VALUES (164, N'South Sudan')
INSERT [dbo].[country] ([id], [name]) VALUES (165, N'Spain')
INSERT [dbo].[country] ([id], [name]) VALUES (166, N'Sri Lanka')
INSERT [dbo].[country] ([id], [name]) VALUES (167, N'Sudan')
INSERT [dbo].[country] ([id], [name]) VALUES (168, N'Suriname')
INSERT [dbo].[country] ([id], [name]) VALUES (169, N'Sweden')
INSERT [dbo].[country] ([id], [name]) VALUES (170, N'Switzerland')
INSERT [dbo].[country] ([id], [name]) VALUES (171, N'Syria')
INSERT [dbo].[country] ([id], [name]) VALUES (172, N'Taiwan')
INSERT [dbo].[country] ([id], [name]) VALUES (173, N'Tajikistan')
INSERT [dbo].[country] ([id], [name]) VALUES (174, N'Tanzania')
INSERT [dbo].[country] ([id], [name]) VALUES (175, N'Thailand')
INSERT [dbo].[country] ([id], [name]) VALUES (176, N'Timor-Leste')
INSERT [dbo].[country] ([id], [name]) VALUES (177, N'Togo')
INSERT [dbo].[country] ([id], [name]) VALUES (178, N'Tonga')
INSERT [dbo].[country] ([id], [name]) VALUES (179, N'Trinidad and Tobago')
INSERT [dbo].[country] ([id], [name]) VALUES (180, N'Tunisia')
INSERT [dbo].[country] ([id], [name]) VALUES (181, N'Turkey')
INSERT [dbo].[country] ([id], [name]) VALUES (182, N'Turkmenistan')
INSERT [dbo].[country] ([id], [name]) VALUES (183, N'Tuvalu')
INSERT [dbo].[country] ([id], [name]) VALUES (184, N'Uganda')
INSERT [dbo].[country] ([id], [name]) VALUES (185, N'Ukraine')
INSERT [dbo].[country] ([id], [name]) VALUES (186, N'United Arab Emirates (UAE)')
INSERT [dbo].[country] ([id], [name]) VALUES (187, N'United Kingdom (UK)')
INSERT [dbo].[country] ([id], [name]) VALUES (188, N'United States of America (USA)')
INSERT [dbo].[country] ([id], [name]) VALUES (189, N'Uruguay')
INSERT [dbo].[country] ([id], [name]) VALUES (190, N'Uzbekistan')
INSERT [dbo].[country] ([id], [name]) VALUES (191, N'Vanuatu')
INSERT [dbo].[country] ([id], [name]) VALUES (192, N'Vatican City (Holy See)')
INSERT [dbo].[country] ([id], [name]) VALUES (193, N'Venezuela')
INSERT [dbo].[country] ([id], [name]) VALUES (194, N'Vietnam')
INSERT [dbo].[country] ([id], [name]) VALUES (195, N'Yemen')
INSERT [dbo].[country] ([id], [name]) VALUES (196, N'Zambia')
INSERT [dbo].[country] ([id], [name]) VALUES (197, N'Zimbabwe')
SET IDENTITY_INSERT [dbo].[country] OFF
GO
SET IDENTITY_INSERT [dbo].[ingredient] ON 

INSERT [dbo].[ingredient] ([id], [name]) VALUES (1, N'erythritol')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (2, N'xylitol')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (3, N'splenda')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (4, N'sweetleaf stevia packets')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (5, N'honey')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (6, N'molasses')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (7, N'white sugar')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (8, N'brown sugar')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (9, N'white vinegar')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (10, N'balsamic vinegar')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (11, N'apple cider vinegar')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (12, N'baking soda')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (13, N'baking powder')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (14, N'cocoa powder')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (15, N'cream of tartar')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (16, N'olive oil')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (17, N'peanut oil')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (18, N'coconut oil')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (19, N'spray oil')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (20, N'sea salt')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (21, N'milled pepper')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (22, N'basil')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (23, N'oregano')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (24, N'parsley')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (25, N'garlic powder')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (26, N'onion powder')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (27, N'cinnamon')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (28, N'nutmeg')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (29, N'chili')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (30, N'cumin')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (31, N'thyme')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (32, N'fennel')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (33, N'real vanilla extract')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (34, N'almond extract')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (35, N'maple extract')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (36, N'mint extract')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (37, N'orange extract')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (38, N'rum extract')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (39, N'almond flour')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (40, N'coconut flour')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (41, N'almond meal')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (42, N'dessicated coconut')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (43, N'protein powder')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (44, N'flax seed meal')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (45, N'soy sauce')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (46, N'worcestershire sauce')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (47, N'kitchen bouquet')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (48, N'onion')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (49, N'garlic')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (50, N'jalapeno slices')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (51, N'black olives')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (52, N'ro-tel')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (53, N'iced tea bags')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (54, N'mint tea bags')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (55, N'pizza sauce')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (56, N'organic beef broth')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (57, N'organic chicken broth')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (58, N'pumpkin seeds')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (59, N'sunflower seeds')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (60, N'macadamia nuts')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (61, N'almonds')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (62, N'walnuts')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (63, N'pine nuts')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (64, N'cashews')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (65, N'pecans')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (66, N'sun-dried tomatoes')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (67, N'roasted red peppers')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (68, N'artichoke hearts')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (69, N'pesto alfredo sauce')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (70, N'pumpkin')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (71, N'instant coffee')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (72, N'feta')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (73, N'medium cheddar')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (74, N'sharp cheddar')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (75, N'shredded parmesan')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (76, N'grated parmesan')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (77, N'cream cheese')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (78, N'shredded mozzarella')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (79, N'greek yogurt')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (80, N'cottage cheese')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (81, N'low-carb yogurt')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (82, N'heavy white whipping cream')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (83, N'butter')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (84, N'sour cream')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (85, N'ground beef')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (86, N'eggs')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (87, N'boneless chicken breasts')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (88, N'sliced pepperoni')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (89, N'bacon')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (90, N'pepperoni sticks')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (91, N'beef hot dogs')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (92, N'green beans')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (93, N'grape tomatoes ')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (94, N'kosher baby dill pickles')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (95, N'cucumber')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (96, N'zucchini')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (97, N'cauliflower')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (98, N'bagged spinach')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (99, N'mushrooms')
GO
INSERT [dbo].[ingredient] ([id], [name]) VALUES (100, N'iceberg lettuce')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (101, N'lemon')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (102, N'apple')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (103, N'orange')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (104, N'banana')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (105, N'pear')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (106, N'plum')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (107, N'green olives')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (108, N'mayonnaise')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (109, N'unsweetened almond milk')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (110, N'unsweetened coconut milk')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (111, N'heinz ketchup')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (112, N'yellow mustard')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (113, N'brussels sprouts')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (114, N'carrots')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (115, N'ginger root')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (116, N'green bell peppers')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (117, N'red bell peppers')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (118, N'lime')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (119, N'blueberries')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (120, N'strawberries')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (121, N'flank steaks')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (122, N'skirt steaks')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (123, N'coleslaw (bagged unmixed) fresh snap peas')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (124, N'grass-fed beef')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (125, N'tilapia')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (126, N'shrimp')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (127, N'blueberries')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (128, N'strawberries')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (129, N'raspberries')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (130, N'cherries')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (131, N'blackberries')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (132, N'cauliflower')
INSERT [dbo].[ingredient] ([id], [name]) VALUES (133, N'spinach')
SET IDENTITY_INSERT [dbo].[ingredient] OFF
GO
INSERT [dbo].[likes] ([user_id], [recipe_id]) VALUES (11, 89)
GO
SET IDENTITY_INSERT [dbo].[recipe] ON 

INSERT [dbo].[recipe] ([id], [title], [description], [instructions], [user_id], [category_id], [imageUrl], [ingredients]) VALUES (86, N'Millionaire’s shortbread', N' Our millionaire shortbread recipes include vegan alternatives and 
flavoured versions of this biscuit tin classic.
', N'STEP 1
Heat the oven to 180C/160C fan/gas 4. Lightly grease and line a 20-22cm square or rectangular
baking tin with a lip of at least 3cm.', 13, 1, N'images/food-img-2.jpg', NULL)
INSERT [dbo].[recipe] ([id], [title], [description], [instructions], [user_id], [category_id], [imageUrl], [ingredients]) VALUES (88, N'Courgette & lemon risotto', N'An easy vegetarian one-pot risotto - simply stir in 
your seasonal veg, simmer and enjoy
', N'STEP 1
Melt the butter in a deep frying pan. Add the onion and fry gently until softened for about 
8 mins, then add the garlic and stir for 1 min. Stir in the rice to coat it in the buttery 
onions and garlic for 1-2 mins.', 13, 1, N'images/food-img-5.jpg', NULL)
INSERT [dbo].[recipe] ([id], [title], [description], [instructions], [user_id], [category_id], [imageUrl], [ingredients]) VALUES (89, N'Daisy daisy', N'This isn’t one of those post-90s disco drinks that hurt your teeth, 
but it is easy to make at home, and is an all-round winner', N'You will need 40ml Ketel One peach and orange blossom vodka (or you can use gin), 20ml elderflower
liqueur (we prefer Fiorente), 40ml apple juice and 20ml lime juice', 12, 2, N'images/drink-img-2.jpg', NULL)
INSERT [dbo].[recipe] ([id], [title], [description], [instructions], [user_id], [category_id], [imageUrl], [ingredients]) VALUES (90, N'Healthy hedonist spritz', N'Build directly into a wine glass for a single serve', N'Start by pouring 50ml Lyre’s Italian Spritz over ice, followed by 5ml of aloe vera juice. 
Next, slowly add 50ml of cucumber soda (I use Something & Nothing’s Cucumber Seltzer).', 13, 2, N'images/drink-img-3.jpg', NULL)
INSERT [dbo].[recipe] ([id], [title], [description], [instructions], [user_id], [category_id], [imageUrl], [ingredients]) VALUES (91, N'Elderflower spritz', N'For me, nothing says “summer” more than sipping an ice-cold spritz
on a terrace', N'In a wine glass, simply mix 50ml St Germain, 25ml lemon juice, 75ml prosecco and 75ml soda. If 
you really want to wow your friends, garnish with a rolled cucumber.', 12, 2, N'images/drink-img-4.jpg', NULL)
INSERT [dbo].[recipe] ([id], [title], [description], [instructions], [user_id], [category_id], [imageUrl], [ingredients]) VALUES (92, N'Curried cod', N'An easy-to-prepare midweek one-pot with cod fillet, chickpeas, ginger and spices 
- its healthy, low calorie and packed with iron too.', N'Heat the oil in a large, lidded frying pan. Cook 
the onion over a high heat for a few mins, then stir in the curry powder, ginger and garlic. Cook for 
another 1-2 mins until fragrant, then stir in the tomatoes, chickpeas and some seasoning.', 13, 1, N'images/food-img-4.jpg', NULL)
INSERT [dbo].[recipe] ([id], [title], [description], [instructions], [user_id], [category_id], [imageUrl], [ingredients]) VALUES (93, N'The floradora', N'This drink has a great balance of sharpness and sweetness
', N'This drink has a great balance of sharpness and sweetness, which really makes me 
feel I have quenched my thirst. However, it can be a tad dangerous as it is super easy-drinking. 
Take 50ml gin, 15ml raspberry shrub (we use the Bristol Syrup Co’s shrub) and 15ml lime juice, stir 
together and pour on to ice in a tall glass. Top with ginger ale and garnish with a dehydrated 
lime wheel (optional).', 12, 2, N'images/drink-img-1.jpg', NULL)
INSERT [dbo].[recipe] ([id], [title], [description], [instructions], [user_id], [category_id], [imageUrl], [ingredients]) VALUES (94, N'Beef stroganoff', N'Make a classic beef stroganoff with steak and mushrooms for a tasty midweek meal. 
Garnish with parsley and serve with pappardelle pasta or rice.
', N'Heat 1 tbsp olive oil in a non-stick frying pan then add 1 sliced onion and cook on a medium heat 
until completely softened,
around 15 mins, adding a little splash of water if it starts to stick.', 13, 1, N'images/food-img-7.jpg', NULL)
INSERT [dbo].[recipe] ([id], [title], [description], [instructions], [user_id], [category_id], [imageUrl], [ingredients]) VALUES (95, N'Pan-fried salmon', N'Have a perfectly cooked salmon fillet, complete with crisp skin, 
ready in under 10 minutes. Serve with a side of buttery, seasonal green veg for a filling supper
', N'Generously season the salmon fillets with salt and pepper. Put the oil and butter in a non-stick
frying pan over a medium heat, swirling around the pan until melted and foaming, then turn up the heat. 
Once the butter starts bubbling, add the salmon fillets to the pan, skin-side-down, and fry for 3 mins 
until crisp. Flip the fillets over, lower the heat and cook for 2 mins more, then drizzle with the lemon
juice. Transfer the salmon to a plate and baste with any of the buttery juices left in the pan.', 12, 1, N'images/food-img-6.jpg', NULL)
INSERT [dbo].[recipe] ([id], [title], [description], [instructions], [user_id], [category_id], [imageUrl], [ingredients]) VALUES (96, N'Chorizo & mozzarella gnocchi bake', N'Upgrade cheesy tomato pasta with gnocchi, 
chorizo and mozzarella for a comforting bake that makes an excellent midweek meal
', N'Heat the oil in a medium pan over a medium heat. Fry the onion and garlic for 8-10 mins
until soft. Add the chorizo and fry for 5 mins more. Tip in the tomatoes and sugar, and 
season. Bring to a simmer, then add the gnocchi and cook for 8 mins, stirring often, until 
soft. Heat the grill to high.', 12, 1, N'images/food-img-1.jpg', N'1 tbsp olive oil
1 onion , finely chopped
2 garlic cloves , crushed
120g chorizo , diced
2 x 400g cans chopped tomatoes
1 tsp caster sugar
600g fresh gnocchi
125g mozzarella ball, cut into chunks
small bunch of basil , torn
green salad , to serve')
INSERT [dbo].[recipe] ([id], [title], [description], [instructions], [user_id], [category_id], [imageUrl], [ingredients]) VALUES (97, N'Meatball black bean chilli', N'Double the amounts for this one-pot black bean chilli,
then freeze the leftovers for busy days. It tastes just as great reheated as it does freshly cooked
', N'Heat the oil in a large flameproof casserole dish over a medium heat. Fry the meatballs for 5 mins
until browned, then transfer to a plate with a slotted spoon.', 12, 1, N'images/food-img-3.jpg', N'1 tbsp olive oil
1 onion , finely chopped
2 garlic cloves , crushed
120g chorizo , diced
2 x 400g cans chopped tomatoes
1 tsp caster sugar
600g fresh gnocchi
125g mozzarella ball, cut into chunks
small bunch of basil , torn
green salad , to serve')
SET IDENTITY_INSERT [dbo].[recipe] OFF
GO
SET IDENTITY_INSERT [dbo].[siteuser] ON 

INSERT [dbo].[siteuser] ([id], [name], [surname], [username], [email], [password], [country_id], [is_Admin]) VALUES (11, N'Admin', N'Admin', N'Admin', N'Admin@admin.com', N'123', 169, 1)
INSERT [dbo].[siteuser] ([id], [name], [surname], [username], [email], [password], [country_id], [is_Admin]) VALUES (12, N'user1', N'user1', N'user1', N'user1@user1.com', N'123', 32, 0)
INSERT [dbo].[siteuser] ([id], [name], [surname], [username], [email], [password], [country_id], [is_Admin]) VALUES (13, N'user2', N'user2', N'user2', N'user2@user2.com', N'123', 83, 0)
SET IDENTITY_INSERT [dbo].[siteuser] OFF
GO
SET IDENTITY_INSERT [dbo].[unit] ON 

INSERT [dbo].[unit] ([id], [name]) VALUES (1, N'Cup')
INSERT [dbo].[unit] ([id], [name]) VALUES (2, N'Gram')
SET IDENTITY_INSERT [dbo].[unit] OFF
GO
ALTER TABLE [dbo].[likes]  WITH CHECK ADD FOREIGN KEY([recipe_id])
REFERENCES [dbo].[recipe] ([id])
GO
ALTER TABLE [dbo].[likes]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[siteuser] ([id])
GO
ALTER TABLE [dbo].[recipe]  WITH CHECK ADD FOREIGN KEY([category_id])
REFERENCES [dbo].[category] ([id])
GO
ALTER TABLE [dbo].[recipe]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[siteuser] ([id])
GO
ALTER TABLE [dbo].[siteuser]  WITH CHECK ADD FOREIGN KEY([country_id])
REFERENCES [dbo].[country] ([id])
GO
ALTER TABLE [dbo].[uses]  WITH CHECK ADD FOREIGN KEY([ingredient_id])
REFERENCES [dbo].[ingredient] ([id])
GO
ALTER TABLE [dbo].[uses]  WITH CHECK ADD FOREIGN KEY([recipe_id])
REFERENCES [dbo].[recipe] ([id])
GO
ALTER TABLE [dbo].[uses]  WITH CHECK ADD FOREIGN KEY([unit_id])
REFERENCES [dbo].[unit] ([id])
GO
/****** Object:  StoredProcedure [dbo].[getUser]    Script Date: 03/11/2020 00:29:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getUser] (
@userId int
)
AS
select siteuser.username, siteuser.email, country.name as countryName
from 
siteuser
join country  on
 siteuser.country_id=country.id
where siteuser.id=@userId
GO
/****** Object:  StoredProcedure [dbo].[getUserInformation]    Script Date: 03/11/2020 00:29:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getUserInformation](
@userName varchar(50)
)
AS select users.id AS userId, users.email, users.is_Admin, users.name As firstNmae, users.surname, users.username, password, coun.name As countryName, 
recp.id AS recipeId, recp.title AS recieTitle, recp.description, recp.imageUrl, recp.ingredients, recp.instructions, recp.likes
from 
siteuser users join 
(select * from country)  coun 
on coun.id=users.country_id
join(select * from  recipe) recp on
recp.user_id=users.id
where users.username='alwan95'
GO
/****** Object:  StoredProcedure [dbo].[getUserRecipes]    Script Date: 03/11/2020 00:29:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getUserRecipes]  (
@userId int
)
As 
select recipe.id, recipe.title, recipe.description, recipe.likes, recipe.imageUrl from recipe where 
recipe.user_id=@userId
GO
/****** Object:  StoredProcedure [dbo].[insertRecipe]    Script Date: 03/11/2020 00:29:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[insertRecipe](
@title varchar(100), 
@descrition varchar(500) ,
@instruction varchar(2500),
@userId int ,
@categoryId int,
@imgUrl varchar(300),
@ingredients varchar(2000)
)
As 
insert into recipe (title,description, instructions, user_id, category_id, imageUrl, ingredients)
values (@title,@descrition, @instruction, @userId, @categoryId, @imgUrl, @ingredients )
GO
/****** Object:  StoredProcedure [dbo].[spDeleteRecipe]    Script Date: 03/11/2020 00:29:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spDeleteRecipe](
@recipeId int
)
As
delete from likes where recipe_id=@recipeId
delete from recipe where id=@recipeId 
GO
/****** Object:  StoredProcedure [dbo].[spDeleteUser]    Script Date: 03/11/2020 00:29:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spDeleteUser] (
@username varchar (50)
)
AS
declare @userId int;
set @userId = (select siteuser.id from siteuser where siteuser.username=@username);
delete from likes where likes.user_id =@userId;
delete from recipe where recipe.user_id=@userId
delete from siteuser where siteuser.id=@userId
GO
/****** Object:  StoredProcedure [dbo].[spGetBestRecipes]    Script Date: 03/11/2020 00:29:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spGetBestRecipes] (
@numberOfRecipes int
)
AS
select top (@numberOfRecipes) recipe.id, title,description, instructions,user_id,category_id,imageUrl,likes,siteuser.name,
	siteuser.surname,siteuser.username from recipe left join siteuser on recipe.user_id=siteuser.id
	order by likes desc
GO
/****** Object:  StoredProcedure [dbo].[spGetHints]    Script Date: 03/11/2020 00:29:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create proc [dbo].[spGetHints] (
@numberOfHints int,
@searchWord varchar (100)
)
AS
select top (@numberOfHints) recipe.id, recipe.title, recipe.description, recipe.ingredients from recipe where
recipe.title like '%'+ @searchWord+'%' or 
recipe.description like  '%'+@searchWord+'%'
or recipe.ingredients like '%'+@searchWord+'%'
order by recipe.likes
GO
/****** Object:  StoredProcedure [dbo].[spGetRecipesByCategory]    Script Date: 03/11/2020 00:29:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create proc [dbo].[spGetRecipesByCategory] (
@categoryName varchar (100)
)
AS
select r.id, r.imageUrl, r.likes,r.title, u.username, r.description, c.name
from 
recipe r join 
(select * from siteuser)  u 
on r.user_id=u.id
join(select * from  category) c on
r.category_id=c.id
where c.name=@categoryName
GO
/****** Object:  StoredProcedure [dbo].[spGetRecipesByCountry]    Script Date: 03/11/2020 00:29:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create proc [dbo].[spGetRecipesByCountry] (

@countryName varchar (100)
)
AS
select r.id, r.imageUrl, r.likes,r.title, u.username, r.description
from 
recipe r join 
(select * from siteuser)  u 
on r.user_id=u.id
join(select * from  country) c on
u.country_id=c.id
where c.name=@countryName
GO
/****** Object:  StoredProcedure [dbo].[spGetRecipesByCountryAndCategory]    Script Date: 03/11/2020 00:29:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spGetRecipesByCountryAndCategory] (
@categoryName varchar (100),
@countryName varchar (100)
)
As
select rec.id, rec.imageUrl, rec.likes,rec.title, us.username, rec.description, cat.name,con.name
from 
recipe rec join 
(select * from siteuser)  us 
on rec.user_id=us.id
join(select * from  country) con on
us.country_id=con.id
join (select *from category)as cat on
cat.id=rec.category_id
where cat.name=@categoryName and 
con.name=@countryName
GO
/****** Object:  StoredProcedure [dbo].[spGetRecipesByUserName]    Script Date: 03/11/2020 00:29:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spGetRecipesByUserName](
@username varchar(50)
)
AS
select * from recipe join siteuser on 
recipe.user_id=siteuser.id
where siteuser.username=@username
GO
/****** Object:  StoredProcedure [dbo].[spGetRecipesForAPage]    Script Date: 03/11/2020 00:29:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spGetRecipesForAPage] 
@PageNumber int, 
@RecipesNumber int 
as 
Begin
	Declare @StartRow int 
	Declare @EndRow int 
	set @StartRow = ((@PageNumber -1) *@RecipesNumber) +1;
	set @EndRow = @PageNumber * @RecipesNumber;
	With Result as (
	select recipe.id, title,description, instructions,user_id,category_id,imageUrl,likes,siteuser.name,
	siteuser.surname,siteuser.username,
	ROW_NUMBER () over (Order by recipe.id ASC) RowNumber
	from recipe join siteuser on recipe.user_id=siteuser.id
	)
	select * from Result 
	where RowNumber Between @StartRow And @EndRow
End
GO
/****** Object:  StoredProcedure [dbo].[spGetUserInfo]    Script Date: 03/11/2020 00:29:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spGetUserInfo] (
@userName varchar(50)
)
AS
select siteuser.username, siteuser.email, siteuser.is_Admin, country.name as country from siteuser join country 
on siteuser.country_id=country.id
where siteuser.username=@userName
GO
/****** Object:  StoredProcedure [dbo].[spGetUserNameForHints]    Script Date: 03/11/2020 00:29:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spGetUserNameForHints](
@searchWord varchar (50)
)
As
select siteuser.username from siteuser where siteuser.username like @searchWord+'%'
GO
/****** Object:  StoredProcedure [dbo].[spGetUserStatics]    Script Date: 03/11/2020 00:29:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  proc [dbo].[spGetUserStatics](
@username varchar (50)
)
AS
declare @userId int;
select @userId =  CAST(siteuser.id as int) from siteuser where siteuser.username=@username;

select COUNT(user_id) as recpies from recipe where user_id=@userId union all 
select COUNT(user_id) as likes from likes where user_id=@userId
GO
/****** Object:  StoredProcedure [dbo].[spUpdateRecipe]    Script Date: 03/11/2020 00:29:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spUpdateRecipe](
@recipeId int,
@userId int, 
@title varchar(100), 
@descrition varchar(500) ,
@instruction varchar(2500),
@categoryId int,
@ingredients varchar(2000)
)
AS
UPDATE recipe  set 
title=@title,description=@descrition, instructions=@instruction,category_id=@categoryId,
ingredients=@ingredients
where recipe.id=@recipeId and recipe.user_id=@userId
GO
USE [master]
GO
ALTER DATABASE [ProjectDB] SET  READ_WRITE 
GO
