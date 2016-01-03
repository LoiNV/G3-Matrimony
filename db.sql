USE [ideal_match]
GO
/****** Object:  Table [dbo].[tbl_Advertisement]    Script Date: 3/1/2016 20:21:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Advertisement](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[customer_id] [int] NOT NULL,
	[image] [ntext] NOT NULL,
	[link] [ntext] NOT NULL,
	[duration] [int] NOT NULL,
	[message] [ntext] NOT NULL,
	[amount] [float] NOT NULL,
	[created_date] [varchar](20) NOT NULL,
	[status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Customers]    Script Date: 3/1/2016 20:21:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Customers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[phone] [varchar](20) NOT NULL,
	[position] [int] NOT NULL,
	[status] [int] NULL,
 CONSTRAINT [PK_tbl_Customers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Friends]    Script Date: 3/1/2016 20:21:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[tbl_Friends](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId1] [int] NOT NULL,
	[userId2] [int] NOT NULL,
	[created_date] [varchar](20) NOT NULL,
	[namespace] [varchar](20) NOT NULL,
	[status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Images]    Script Date: 3/1/2016 20:21:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Images](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[imgLink] [ntext] NOT NULL,
	[status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_Subcription]    Script Date: 3/1/2016 20:21:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Subcription](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[price] [float] NOT NULL,
	[duration] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_Users]    Script Date: 3/1/2016 20:21:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[tbl_Users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](20) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[gender] [bit] NOT NULL,
	[birthday] [varchar](20) NOT NULL,
	[age] [int] NOT NULL,
	[first_name] [nvarchar](20) NULL,
	[last_name] [nvarchar](20) NULL,
	[marital_status] [nvarchar](30) NULL,
	[country] [nvarchar](30) NULL,
	[city] [nvarchar](30) NULL,
	[phone] [varchar](15) NULL,
	[religion] [nvarchar](50) NULL,
	[caste] [ntext] NULL,
	[avatar] [ntext] NULL,
	[longtitude] [bigint] NULL,
	[latitude] [bigint] NULL,
	[status] [int] NULL,
	[description] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_UserSubscription]    Script Date: 3/1/2016 20:21:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[tbl_UserSubscription](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[sub_id] [int] NOT NULL,
	[chargedDate] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[tbl_Advertisement]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Advertisement_tbl_Customers] FOREIGN KEY([customer_id])
REFERENCES [dbo].[tbl_Customers] ([id])
GO
ALTER TABLE [dbo].[tbl_Advertisement] CHECK CONSTRAINT [FK_tbl_Advertisement_tbl_Customers]
GO
ALTER TABLE [dbo].[tbl_Friends]  WITH CHECK ADD  CONSTRAINT [FK_tbl__Friends_tbl_Users] FOREIGN KEY([userId1])
REFERENCES [dbo].[tbl_Users] ([id])
GO
ALTER TABLE [dbo].[tbl_Friends] CHECK CONSTRAINT [FK_tbl__Friends_tbl_Users]
GO
ALTER TABLE [dbo].[tbl_Friends]  WITH CHECK ADD  CONSTRAINT [FK_tbl__Friends_tbl_Users1] FOREIGN KEY([userId2])
REFERENCES [dbo].[tbl_Users] ([id])
GO
ALTER TABLE [dbo].[tbl_Friends] CHECK CONSTRAINT [FK_tbl__Friends_tbl_Users1]
GO
ALTER TABLE [dbo].[tbl_Images]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Images_tbl_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[tbl_Users] ([id])
GO
ALTER TABLE [dbo].[tbl_Images] CHECK CONSTRAINT [FK_tbl_Images_tbl_Users]
GO
ALTER TABLE [dbo].[tbl_UserSubscription]  WITH CHECK ADD  CONSTRAINT [FK_tbl_UserSubscription_tbl_Subcription] FOREIGN KEY([sub_id])
REFERENCES [dbo].[tbl_Subcription] ([id])
GO
ALTER TABLE [dbo].[tbl_UserSubscription] CHECK CONSTRAINT [FK_tbl_UserSubscription_tbl_Subcription]
GO
ALTER TABLE [dbo].[tbl_UserSubscription]  WITH CHECK ADD  CONSTRAINT [FK_tbl_UserSubscription_tbl_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[tbl_Users] ([id])
GO
ALTER TABLE [dbo].[tbl_UserSubscription] CHECK CONSTRAINT [FK_tbl_UserSubscription_tbl_Users]
GO

insert into tbl_Subcription values('3 months', 30, 90);
insert into tbl_Subcription values('6 months', 50, 180);
insert into tbl_Subcription values('12 months', 100, 365);

update tbl_Users set password ='21232f297a57a5a743894a0e4a801fc3' where id >0