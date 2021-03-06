USE [master]
GO
/****** Object:  Database [BloggingPlatform]    Script Date: 06-Apr-18 14:02:21 ******/
CREATE DATABASE [BloggingPlatform]
 CONTAINMENT = NONE
GO
ALTER DATABASE [BloggingPlatform] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BloggingPlatform].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [BloggingPlatform] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BloggingPlatform] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BloggingPlatform] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BloggingPlatform] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BloggingPlatform] SET ARITHABORT OFF 
GO
ALTER DATABASE [BloggingPlatform] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BloggingPlatform] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BloggingPlatform] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BloggingPlatform] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BloggingPlatform] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BloggingPlatform] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BloggingPlatform] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BloggingPlatform] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BloggingPlatform] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BloggingPlatform] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BloggingPlatform] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BloggingPlatform] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BloggingPlatform] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BloggingPlatform] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BloggingPlatform] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BloggingPlatform] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BloggingPlatform] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BloggingPlatform] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BloggingPlatform] SET  MULTI_USER 
GO
ALTER DATABASE [BloggingPlatform] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BloggingPlatform] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BloggingPlatform] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BloggingPlatform] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [BloggingPlatform] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BloggingPlatform] SET QUERY_STORE = OFF
GO
USE [BloggingPlatform]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [BloggingPlatform]
GO
/****** Object:  Table [dbo].[Authors]    Script Date: 30. 4. 2018 9:37:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authors](
	[id] [uniqueidentifier] NOT NULL,
	[username] [varchar](250) NOT NULL,
	[firstName] [varchar](250) NULL,
	[lastName] [varchar](250) NULL,
	[email] [varchar](250) NOT NULL,
	[password] [varchar](250) NOT NULL,
	[phone] [varchar](50) NULL,
 CONSTRAINT [PK_Authors] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 30. 4. 2018 9:38:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[id] [uniqueidentifier] NOT NULL,
	[name] [varchar](250) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 30. 4. 2018 9:38:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[id] [uniqueidentifier] NOT NULL,
	[commentDate] [datetime] NOT NULL,
	[authorId] [uniqueidentifier] NOT NULL,
	[commentText] [varchar](max) NOT NULL,
	[postId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Posts]    Script Date: 30. 4. 2018 9:38:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts](
	[id] [uniqueidentifier] NOT NULL,
	[title] [nvarchar](250) NOT NULL,
	[postDate] [datetime] NOT NULL,
	[authorId] [uniqueidentifier] NOT NULL,
	[perex] [nvarchar](max) NULL,
	[postText] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Posts] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PostsCategories]    Script Date: 30. 4. 2018 9:38:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostsCategories](
	[Id] [uniqueidentifier] NOT NULL,
	[postId] [uniqueidentifier] NOT NULL,
	[categoryId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_PostsCategories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Authors] FOREIGN KEY([authorId])
REFERENCES [dbo].[Authors] ([id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Authors]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Posts] FOREIGN KEY([postId])
REFERENCES [dbo].[Posts] ([id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Posts]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_Authors] FOREIGN KEY([authorId])
REFERENCES [dbo].[Authors] ([id])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_Authors]
GO
ALTER TABLE [dbo].[PostsCategories]  WITH CHECK ADD  CONSTRAINT [FK_PostsCategories_Categories] FOREIGN KEY([categoryId])
REFERENCES [dbo].[Categories] ([id])
GO
ALTER TABLE [dbo].[PostsCategories] CHECK CONSTRAINT [FK_PostsCategories_Categories]
GO
ALTER TABLE [dbo].[PostsCategories]  WITH CHECK ADD  CONSTRAINT [FK_PostsCategories_Posts] FOREIGN KEY([postId])
REFERENCES [dbo].[Posts] ([id])
GO
ALTER TABLE [dbo].[PostsCategories] CHECK CONSTRAINT [FK_PostsCategories_Posts]
GO
USE [master]
GO
ALTER DATABASE [BloggingPlatform] SET  READ_WRITE 
GO
