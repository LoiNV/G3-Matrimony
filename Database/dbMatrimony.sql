USE [ideal_match]
GO
/****** Object:  Table [dbo].[tbl_Advertisement]    Script Date: 7/1/2016 17:12:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
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
/****** Object:  Table [dbo].[tbl_Customers]    Script Date: 7/1/2016 17:12:58 PM ******/
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
/****** Object:  Table [dbo].[tbl_Friends]    Script Date: 7/1/2016 17:12:58 PM ******/
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
/****** Object:  Table [dbo].[tbl_Images]    Script Date: 7/1/2016 17:12:58 PM ******/
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
/****** Object:  Table [dbo].[tbl_Subcription]    Script Date: 7/1/2016 17:12:58 PM ******/
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
/****** Object:  Table [dbo].[tbl_Users]    Script Date: 7/1/2016 17:12:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[tbl_Users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
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
	[description] [ntext] NULL,
	[longtitude] [bigint] NULL,
	[latitude] [bigint] NULL,
	[status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_UserSubscription]    Script Date: 7/1/2016 17:12:58 PM ******/
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
SET IDENTITY_INSERT [dbo].[tbl_Friends] ON 

INSERT [dbo].[tbl_Friends] ([id], [userId1], [userId2], [created_date], [namespace], [status]) VALUES (1, 1, 31, N'07/01/2016', N'1_31', 0)
INSERT [dbo].[tbl_Friends] ([id], [userId1], [userId2], [created_date], [namespace], [status]) VALUES (2, 2, 31, N'07/01/2016', N'2_31', 0)
INSERT [dbo].[tbl_Friends] ([id], [userId1], [userId2], [created_date], [namespace], [status]) VALUES (3, 3, 31, N'07/01/2016', N'3_31', 0)
SET IDENTITY_INSERT [dbo].[tbl_Friends] OFF
SET IDENTITY_INSERT [dbo].[tbl_Images] ON 

INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (1, 1, N'http://www.hinhviet.com/images/2016/01/04/taylor-swift-red-2.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (2, 1, N'http://www.hinhviet.com/images/2016/01/04/Taylor-Swift-photo-shoot-for-The-Independent-Newspaper-taylor-swift-26783923-600-800.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (3, 1, N'http://www.hinhviet.com/images/2016/01/04/taylor-swift-covergirl-2012.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (4, 1, N'http://www.hinhviet.com/images/2016/01/04/taylor-swift-covergirl-20121.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (5, 1, N'http://www.hinhviet.com/images/2016/01/04/Shawn-Patrick-Diet-Coke-Taylor-Swift-02-600x800.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (6, 1, N'http://www.hinhviet.com/images/2016/01/04/taylor-swift-legs-keds-6.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (7, 1, N'http://www.hinhviet.com/images/2016/01/04/tumblr_n8eo62toXt1qepnhso1_1280.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (8, 1, N'http://www.hinhviet.com/images/2016/01/04/TSwift2.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (9, 1, N'http://www.hinhviet.com/images/2016/01/04/taylor-swift-with-curls.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (10, 2, N'http://www.hinhviet.com/images/2016/01/04/05.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (11, 2, N'http://www.hinhviet.com/images/2016/01/04/tumblr_n2vbdeeIKx1rcoad1o1_r1_1280.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (12, 2, N'http://www.hinhviet.com/images/2016/01/04/c520ad551e9fd113959f02e8cc4c22b2-051854400_1426072780-4.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (13, 2, N'http://www.hinhviet.com/images/2016/01/04/CGRM6aNVAAEL8Ci.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (14, 2, N'http://www.hinhviet.com/images/2016/01/04/7d90ce1e1d2a5c9706d3367dfbced488.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (15, 2, N'http://www.hinhviet.com/images/2016/01/04/a7b2B8e_700b.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (16, 2, N'http://www.hinhviet.com/images/2016/01/04/201403181006420310_1.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (17, 2, N'http://www.hinhviet.com/images/2016/01/04/84fe5d9ejw1enok5b5pckj20sg15mwpq.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (18, 2, N'http://www.hinhviet.com/images/2016/01/04/0084bb08-afbf-4bdc-963e-61f8d06257c2.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (19, 3, N'http://www.hinhviet.com/images/2016/01/04/Jessica-jessica-snsd-14633033-479-720.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (20, 3, N'http://www.hinhviet.com/images/2016/01/04/11.png', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (21, 3, N'http://www.hinhviet.com/images/2016/01/04/-Jessica-jessica-snsd-32898361-400-600.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (22, 3, N'http://www.hinhviet.com/images/2016/01/04/Jessica-jessica-snsd-32685357-500-713.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (23, 3, N'http://www.hinhviet.com/images/2016/01/04/jessicavita500-38.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (24, 3, N'http://www.hinhviet.com/images/2016/01/04/1d965cd75bfc2de628bb95817fe38c14.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (25, 3, N'http://www.hinhviet.com/images/2016/01/04/original.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (26, 3, N'http://www.hinhviet.com/images/2016/01/04/140103-snsd-jessiac-real-baby-g-promotion.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (27, 3, N'http://www.hinhviet.com/images/2016/01/04/snsd-jessica-g-star-picture.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (28, 4, N'http://www.hinhviet.com/images/2016/01/04/karas-kang-ji-young-and-f-x-s-krystal-april-16-2013.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (29, 4, N'http://www.hinhviet.com/images/2016/01/04/ouc1399298836.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (30, 4, N'http://www.hinhviet.com/images/2016/01/04/img-201504021453381933-jpeg-7773-1427969159.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (31, 4, N'http://www.hinhviet.com/images/2016/01/04/20140512_kfashionista_fx_krystal5.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (32, 4, N'http://www.hinhviet.com/images/2016/01/04/660fa68b63358a50748bd5663b1de1bb.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (33, 4, N'http://www.hinhviet.com/images/2016/01/04/Krystal-on-the-phone-krystal-jung-31740110-500-686.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (34, 4, N'http://www.hinhviet.com/images/2016/01/04/20140330_krys-vogue_01.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (35, 4, N'http://www.hinhviet.com/images/2016/01/04/xMy_Lovely_Girl_Krystal-Jung-Fx-683x1024.jpg.pagespeed.ic.N3A2nH3CpE.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (36, 4, N'http://www.hinhviet.com/images/2016/01/04/krystal2.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (37, 5, N'http://www.hinhviet.com/images/2016/01/04/1368371555268.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (38, 5, N'http://www.hinhviet.com/images/2016/01/04/1378788173119.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (39, 5, N'http://www.hinhviet.com/images/2016/01/04/347b7d02-ef00-4e45-8e6c-dd5d8eb291b2.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (40, 5, N'http://www.hinhviet.com/images/2016/01/04/ban-sao-pham-bang-bang-duong-mich-1.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (41, 5, N'http://www.hinhviet.com/images/2016/01/04/fan-lo-lang-cho-dua-con-trong-bung-duong-mich-.jpghttp://www.hinhviet.com/images/2016/01/04/1368371555268.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (42, 5, N'
http://www.hinhviet.com/images/2016/01/04/1378788173119.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (43, 5, N'http://www.hinhviet.com/images/2016/01/04/347b7d02-ef00-4e45-8e6c-dd5d8eb291b2.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (44, 5, N'http://www.hinhviet.com/images/2016/01/04/ban-sao-pham-bang-bang-duong-mich-1.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (45, 5, N'
http://www.hinhviet.com/images/2016/01/04/fan-lo-lang-cho-dua-con-trong-bung-duong-mich-.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (46, 6, N'http://www.hinhviet.com/images/2016/01/04/park-min-young.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (47, 6, N'http://www.hinhviet.com/images/2016/01/04/12372744_f520.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (48, 6, N'http://www.hinhviet.com/images/2016/01/04/Park-Min-Young-dawnlove92-35069621-520-774.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (49, 6, N'http://www.hinhviet.com/images/2016/01/04/9e02c7249fdd2b9d513996a8f5cb9332.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (50, 6, N'http://www.hinhviet.com/images/2016/01/04/20110506_park_minyoung_3.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (51, 6, N'http://www.hinhviet.com/images/2016/01/04/Park-Min-Young-Duani-F-W-2014-Lookbook-13.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (52, 6, N'http://www.hinhviet.com/images/2016/01/04/original75788.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (53, 6, N'http://www.hinhviet.com/images/2016/01/04/06_zpsed5e45f7.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (54, 6, N'http://www.hinhviet.com/images/2016/01/04/2012050307315233995_1.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (55, 6, N'http://www.hinhviet.com/images/2016/01/04/original822b6.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (56, 7, N'http://www.hinhviet.com/images/2016/01/04/efe693bb151e02ad636f8801580b4f55_DIoQhycmyMFjveqlmR.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (57, 7, N'http://www.hinhviet.com/images/2016/01/04/imjiyeon_15.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (58, 7, N'http://www.hinhviet.com/images/2016/01/04/tumblr_ninq0tpT7B1rcoad1o1_540.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (59, 7, N'http://www.hinhviet.com/images/2016/01/04/l_20150122020011486002455610_99_20150122104801.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (60, 7, N'http://www.hinhviet.com/images/2016/01/04/taras-jiyeon-at-cable-tv-broadcast-awards-red-carpet.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (61, 7, N'http://www.hinhviet.com/images/2016/01/04/gJkQIL7.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (62, 7, N'http://www.hinhviet.com/images/2016/01/04/JiYeon.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (63, 7, N'http://www.hinhviet.com/images/2016/01/04/lee_min_jung1.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (64, 7, N'http://www.hinhviet.com/images/2016/01/04/1381640888-jiyeonsmil-o.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (65, 8, N'http://www.hinhviet.com/images/2016/01/04/davichis-kang-min-kyung-sunbathing-at-terrace-in-tank-top.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (66, 8, N'http://www.hinhviet.com/images/2016/01/04/nhung-hinh-anh-goi-cam-cua-kang-minkyung-davichi-9fc5e4.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (67, 8, N'http://www.hinhviet.com/images/2016/01/04/KangMinKyung09.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (68, 8, N'http://www.hinhviet.com/images/2016/01/04/85654002.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (69, 8, N'http://www.hinhviet.com/images/2016/01/04/20110322_minkyung_11.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (70, 8, N'http://www.hinhviet.com/images/2016/01/04/tumblr_n7olccBiWG1ru897fo1_500.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (71, 8, N'http://www.hinhviet.com/images/2016/01/04/mk.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (72, 8, N'http://www.hinhviet.com/images/2016/01/04/images889931_mgf290313nucasihan_mgf290313nucasihan3.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (73, 8, N'http://www.hinhviet.com/images/2016/01/04/191120121345422.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (74, 9, N'http://www.hinhviet.com/images/2016/01/04/2411.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (75, 9, N'http://www.hinhviet.com/images/2016/01/04/large.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (76, 9, N'http://www.hinhviet.com/images/2016/01/04/SNSD-Sweet-Magazine-May-Issue-2011-girls-generation-snsd-21168948-705-870.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (77, 9, N'http://www.hinhviet.com/images/2016/01/04/tiffany.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (78, 9, N'http://www.hinhviet.com/images/2016/01/04/So-pretty-fany-girls-generation-snsd-37008484-240-400.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (79, 9, N'http://www.hinhviet.com/images/2016/01/04/207821_1383585258621_full.png', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (80, 9, N'http://www.hinhviet.com/images/2016/01/04/tumblr_lilm0irtco1qcsgcuo1_500.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (81, 9, N'http://www.hinhviet.com/images/2016/01/04/tiffany-snsd-khoe-sac-rang-ro-lan-at-dan-sao-a773f5.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (82, 9, N'http://www.hinhviet.com/images/2016/01/04/snsd-Tiffany-without-makeup-03.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (83, 10, N'http://www.hinhviet.com/images/2016/01/04/yui2-750.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (84, 10, N'http://www.hinhviet.com/images/2016/01/04/normal_256.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (85, 10, N'http://www.hinhviet.com/images/2016/01/04/aragakiyui_i01.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (86, 10, N'http://www.hinhviet.com/images/2016/01/04/aragaki-yui-4.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (87, 10, N'http://www.hinhviet.com/images/2016/01/04/600full-yui-aragaki.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (88, 10, N'http://www.hinhviet.com/images/2016/01/04/tumblr_krtg9f1eFC1qzd0u6o1_500.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (89, 10, N'http://www.hinhviet.com/images/2016/01/04/9113c9277999d12368c1cd98b52cd5b31243572405_full.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (90, 10, N'http://www.hinhviet.com/images/2016/01/04/9xDTbRJ3aqvdkozxeMHbEkgvo1_500.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (91, 16, N'http://hinhviet.com/images/2016/01/04/LeeMinHo_Romanson_1.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (92, 16, N'http://hinhviet.com/images/2016/01/04/actor-lee-min-ho-becomes-the-most-followed-korean-celebrity-on-chinas-weibo.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (93, 16, N'http://hinhviet.com/images/2016/01/04/leeminho_150.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (94, 16, N'http://hinhviet.com/images/2016/01/04/Lee-Min-Ho-angle-lee-min-ho-30733266-399-600.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (95, 16, N'http://hinhviet.com/images/2016/01/04/15a129eb1c818b16aa768c2bb563d704.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (96, 16, N'http://hinhviet.com/images/2016/01/04/d9f267f12440ddb6b6a073a5a98d1a38.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (97, 16, N'http://hinhviet.com/images/2016/01/04/tumblr_static_au0smrygx5sk80o0oowkwgc8g.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (98, 16, N'http://hinhviet.com/images/2016/01/04/Lee-min-ho-korean-stars-24075261-551-747.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (99, 16, N'http://hinhviet.com/images/2016/01/04/Lee-Min-Ho-image-lee-min-ho-36658596-700-900.jpg', 0)
GO
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (100, 17, N'http://hinhviet.com/images/2016/01/04/c0ced7f1adbd9bef4a75b934dbe240b0.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (101, 17, N'http://hinhviet.com/images/2016/01/04/large.png', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (102, 17, N'http://hinhviet.com/images/2016/01/04/EXO-Luhan-kris_1438308860_af_org.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (103, 17, N'http://hinhviet.com/images/2016/01/04/tumblr_mwgg3fAv3P1qgnxifo2_500.png', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (104, 17, N'http://hinhviet.com/images/2016/01/04/fd71a95e782c74d9c248f0226684a499.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (105, 17, N'http://hinhviet.com/images/2016/01/04/original.png', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (106, 17, N'http://hinhviet.com/images/2016/01/04/exo-m_213228_1.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (107, 17, N'http://hinhviet.com/images/2016/01/04/kris.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (108, 17, N'http://hinhviet.com/images/2016/01/04/kris-wu-yi-fan-l-o-r-d-legend-of-ravaging-dynasties.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (109, 18, N'http://hinhviet.com/images/2016/01/04/KimSooHyun039_zpsb008742f.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (110, 18, N'http://hinhviet.com/images/2016/01/04/Kim-SooHyun-image-kim-soohyun-36663952-500-677.png', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (111, 18, N'http://hinhviet.com/images/2016/01/04/Kim-Soo-Hyun_1392478667_af_org.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (112, 18, N'http://hinhviet.com/images/2016/01/04/KimSooHyun2.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (113, 18, N'http://hinhviet.com/images/2016/01/04/KimSooHyun-newphotos-3.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (114, 18, N'http://hinhviet.com/images/2016/01/04/06_zps8c8ba4e6.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (115, 18, N'http://hinhviet.com/images/2016/01/04/Kim2BSoo2BHyun.png', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (116, 18, N'http://hinhviet.com/images/2016/01/04/02_zps2ad29316.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (117, 18, N'http://hinhviet.com/images/2016/01/04/KIM-SOO-HYUN-ALLURE-APRIL-2012-B.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (118, 19, N'http://hinhviet.com/images/2016/01/04/Tao.png', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (119, 19, N'http://hinhviet.com/images/2016/01/04/Tao-next-EXO-member-to-be-featured-in-Laws-of-the-Jungle..jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (120, 19, N'http://hinhviet.com/images/2016/01/04/tao8.png', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (121, 19, N'http://hinhviet.com/images/2016/01/04/untitled_by_xartexplosion-d76bue4.png', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (122, 19, N'http://hinhviet.com/images/2016/01/04/a6eba2ecabfc04045056bdb6c013f2bf.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (123, 19, N'http://hinhviet.com/images/2016/01/04/EXO-EXO-M-Tao_1429229840_af_org.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (124, 19, N'http://hinhviet.com/images/2016/01/04/2976085b-88d8-4d71-bf7e-72c5d3c64567.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (125, 19, N'http://hinhviet.com/images/2016/01/04/EXO-MTao00000.png', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (126, 19, N'http://hinhviet.com/images/2016/01/04/incheon120726_47.jpg', 0)
INSERT [dbo].[tbl_Images] ([id], [user_id], [imgLink], [status]) VALUES (127, 31, N'http://localhost:8080/Matrimony/img/ADMIN/avt.jpg', 0)
SET IDENTITY_INSERT [dbo].[tbl_Images] OFF
SET IDENTITY_INSERT [dbo].[tbl_Subcription] ON 

INSERT [dbo].[tbl_Subcription] ([id], [name], [price], [duration]) VALUES (1, N'3 months', 30, 90)
INSERT [dbo].[tbl_Subcription] ([id], [name], [price], [duration]) VALUES (2, N'6 months', 50, 180)
INSERT [dbo].[tbl_Subcription] ([id], [name], [price], [duration]) VALUES (3, N'12 months', 100, 365)
SET IDENTITY_INSERT [dbo].[tbl_Subcription] OFF
SET IDENTITY_INSERT [dbo].[tbl_Users] ON 

INSERT [dbo].[tbl_Users] ([id], [name], [password], [email], [gender], [birthday], [age], [first_name], [last_name], [marital_status], [country], [city], [phone], [religion], [caste], [avatar], [description], [longtitude], [latitude], [status]) VALUES (1, N'Taylor Swift', N'21232f297a57a5a743894a0e4a801fc3', N'TaylorSwift@gmailcom', 0, N'21-12-1989', 28, N'Maria', N'Ozawoa', N'Single', N'USA', N'Colombian', N'0971711815', N'No', N'University', N'http://hinhviet.com/images/2016/01/04/cb0d8db03c882c52f30b7b244475b36f.jpg', N'Keep Smiling & One day Life will tired of upsetting you :)', 111, 111, 0)
INSERT [dbo].[tbl_Users] ([id], [name], [password], [email], [gender], [birthday], [age], [first_name], [last_name], [marital_status], [country], [city], [phone], [religion], [caste], [avatar], [description], [longtitude], [latitude], [status]) VALUES (2, N'Yoona', N'21232f297a57a5a743894a0e4a801fc3', N'Yoona@gmail.com', 0, N'1-12-1992', 23, N'Priyanka ', N'Chopra', N'Single', N'USA', N'New York', N'2025550167
', N'Christian', N'College', N'http://www.hinhviet.com/images/2016/01/04/24.jpg', N'Dont tell people your dreams, SHOW THEM!', 42, 78, 0)
INSERT [dbo].[tbl_Users] ([id], [name], [password], [email], [gender], [birthday], [age], [first_name], [last_name], [marital_status], [country], [city], [phone], [religion], [caste], [avatar], [description], [longtitude], [latitude], [status]) VALUES (3, N'Jessica', N'21232f297a57a5a743894a0e4a801fc3', N'Jessica@gmail.com', 0, N'27-12-1991', 22, N'Kate ', N'Upton', N'Single', N'USA', N'Michigan', N'2025550125
', N'Buddhist', N'University', N'http://www.hinhviet.com/images/2016/01/04/jessica-soup-28s.jpg', N'If I had a pound for every time I got suspicious... Id wonder who the f&*k was paying me, and why?', 42, 83, 0)
INSERT [dbo].[tbl_Users] ([id], [name], [password], [email], [gender], [birthday], [age], [first_name], [last_name], [marital_status], [country], [city], [phone], [religion], [caste], [avatar], [description], [longtitude], [latitude], [status]) VALUES (4, N'Krystal', N'21232f297a57a5a743894a0e4a801fc3', N'Krystal@gmail.com', 0, N'5-3-1992', 23, N'Taylor ', N'Swift', N'Single', N'USA', N'Pennsylvania', N'2025550175
', N'No', N'x', N'http://www.hinhviet.com/images/2016/01/04/Krystal-Jung-2.jpg', N'I m not special, I am just a LIMITED EDITION.', 40, 80, 0)
INSERT [dbo].[tbl_Users] ([id], [name], [password], [email], [gender], [birthday], [age], [first_name], [last_name], [marital_status], [country], [city], [phone], [religion], [caste], [avatar], [description], [longtitude], [latitude], [status]) VALUES (5, N'Duong Mich', N'21232f297a57a5a743894a0e4a801fc3', N'duongmich@gmail.com', 0, N'7-5-1992', 25, N'Gal ', N'Gadot', N'Single', N'USA', N'Rosh HaAyin', N'2025550160
', N'Christian', N'University', N'http://www.hinhviet.com/images/2016/01/04/9954b8c9-0e52-4ba8-97dd-5649141d065b.jpg', N'There is only 1 thing 2 do, 3 words for you - I Love You', 34, 74, 0)
INSERT [dbo].[tbl_Users] ([id], [name], [password], [email], [gender], [birthday], [age], [first_name], [last_name], [marital_status], [country], [city], [phone], [religion], [caste], [avatar], [description], [longtitude], [latitude], [status]) VALUES (6, N'Park Min Young', N'21232f297a57a5a743894a0e4a801fc3', N'ParkMinYoung@gmail.com', 0, N'9-9-1992', 30, N'Emma ', N'Watson', N'Single', N'France', N'Paris', N'2025550121
', N'Christian', N'College', N'http://www.hinhviet.com/images/2016/01/04/01202.jpg', N'Mom logic: If you go wild and break your legs, do not run to me and cry ..', 43, 76, 0)
INSERT [dbo].[tbl_Users] ([id], [name], [password], [email], [gender], [birthday], [age], [first_name], [last_name], [marital_status], [country], [city], [phone], [religion], [caste], [avatar], [description], [longtitude], [latitude], [status]) VALUES (7, N'Lee Ji Yeon', N'21232f297a57a5a743894a0e4a801fc3', N'LeeJiYeon@gmail.com', 0, N'7-3-1990', 25, N'Deepika ', N'Padukone', N'Single', N'South Africa', N'Mooiriver', N'2025550175
', N'No', N'University', N'http://www.hinhviet.com/images/2016/01/04/Lee_Ji-Yeon_1984-p02.jpg', N'Borrow money from a pessimist- - he doesnt expect it back.', 9, 11, 0)
INSERT [dbo].[tbl_Users] ([id], [name], [password], [email], [gender], [birthday], [age], [first_name], [last_name], [marital_status], [country], [city], [phone], [religion], [caste], [avatar], [description], [longtitude], [latitude], [status]) VALUES (8, N'Kang Min Kyung', N'21232f297a57a5a743894a0e4a801fc3', N'KangMinKyung@gmail.com', 0, N'17-10-1988', 27, N'Shailene ', N'Woodley', N'Single', N'Denmark', N'Copenhagen', N'0163296012', N'No', N'College', N'http://www.hinhviet.com/images/2016/01/04/Davichi-image-davichi-36113448-480-720.jpg', N'Our marriage is like a workshop. I work and my wife shops.', 6, 79, 0)
INSERT [dbo].[tbl_Users] ([id], [name], [password], [email], [gender], [birthday], [age], [first_name], [last_name], [marital_status], [country], [city], [phone], [religion], [caste], [avatar], [description], [longtitude], [latitude], [status]) VALUES (9, N'Tiffany', N'21232f297a57a5a743894a0e4a801fc3', N'Tiffany@gmail.com', 0, N'3-6-1998', 18, N'Sarah ', N'Cornor', N'Single', N'USA', N'New York', N'20255501899', N'No', N'University', N'http://www.hinhviet.com/images/2016/01/04/6.jpg', N'Mom''s logic: If you go wild and break your legs, do not run to me and cry ..
', 42, 78, 0)
INSERT [dbo].[tbl_Users] ([id], [name], [password], [email], [gender], [birthday], [age], [first_name], [last_name], [marital_status], [country], [city], [phone], [religion], [caste], [avatar], [description], [longtitude], [latitude], [status]) VALUES (10, N'Aragaki Yui', N'21232f297a57a5a743894a0e4a801fc3', N'AragakiYui@gmail.com', 0, N'2-2-1991', 25, N'Xiao ', N'Fang', N'Single', N'Chinese', N'Beijing', N'39455667789', N'Buddihist', N'x', N'http://www.hinhviet.com/images/2016/01/04/yui.jpg', N'There are 3 types of people in the world- vegetarian, non-veterinarian & Tuesday Saturday     
', 39, 116, 0)
INSERT [dbo].[tbl_Users] ([id], [name], [password], [email], [gender], [birthday], [age], [first_name], [last_name], [marital_status], [country], [city], [phone], [religion], [caste], [avatar], [description], [longtitude], [latitude], [status]) VALUES (11, N'Nagasawa Masami', N'21232f297a57a5a743894a0e4a801fc3', N'NagasawaMasami@gmail.com', 0, N'28-12-1995
', 21, N'Manni', N'Pann', N'Single', N'France', N'Paris', N'2025551166', N'No', N'x', N'http://hinhviet.com/images/2016/01/04/Nagasawa-Masami-2.jpg', N'Everyday is a good day', 43, 76, 0)
INSERT [dbo].[tbl_Users] ([id], [name], [password], [email], [gender], [birthday], [age], [first_name], [last_name], [marital_status], [country], [city], [phone], [religion], [caste], [avatar], [description], [longtitude], [latitude], [status]) VALUES (12, N'Luu Thi Thi', N'21232f297a57a5a743894a0e4a801fc3', N'LuuThiThi@gmail.com', 0, N'23-10-1985
', 31, N'Emily', N'Wardlaw', N'Single', N'USA', N'New York', N'20255501758', N'No', N'University', N'http://hinhviet.com/images/2016/01/04/soi-sao_9a75492155.jpg', N'Keep Smiling & One day Life will tired of upsetting you :)', 42, 78, 0)
INSERT [dbo].[tbl_Users] ([id], [name], [password], [email], [gender], [birthday], [age], [first_name], [last_name], [marital_status], [country], [city], [phone], [religion], [caste], [avatar], [description], [longtitude], [latitude], [status]) VALUES (13, N'Horikita Maki', N'21232f297a57a5a743894a0e4a801fc3', N'HorikitaMaki@gmail.com', 0, N'11-10-1983
', 33, N'Nicole', N'Pereira
', N'Single', N'France', N'Paris', N'01632965555', N'No', N'Worker', N'http://hinhviet.com/images/2016/01/04/36b707f86a8c4923f523eebcef9fdb47.jpg', N'Don''t tell people your dreams, SHOW THEM!
', 43, 76, 0)
INSERT [dbo].[tbl_Users] ([id], [name], [password], [email], [gender], [birthday], [age], [first_name], [last_name], [marital_status], [country], [city], [phone], [religion], [caste], [avatar], [description], [longtitude], [latitude], [status]) VALUES (14, N'Luu Diec Phi', N'21232f297a57a5a743894a0e4a801fc3', N'LuuDiecPhi@gmail.com', 0, N'30-04-1991
', 25, N'Emma', N'Johson', N'Single', N'South Africa', N'Mooiriver', N'09717118900', N'Islam', N'x', N'http://hinhviet.com/images/2016/01/04/55284825-1268187013-luu-diec-phi--2-.jpg', N'If I had a pound for every time I got suspicious... I''d wonder who the f&*k was paying me, and why?
', 9, 11, 0)
INSERT [dbo].[tbl_Users] ([id], [name], [password], [email], [gender], [birthday], [age], [first_name], [last_name], [marital_status], [country], [city], [phone], [religion], [caste], [avatar], [description], [longtitude], [latitude], [status]) VALUES (15, N'Ingrid Russell', N'21232f297a57a5a743894a0e4a801fc3', N'IngridB@gmail.com', 0, N'13-10-1996', 22, N'Ingrid', N'Russel', N'Single', N'USA', N'New York', N'8197615831', N'No', N'Employee', N'http://hinhviet.com/images/2016/01/04/1355390580-yen-korea-1.jpg', N'I m not special, I am just a LIMITED EDITION.
', 47, 79, 0)
INSERT [dbo].[tbl_Users] ([id], [name], [password], [email], [gender], [birthday], [age], [first_name], [last_name], [marital_status], [country], [city], [phone], [religion], [caste], [avatar], [description], [longtitude], [latitude], [status]) VALUES (16, N'Lee Min Ho', N'21232f297a57a5a743894a0e4a801fc3', N'LeeMinHo@gmail.com', 1, N'8-2-1992', 23, N'Hungary', N'Tsou', N'Single', N'Hungary', N'Baross', N'48980014', N'Christian', N'Employee', N'http://hinhviet.com/images/2016/01/04/sari.jpg', N'There is only 1 thing 2 do, 3 words for you - I Love You
', 48, 20, 0)
INSERT [dbo].[tbl_Users] ([id], [name], [password], [email], [gender], [birthday], [age], [first_name], [last_name], [marital_status], [country], [city], [phone], [religion], [caste], [avatar], [description], [longtitude], [latitude], [status]) VALUES (17, N'Kris', N'21232f297a57a5a743894a0e4a801fc3', N'Kris@gmail.com
', 1, N'31-8-1985', 30, N'Jie', N'Tan', N'Single', N'Estonia', N'Umbsoo', N'4302927', N'No', N'Employee', N'http://hinhviet.com/images/2016/01/04/tumblr_inline_nsvn1xw1oc1tzitni_500.jpg', N'I''m so good at sleeping, I can do it with my eyes CLOSED :)

', 58, 25, 0)
INSERT [dbo].[tbl_Users] ([id], [name], [password], [email], [gender], [birthday], [age], [first_name], [last_name], [marital_status], [country], [city], [phone], [religion], [caste], [avatar], [description], [longtitude], [latitude], [status]) VALUES (18, N'Kim Soo Hyun', N'21232f297a57a5a743894a0e4a801fc3', N'KimSooHyun@gmail.com
', 1, N'31-7-1981', 34, N'Chibueze', N'Nwokike
', N'Single', N'UK', N'Freezeland', N'07727948569
', N'Islam', N'Employee', N'http://hinhviet.com/images/2016/01/04/kim-soo-hyun.jpg', N'For Sale: Parachute. Only used once, never opened.  
', 54, 0, 0)
INSERT [dbo].[tbl_Users] ([id], [name], [password], [email], [gender], [birthday], [age], [first_name], [last_name], [marital_status], [country], [city], [phone], [religion], [caste], [avatar], [description], [longtitude], [latitude], [status]) VALUES (19, N'Tao', N'21232f297a57a5a743894a0e4a801fc3', N'Tao@gmail.com', 1, N'26-7-1997', 19, N'Nhu', N'La', N'Single', N'Australia', N'Marion', N'0889425605', N'Buddhist', N'Employee', N'http://hinhviet.com/images/2016/01/04/art-130414-tao-exo-k-mxsaa.jpg', N'when i was BORN i was so surprised, I didn''t talk for a year & a half.
', 12, 130, 0)
INSERT [dbo].[tbl_Users] ([id], [name], [password], [email], [gender], [birthday], [age], [first_name], [last_name], [marital_status], [country], [city], [phone], [religion], [caste], [avatar], [description], [longtitude], [latitude], [status]) VALUES (20, N'Jaejoong', N'21232f297a57a5a743894a0e4a801fc3', N'Jaejoong@gmail.com', 1, N'26-12-1986', 30, N'Magnus', N'Loth', N'Single', N'Belgium', N'Bonlez', N'0484524631', N'No', N'Employee', N'http://hinhviet.com/images/2016/01/04/jyj-jae-joong-bnt-international-december-issue-2014.jpg', N'You compliment someone for their mustaches, & suddenly she isn''t your friend anymore. 
', 50, 4, 0)
INSERT [dbo].[tbl_Users] ([id], [name], [password], [email], [gender], [birthday], [age], [first_name], [last_name], [marital_status], [country], [city], [phone], [religion], [caste], [avatar], [description], [longtitude], [latitude], [status]) VALUES (21, N'Heechul', N'21232f297a57a5a743894a0e4a801fc3', N'Heechul@gmail.com
', 1, N'25-12-1989', 28, N'Madoc', N'Gawk', N'Single', N'Belgium', N'Wielsbeke', N'0490611633
', N'Christian', N'Employee', N'http://hinhviet.com/images/2016/01/04/140118bfriend1.jpg', N'Do not be afraid to step on people... Mario made a career from it.
', 50, 3, 0)
INSERT [dbo].[tbl_Users] ([id], [name], [password], [email], [gender], [birthday], [age], [first_name], [last_name], [marital_status], [country], [city], [phone], [religion], [caste], [avatar], [description], [longtitude], [latitude], [status]) VALUES (22, N'G dragon', N'21232f297a57a5a743894a0e4a801fc3', N'gdragon@gmail.com', 1, N'26-8-1992', 23, N'Oliver', N'Kristoffersen', N'Single', N'Brazil', N'Rua Chouro', N'8168239629', N'No', N'Employee', N'http://hinhviet.com/images/2016/01/04/G-Dragon-For-Bean-Pole-gdragon-29447404-630-921.jpg', N'Never laugh at your wife''s choices... you''re one of them ...
', 8, 35, 0)
INSERT [dbo].[tbl_Users] ([id], [name], [password], [email], [gender], [birthday], [age], [first_name], [last_name], [marital_status], [country], [city], [phone], [religion], [caste], [avatar], [description], [longtitude], [latitude], [status]) VALUES (23, N'Dương Dương', N'21232f297a57a5a743894a0e4a801fc3', N'duongduong@gmail.com
', 1, N'6-11-1990', 27, N'Erik', N'Hoch', N'Single', N'Germany', N'Lahstedt', N'05174562823', N'No', N'Employee', N'http://hinhviet.com/images/2016/01/04/734063.jpg', N' I just want to die young as late as possible.
', 52, 10, 0)
INSERT [dbo].[tbl_Users] ([id], [name], [password], [email], [gender], [birthday], [age], [first_name], [last_name], [marital_status], [country], [city], [phone], [religion], [caste], [avatar], [description], [longtitude], [latitude], [status]) VALUES (24, N'Changmin', N'21232f297a57a5a743894a0e4a801fc3', N'Changmin@gmail.com
', 1, N'27-7-1998', 18, N'Mario', N'Fassbinder', N'Single', N'Germany', N'Konstanzer ', N'06047566336', N'Buddhist', N'Employee', N'http://hinhviet.com/images/2016/01/04/changmin-tvxq.jpg', N'If you’re talking abt me behind mah back….. go ahead this is the best angle to kiss mah ass!
', 47, 10, 0)
INSERT [dbo].[tbl_Users] ([id], [name], [password], [email], [gender], [birthday], [age], [first_name], [last_name], [marital_status], [country], [city], [phone], [religion], [caste], [avatar], [description], [longtitude], [latitude], [status]) VALUES (25, N'Yonghwa', N'21232f297a57a5a743894a0e4a801fc3', N'Yonghwa@gmail.com
', 1, N'13-10-1983', 33, N'Frank ', N'Schwartz', N'Single', N'Denmark', N'Toftvej ', N'24536613', N'No', N'Employee', N'http://hinhviet.com/images/2016/01/04/Jung-Yong-Hwa-CN-Blue-kpop-leaders-35374629-382-500.jpg', N'My "last seen at" was just to check your "last seen at".
', 55, 12, 0)
INSERT [dbo].[tbl_Users] ([id], [name], [password], [email], [gender], [birthday], [age], [first_name], [last_name], [marital_status], [country], [city], [phone], [religion], [caste], [avatar], [description], [longtitude], [latitude], [status]) VALUES (26, N'Nickhun', N'21232f297a57a5a743894a0e4a801fc3', N'Nickhun@gmail.com', 1, N'25-10-1997', 19, N'Gordey ', N'Yermakov', N'Single', N'Spain', N'Venta', N'624811266
', N'No', N'Employee', N'http://hinhviet.com/images/2016/01/04/2pm-nichkhun.jpg', N'If i had the world in mah hands, i''d give it all to you :) 
', 41, 4, 0)
INSERT [dbo].[tbl_Users] ([id], [name], [password], [email], [gender], [birthday], [age], [first_name], [last_name], [marital_status], [country], [city], [phone], [religion], [caste], [avatar], [description], [longtitude], [latitude], [status]) VALUES (27, N'Taecyeon', N'21232f297a57a5a743894a0e4a801fc3', N'Taecyeon
@gmail.com', 1, N'26-9-1983', 33, N'Cornelius ', N'Maslov', N'Single', N'Spain', N'Carboneras', N'692435272
', N'No', N'Employee', N'http://hinhviet.com/images/2016/01/04/76a683f94967848ec69cf4c77891dc5e.jpg', N'If a hug tell how much i love you, i would hold you in my arms forever. 
', 36, 1, 0)
INSERT [dbo].[tbl_Users] ([id], [name], [password], [email], [gender], [birthday], [age], [first_name], [last_name], [marital_status], [country], [city], [phone], [religion], [caste], [avatar], [description], [longtitude], [latitude], [status]) VALUES (28, N'Bi Rain', N'21232f297a57a5a743894a0e4a801fc3', N'Rain@gmail.com
', 1, N'11-10-1979', 36, N'Andrew ', N'Barrett', N'Single', N'France', N'FRESNES', N'0105452024', N'No', N'Employee', N'http://hinhviet.com/images/2016/01/04/bi6.jpg', N'Every LOVE story is beautiful, but ours if my Favorite. <3 
', 48, 2, 0)
INSERT [dbo].[tbl_Users] ([id], [name], [password], [email], [gender], [birthday], [age], [first_name], [last_name], [marital_status], [country], [city], [phone], [religion], [caste], [avatar], [description], [longtitude], [latitude], [status]) VALUES (29, N'Lee Jong Suk', N'21232f297a57a5a743894a0e4a801fc3', N'LeeJongSuk@gmail.com', 1, N'14-6-1979', 36, N'Tom', N'Owen
', N'Single', N'Austria', N'SEE', N'06889417750
', N'Islam', N'Employee', N'http://hinhviet.com/images/2016/01/04/lee-jong-suk_1407110377_af_org.jpg', N'Every moment i spent with you is like a dream come true <3 
', 47, 10, 0)
INSERT [dbo].[tbl_Users] ([id], [name], [password], [email], [gender], [birthday], [age], [first_name], [last_name], [marital_status], [country], [city], [phone], [religion], [caste], [avatar], [description], [longtitude], [latitude], [status]) VALUES (30, N'Julien Kang', N'21232f297a57a5a743894a0e4a801fc3', N'JulienKang@gmail.com
', 1, N'23-9-1988', 28, N'Tom', N'Sheppard', N'Single', N'Findland', N'Karijoki', N'0428702776
', N'Christian', N'Employee', N'http://hinhviet.com/images/2016/01/04/julien-kang.jpg', N' As long as i wake up in the morning and she is next to me, that''s all that matters.
', 62, 21, 0)
INSERT [dbo].[tbl_Users] ([id], [name], [password], [email], [gender], [birthday], [age], [first_name], [last_name], [marital_status], [country], [city], [phone], [religion], [caste], [avatar], [description], [longtitude], [latitude], [status]) VALUES (31, N'ADMIN', N'21232f297a57a5a743894a0e4a801fc3', N'admin@gmail.com', 1, N'25/11/1986', 29, N'admin', N'boss', N'Single', N'VN', N'HN', N'0987654321', N'NOT', N'MISS', N'http://wsuploadimage.ga/uploads/onion.jpg', N'i''m a Boss :))', 0, 0, 6)
SET IDENTITY_INSERT [dbo].[tbl_Users] OFF
SET IDENTITY_INSERT [dbo].[tbl_UserSubscription] ON 

INSERT [dbo].[tbl_UserSubscription] ([id], [user_id], [sub_id], [chargedDate]) VALUES (1, 31, 3, N'22/12/2015')
INSERT [dbo].[tbl_UserSubscription] ([id], [user_id], [sub_id], [chargedDate]) VALUES (2, 1, 1, N'07-01-2016')
INSERT [dbo].[tbl_UserSubscription] ([id], [user_id], [sub_id], [chargedDate]) VALUES (3, 2, 2, N'07-01-2016')
INSERT [dbo].[tbl_UserSubscription] ([id], [user_id], [sub_id], [chargedDate]) VALUES (4, 3, 2, N'07-01-2016')
SET IDENTITY_INSERT [dbo].[tbl_UserSubscription] OFF
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
update tbl_Users set password ='21232f297a57a5a743894a0e4a801fc3' where id >0