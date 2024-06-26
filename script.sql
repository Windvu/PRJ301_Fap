USE [master]
GO
/****** Object:  Database [Attend_Task]    Script Date: 3/19/2024 6:33:22 PM ******/
CREATE DATABASE [Attend_Task]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Attend_Task', FILENAME = N'C:\Users\Vu Minh Quan\Downloads\MSSQL16.MSSQLSERVER\MSSQL\DATA\Attend_Task.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Attend_Task_log', FILENAME = N'C:\Users\Vu Minh Quan\Downloads\MSSQL16.MSSQLSERVER\MSSQL\DATA\Attend_Task_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Attend_Task] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Attend_Task].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Attend_Task] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Attend_Task] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Attend_Task] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Attend_Task] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Attend_Task] SET ARITHABORT OFF 
GO
ALTER DATABASE [Attend_Task] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Attend_Task] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Attend_Task] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Attend_Task] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Attend_Task] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Attend_Task] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Attend_Task] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Attend_Task] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Attend_Task] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Attend_Task] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Attend_Task] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Attend_Task] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Attend_Task] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Attend_Task] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Attend_Task] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Attend_Task] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Attend_Task] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Attend_Task] SET RECOVERY FULL 
GO
ALTER DATABASE [Attend_Task] SET  MULTI_USER 
GO
ALTER DATABASE [Attend_Task] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Attend_Task] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Attend_Task] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Attend_Task] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Attend_Task] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Attend_Task] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Attend_Task', N'ON'
GO
ALTER DATABASE [Attend_Task] SET QUERY_STORE = ON
GO
ALTER DATABASE [Attend_Task] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Attend_Task]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 3/19/2024 6:33:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NULL,
	[displayname] [nvarchar](50) NULL,
	[gmail] [nvarchar](50) NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Assessment]    Script Date: 3/19/2024 6:33:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Assessment](
	[aId] [int] NOT NULL,
	[name] [nvarchar](50) NULL,
	[suId] [nvarchar](50) NULL,
	[weight] [float] NULL,
	[gid] [int] NULL,
	[category] [nvarchar](50) NULL,
 CONSTRAINT [PK_Assessment] PRIMARY KEY CLUSTERED 
(
	[aId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Attendence]    Script Date: 3/19/2024 6:33:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attendence](
	[leId] [nvarchar](50) NULL,
	[sId] [nvarchar](50) NULL,
	[isPresent] [bit] NULL,
	[aDescript] [nvarchar](50) NULL,
	[aDate] [datetime] NULL,
	[aId] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Attendence] PRIMARY KEY CLUSTERED 
(
	[aId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Campus]    Script Date: 3/19/2024 6:33:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Campus](
	[cID] [nvarchar](50) NOT NULL,
	[cName] [nvarchar](50) NULL,
	[sID] [nvarchar](50) NULL,
	[lID] [nvarchar](50) NULL,
 CONSTRAINT [PK_Campus] PRIMARY KEY CLUSTERED 
(
	[cID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Enroll]    Script Date: 3/19/2024 6:33:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Enroll](
	[sId] [nvarchar](50) NOT NULL,
	[gId] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Enroll] PRIMARY KEY CLUSTERED 
(
	[sId] ASC,
	[gId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Exam]    Script Date: 3/19/2024 6:33:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exam](
	[eId] [int] NOT NULL,
	[aId] [int] NULL,
	[begin] [date] NULL,
	[end] [date] NULL,
	[rId] [nvarchar](50) NULL,
	[protorid] [nvarchar](50) NULL,
 CONSTRAINT [PK_Exam] PRIMARY KEY CLUSTERED 
(
	[eId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feature]    Script Date: 3/19/2024 6:33:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feature](
	[fId] [int] NOT NULL,
	[fName] [nvarchar](50) NULL,
	[url] [nvarchar](50) NULL,
 CONSTRAINT [PK_Feature] PRIMARY KEY CLUSTERED 
(
	[fId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Grade]    Script Date: 3/19/2024 6:33:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grade](
	[gid] [int] NOT NULL,
	[sId] [nvarchar](50) NULL,
	[score] [float] NULL,
	[lId] [nvarchar](50) NULL,
	[comment] [nvarchar](50) NULL,
 CONSTRAINT [PK_Grade] PRIMARY KEY CLUSTERED 
(
	[gid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Group]    Script Date: 3/19/2024 6:33:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group](
	[gId] [nvarchar](50) NOT NULL,
	[gName] [nvarchar](50) NOT NULL,
	[suId] [nvarchar](50) NOT NULL,
	[pIC] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Group_] PRIMARY KEY CLUSTERED 
(
	[gId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lecturer]    Script Date: 3/19/2024 6:33:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lecturer](
	[lId] [nvarchar](50) NOT NULL,
	[lName] [nvarchar](50) NOT NULL,
	[gender] [bit] NULL,
	[dob] [date] NULL,
	[gmail] [nvarchar](50) NULL,
 CONSTRAINT [PK_Lecturer] PRIMARY KEY CLUSTERED 
(
	[lId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lesson]    Script Date: 3/19/2024 6:33:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lesson](
	[leId] [nvarchar](50) NOT NULL,
	[gId] [nvarchar](50) NULL,
	[tId] [nvarchar](50) NULL,
	[lId] [nvarchar](50) NULL,
	[lDate] [date] NULL,
	[idAttend] [bit] NULL,
	[rId] [int] NULL,
 CONSTRAINT [PK_Lesson] PRIMARY KEY CLUSTERED 
(
	[leId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 3/19/2024 6:33:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[reId] [int] NOT NULL,
	[reName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[reId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoleAccount]    Script Date: 3/19/2024 6:33:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleAccount](
	[username] [nvarchar](50) NOT NULL,
	[reId] [int] NOT NULL,
 CONSTRAINT [PK_RoleAccount] PRIMARY KEY CLUSTERED 
(
	[username] ASC,
	[reId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoleFeature]    Script Date: 3/19/2024 6:33:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleFeature](
	[reId] [int] NOT NULL,
	[fId] [int] NOT NULL,
 CONSTRAINT [PK_RoleFeature] PRIMARY KEY CLUSTERED 
(
	[reId] ASC,
	[fId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 3/19/2024 6:33:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[rId] [int] NOT NULL,
	[rNumber] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[rId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 3/19/2024 6:33:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[sId] [nvarchar](50) NOT NULL,
	[sName] [nvarchar](50) NOT NULL,
	[gender] [bit] NULL,
	[dob] [date] NULL,
	[gmail] [nvarchar](50) NULL,
	[coreName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[sId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subject]    Script Date: 3/19/2024 6:33:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject](
	[suId] [nvarchar](50) NOT NULL,
	[suName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Subject] PRIMARY KEY CLUSTERED 
(
	[suId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Time_Slot]    Script Date: 3/19/2024 6:33:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Time_Slot](
	[tId] [nvarchar](50) NOT NULL,
	[tDescript] [nvarchar](50) NULL,
	[tName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Time_Slot] PRIMARY KEY CLUSTERED 
(
	[tId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Account] ([username], [password], [displayname], [gmail]) VALUES (N'quanvmhe171227', N'000', N'Vũ Minh Quân', N'quanvmhe171227@fpt.edu.vn')
INSERT [dbo].[Account] ([username], [password], [displayname], [gmail]) VALUES (N'sonnt5', N'123', N'Ngô Tùng Sơn ', N'sonnt69@fe.edu.vn')
INSERT [dbo].[Account] ([username], [password], [displayname], [gmail]) VALUES (N'thangpd10', N'123', N'Phạm Đức Thắng', N'thangpd10@fe.edu.vn')
INSERT [dbo].[Account] ([username], [password], [displayname], [gmail]) VALUES (N'thiennv', N'123', N'Nguyễn Văn Thiện', N'ThienNV15@fe.edu.vn
')
INSERT [dbo].[Account] ([username], [password], [displayname], [gmail]) VALUES (N'thuyntt135', N'123', N'Nguyễn Thị Thu Thủy', N'ThuyNTT135@fe.edu.vn
')
GO
INSERT [dbo].[Assessment] ([aId], [name], [suId], [weight], [gid], [category]) VALUES (1, N'Progress test 1', N'PRJ301', 0.05, 1, N'Progress test')
INSERT [dbo].[Assessment] ([aId], [name], [suId], [weight], [gid], [category]) VALUES (2, N'Progress test 2', N'PRJ301', 0.05, 2, N'Progress test')
INSERT [dbo].[Assessment] ([aId], [name], [suId], [weight], [gid], [category]) VALUES (3, N'Workshop 1', N'PRJ301', 0.05, 3, N'Workshop')
INSERT [dbo].[Assessment] ([aId], [name], [suId], [weight], [gid], [category]) VALUES (4, N'Workshop 2', N'PRJ301', 0.05, 4, N'Workshop')
INSERT [dbo].[Assessment] ([aId], [name], [suId], [weight], [gid], [category]) VALUES (5, N'Practical Exam', N'PRJ301', 0.2, 5, N'Practical Exam')
INSERT [dbo].[Assessment] ([aId], [name], [suId], [weight], [gid], [category]) VALUES (6, N'Assignment', N'PRJ301', 0.4, 6, N'Assignment')
INSERT [dbo].[Assessment] ([aId], [name], [suId], [weight], [gid], [category]) VALUES (7, N'Final Exam', N'PRJ301', 0.2, 7, N'Final Exam')
INSERT [dbo].[Assessment] ([aId], [name], [suId], [weight], [gid], [category]) VALUES (8, N'Participation', N'JPD123', 0.1, 8, N'Participation')
INSERT [dbo].[Assessment] ([aId], [name], [suId], [weight], [gid], [category]) VALUES (9, N'Progress test 1', N'JPD123', 0.1, 9, N'Progress test')
INSERT [dbo].[Assessment] ([aId], [name], [suId], [weight], [gid], [category]) VALUES (10, N'Progress test 2', N'JPD123', 0.1, 10, N'Progress test')
INSERT [dbo].[Assessment] ([aId], [name], [suId], [weight], [gid], [category]) VALUES (11, N'Mid-term test', N'JPD123', 0.3, 11, N'Mid-term test')
INSERT [dbo].[Assessment] ([aId], [name], [suId], [weight], [gid], [category]) VALUES (12, N'FE: Listening', N'JPD123', 0.1, 12, N'Final Exam')
INSERT [dbo].[Assessment] ([aId], [name], [suId], [weight], [gid], [category]) VALUES (13, N'FE: GVR	', N'JPD123', 0.3, 13, N'Final Exam')
INSERT [dbo].[Assessment] ([aId], [name], [suId], [weight], [gid], [category]) VALUES (14, N'Computer Project', N'MAS291', 0.15, 14, N'Computer Project')
INSERT [dbo].[Assessment] ([aId], [name], [suId], [weight], [gid], [category]) VALUES (15, N'	Assignment 1', N'MAS291', 0.1, 15, N'Assignment')
INSERT [dbo].[Assessment] ([aId], [name], [suId], [weight], [gid], [category]) VALUES (16, N'Assignment 2	', N'MAS291', 0.1, 16, N'Assignment')
INSERT [dbo].[Assessment] ([aId], [name], [suId], [weight], [gid], [category]) VALUES (17, N'Progress Test 1', N'MAS291', 0.1, 17, N'Progress test')
INSERT [dbo].[Assessment] ([aId], [name], [suId], [weight], [gid], [category]) VALUES (18, N'Progress Test 2', N'MAS291', 0.1, 18, N'Progress test')
INSERT [dbo].[Assessment] ([aId], [name], [suId], [weight], [gid], [category]) VALUES (19, N'Progress Test 3', N'MAS291', 0.1, 19, N'Progress test')
INSERT [dbo].[Assessment] ([aId], [name], [suId], [weight], [gid], [category]) VALUES (20, N'Final Exam', N'MAS291', 0.35, 20, N'Final Exam')
INSERT [dbo].[Assessment] ([aId], [name], [suId], [weight], [gid], [category]) VALUES (25, N'Pratice exam', N'SWE201c', 0.5, 25, N'Pratice exam')
INSERT [dbo].[Assessment] ([aId], [name], [suId], [weight], [gid], [category]) VALUES (26, N'Theory exam', N'SWE201c', 0.5, 26, N'Theory exam')
INSERT [dbo].[Assessment] ([aId], [name], [suId], [weight], [gid], [category]) VALUES (27, N'Bonus', N'SWE201c', 1, 27, N'Bonus')
GO
SET IDENTITY_INSERT [dbo].[Attendence] ON 

INSERT [dbo].[Attendence] ([leId], [sId], [isPresent], [aDescript], [aDate], [aId]) VALUES (N'le1', N'HE150931', 1, N'aaa', CAST(N'2024-03-18T07:07:09.980' AS DateTime), 32)
INSERT [dbo].[Attendence] ([leId], [sId], [isPresent], [aDescript], [aDate], [aId]) VALUES (N'le1', N'HE161779', 1, N'', CAST(N'2024-03-18T07:07:09.987' AS DateTime), 33)
INSERT [dbo].[Attendence] ([leId], [sId], [isPresent], [aDescript], [aDate], [aId]) VALUES (N'le1', N'HE170388', 0, N'', CAST(N'2024-03-05T14:34:24.447' AS DateTime), 34)
INSERT [dbo].[Attendence] ([leId], [sId], [isPresent], [aDescript], [aDate], [aId]) VALUES (N'le1', N'HE170406', 0, N'', CAST(N'2024-03-05T14:34:24.447' AS DateTime), 35)
INSERT [dbo].[Attendence] ([leId], [sId], [isPresent], [aDescript], [aDate], [aId]) VALUES (N'le1', N'HE171093', 0, N'', CAST(N'2024-03-05T14:34:24.447' AS DateTime), 36)
INSERT [dbo].[Attendence] ([leId], [sId], [isPresent], [aDescript], [aDate], [aId]) VALUES (N'le1', N'HE171227', 1, N'', CAST(N'2024-03-18T07:07:09.990' AS DateTime), 37)
INSERT [dbo].[Attendence] ([leId], [sId], [isPresent], [aDescript], [aDate], [aId]) VALUES (N'le1', N'HE171749', 0, N'', CAST(N'2024-03-05T14:34:24.447' AS DateTime), 38)
INSERT [dbo].[Attendence] ([leId], [sId], [isPresent], [aDescript], [aDate], [aId]) VALUES (N'le1', N'HE171958', 0, N'', CAST(N'2024-03-05T14:34:24.447' AS DateTime), 39)
INSERT [dbo].[Attendence] ([leId], [sId], [isPresent], [aDescript], [aDate], [aId]) VALUES (N'le1', N'HE172200', 0, N'', CAST(N'2024-03-05T14:34:24.447' AS DateTime), 40)
INSERT [dbo].[Attendence] ([leId], [sId], [isPresent], [aDescript], [aDate], [aId]) VALUES (N'le1', N'HE172209', 0, N'', CAST(N'2024-03-05T14:34:24.447' AS DateTime), 41)
INSERT [dbo].[Attendence] ([leId], [sId], [isPresent], [aDescript], [aDate], [aId]) VALUES (N'le1', N'HE172295', 0, N'', CAST(N'2024-03-05T14:34:24.447' AS DateTime), 42)
INSERT [dbo].[Attendence] ([leId], [sId], [isPresent], [aDescript], [aDate], [aId]) VALUES (N'le1', N'HE172390', 0, N'', CAST(N'2024-03-05T14:34:24.447' AS DateTime), 43)
INSERT [dbo].[Attendence] ([leId], [sId], [isPresent], [aDescript], [aDate], [aId]) VALUES (N'le1', N'HE173190', 0, N'', CAST(N'2024-03-05T14:34:24.447' AS DateTime), 44)
INSERT [dbo].[Attendence] ([leId], [sId], [isPresent], [aDescript], [aDate], [aId]) VALUES (N'le1', N'HE173199', 0, N'', CAST(N'2024-03-05T14:34:24.447' AS DateTime), 45)
INSERT [dbo].[Attendence] ([leId], [sId], [isPresent], [aDescript], [aDate], [aId]) VALUES (N'le1', N'HE173227', 0, N'', CAST(N'2024-03-05T14:34:24.447' AS DateTime), 46)
INSERT [dbo].[Attendence] ([leId], [sId], [isPresent], [aDescript], [aDate], [aId]) VALUES (N'le3', N'HE150931', 0, N'', CAST(N'2024-03-05T14:34:24.447' AS DateTime), 242)
INSERT [dbo].[Attendence] ([leId], [sId], [isPresent], [aDescript], [aDate], [aId]) VALUES (N'le3', N'HE161779', 0, N'', CAST(N'2024-03-05T14:34:24.447' AS DateTime), 243)
INSERT [dbo].[Attendence] ([leId], [sId], [isPresent], [aDescript], [aDate], [aId]) VALUES (N'le3', N'HE170388', 0, N'', CAST(N'2024-03-05T14:34:24.447' AS DateTime), 244)
INSERT [dbo].[Attendence] ([leId], [sId], [isPresent], [aDescript], [aDate], [aId]) VALUES (N'le3', N'HE170406', 0, N'', CAST(N'2024-03-05T14:34:24.447' AS DateTime), 245)
INSERT [dbo].[Attendence] ([leId], [sId], [isPresent], [aDescript], [aDate], [aId]) VALUES (N'le3', N'HE171093', 0, N'', CAST(N'2024-03-05T14:34:24.447' AS DateTime), 246)
INSERT [dbo].[Attendence] ([leId], [sId], [isPresent], [aDescript], [aDate], [aId]) VALUES (N'le3', N'HE171227', 0, N'', CAST(N'2024-03-05T14:34:24.447' AS DateTime), 247)
INSERT [dbo].[Attendence] ([leId], [sId], [isPresent], [aDescript], [aDate], [aId]) VALUES (N'le3', N'HE171749', 0, N'', CAST(N'2024-03-05T14:34:24.447' AS DateTime), 248)
INSERT [dbo].[Attendence] ([leId], [sId], [isPresent], [aDescript], [aDate], [aId]) VALUES (N'le3', N'HE171958', 0, N'', CAST(N'2024-03-05T14:34:24.447' AS DateTime), 249)
INSERT [dbo].[Attendence] ([leId], [sId], [isPresent], [aDescript], [aDate], [aId]) VALUES (N'le3', N'HE172200', 0, N'', CAST(N'2024-03-05T14:34:24.447' AS DateTime), 250)
INSERT [dbo].[Attendence] ([leId], [sId], [isPresent], [aDescript], [aDate], [aId]) VALUES (N'le3', N'HE172209', 0, N'', CAST(N'2024-03-05T14:34:24.447' AS DateTime), 251)
INSERT [dbo].[Attendence] ([leId], [sId], [isPresent], [aDescript], [aDate], [aId]) VALUES (N'le3', N'HE172295', 0, N'', CAST(N'2024-03-05T14:34:24.447' AS DateTime), 252)
INSERT [dbo].[Attendence] ([leId], [sId], [isPresent], [aDescript], [aDate], [aId]) VALUES (N'le3', N'HE172390', 0, N'', CAST(N'2024-03-05T14:34:24.447' AS DateTime), 253)
INSERT [dbo].[Attendence] ([leId], [sId], [isPresent], [aDescript], [aDate], [aId]) VALUES (N'le3', N'HE173190', 0, N'', CAST(N'2024-03-05T14:34:24.447' AS DateTime), 254)
INSERT [dbo].[Attendence] ([leId], [sId], [isPresent], [aDescript], [aDate], [aId]) VALUES (N'le3', N'HE173199', 0, N'', CAST(N'2024-03-05T14:34:24.447' AS DateTime), 255)
INSERT [dbo].[Attendence] ([leId], [sId], [isPresent], [aDescript], [aDate], [aId]) VALUES (N'le3', N'HE173227', 0, N'', CAST(N'2024-03-05T14:34:24.447' AS DateTime), 256)
INSERT [dbo].[Attendence] ([leId], [sId], [isPresent], [aDescript], [aDate], [aId]) VALUES (N'le2', N'HE150931', 1, N'chăm chỉ, đẹp trai, học giỏi, lễ phép', CAST(N'2024-03-10T09:41:45.517' AS DateTime), 302)
INSERT [dbo].[Attendence] ([leId], [sId], [isPresent], [aDescript], [aDate], [aId]) VALUES (N'le2', N'HE161779', 1, N'', CAST(N'2024-03-05T15:06:50.637' AS DateTime), 303)
INSERT [dbo].[Attendence] ([leId], [sId], [isPresent], [aDescript], [aDate], [aId]) VALUES (N'le2', N'HE170388', 1, N'', CAST(N'2024-03-05T15:03:16.683' AS DateTime), 304)
INSERT [dbo].[Attendence] ([leId], [sId], [isPresent], [aDescript], [aDate], [aId]) VALUES (N'le2', N'HE170406', 1, N'', CAST(N'2024-03-05T15:03:16.683' AS DateTime), 305)
INSERT [dbo].[Attendence] ([leId], [sId], [isPresent], [aDescript], [aDate], [aId]) VALUES (N'le2', N'HE171093', 1, N'', CAST(N'2024-03-05T15:03:16.683' AS DateTime), 306)
INSERT [dbo].[Attendence] ([leId], [sId], [isPresent], [aDescript], [aDate], [aId]) VALUES (N'le2', N'HE171227', 1, N'', CAST(N'2024-03-05T15:03:16.687' AS DateTime), 307)
INSERT [dbo].[Attendence] ([leId], [sId], [isPresent], [aDescript], [aDate], [aId]) VALUES (N'le2', N'HE171749', 1, N'', CAST(N'2024-03-05T15:03:16.687' AS DateTime), 308)
INSERT [dbo].[Attendence] ([leId], [sId], [isPresent], [aDescript], [aDate], [aId]) VALUES (N'le2', N'HE171958', 0, N'', CAST(N'2024-03-05T14:34:24.447' AS DateTime), 309)
INSERT [dbo].[Attendence] ([leId], [sId], [isPresent], [aDescript], [aDate], [aId]) VALUES (N'le2', N'HE172200', 0, N'', CAST(N'2024-03-05T14:34:24.447' AS DateTime), 310)
INSERT [dbo].[Attendence] ([leId], [sId], [isPresent], [aDescript], [aDate], [aId]) VALUES (N'le2', N'HE172209', 0, N'', CAST(N'2024-03-05T14:34:24.447' AS DateTime), 311)
INSERT [dbo].[Attendence] ([leId], [sId], [isPresent], [aDescript], [aDate], [aId]) VALUES (N'le2', N'HE172295', 0, N'', CAST(N'2024-03-05T14:34:24.447' AS DateTime), 312)
INSERT [dbo].[Attendence] ([leId], [sId], [isPresent], [aDescript], [aDate], [aId]) VALUES (N'le2', N'HE172390', 0, N'', CAST(N'2024-03-05T14:34:24.447' AS DateTime), 313)
INSERT [dbo].[Attendence] ([leId], [sId], [isPresent], [aDescript], [aDate], [aId]) VALUES (N'le2', N'HE173190', 0, N'', CAST(N'2024-03-05T14:34:24.447' AS DateTime), 314)
INSERT [dbo].[Attendence] ([leId], [sId], [isPresent], [aDescript], [aDate], [aId]) VALUES (N'le2', N'HE173199', 0, N'', CAST(N'2024-03-05T14:34:24.447' AS DateTime), 315)
INSERT [dbo].[Attendence] ([leId], [sId], [isPresent], [aDescript], [aDate], [aId]) VALUES (N'le2', N'HE173227', 0, N'', CAST(N'2024-03-05T14:34:24.447' AS DateTime), 316)
INSERT [dbo].[Attendence] ([leId], [sId], [isPresent], [aDescript], [aDate], [aId]) VALUES (N'le4', N'HE150931', 0, N'', CAST(N'2024-03-11T16:10:44.890' AS DateTime), 317)
INSERT [dbo].[Attendence] ([leId], [sId], [isPresent], [aDescript], [aDate], [aId]) VALUES (N'le4', N'HE161779', 0, N'', CAST(N'2024-03-11T16:10:44.900' AS DateTime), 318)
INSERT [dbo].[Attendence] ([leId], [sId], [isPresent], [aDescript], [aDate], [aId]) VALUES (N'le4', N'HE170388', 0, N'', CAST(N'2024-03-11T16:10:44.900' AS DateTime), 319)
INSERT [dbo].[Attendence] ([leId], [sId], [isPresent], [aDescript], [aDate], [aId]) VALUES (N'le4', N'HE170406', 0, N'', CAST(N'2024-03-11T16:10:44.900' AS DateTime), 320)
INSERT [dbo].[Attendence] ([leId], [sId], [isPresent], [aDescript], [aDate], [aId]) VALUES (N'le4', N'HE171093', 0, N'', CAST(N'2024-03-11T16:10:44.900' AS DateTime), 321)
INSERT [dbo].[Attendence] ([leId], [sId], [isPresent], [aDescript], [aDate], [aId]) VALUES (N'le4', N'HE171227', 0, N'', CAST(N'2024-03-11T16:10:44.900' AS DateTime), 322)
INSERT [dbo].[Attendence] ([leId], [sId], [isPresent], [aDescript], [aDate], [aId]) VALUES (N'le4', N'HE171749', 1, N'', CAST(N'2024-03-11T16:10:44.900' AS DateTime), 323)
INSERT [dbo].[Attendence] ([leId], [sId], [isPresent], [aDescript], [aDate], [aId]) VALUES (N'le4', N'HE171958', 1, N'', CAST(N'2024-03-11T16:10:44.900' AS DateTime), 324)
INSERT [dbo].[Attendence] ([leId], [sId], [isPresent], [aDescript], [aDate], [aId]) VALUES (N'le4', N'HE172200', 1, N'', CAST(N'2024-03-11T16:10:44.903' AS DateTime), 325)
INSERT [dbo].[Attendence] ([leId], [sId], [isPresent], [aDescript], [aDate], [aId]) VALUES (N'le4', N'HE172209', 1, N'', CAST(N'2024-03-11T16:10:44.903' AS DateTime), 326)
INSERT [dbo].[Attendence] ([leId], [sId], [isPresent], [aDescript], [aDate], [aId]) VALUES (N'le4', N'HE172295', 0, N'', CAST(N'2024-03-11T16:10:44.903' AS DateTime), 327)
INSERT [dbo].[Attendence] ([leId], [sId], [isPresent], [aDescript], [aDate], [aId]) VALUES (N'le4', N'HE172390', 0, N'', CAST(N'2024-03-11T16:10:44.903' AS DateTime), 328)
INSERT [dbo].[Attendence] ([leId], [sId], [isPresent], [aDescript], [aDate], [aId]) VALUES (N'le4', N'HE173190', 0, N'', CAST(N'2024-03-11T16:10:44.903' AS DateTime), 329)
INSERT [dbo].[Attendence] ([leId], [sId], [isPresent], [aDescript], [aDate], [aId]) VALUES (N'le4', N'HE173199', 0, N'', CAST(N'2024-03-11T16:10:44.903' AS DateTime), 330)
INSERT [dbo].[Attendence] ([leId], [sId], [isPresent], [aDescript], [aDate], [aId]) VALUES (N'le4', N'HE173227', 0, N'', CAST(N'2024-03-11T16:10:44.903' AS DateTime), 331)
SET IDENTITY_INSERT [dbo].[Attendence] OFF
GO
INSERT [dbo].[Campus] ([cID], [cName], [sID], [lID]) VALUES (N'CT', N'Cần Thơ', NULL, NULL)
INSERT [dbo].[Campus] ([cID], [cName], [sID], [lID]) VALUES (N'DN', N'Đà Nẵng', NULL, NULL)
INSERT [dbo].[Campus] ([cID], [cName], [sID], [lID]) VALUES (N'HCM', N'Hồ Chí Minh', NULL, NULL)
INSERT [dbo].[Campus] ([cID], [cName], [sID], [lID]) VALUES (N'HN', N'Hòa Lạc', NULL, NULL)
INSERT [dbo].[Campus] ([cID], [cName], [sID], [lID]) VALUES (N'QN', N'Quy Nhơn', NULL, NULL)
GO
INSERT [dbo].[Enroll] ([sId], [gId]) VALUES (N'HE150931', N'g1')
INSERT [dbo].[Enroll] ([sId], [gId]) VALUES (N'HE150931', N'g2')
INSERT [dbo].[Enroll] ([sId], [gId]) VALUES (N'HE161779', N'g1')
INSERT [dbo].[Enroll] ([sId], [gId]) VALUES (N'HE161779', N'g2')
INSERT [dbo].[Enroll] ([sId], [gId]) VALUES (N'HE170388', N'g1')
INSERT [dbo].[Enroll] ([sId], [gId]) VALUES (N'HE170388', N'g2')
INSERT [dbo].[Enroll] ([sId], [gId]) VALUES (N'HE170406', N'g1')
INSERT [dbo].[Enroll] ([sId], [gId]) VALUES (N'HE170406', N'g2')
INSERT [dbo].[Enroll] ([sId], [gId]) VALUES (N'HE171093', N'g1')
INSERT [dbo].[Enroll] ([sId], [gId]) VALUES (N'HE171093', N'g2')
INSERT [dbo].[Enroll] ([sId], [gId]) VALUES (N'HE171227', N'g1')
INSERT [dbo].[Enroll] ([sId], [gId]) VALUES (N'HE171227', N'g2')
INSERT [dbo].[Enroll] ([sId], [gId]) VALUES (N'HE171749', N'g1')
INSERT [dbo].[Enroll] ([sId], [gId]) VALUES (N'HE171749', N'g2')
INSERT [dbo].[Enroll] ([sId], [gId]) VALUES (N'HE171958', N'g1')
INSERT [dbo].[Enroll] ([sId], [gId]) VALUES (N'HE171958', N'g2')
INSERT [dbo].[Enroll] ([sId], [gId]) VALUES (N'HE172200', N'g1')
INSERT [dbo].[Enroll] ([sId], [gId]) VALUES (N'HE172200', N'g2')
INSERT [dbo].[Enroll] ([sId], [gId]) VALUES (N'HE172209', N'g1')
INSERT [dbo].[Enroll] ([sId], [gId]) VALUES (N'HE172209', N'g2')
INSERT [dbo].[Enroll] ([sId], [gId]) VALUES (N'HE172295', N'g1')
INSERT [dbo].[Enroll] ([sId], [gId]) VALUES (N'HE172295', N'g2')
INSERT [dbo].[Enroll] ([sId], [gId]) VALUES (N'HE172390', N'g1')
INSERT [dbo].[Enroll] ([sId], [gId]) VALUES (N'HE172390', N'g2')
INSERT [dbo].[Enroll] ([sId], [gId]) VALUES (N'HE173190', N'g1')
INSERT [dbo].[Enroll] ([sId], [gId]) VALUES (N'HE173190', N'g2')
INSERT [dbo].[Enroll] ([sId], [gId]) VALUES (N'HE173199', N'g1')
INSERT [dbo].[Enroll] ([sId], [gId]) VALUES (N'HE173199', N'g2')
INSERT [dbo].[Enroll] ([sId], [gId]) VALUES (N'HE173227', N'g1')
INSERT [dbo].[Enroll] ([sId], [gId]) VALUES (N'HE173227', N'g2')
GO
INSERT [dbo].[Exam] ([eId], [aId], [begin], [end], [rId], [protorid]) VALUES (1, 1, CAST(N'2024-01-03' AS Date), CAST(N'2024-01-03' AS Date), N'3', N'sonnt5')
INSERT [dbo].[Exam] ([eId], [aId], [begin], [end], [rId], [protorid]) VALUES (2, 2, CAST(N'2024-01-05' AS Date), CAST(N'2024-01-05' AS Date), N'3', N'sonnt5')
INSERT [dbo].[Exam] ([eId], [aId], [begin], [end], [rId], [protorid]) VALUES (3, 3, CAST(N'2024-01-10' AS Date), CAST(N'2024-01-10' AS Date), N'3', N'sonnt5')
INSERT [dbo].[Exam] ([eId], [aId], [begin], [end], [rId], [protorid]) VALUES (4, 4, CAST(N'2024-01-12' AS Date), CAST(N'2024-01-12' AS Date), N'3', N'sonnt5')
INSERT [dbo].[Exam] ([eId], [aId], [begin], [end], [rId], [protorid]) VALUES (5, 5, CAST(N'2024-01-17' AS Date), CAST(N'2024-01-17' AS Date), N'1', N'sonnt5')
INSERT [dbo].[Exam] ([eId], [aId], [begin], [end], [rId], [protorid]) VALUES (6, 6, CAST(N'2024-01-01' AS Date), CAST(N'2024-01-19' AS Date), NULL, N'sonnt5')
INSERT [dbo].[Exam] ([eId], [aId], [begin], [end], [rId], [protorid]) VALUES (7, 7, CAST(N'2024-02-25' AS Date), CAST(N'2024-02-25' AS Date), N'2', N'sonnt5')
INSERT [dbo].[Exam] ([eId], [aId], [begin], [end], [rId], [protorid]) VALUES (8, 8, CAST(N'2024-01-02' AS Date), CAST(N'2024-01-02' AS Date), N'3', N'thuyntt135')
INSERT [dbo].[Exam] ([eId], [aId], [begin], [end], [rId], [protorid]) VALUES (9, 9, CAST(N'2024-01-04' AS Date), CAST(N'2024-01-04' AS Date), N'3', N'thuyntt135')
INSERT [dbo].[Exam] ([eId], [aId], [begin], [end], [rId], [protorid]) VALUES (10, 10, CAST(N'2024-01-09' AS Date), CAST(N'2024-01-09' AS Date), N'3', N'thuyntt135')
INSERT [dbo].[Exam] ([eId], [aId], [begin], [end], [rId], [protorid]) VALUES (11, 11, CAST(N'2024-01-11' AS Date), CAST(N'2024-01-11' AS Date), N'3', N'thuyntt135')
INSERT [dbo].[Exam] ([eId], [aId], [begin], [end], [rId], [protorid]) VALUES (12, 12, CAST(N'2024-02-25' AS Date), CAST(N'2024-02-25' AS Date), N'4', N'thuyntt135')
INSERT [dbo].[Exam] ([eId], [aId], [begin], [end], [rId], [protorid]) VALUES (13, 13, CAST(N'2024-02-25' AS Date), CAST(N'2024-02-25' AS Date), N'4', N'thuyntt135')
GO
INSERT [dbo].[Feature] ([fId], [fName], [url]) VALUES (1, N'Lecturer View Timetable', N'/lecturer/timetable')
INSERT [dbo].[Feature] ([fId], [fName], [url]) VALUES (2, N'Lecture Take Attendence', N'/lecturer/attendence')
INSERT [dbo].[Feature] ([fId], [fName], [url]) VALUES (3, N'Student View Score', N'/student/grade')
INSERT [dbo].[Feature] ([fId], [fName], [url]) VALUES (4, N'Student View Attendance', N'/student/attendstudent')
INSERT [dbo].[Feature] ([fId], [fName], [url]) VALUES (5, N'Student View Home', N'/student/home')
INSERT [dbo].[Feature] ([fId], [fName], [url]) VALUES (6, N'Student View Profile', N'/student/profile')
INSERT [dbo].[Feature] ([fId], [fName], [url]) VALUES (7, N'Lecturer View Profile', N'/lecturer/profile')
GO
INSERT [dbo].[Grade] ([gid], [sId], [score], [lId], [comment]) VALUES (1, N'HE171227', 10, N'sonnt5', NULL)
INSERT [dbo].[Grade] ([gid], [sId], [score], [lId], [comment]) VALUES (2, N'HE171227', 10, N'sonnt5', NULL)
INSERT [dbo].[Grade] ([gid], [sId], [score], [lId], [comment]) VALUES (3, N'HE171227', 10, N'sonnt5', NULL)
INSERT [dbo].[Grade] ([gid], [sId], [score], [lId], [comment]) VALUES (4, N'HE171227', 10, N'sonnt5', NULL)
INSERT [dbo].[Grade] ([gid], [sId], [score], [lId], [comment]) VALUES (5, N'HE171227', 10, N'sonnt5', NULL)
INSERT [dbo].[Grade] ([gid], [sId], [score], [lId], [comment]) VALUES (6, N'HE171227', 10, N'sonnt5', NULL)
INSERT [dbo].[Grade] ([gid], [sId], [score], [lId], [comment]) VALUES (7, N'HE171227', 10, N'sonnt5', NULL)
INSERT [dbo].[Grade] ([gid], [sId], [score], [lId], [comment]) VALUES (8, N'HE171227', 8, N'thuyntt135', NULL)
INSERT [dbo].[Grade] ([gid], [sId], [score], [lId], [comment]) VALUES (9, N'HE171227', 2, N'thuyntt135', NULL)
INSERT [dbo].[Grade] ([gid], [sId], [score], [lId], [comment]) VALUES (10, N'HE171227', 3, N'thuyntt135', NULL)
INSERT [dbo].[Grade] ([gid], [sId], [score], [lId], [comment]) VALUES (11, N'HE171227', 4, N'thuyntt135', NULL)
INSERT [dbo].[Grade] ([gid], [sId], [score], [lId], [comment]) VALUES (12, N'HE171227', 5, N'thuyntt135', NULL)
INSERT [dbo].[Grade] ([gid], [sId], [score], [lId], [comment]) VALUES (13, N'HE171227', 5, N'thuyntt135', NULL)
INSERT [dbo].[Grade] ([gid], [sId], [score], [lId], [comment]) VALUES (14, N'HE171227', 9, N'thiennv', NULL)
INSERT [dbo].[Grade] ([gid], [sId], [score], [lId], [comment]) VALUES (15, N'HE171227', 9, N'thiennv', NULL)
INSERT [dbo].[Grade] ([gid], [sId], [score], [lId], [comment]) VALUES (16, N'HE171227', 9, N'thiennv', NULL)
INSERT [dbo].[Grade] ([gid], [sId], [score], [lId], [comment]) VALUES (17, N'HE171227', 9, N'thiennv', NULL)
INSERT [dbo].[Grade] ([gid], [sId], [score], [lId], [comment]) VALUES (18, N'HE171227', 9, N'thiennv', NULL)
INSERT [dbo].[Grade] ([gid], [sId], [score], [lId], [comment]) VALUES (19, N'HE171227', 9, N'thiennv', NULL)
INSERT [dbo].[Grade] ([gid], [sId], [score], [lId], [comment]) VALUES (20, N'HE171227', -1, N'thiennv', NULL)
INSERT [dbo].[Grade] ([gid], [sId], [score], [lId], [comment]) VALUES (25, N'HE171227', 9, N'thangpd10', NULL)
INSERT [dbo].[Grade] ([gid], [sId], [score], [lId], [comment]) VALUES (26, N'HE171227', 8, N'thangpd10', NULL)
INSERT [dbo].[Grade] ([gid], [sId], [score], [lId], [comment]) VALUES (27, N'HE171227', 1, N'thangpd10', NULL)
GO
INSERT [dbo].[Group] ([gId], [gName], [suId], [pIC]) VALUES (N'g1', N'SE1818', N'PRJ301', N'sonnt5')
INSERT [dbo].[Group] ([gId], [gName], [suId], [pIC]) VALUES (N'g2', N'SE1818', N'JPD123', N'thuyntt135')
GO
INSERT [dbo].[Lecturer] ([lId], [lName], [gender], [dob], [gmail]) VALUES (N'sonnt5', N'	Ngô Tùng Sơn', 1, CAST(N'1997-01-01' AS Date), N'sonnt69@fe.edu.vn')
INSERT [dbo].[Lecturer] ([lId], [lName], [gender], [dob], [gmail]) VALUES (N'thangpd10', N'Phạm Đức Thắng', 1, CAST(N'1987-01-01' AS Date), N'thangpd10@fe.edu.vn')
INSERT [dbo].[Lecturer] ([lId], [lName], [gender], [dob], [gmail]) VALUES (N'thiennv', N'Nguyễn Văn Thiện', 1, CAST(N'1987-01-01' AS Date), N'ThienNV15@fe.edu.vn
')
INSERT [dbo].[Lecturer] ([lId], [lName], [gender], [dob], [gmail]) VALUES (N'thuyntt135', N'Nguyễn Thị Thu Thủy', 0, CAST(N'1987-01-01' AS Date), N'ThuyNTT135@fe.edu.vn
')
GO
INSERT [dbo].[Lesson] ([leId], [gId], [tId], [lId], [lDate], [idAttend], [rId]) VALUES (N'le1', N'g2', N'Slot1', N'thuyntt135', CAST(N'2024-01-02' AS Date), 1, 1)
INSERT [dbo].[Lesson] ([leId], [gId], [tId], [lId], [lDate], [idAttend], [rId]) VALUES (N'le2', N'g1', N'Slot1', N'sonnt5', CAST(N'2024-01-03' AS Date), 1, 1)
INSERT [dbo].[Lesson] ([leId], [gId], [tId], [lId], [lDate], [idAttend], [rId]) VALUES (N'le3', N'g2', N'Slot2', N'thuyntt135', CAST(N'2024-01-04' AS Date), 1, 1)
INSERT [dbo].[Lesson] ([leId], [gId], [tId], [lId], [lDate], [idAttend], [rId]) VALUES (N'le4', N'g1', N'Slot2', N'sonnt5', CAST(N'2024-01-05' AS Date), 1, 1)
INSERT [dbo].[Lesson] ([leId], [gId], [tId], [lId], [lDate], [idAttend], [rId]) VALUES (N'le5', N'g2', N'Slot1', N'thuyntt135', CAST(N'2024-01-09' AS Date), 0, 1)
INSERT [dbo].[Lesson] ([leId], [gId], [tId], [lId], [lDate], [idAttend], [rId]) VALUES (N'le6', N'g1', N'Slot1', N'sonnt5', CAST(N'2024-01-10' AS Date), 0, 1)
INSERT [dbo].[Lesson] ([leId], [gId], [tId], [lId], [lDate], [idAttend], [rId]) VALUES (N'le7', N'g2', N'Slot2', N'thuyntt135', CAST(N'2024-01-11' AS Date), 0, 1)
INSERT [dbo].[Lesson] ([leId], [gId], [tId], [lId], [lDate], [idAttend], [rId]) VALUES (N'le8', N'g1', N'Slot2', N'sonnt5', CAST(N'2024-01-12' AS Date), 0, 1)
INSERT [dbo].[Lesson] ([leId], [gId], [tId], [lId], [lDate], [idAttend], [rId]) VALUES (N'le9', N'g2', N'Slot1', N'thuyntt135', CAST(N'2024-01-16' AS Date), 0, 1)
GO
INSERT [dbo].[Role] ([reId], [reName]) VALUES (1, N'roleLecturer')
INSERT [dbo].[Role] ([reId], [reName]) VALUES (2, N'roleStudent')
GO
INSERT [dbo].[RoleAccount] ([username], [reId]) VALUES (N'quanvmhe171227', 2)
INSERT [dbo].[RoleAccount] ([username], [reId]) VALUES (N'sonnt5', 1)
INSERT [dbo].[RoleAccount] ([username], [reId]) VALUES (N'thangpd10', 1)
INSERT [dbo].[RoleAccount] ([username], [reId]) VALUES (N'thiennv', 1)
INSERT [dbo].[RoleAccount] ([username], [reId]) VALUES (N'thuyntt135', 1)
GO
INSERT [dbo].[RoleFeature] ([reId], [fId]) VALUES (1, 1)
INSERT [dbo].[RoleFeature] ([reId], [fId]) VALUES (1, 2)
INSERT [dbo].[RoleFeature] ([reId], [fId]) VALUES (1, 7)
INSERT [dbo].[RoleFeature] ([reId], [fId]) VALUES (2, 3)
INSERT [dbo].[RoleFeature] ([reId], [fId]) VALUES (2, 4)
INSERT [dbo].[RoleFeature] ([reId], [fId]) VALUES (2, 5)
INSERT [dbo].[RoleFeature] ([reId], [fId]) VALUES (2, 6)
GO
INSERT [dbo].[Room] ([rId], [rNumber]) VALUES (1, N'AL-L202')
INSERT [dbo].[Room] ([rId], [rNumber]) VALUES (2, N'AL-R303')
INSERT [dbo].[Room] ([rId], [rNumber]) VALUES (3, N'BE-102')
INSERT [dbo].[Room] ([rId], [rNumber]) VALUES (4, N'BE-401')
INSERT [dbo].[Room] ([rId], [rNumber]) VALUES (5, N'DE-315')
GO
INSERT [dbo].[Student] ([sId], [sName], [gender], [dob], [gmail], [coreName]) VALUES (N'HE150931', N'Nguyễn Đức Cảnh', 1, CAST(N'2003-10-20' AS Date), N'canhndhe150931@fpt.edu.vn', N'canhndhe150931')
INSERT [dbo].[Student] ([sId], [sName], [gender], [dob], [gmail], [coreName]) VALUES (N'HE161779', N'Nguyễn Tiến Toàn', 1, CAST(N'2003-10-20' AS Date), N'toannthe161779@fpt.edu.vn', N'toannthe161779')
INSERT [dbo].[Student] ([sId], [sName], [gender], [dob], [gmail], [coreName]) VALUES (N'HE170388', N'Bùi Hoàng Hiệp', 1, CAST(N'2003-10-20' AS Date), N'hiepbhhe170388@fpt.edu.vn', N'hiepbhhe170388')
INSERT [dbo].[Student] ([sId], [sName], [gender], [dob], [gmail], [coreName]) VALUES (N'HE170406', N'Đỗ Minh Dương', 1, CAST(N'2003-10-20' AS Date), N'duongdmhe170406@fpt.edu.vn', N'duongdmhe170406')
INSERT [dbo].[Student] ([sId], [sName], [gender], [dob], [gmail], [coreName]) VALUES (N'HE171093', N'Chu Bảo Khánh', 1, CAST(N'2003-10-20' AS Date), N'khanhcbhe171093@fpt.edu.vn', N'khanhcbhe171093')
INSERT [dbo].[Student] ([sId], [sName], [gender], [dob], [gmail], [coreName]) VALUES (N'HE171227', N'Vũ Minh Quân', 1, CAST(N'2003-10-20' AS Date), N'quanvmhe171227@fpt.edu.vn', N'quanvmhe171227')
INSERT [dbo].[Student] ([sId], [sName], [gender], [dob], [gmail], [coreName]) VALUES (N'HE171749', N'Phạm Đức Trung', 1, CAST(N'2003-10-20' AS Date), N'trungpdhe171749@fpt.edu.vn', N'trungpdhe171749')
INSERT [dbo].[Student] ([sId], [sName], [gender], [dob], [gmail], [coreName]) VALUES (N'HE171958', N'Nguyễn Việt Anh', 1, CAST(N'2003-10-20' AS Date), N'anhnvhe171749@fpt.edu.vn', N'anhnvhe171749')
INSERT [dbo].[Student] ([sId], [sName], [gender], [dob], [gmail], [coreName]) VALUES (N'HE172200', N'Trần Việt Duy', 1, CAST(N'2003-10-20' AS Date), N'duytvdhe172200@fpt.edu.vn', N'duytvdhe172200')
INSERT [dbo].[Student] ([sId], [sName], [gender], [dob], [gmail], [coreName]) VALUES (N'HE172209', N'Nguyễn Huy Anh', 1, CAST(N'2003-10-20' AS Date), N'anhnhhe172209@fpt.edu.vn', N'anhnhhe172209')
INSERT [dbo].[Student] ([sId], [sName], [gender], [dob], [gmail], [coreName]) VALUES (N'HE172295', N'Nguyễn Văn Đạt', 1, CAST(N'2003-10-20' AS Date), N'datnvhe172295@fpt.edu.vn', N'datnvhe172295')
INSERT [dbo].[Student] ([sId], [sName], [gender], [dob], [gmail], [coreName]) VALUES (N'HE172390', N'Phạm Quốc Duy', 1, CAST(N'2003-10-20' AS Date), N'duypqhe172390@fpt.edu.vn', N'duypqhe172390')
INSERT [dbo].[Student] ([sId], [sName], [gender], [dob], [gmail], [coreName]) VALUES (N'HE173190', N'Ngô Hải Yến', 0, CAST(N'2003-10-20' AS Date), N'yennhhe173190@fpt.edu.vn', N'yennhhe173190')
INSERT [dbo].[Student] ([sId], [sName], [gender], [dob], [gmail], [coreName]) VALUES (N'HE173199', N'Lê Minh Thắng', 1, CAST(N'2003-10-20' AS Date), N'thanglmhe173199@fpt.edu.vn', N'thanglmhe173199')
INSERT [dbo].[Student] ([sId], [sName], [gender], [dob], [gmail], [coreName]) VALUES (N'HE173227', N'Tô Tuấn Anh', 1, CAST(N'2003-10-20' AS Date), N'anhtthe173227@fpt.edu.vn', N'anhtthe173227')
GO
INSERT [dbo].[Subject] ([suId], [suName]) VALUES (N'JPD123', N'	Elementary Japanese 1-A1.2')
INSERT [dbo].[Subject] ([suId], [suName]) VALUES (N'MAS291', N'Statistics and Probability')
INSERT [dbo].[Subject] ([suId], [suName]) VALUES (N'PRJ301', N'Java Web Application Development')
INSERT [dbo].[Subject] ([suId], [suName]) VALUES (N'SWE201c', N'Introduction to Software Engineering')
GO
INSERT [dbo].[Time_Slot] ([tId], [tDescript], [tName]) VALUES (N'Slot1', N'7:30-9:50', N'Slot 1')
INSERT [dbo].[Time_Slot] ([tId], [tDescript], [tName]) VALUES (N'Slot2', N'10:00-12:20', N'Slot 2')
INSERT [dbo].[Time_Slot] ([tId], [tDescript], [tName]) VALUES (N'Slot3', N'12:50-15:10', N'Slot 3')
INSERT [dbo].[Time_Slot] ([tId], [tDescript], [tName]) VALUES (N'Slot4', N'15:20-17:40', N'Slot 4')
INSERT [dbo].[Time_Slot] ([tId], [tDescript], [tName]) VALUES (N'Slot5 ', NULL, N'Slot 5 ')
INSERT [dbo].[Time_Slot] ([tId], [tDescript], [tName]) VALUES (N'Slot6', NULL, N'Slot 6')
INSERT [dbo].[Time_Slot] ([tId], [tDescript], [tName]) VALUES (N'Slot7', NULL, N'Slot 7')
INSERT [dbo].[Time_Slot] ([tId], [tDescript], [tName]) VALUES (N'Slot8', NULL, N'Slot 8')
INSERT [dbo].[Time_Slot] ([tId], [tDescript], [tName]) VALUES (N'Slot9', NULL, N'Slot 9')
GO
ALTER TABLE [dbo].[Assessment]  WITH CHECK ADD  CONSTRAINT [FK_Assessment_Grade] FOREIGN KEY([gid])
REFERENCES [dbo].[Grade] ([gid])
GO
ALTER TABLE [dbo].[Assessment] CHECK CONSTRAINT [FK_Assessment_Grade]
GO
ALTER TABLE [dbo].[Assessment]  WITH CHECK ADD  CONSTRAINT [FK_Assessment_Subject] FOREIGN KEY([suId])
REFERENCES [dbo].[Subject] ([suId])
GO
ALTER TABLE [dbo].[Assessment] CHECK CONSTRAINT [FK_Assessment_Subject]
GO
ALTER TABLE [dbo].[Attendence]  WITH CHECK ADD  CONSTRAINT [FK_Attendence_Lesson] FOREIGN KEY([leId])
REFERENCES [dbo].[Lesson] ([leId])
GO
ALTER TABLE [dbo].[Attendence] CHECK CONSTRAINT [FK_Attendence_Lesson]
GO
ALTER TABLE [dbo].[Attendence]  WITH CHECK ADD  CONSTRAINT [FK_Attendence_Student] FOREIGN KEY([sId])
REFERENCES [dbo].[Student] ([sId])
GO
ALTER TABLE [dbo].[Attendence] CHECK CONSTRAINT [FK_Attendence_Student]
GO
ALTER TABLE [dbo].[Campus]  WITH CHECK ADD  CONSTRAINT [FK_Campus_Lecturer] FOREIGN KEY([lID])
REFERENCES [dbo].[Lecturer] ([lId])
GO
ALTER TABLE [dbo].[Campus] CHECK CONSTRAINT [FK_Campus_Lecturer]
GO
ALTER TABLE [dbo].[Campus]  WITH CHECK ADD  CONSTRAINT [FK_Campus_Student] FOREIGN KEY([sID])
REFERENCES [dbo].[Student] ([sId])
GO
ALTER TABLE [dbo].[Campus] CHECK CONSTRAINT [FK_Campus_Student]
GO
ALTER TABLE [dbo].[Enroll]  WITH CHECK ADD  CONSTRAINT [FK_Enroll_Group] FOREIGN KEY([gId])
REFERENCES [dbo].[Group] ([gId])
GO
ALTER TABLE [dbo].[Enroll] CHECK CONSTRAINT [FK_Enroll_Group]
GO
ALTER TABLE [dbo].[Enroll]  WITH CHECK ADD  CONSTRAINT [FK_Enroll_Student] FOREIGN KEY([sId])
REFERENCES [dbo].[Student] ([sId])
GO
ALTER TABLE [dbo].[Enroll] CHECK CONSTRAINT [FK_Enroll_Student]
GO
ALTER TABLE [dbo].[Grade]  WITH CHECK ADD  CONSTRAINT [FK_Grade_Student] FOREIGN KEY([sId])
REFERENCES [dbo].[Student] ([sId])
GO
ALTER TABLE [dbo].[Grade] CHECK CONSTRAINT [FK_Grade_Student]
GO
ALTER TABLE [dbo].[Group]  WITH CHECK ADD  CONSTRAINT [FK_Group_Lecturer] FOREIGN KEY([pIC])
REFERENCES [dbo].[Lecturer] ([lId])
GO
ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [FK_Group_Lecturer]
GO
ALTER TABLE [dbo].[Group]  WITH CHECK ADD  CONSTRAINT [FK_Group_Subject] FOREIGN KEY([suId])
REFERENCES [dbo].[Subject] ([suId])
GO
ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [FK_Group_Subject]
GO
ALTER TABLE [dbo].[Lesson]  WITH CHECK ADD  CONSTRAINT [FK_Lesson_Group] FOREIGN KEY([gId])
REFERENCES [dbo].[Group] ([gId])
GO
ALTER TABLE [dbo].[Lesson] CHECK CONSTRAINT [FK_Lesson_Group]
GO
ALTER TABLE [dbo].[Lesson]  WITH CHECK ADD  CONSTRAINT [FK_Lesson_Lecturer1] FOREIGN KEY([lId])
REFERENCES [dbo].[Lecturer] ([lId])
GO
ALTER TABLE [dbo].[Lesson] CHECK CONSTRAINT [FK_Lesson_Lecturer1]
GO
ALTER TABLE [dbo].[Lesson]  WITH CHECK ADD  CONSTRAINT [FK_Lesson_Room] FOREIGN KEY([rId])
REFERENCES [dbo].[Room] ([rId])
GO
ALTER TABLE [dbo].[Lesson] CHECK CONSTRAINT [FK_Lesson_Room]
GO
ALTER TABLE [dbo].[Lesson]  WITH CHECK ADD  CONSTRAINT [FK_Lesson_TimeSlot] FOREIGN KEY([tId])
REFERENCES [dbo].[Time_Slot] ([tId])
GO
ALTER TABLE [dbo].[Lesson] CHECK CONSTRAINT [FK_Lesson_TimeSlot]
GO
ALTER TABLE [dbo].[RoleAccount]  WITH CHECK ADD  CONSTRAINT [FK_RoleAccount_Account] FOREIGN KEY([username])
REFERENCES [dbo].[Account] ([username])
GO
ALTER TABLE [dbo].[RoleAccount] CHECK CONSTRAINT [FK_RoleAccount_Account]
GO
ALTER TABLE [dbo].[RoleAccount]  WITH CHECK ADD  CONSTRAINT [FK_RoleAccount_Role] FOREIGN KEY([reId])
REFERENCES [dbo].[Role] ([reId])
GO
ALTER TABLE [dbo].[RoleAccount] CHECK CONSTRAINT [FK_RoleAccount_Role]
GO
ALTER TABLE [dbo].[RoleFeature]  WITH CHECK ADD  CONSTRAINT [FK_RoleFeature_Feature] FOREIGN KEY([fId])
REFERENCES [dbo].[Feature] ([fId])
GO
ALTER TABLE [dbo].[RoleFeature] CHECK CONSTRAINT [FK_RoleFeature_Feature]
GO
ALTER TABLE [dbo].[RoleFeature]  WITH CHECK ADD  CONSTRAINT [FK_RoleFeature_Role] FOREIGN KEY([reId])
REFERENCES [dbo].[Role] ([reId])
GO
ALTER TABLE [dbo].[RoleFeature] CHECK CONSTRAINT [FK_RoleFeature_Role]
GO
USE [master]
GO
ALTER DATABASE [Attend_Task] SET  READ_WRITE 
GO
