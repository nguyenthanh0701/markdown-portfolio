USE [master]
GO
/****** Object:  Database [Social_Network]    Script Date: 8/26/2021 10:33:19 AM ******/
CREATE DATABASE [Social_Network]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Social_Network', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Social_Network.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Social_Network_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Social_Network_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Social_Network] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Social_Network].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Social_Network] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Social_Network] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Social_Network] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Social_Network] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Social_Network] SET ARITHABORT OFF 
GO
ALTER DATABASE [Social_Network] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Social_Network] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Social_Network] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Social_Network] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Social_Network] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Social_Network] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Social_Network] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Social_Network] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Social_Network] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Social_Network] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Social_Network] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Social_Network] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Social_Network] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Social_Network] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Social_Network] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Social_Network] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Social_Network] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Social_Network] SET RECOVERY FULL 
GO
ALTER DATABASE [Social_Network] SET  MULTI_USER 
GO
ALTER DATABASE [Social_Network] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Social_Network] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Social_Network] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Social_Network] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Social_Network] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Social_Network] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Social_Network', N'ON'
GO
ALTER DATABASE [Social_Network] SET QUERY_STORE = OFF
GO
USE [Social_Network]
GO
/****** Object:  Table [dbo].[comments]    Script Date: 8/26/2021 10:33:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[comments](
	[CID] [char](10) NOT NULL,
	[content] [nvarchar](1000) NULL,
	[PID] [char](10) NULL,
 CONSTRAINT [pk_comments] PRIMARY KEY CLUSTERED 
(
	[CID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Friendlist]    Script Date: 8/26/2021 10:33:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Friendlist](
	[FID] [char](10) NOT NULL,
	[UserID] [char](10) NULL,
 CONSTRAINT [pk_friendlist] PRIMARY KEY CLUSTERED 
(
	[FID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[images]    Script Date: 8/26/2021 10:33:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[images](
	[IID] [char](10) NOT NULL,
	[Iname] [nvarchar](50) NULL,
	[images] [nvarchar](50) NULL,
 CONSTRAINT [pk_images] PRIMARY KEY CLUSTERED 
(
	[IID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Post]    Script Date: 8/26/2021 10:33:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post](
	[PID] [char](10) NOT NULL,
	[USERID] [char](10) NULL,
	[CONTENT] [nvarchar](200) NULL,
	[P_like] [varchar](1000) NULL,
 CONSTRAINT [pk_Post] PRIMARY KEY CLUSTERED 
(
	[PID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Post_images]    Script Date: 8/26/2021 10:33:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post_images](
	[IID] [char](10) NULL,
	[CID] [char](10) NULL,
	[create_date] [datetime] NULL,
	[PID] [char](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Post_Videos]    Script Date: 8/26/2021 10:33:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post_Videos](
	[PID] [char](10) NULL,
	[VID] [char](10) NULL,
	[CID] [char](10) NULL,
	[create_date] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_comment]    Script Date: 8/26/2021 10:33:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_comment](
	[UserID] [char](10) NULL,
	[FID] [char](10) NULL,
	[CID] [char](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 8/26/2021 10:33:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [char](10) NOT NULL,
	[username] [nvarchar](50) NULL,
	[User_password] [char](10) NULL,
	[jobs] [nvarchar](50) NULL,
	[email] [varchar](50) NULL,
	[birth_of_date] [datetime] NULL,
 CONSTRAINT [pk_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[videos]    Script Date: 8/26/2021 10:33:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[videos](
	[VID] [char](10) NOT NULL,
	[Vname] [nvarchar](50) NULL,
	[videos] [nvarchar](100) NULL,
 CONSTRAINT [pk_videos] PRIMARY KEY CLUSTERED 
(
	[VID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ID_Username]    Script Date: 8/26/2021 10:33:19 AM ******/
CREATE NONCLUSTERED INDEX [ID_Username] ON [dbo].[Users]
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[comments]  WITH CHECK ADD  CONSTRAINT [fk_post_comment] FOREIGN KEY([PID])
REFERENCES [dbo].[Post] ([PID])
GO
ALTER TABLE [dbo].[comments] CHECK CONSTRAINT [fk_post_comment]
GO
ALTER TABLE [dbo].[Friendlist]  WITH CHECK ADD  CONSTRAINT [fk_User_friend] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Friendlist] CHECK CONSTRAINT [fk_User_friend]
GO
ALTER TABLE [dbo].[Friendlist]  WITH CHECK ADD  CONSTRAINT [fk_Userfriend] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Friendlist] CHECK CONSTRAINT [fk_Userfriend]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [fk_User_post] FOREIGN KEY([USERID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [fk_User_post]
GO
ALTER TABLE [dbo].[Post_images]  WITH CHECK ADD  CONSTRAINT [fk_Post_images1] FOREIGN KEY([PID])
REFERENCES [dbo].[Post] ([PID])
GO
ALTER TABLE [dbo].[Post_images] CHECK CONSTRAINT [fk_Post_images1]
GO
ALTER TABLE [dbo].[Post_images]  WITH CHECK ADD  CONSTRAINT [fk_Post_images2] FOREIGN KEY([IID])
REFERENCES [dbo].[images] ([IID])
GO
ALTER TABLE [dbo].[Post_images] CHECK CONSTRAINT [fk_Post_images2]
GO
ALTER TABLE [dbo].[Post_images]  WITH CHECK ADD  CONSTRAINT [fk_Post_images3] FOREIGN KEY([CID])
REFERENCES [dbo].[comments] ([CID])
GO
ALTER TABLE [dbo].[Post_images] CHECK CONSTRAINT [fk_Post_images3]
GO
ALTER TABLE [dbo].[Post_Videos]  WITH CHECK ADD  CONSTRAINT [fk_Post_videos1] FOREIGN KEY([CID])
REFERENCES [dbo].[comments] ([CID])
GO
ALTER TABLE [dbo].[Post_Videos] CHECK CONSTRAINT [fk_Post_videos1]
GO
ALTER TABLE [dbo].[Post_Videos]  WITH CHECK ADD  CONSTRAINT [fk_Post_videos2] FOREIGN KEY([VID])
REFERENCES [dbo].[videos] ([VID])
GO
ALTER TABLE [dbo].[Post_Videos] CHECK CONSTRAINT [fk_Post_videos2]
GO
ALTER TABLE [dbo].[Post_Videos]  WITH CHECK ADD  CONSTRAINT [fk_Post_videos3] FOREIGN KEY([PID])
REFERENCES [dbo].[Post] ([PID])
GO
ALTER TABLE [dbo].[Post_Videos] CHECK CONSTRAINT [fk_Post_videos3]
GO
ALTER TABLE [dbo].[User_comment]  WITH CHECK ADD  CONSTRAINT [fk_Friend_comment1] FOREIGN KEY([FID])
REFERENCES [dbo].[Friendlist] ([FID])
GO
ALTER TABLE [dbo].[User_comment] CHECK CONSTRAINT [fk_Friend_comment1]
GO
ALTER TABLE [dbo].[User_comment]  WITH CHECK ADD  CONSTRAINT [fk_Friend_comment2] FOREIGN KEY([CID])
REFERENCES [dbo].[comments] ([CID])
GO
ALTER TABLE [dbo].[User_comment] CHECK CONSTRAINT [fk_Friend_comment2]
GO
ALTER TABLE [dbo].[User_comment]  WITH CHECK ADD  CONSTRAINT [fk_user_cmt] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[User_comment] CHECK CONSTRAINT [fk_user_cmt]
GO
USE [master]
GO
ALTER DATABASE [Social_Network] SET  READ_WRITE 
GO
