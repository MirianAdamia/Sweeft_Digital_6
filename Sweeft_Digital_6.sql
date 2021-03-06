USE [master]
GO

/****** Object:  Database [School]    Script Date: 12 ივლ. 2022 20:16:55 ******/
CREATE DATABASE [School]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'School', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\School.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'School_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\School_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [School].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [School] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [School] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [School] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [School] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [School] SET ARITHABORT OFF 
GO

ALTER DATABASE [School] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [School] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [School] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [School] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [School] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [School] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [School] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [School] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [School] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [School] SET  DISABLE_BROKER 
GO

ALTER DATABASE [School] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [School] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [School] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [School] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [School] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [School] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [School] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [School] SET RECOVERY SIMPLE 
GO

ALTER DATABASE [School] SET  MULTI_USER 
GO

ALTER DATABASE [School] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [School] SET DB_CHAINING OFF 
GO

ALTER DATABASE [School] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [School] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [School] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [School] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO

ALTER DATABASE [School] SET QUERY_STORE = OFF
GO

ALTER DATABASE [School] SET  READ_WRITE 
GO




USE [School]
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 12 ივლ. 2022 20:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gender](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Gender] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pupil]    Script Date: 12 ივლ. 2022 20:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pupil](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Lastname] [nvarchar](50) NOT NULL,
	[GenderId] [int] NOT NULL,
	[Class] [int] NOT NULL,
 CONSTRAINT [PK_Pupil] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teacher]    Script Date: 12 ივლ. 2022 20:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teacher](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[GenderId] [int] NOT NULL,
	[Subject] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Teacher] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TeacherPupil]    Script Date: 12 ივლ. 2022 20:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeacherPupil](
	[TeacherId] [int] NOT NULL,
	[PupilId] [int] NOT NULL,
 CONSTRAINT [PK_TeacherPupil] PRIMARY KEY CLUSTERED 
(
	[TeacherId] ASC,
	[PupilId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Gender] ([Id], [Name]) VALUES (1, N'მამრობითი')
INSERT [dbo].[Gender] ([Id], [Name]) VALUES (2, N'მდედრობითი')
GO
INSERT [dbo].[Pupil] ([Id], [Name], [Lastname], [GenderId], [Class]) VALUES (1, N'გიორგი', N'ბიგანიშვილი', 1, 9)
INSERT [dbo].[Pupil] ([Id], [Name], [Lastname], [GenderId], [Class]) VALUES (2, N'ნემო', N'გოგოლაძე', 1, 9)
INSERT [dbo].[Pupil] ([Id], [Name], [Lastname], [GenderId], [Class]) VALUES (3, N'ქეთი', N'დარასელია', 2, 8)
INSERT [dbo].[Pupil] ([Id], [Name], [Lastname], [GenderId], [Class]) VALUES (4, N'გიორგი', N'ნემსაძე', 1, 10)
INSERT [dbo].[Pupil] ([Id], [Name], [Lastname], [GenderId], [Class]) VALUES (5, N'გიორგი', N'ძაძამია', 1, 5)
GO
INSERT [dbo].[Teacher] ([Id], [Name], [LastName], [GenderId], [Subject]) VALUES (1, N'გიორგი', N'მამარდაშვილი', 1, N'მათემატიკა')
INSERT [dbo].[Teacher] ([Id], [Name], [LastName], [GenderId], [Subject]) VALUES (2, N'გაგა', N'ასათიანი', 1, N'ინგლისური')
INSERT [dbo].[Teacher] ([Id], [Name], [LastName], [GenderId], [Subject]) VALUES (3, N'ირაკლი', N'ოღანიანი', 1, N'ფიზიკა')
GO
INSERT [dbo].[TeacherPupil] ([TeacherId], [PupilId]) VALUES (1, 1)
INSERT [dbo].[TeacherPupil] ([TeacherId], [PupilId]) VALUES (2, 2)
INSERT [dbo].[TeacherPupil] ([TeacherId], [PupilId]) VALUES (3, 4)
GO
ALTER TABLE [dbo].[Pupil]  WITH CHECK ADD  CONSTRAINT [FK_Pupil_Gender] FOREIGN KEY([GenderId])
REFERENCES [dbo].[Gender] ([Id])
GO
ALTER TABLE [dbo].[Pupil] CHECK CONSTRAINT [FK_Pupil_Gender]
GO
ALTER TABLE [dbo].[Teacher]  WITH CHECK ADD  CONSTRAINT [FK_Teacher_Gender] FOREIGN KEY([GenderId])
REFERENCES [dbo].[Gender] ([Id])
GO
ALTER TABLE [dbo].[Teacher] CHECK CONSTRAINT [FK_Teacher_Gender]
GO
ALTER TABLE [dbo].[TeacherPupil]  WITH CHECK ADD  CONSTRAINT [FK_TeacherPupil_Pupil1] FOREIGN KEY([PupilId])
REFERENCES [dbo].[Pupil] ([Id])
GO
ALTER TABLE [dbo].[TeacherPupil] CHECK CONSTRAINT [FK_TeacherPupil_Pupil1]
GO
ALTER TABLE [dbo].[TeacherPupil]  WITH CHECK ADD  CONSTRAINT [FK_TeacherPupil_Teacher1] FOREIGN KEY([TeacherId])
REFERENCES [dbo].[Teacher] ([Id])
GO
ALTER TABLE [dbo].[TeacherPupil] CHECK CONSTRAINT [FK_TeacherPupil_Teacher1]
GO

--selects
SELECT t0.Name,t0.LastName, t3.Name as Gender,t0.Subject FROM dbo.Teacher t0 
Inner Join dbo.TeacherPupil t1 on t0.Id = t1.TeacherId
Inner Join dbo.Pupil t2 on  t2.Id = t1.PupilId
Inner Join dbo.Gender t3 on t0.GenderId = t3.Id
WHERE t2.Name = N'გიორგი'