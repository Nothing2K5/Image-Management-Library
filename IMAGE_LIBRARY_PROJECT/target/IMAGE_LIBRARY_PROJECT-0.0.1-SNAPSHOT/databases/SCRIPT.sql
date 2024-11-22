USE [master]
GO
/****** Object:  Database [PHOTO_LIBRARY]    Script Date: 9/17/2024 9:31:34 PM ******/
CREATE DATABASE [PHOTO_LIBRARY]
GO

USE [PHOTO_LIBRARY]
GO
/****** Object:  Table [dbo].[account]    Script Date: 9/17/2024 9:31:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[account](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fullname] [varchar](255) NULL,
	[username] [varchar](255) NULL,
	[password] [varchar](255) NULL,
	[role_id] [int] NULL,
	[createddate] [datetime] NULL,
	[modifieddate] [datetime] NULL,
	[createdby] [varchar](255) NULL,
	[modifiedby] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[album]    Script Date: 9/17/2024 9:31:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[album](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NULL,
	[description] [text] NULL,
	[cover_image_id] [int] NULL,
	[privacy_status] [varchar](20) NULL,
	[createddate] [datetime] NULL,
	[modifieddate] [datetime] NULL,
	[account_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[album_image]    Script Date: 9/17/2024 9:31:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[album_image](
	[album_id] [int] NOT NULL,
	[image_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[album_id] ASC,
	[image_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[category]    Script Date: 9/17/2024 9:31:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NOT NULL,
	[createddate] [datetime] NULL,
	[modifieddate] [datetime] NULL,
	[createdby] [varchar](255) NULL,
	[modifiedby] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[image]    Script Date: 9/17/2024 9:31:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[image](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](max) NULL,
	[image] [varchar](max) NULL,
	[description] [varchar](max) NULL,
	[cate_id] [int] NULL,
	[account_id] [int] NULL,
	[createddate] [datetime] NULL,
	[modifieddate] [datetime] NULL,
	[createdby] [varchar](255) NULL,
	[modifiedby] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[permission]    Script Date: 9/17/2024 9:31:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[permission](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[role_id] [int] NULL,
	[entity] [varchar](255) NULL,
	[action] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[role]    Script Date: 9/17/2024 9:31:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[role](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NOT NULL,
	[code] [varchar](255) NOT NULL,
	[createddate] [datetime] NULL,
	[modifieddate] [datetime] NULL,
	[createdby] [varchar](255) NULL,
	[modifiedby] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[account] ON 
GO
INSERT [dbo].[account] ([id], [fullname], [username], [password], [role_id], [createddate], [modifieddate], [createdby], [modifiedby]) VALUES (1, N'Dragon', N'Dragon', N'2005', 1, CAST(N'2024-07-03T15:00:38.573' AS DateTime), CAST(N'2024-07-03T15:00:38.573' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[account] ([id], [fullname], [username], [password], [role_id], [createddate], [modifieddate], [createdby], [modifiedby]) VALUES (2, N'', N'Anjolie', N'SNZ6HE', 1, CAST(N'2024-07-03T15:00:38.580' AS DateTime), CAST(N'2024-07-03T15:00:38.580' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[account] ([id], [fullname], [username], [password], [role_id], [createddate], [modifieddate], [createdby], [modifiedby]) VALUES (3, N'', N'Ferris', N'RXH3XJ', 2, CAST(N'2024-07-03T15:00:38.580' AS DateTime), CAST(N'2024-07-03T15:00:38.580' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[account] ([id], [fullname], [username], [password], [role_id], [createddate], [modifieddate], [createdby], [modifiedby]) VALUES (4, N'', N'Katell', N'HWV8ZN', 1, CAST(N'2024-07-03T15:00:38.583' AS DateTime), CAST(N'2024-07-03T15:00:38.583' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[account] ([id], [fullname], [username], [password], [role_id], [createddate], [modifieddate], [createdby], [modifiedby]) VALUES (5, N'', N'Zahir', N'NPX7OF', 2, CAST(N'2024-07-03T15:00:38.587' AS DateTime), CAST(N'2024-07-03T15:00:38.587' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[account] ([id], [fullname], [username], [password], [role_id], [createddate], [modifieddate], [createdby], [modifiedby]) VALUES (6, N'', N'Conan', N'WIZ5VZ', 2, CAST(N'2024-07-03T15:00:38.590' AS DateTime), CAST(N'2024-07-03T15:00:38.590' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[account] ([id], [fullname], [username], [password], [role_id], [createddate], [modifieddate], [createdby], [modifiedby]) VALUES (7, N'', N'Cade', N'ZSW2LU', 1, CAST(N'2024-07-03T15:00:38.590' AS DateTime), CAST(N'2024-07-03T15:00:38.590' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[account] ([id], [fullname], [username], [password], [role_id], [createddate], [modifieddate], [createdby], [modifiedby]) VALUES (8, N'', N'Micah', N'RVV5SR', 1, CAST(N'2024-07-03T15:00:38.593' AS DateTime), CAST(N'2024-07-03T15:00:38.593' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[account] ([id], [fullname], [username], [password], [role_id], [createddate], [modifieddate], [createdby], [modifiedby]) VALUES (9, N'', N'Rowan', N'VAI6XR', 1, CAST(N'2024-07-03T15:00:38.597' AS DateTime), CAST(N'2024-07-03T15:00:38.597' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[account] ([id], [fullname], [username], [password], [role_id], [createddate], [modifieddate], [createdby], [modifiedby]) VALUES (10, N'', N'Kirby', N'DNX6JK', 1, CAST(N'2024-07-03T15:00:38.603' AS DateTime), CAST(N'2024-07-03T15:00:38.603' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[account] ([id], [fullname], [username], [password], [role_id], [createddate], [modifieddate], [createdby], [modifiedby]) VALUES (11, N'', N'Tanisha', N'XWU7JP', 2, CAST(N'2024-07-03T15:00:38.630' AS DateTime), CAST(N'2024-07-03T15:00:38.630' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[account] ([id], [fullname], [username], [password], [role_id], [createddate], [modifieddate], [createdby], [modifiedby]) VALUES (12, N'', N'Howard', N'TSR5MR', 2, CAST(N'2024-07-03T15:00:38.633' AS DateTime), CAST(N'2024-07-03T15:00:38.633' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[account] ([id], [fullname], [username], [password], [role_id], [createddate], [modifieddate], [createdby], [modifiedby]) VALUES (13, N'', N'Tana', N'EHS8CM', 1, CAST(N'2024-07-03T15:00:38.633' AS DateTime), CAST(N'2024-07-03T15:00:38.633' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[account] ([id], [fullname], [username], [password], [role_id], [createddate], [modifieddate], [createdby], [modifiedby]) VALUES (14, N'', N'Hadassah', N'YOY7ZW', 2, CAST(N'2024-07-03T15:00:38.637' AS DateTime), CAST(N'2024-07-03T15:00:38.637' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[account] ([id], [fullname], [username], [password], [role_id], [createddate], [modifieddate], [createdby], [modifiedby]) VALUES (15, N'', N'Echo', N'IGE8TN', 1, CAST(N'2024-07-03T15:00:38.640' AS DateTime), CAST(N'2024-07-03T15:00:38.640' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[account] ([id], [fullname], [username], [password], [role_id], [createddate], [modifieddate], [createdby], [modifiedby]) VALUES (16, N'', N'Slade', N'OFO6QS', 2, CAST(N'2024-07-03T15:00:38.640' AS DateTime), CAST(N'2024-07-03T15:00:38.640' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[account] ([id], [fullname], [username], [password], [role_id], [createddate], [modifieddate], [createdby], [modifiedby]) VALUES (17, N'', N'Devin', N'IBM6RZ', 2, CAST(N'2024-07-03T15:00:38.643' AS DateTime), CAST(N'2024-07-03T15:00:38.643' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[account] ([id], [fullname], [username], [password], [role_id], [createddate], [modifieddate], [createdby], [modifiedby]) VALUES (18, N'', N'Rowan', N'ZYS9VI', 2, CAST(N'2024-07-03T15:00:38.647' AS DateTime), CAST(N'2024-07-03T15:00:38.647' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[account] ([id], [fullname], [username], [password], [role_id], [createddate], [modifieddate], [createdby], [modifiedby]) VALUES (19, N'', N'Rafael', N'WZA0IH', 1, CAST(N'2024-07-03T15:00:38.647' AS DateTime), CAST(N'2024-07-03T15:00:38.647' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[account] ([id], [fullname], [username], [password], [role_id], [createddate], [modifieddate], [createdby], [modifiedby]) VALUES (20, N'', N'Madaline', N'QMW4EN', 1, CAST(N'2024-07-03T15:00:38.650' AS DateTime), CAST(N'2024-07-03T15:00:38.650' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[account] ([id], [fullname], [username], [password], [role_id], [createddate], [modifieddate], [createdby], [modifiedby]) VALUES (21, N'', N'Vera', N'CZB2VM', 2, CAST(N'2024-07-03T15:00:38.650' AS DateTime), CAST(N'2024-07-03T15:00:38.650' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[account] ([id], [fullname], [username], [password], [role_id], [createddate], [modifieddate], [createdby], [modifiedby]) VALUES (22, N'', N'Declan', N'ZKE7QZ', 1, CAST(N'2024-07-03T15:00:38.653' AS DateTime), CAST(N'2024-07-03T15:00:38.653' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[account] ([id], [fullname], [username], [password], [role_id], [createddate], [modifieddate], [createdby], [modifiedby]) VALUES (23, N'', N'Katell', N'SFS0IW', 1, CAST(N'2024-07-03T15:00:38.657' AS DateTime), CAST(N'2024-07-03T15:00:38.657' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[account] ([id], [fullname], [username], [password], [role_id], [createddate], [modifieddate], [createdby], [modifiedby]) VALUES (24, N'', N'Summer', N'PSQ7LC', 2, CAST(N'2024-07-03T15:00:38.660' AS DateTime), CAST(N'2024-07-03T15:00:38.660' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[account] ([id], [fullname], [username], [password], [role_id], [createddate], [modifieddate], [createdby], [modifiedby]) VALUES (25, N'', N'Robin', N'KIS9AF', 2, CAST(N'2024-07-03T15:00:38.660' AS DateTime), CAST(N'2024-07-03T15:00:38.660' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[account] ([id], [fullname], [username], [password], [role_id], [createddate], [modifieddate], [createdby], [modifiedby]) VALUES (26, N'', N'Dominique', N'IKV0IX', 2, CAST(N'2024-07-03T15:00:38.663' AS DateTime), CAST(N'2024-07-03T15:00:38.663' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[account] ([id], [fullname], [username], [password], [role_id], [createddate], [modifieddate], [createdby], [modifiedby]) VALUES (27, N'', N'admin', N'123', 1, CAST(N'2024-07-03T15:00:38.667' AS DateTime), CAST(N'2024-07-03T15:00:38.667' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[account] ([id], [fullname], [username], [password], [role_id], [createddate], [modifieddate], [createdby], [modifiedby]) VALUES (28, N'', N'mra', N'mra', 1, CAST(N'2024-07-03T15:00:38.670' AS DateTime), CAST(N'2024-07-03T15:00:38.670' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[account] ([id], [fullname], [username], [password], [role_id], [createddate], [modifieddate], [createdby], [modifiedby]) VALUES (29, N'', N'Pokemon', N'12345', 2, CAST(N'2024-07-03T15:00:38.670' AS DateTime), CAST(N'2024-07-03T15:00:38.670' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[account] ([id], [fullname], [username], [password], [role_id], [createddate], [modifieddate], [createdby], [modifiedby]) VALUES (30, N'', N'Camden', N'123', 1, CAST(N'2024-07-03T15:00:38.673' AS DateTime), CAST(N'2024-07-03T15:00:38.673' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[account] ([id], [fullname], [username], [password], [role_id], [createddate], [modifieddate], [createdby], [modifiedby]) VALUES (31, N'Hydra', N'Hydra', N'12345', 2, CAST(N'2024-07-08T17:51:06.487' AS DateTime), CAST(N'2024-07-08T17:51:06.487' AS DateTime), N'Dragon', N'Dragon')
GO
SET IDENTITY_INSERT [dbo].[account] OFF
GO
SET IDENTITY_INSERT [dbo].[category] ON 
GO
INSERT [dbo].[category] ([id], [name], [createddate], [modifieddate], [createdby], [modifiedby]) VALUES (1, N'DRAGON', CAST(N'2024-07-03T15:00:38.680' AS DateTime), CAST(N'2024-07-03T15:00:38.680' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[category] ([id], [name], [createddate], [modifieddate], [createdby], [modifiedby]) VALUES (2, N'DRAKE', CAST(N'2024-07-03T15:00:38.683' AS DateTime), CAST(N'2024-07-03T15:00:38.683' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[category] ([id], [name], [createddate], [modifieddate], [createdby], [modifiedby]) VALUES (3, N'LUNG DRAGON', CAST(N'2024-07-03T15:00:38.683' AS DateTime), CAST(N'2024-07-03T15:00:38.683' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[category] ([id], [name], [createddate], [modifieddate], [createdby], [modifiedby]) VALUES (4, N'LINDWURM', CAST(N'2024-07-03T15:00:38.687' AS DateTime), CAST(N'2024-07-03T15:00:38.687' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[category] ([id], [name], [createddate], [modifieddate], [createdby], [modifiedby]) VALUES (5, N'WYRM', CAST(N'2024-07-03T15:00:38.687' AS DateTime), CAST(N'2024-07-03T15:00:38.687' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[category] ([id], [name], [createddate], [modifieddate], [createdby], [modifiedby]) VALUES (6, N'AMPHITHERE', CAST(N'2024-07-03T15:00:38.690' AS DateTime), CAST(N'2024-07-03T15:00:38.690' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[category] ([id], [name], [createddate], [modifieddate], [createdby], [modifiedby]) VALUES (7, N'WYVERN', CAST(N'2024-07-03T15:00:38.690' AS DateTime), CAST(N'2024-07-03T15:00:38.690' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[category] OFF
GO
SET IDENTITY_INSERT [dbo].[image] ON 
GO
INSERT [dbo].[image] ([id], [name], [image], [description], [cate_id], [account_id], [createddate], [modifieddate], [createdby], [modifiedby]) VALUES (1, N'Wings Dragon', N'https://i.pinimg.com/736x/7d/97/69/7d9769c39c4fc1424fc17ff8c6c3a518.jpg', N'', 1, 1, CAST(N'2024-07-03T15:00:38.697' AS DateTime), CAST(N'2024-07-07T10:35:54.073' AS DateTime), N'', NULL)
GO
INSERT [dbo].[image] ([id], [name], [image], [description], [cate_id], [account_id], [createddate], [modifieddate], [createdby], [modifiedby]) VALUES (2, N'Bahamut', N'https://cdnb.artstation.com/p/assets/images/images/019/927/723/large/rabbit-tooth-img-0477.jpg', N'', 1, 1, CAST(N'2024-07-03T15:00:38.700' AS DateTime), CAST(N'2024-07-22T06:51:40.090' AS DateTime), N'', N'Dragon')
GO
INSERT [dbo].[image] ([id], [name], [image], [description], [cate_id], [account_id], [createddate], [modifieddate], [createdby], [modifiedby]) VALUES (3, N'Maelstrom Dragon', N'https://i.pinimg.com/736x/45/72/62/45726280023ba9cfe9e5594e01d6b4bf.jpg', N'', 1, 1, CAST(N'2024-07-03T15:00:38.700' AS DateTime), CAST(N'2024-07-07T10:35:55.290' AS DateTime), N'', NULL)
GO
INSERT [dbo].[image] ([id], [name], [image], [description], [cate_id], [account_id], [createddate], [modifieddate], [createdby], [modifiedby]) VALUES (4, N'Holy Lung Dragon', N'https://i.pinimg.com/736x/7a/7e/a0/7a7ea0fffe8899da44e6c822129a55a5.jpg', N'', 3, 3, CAST(N'2024-07-03T15:00:38.703' AS DateTime), CAST(N'2024-07-07T10:35:55.707' AS DateTime), N'', NULL)
GO
INSERT [dbo].[image] ([id], [name], [image], [description], [cate_id], [account_id], [createddate], [modifieddate], [createdby], [modifiedby]) VALUES (5, N'Elder Dragon', N'https://i.pinimg.com/originals/ae/e3/e7/aee3e7599f91f159e5915268a642251c.jpg', N'', 1, 4, CAST(N'2024-07-03T15:00:38.707' AS DateTime), CAST(N'2024-07-07T10:35:56.137' AS DateTime), N'', NULL)
GO
INSERT [dbo].[image] ([id], [name], [image], [description], [cate_id], [account_id], [createddate], [modifieddate], [createdby], [modifiedby]) VALUES (6, N'Giant Drake', N'https://i.pinimg.com/736x/ce/fb/46/cefb46e425b31dcf1dfbbc248e256387.jpg', N'', 2, 1, CAST(N'2024-07-03T15:00:38.710' AS DateTime), CAST(N'2024-07-07T10:35:56.510' AS DateTime), N'', NULL)
GO
INSERT [dbo].[image] ([id], [name], [image], [description], [cate_id], [account_id], [createddate], [modifieddate], [createdby], [modifiedby]) VALUES (7, N'Snow Wyvern', N'https://wallpaperbat.com/img/9703755-hd-phone-wallpaper.jpg', N'', 7, 1, CAST(N'2024-07-03T15:00:38.710' AS DateTime), CAST(N'2024-07-07T10:35:56.867' AS DateTime), N'', NULL)
GO
INSERT [dbo].[image] ([id], [name], [image], [description], [cate_id], [account_id], [createddate], [modifieddate], [createdby], [modifiedby]) VALUES (8, N'Elder Lung Dragon', N'https://i.redd.it/z1ts9dzmcysb1.jpg', N'', 3, 2, CAST(N'2024-07-03T15:00:38.713' AS DateTime), CAST(N'2024-07-07T10:35:57.320' AS DateTime), N'', NULL)
GO
INSERT [dbo].[image] ([id], [name], [image], [description], [cate_id], [account_id], [createddate], [modifieddate], [createdby], [modifiedby]) VALUES (9, N'Light Dragon', N'https://i.pinimg.com/736x/23/f1/34/23f13495cc68bd7bf352d31ec82640bd.jpg', N'', 1, 4, CAST(N'2024-07-03T15:00:38.713' AS DateTime), CAST(N'2024-07-07T10:35:57.813' AS DateTime), N'', NULL)
GO
INSERT [dbo].[image] ([id], [name], [image], [description], [cate_id], [account_id], [createddate], [modifieddate], [createdby], [modifiedby]) VALUES (10, N'Bahamut', N'https://cdna.artstation.com/p/assets/images/images/019/890/282/large/rabbit-tooth-loc.jpg?1565447896', N'', 1, 1, CAST(N'2024-07-03T15:00:38.717' AS DateTime), CAST(N'2024-07-07T10:35:58.393' AS DateTime), N'', NULL)
GO
INSERT [dbo].[image] ([id], [name], [image], [description], [cate_id], [account_id], [createddate], [modifieddate], [createdby], [modifiedby]) VALUES (11, N'Winded Amphithere', N'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/b26c7e84-e00b-4b4e-b0e4-265a2a0d34bf/dgqmg3x-8e233217-b4da-48dd-b95c-3a472d5251f6.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2IyNmM3ZTg0LWUwMGItNGI0ZS1iMGU0LTI2NWEyYTBkMzRiZlwvZGdxbWczeC04ZTIzMzIxNy1iNGRhLTQ4ZGQtYjk1Yy0zYTQ3MmQ1MjUxZjYuanBnIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.Wc3rlPJ9XnohvPqa1HIlvZurMUbAbkKGyCT51GzHeT8', N'', 6, 5, CAST(N'2024-07-03T15:00:38.720' AS DateTime), CAST(N'2024-07-05T11:23:10.270' AS DateTime), N'', N'Dragon')
GO
INSERT [dbo].[image] ([id], [name], [image], [description], [cate_id], [account_id], [createddate], [modifieddate], [createdby], [modifiedby]) VALUES (12, N'Forest Lindwurm', N'https://i.pinimg.com/originals/b9/b9/0d/b9b90d6732a160290cd1a2c40194485d.jpg', N'', 4, 3, CAST(N'2024-07-03T15:00:38.720' AS DateTime), CAST(N'2024-07-07T10:35:58.787' AS DateTime), N'', NULL)
GO
INSERT [dbo].[image] ([id], [name], [image], [description], [cate_id], [account_id], [createddate], [modifieddate], [createdby], [modifiedby]) VALUES (13, N'White Dragon', N'https://masterpiecer-images.s3.yandex.net/f6f5adf37dad11eeb3b2e6d39d9a42a4:upscaled', N'', 1, 2, CAST(N'2024-07-03T15:00:38.723' AS DateTime), CAST(N'2024-07-07T10:35:59.170' AS DateTime), N'', NULL)
GO
INSERT [dbo].[image] ([id], [name], [image], [description], [cate_id], [account_id], [createddate], [modifieddate], [createdby], [modifiedby]) VALUES (14, N'White Wyrm', N'https://image.tensorartassets.com/model_showcase/686827251574079560/7e89a347-d78a-40fd-5293-4bb7b41add57.png', N'', 5, 1, CAST(N'2024-07-03T15:00:38.727' AS DateTime), CAST(N'2024-07-07T10:36:00.257' AS DateTime), N'', NULL)
GO
INSERT [dbo].[image] ([id], [name], [image], [description], [cate_id], [account_id], [createddate], [modifieddate], [createdby], [modifiedby]) VALUES (15, N'Universe Dragon', N'https://wallpapers-hub.art/wallpaper-images/421017.jpg', N'', 1, 6, CAST(N'2024-07-03T15:00:38.730' AS DateTime), CAST(N'2024-07-07T10:36:00.773' AS DateTime), N'', NULL)
GO
INSERT [dbo].[image] ([id], [name], [image], [description], [cate_id], [account_id], [createddate], [modifieddate], [createdby], [modifiedby]) VALUES (16, N'Max Holy Lung Dragon', N'https://i.pinimg.com/736x/c9/5a/4a/c95a4a70c4672d1444337e86ba9ae327.jpg', N'', 3, 1, CAST(N'2024-07-03T15:00:38.730' AS DateTime), CAST(N'2024-07-07T10:36:01.107' AS DateTime), N'', NULL)
GO
INSERT [dbo].[image] ([id], [name], [image], [description], [cate_id], [account_id], [createddate], [modifieddate], [createdby], [modifiedby]) VALUES (17, N'Temple Wyvern', N'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/500054a6-6638-49d5-bfff-73a4c6ca3b59/dejk438-2162340d-3ffc-47db-874f-4006dacbe806.jpg/v1/fill/w_800,h_1048,q_75,strp/golden_dragon_by_aetiiart_dejk438-fullview.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MTA0OCIsInBhdGgiOiJcL2ZcLzUwMDA1NGE2LTY2MzgtNDlkNS1iZmZmLTczYTRjNmNhM2I1OVwvZGVqazQzOC0yMTYyMzQwZC0zZmZjLTQ3ZGItODc0Zi00MDA2ZGFjYmU4MDYuanBnIiwid2lkdGgiOiI8PTgwMCJ9XV0sImF1ZCI6WyJ1cm46c2VydmljZTppbWFnZS5vcGVyYXRpb25zIl19.a_L0XH9II8fW89F9FCccNy9q5UFVzUB6am1Rg7OkEgE', N'', 7, 1, CAST(N'2024-07-03T15:00:38.733' AS DateTime), CAST(N'2024-07-07T10:36:01.373' AS DateTime), N'', NULL)
GO
INSERT [dbo].[image] ([id], [name], [image], [description], [cate_id], [account_id], [createddate], [modifieddate], [createdby], [modifiedby]) VALUES (18, N'Tiamat', N'https://cdna.artstation.com/p/assets/images/images/029/243/674/large/tatii-lange-joshua-tiamat-cm-small.jpg?1596908865', N'', 5, 7, CAST(N'2024-07-03T15:00:38.733' AS DateTime), CAST(N'2024-07-07T10:36:01.620' AS DateTime), N'', NULL)
GO
INSERT [dbo].[image] ([id], [name], [image], [description], [cate_id], [account_id], [createddate], [modifieddate], [createdby], [modifiedby]) VALUES (19, N'Maelstrom Dragon', N'https://sv.bagoum.com/getRawImage/0/0/101411020/s', N'', 1, 1, CAST(N'2024-07-03T15:00:38.737' AS DateTime), CAST(N'2024-07-07T10:36:01.887' AS DateTime), N'', NULL)
GO
INSERT [dbo].[image] ([id], [name], [image], [description], [cate_id], [account_id], [createddate], [modifieddate], [createdby], [modifiedby]) VALUES (20, N'Fog Lung Dragon', N'https://image.cdn2.seaart.ai/2023-06-28/39186390851653/9f43359933cbaaaee4477e37761cc59b048f54b4_high.webp', N'', 3, 1, CAST(N'2024-07-08T11:19:49.757' AS DateTime), CAST(N'2024-07-08T11:19:49.757' AS DateTime), N'Dragon', NULL)
GO
INSERT [dbo].[image] ([id], [name], [image], [description], [cate_id], [account_id], [createddate], [modifieddate], [createdby], [modifiedby]) VALUES (21, N'Cloud Dragon', N'https://blogger.googleusercontent.com/img/a/AVvXsEhQwJxlXdEHQATLhvxYSsLpBI1SJlWFk2NNW6j_jIKFVHbyMbstvmWcAmzeAz-TeDySDFTEBmWmC0MvKkL4G3P8gP6Ze45UJOOdYFo-8JfghxF6R3RKq66mQv8T84bx1FDwusSFfLhORurFwxU_Rnw7XaLsG0rVwvpx8k7GcPuvuL9tTGjXudM-cE7Ajys=s16000', N'', 3, 1, CAST(N'2024-07-03T15:00:38.740' AS DateTime), CAST(N'2024-07-07T10:36:02.447' AS DateTime), N'', NULL)
GO
INSERT [dbo].[image] ([id], [name], [image], [description], [cate_id], [account_id], [createddate], [modifieddate], [createdby], [modifiedby]) VALUES (22, N'Flame Wyrm', N'https://s.widget-club.com/images/YyiR86zpwIMIfrCZoSs4ulVD9RF3/54aef46f4850d7ee63b06b8a45949163/0849ae51b597d52e7204e4ccd6866720.jpg?q=70&w=500', N'', 5, 1, CAST(N'2024-07-03T15:00:38.743' AS DateTime), CAST(N'2024-07-07T10:36:02.773' AS DateTime), N'', NULL)
GO
INSERT [dbo].[image] ([id], [name], [image], [description], [cate_id], [account_id], [createddate], [modifieddate], [createdby], [modifiedby]) VALUES (23, N'Elder Dragon', N'https://i.pinimg.com/736x/b2/e4/32/b2e4320eca6782c3e3873a507cd0ead2.jpg', N'', 1, 1, CAST(N'2024-07-03T15:00:38.747' AS DateTime), CAST(N'2024-07-07T10:36:03.247' AS DateTime), N'', NULL)
GO
INSERT [dbo].[image] ([id], [name], [image], [description], [cate_id], [account_id], [createddate], [modifieddate], [createdby], [modifiedby]) VALUES (24, N'Feather Dragon', N'https://wallpapercave.com/wp/wp12651508.jpg', N'', 6, 1, CAST(N'2024-07-03T15:00:38.750' AS DateTime), CAST(N'2024-07-07T10:36:05.630' AS DateTime), N'', NULL)
GO
INSERT [dbo].[image] ([id], [name], [image], [description], [cate_id], [account_id], [createddate], [modifieddate], [createdby], [modifiedby]) VALUES (25, N'Golden Dragon', N'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/ee219434-7993-43a9-98d6-238ee165ae53/dgnlmut-10992c61-e2f2-46c4-b7eb-d8c4afa76fb6.jpg/v1/fill/w_1280,h_2284,q_75,strp/golden_dragon_mobile_wallpaper_by_byanel_dgnlmut-fullview.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MjI4NCIsInBhdGgiOiJcL2ZcL2VlMjE5NDM0LTc5OTMtNDNhOS05OGQ2LTIzOGVlMTY1YWU1M1wvZGdubG11dC0xMDk5MmM2MS1lMmYyLTQ2YzQtYjdlYi1kOGM0YWZhNzZmYjYuanBnIiwid2lkdGgiOiI8PTEyODAifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6aW1hZ2Uub3BlcmF0aW9ucyJdfQ.RAGvYzM6eDP81h8Ms9IBHFqdsh7aFhQZIFTXApmjtd0', N'', 1, 1, CAST(N'2024-07-03T15:00:38.750' AS DateTime), CAST(N'2024-07-07T10:36:06.023' AS DateTime), N'', NULL)
GO
INSERT [dbo].[image] ([id], [name], [image], [description], [cate_id], [account_id], [createddate], [modifieddate], [createdby], [modifiedby]) VALUES (26, N'Lava Drake', N'https://c4.wallpaperflare.com/wallpaper/977/65/291/fire-green-hair-horns-wallpaper-preview.jpg', N'', 2, 1, CAST(N'2024-07-03T15:00:38.753' AS DateTime), CAST(N'2024-07-07T10:36:06.297' AS DateTime), N'', NULL)
GO
INSERT [dbo].[image] ([id], [name], [image], [description], [cate_id], [account_id], [createddate], [modifieddate], [createdby], [modifiedby]) VALUES (27, N'HellBreath Dragon', N'https://i.pinimg.com/736x/42/9a/5a/429a5a5bfe7354587610ab2d8bd8be77.jpg', N'', 1, 1, CAST(N'2024-07-03T15:00:38.757' AS DateTime), CAST(N'2024-07-07T17:19:48.070' AS DateTime), N'', N'Dragon')
GO
INSERT [dbo].[image] ([id], [name], [image], [description], [cate_id], [account_id], [createddate], [modifieddate], [createdby], [modifiedby]) VALUES (28, N'Unknown Dragon', N'https://cdnb.artstation.com/p/assets/images/images/019/890/559/large/rabbit-tooth-loc.jpg?1565448201', N'', 1, 1, CAST(N'2024-07-03T15:00:38.757' AS DateTime), CAST(N'2024-07-07T10:36:06.850' AS DateTime), N'', NULL)
GO
INSERT [dbo].[image] ([id], [name], [image], [description], [cate_id], [account_id], [createddate], [modifieddate], [createdby], [modifiedby]) VALUES (29, N'Lightning Wyvern', N'https://cdnb.artstation.com/p/assets/images/images/027/126/435/large/saif-rygo-comic-7.jpg?1590669624', N'', 7, 1, CAST(N'2024-07-03T15:00:38.760' AS DateTime), CAST(N'2024-07-07T10:36:07.163' AS DateTime), N'', NULL)
GO
INSERT [dbo].[image] ([id], [name], [image], [description], [cate_id], [account_id], [createddate], [modifieddate], [createdby], [modifiedby]) VALUES (30, N'Fairy Dragon', N'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/efdf6d64-1e6c-4d01-8cf4-b8113c474a53/dfitxo3-957ccf0e-2ee5-4324-8870-de3841adf265.png/v1/fill/w_1280,h_854,q_80,strp/dragon_of_magic_and_flame_by_titaniumdragon_dfitxo3-fullview.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9ODU0IiwicGF0aCI6IlwvZlwvZWZkZjZkNjQtMWU2Yy00ZDAxLThjZjQtYjgxMTNjNDc0YTUzXC9kZml0eG8zLTk1N2NjZjBlLTJlZTUtNDMyNC04ODcwLWRlMzg0MWFkZjI2NS5wbmciLCJ3aWR0aCI6Ijw9MTI4MCJ9XV0sImF1ZCI6WyJ1cm46c2VydmljZTppbWFnZS5vcGVyYXRpb25zIl19.22MtrcgZd8qN5FmNBi5MZahaov_y2KB9PdeoFfQTH5M', N'', 1, 1, CAST(N'2024-07-03T15:00:38.763' AS DateTime), CAST(N'2024-07-07T10:36:07.490' AS DateTime), N'', NULL)
GO
INSERT [dbo].[image] ([id], [name], [image], [description], [cate_id], [account_id], [createddate], [modifieddate], [createdby], [modifiedby]) VALUES (31, N'White Dragon', N'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/c4e369e2-366b-465b-b85f-c7665527d7db/dg18rfc-e53002ca-5bb8-4873-a8fc-d80c9bba6af4.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2M0ZTM2OWUyLTM2NmItNDY1Yi1iODVmLWM3NjY1NTI3ZDdkYlwvZGcxOHJmYy1lNTMwMDJjYS01YmI4LTQ4NzMtYThmYy1kODBjOWJiYTZhZjQuanBnIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.JbmeCl0v_JBzVnn-t1o19Z17qC2V7TwtRC2ngKDs68A', N'', 1, 1, CAST(N'2024-07-03T15:00:38.767' AS DateTime), CAST(N'2024-07-07T10:36:07.787' AS DateTime), N'', NULL)
GO
INSERT [dbo].[image] ([id], [name], [image], [description], [cate_id], [account_id], [createddate], [modifieddate], [createdby], [modifiedby]) VALUES (32, N'Lunar Dragon', N'https://i.etsystatic.com/36531035/r/il/4a715c/5600842416/il_794xN.5600842416_fstj.jpg', N'', 1, 1, CAST(N'2024-07-03T15:00:38.767' AS DateTime), CAST(N'2024-07-07T10:36:08.100' AS DateTime), N'', NULL)
GO
INSERT [dbo].[image] ([id], [name], [image], [description], [cate_id], [account_id], [createddate], [modifieddate], [createdby], [modifiedby]) VALUES (33, N'Lightning Drake', N'https://img.freepik.com/premium-photo/imposing-storm-pinnacle-dragon-dragon-blue-lightning_924723-3515.jpg', N'', 2, 1, CAST(N'2024-07-03T15:00:38.770' AS DateTime), CAST(N'2024-07-07T10:36:08.390' AS DateTime), N'', NULL)
GO
INSERT [dbo].[image] ([id], [name], [image], [description], [cate_id], [account_id], [createddate], [modifieddate], [createdby], [modifiedby]) VALUES (34, N'Lightning Wyvern', N'https://storage.googleapis.com/pai-images/c8397db78c5c4897b8a627729ceac94f.jpeg', N'', 7, 1, CAST(N'2024-07-03T15:00:38.770' AS DateTime), CAST(N'2024-07-07T10:36:08.967' AS DateTime), N'', NULL)
GO
INSERT [dbo].[image] ([id], [name], [image], [description], [cate_id], [account_id], [createddate], [modifieddate], [createdby], [modifiedby]) VALUES (35, N'Time Dragon', N'https://i.pinimg.com/736x/b4/91/d5/b491d594fd02f2343e1dfe1a3707768d.jpg', N'', 1, 1, CAST(N'2024-07-03T15:00:38.780' AS DateTime), CAST(N'2024-07-07T10:36:09.320' AS DateTime), N'', NULL)
GO
INSERT [dbo].[image] ([id], [name], [image], [description], [cate_id], [account_id], [createddate], [modifieddate], [createdby], [modifiedby]) VALUES (36, N'Hunter Dragon', N'https://cdnb.artstation.com/p/assets/images/images/034/791/283/large/oberin-ojm-monster-hunter-world-mobile-wallpaper-by-d3hell.jpg?1613239484', N'', 1, 1, CAST(N'2024-07-03T15:00:38.780' AS DateTime), CAST(N'2024-07-07T10:36:09.637' AS DateTime), N'', NULL)
GO
INSERT [dbo].[image] ([id], [name], [image], [description], [cate_id], [account_id], [createddate], [modifieddate], [createdby], [modifiedby]) VALUES (37, N'Earth Drake', N'https://cdnb.artstation.com/p/assets/images/images/001/622/603/large/paul-mafayon-stampeding-rager4.jpg?1449666081', N'', 2, 1, CAST(N'2024-07-03T15:00:38.783' AS DateTime), CAST(N'2024-07-07T10:36:09.917' AS DateTime), N'', NULL)
GO
INSERT [dbo].[image] ([id], [name], [image], [description], [cate_id], [account_id], [createddate], [modifieddate], [createdby], [modifiedby]) VALUES (38, N'Giant Dragon', N'https://cdna.artstation.com/p/assets/images/images/053/092/756/large/lu-chen-16-2.jpg?1661400931', N'', 1, 1, CAST(N'2024-07-03T15:00:38.787' AS DateTime), CAST(N'2024-07-07T10:36:10.210' AS DateTime), N'', NULL)
GO
INSERT [dbo].[image] ([id], [name], [image], [description], [cate_id], [account_id], [createddate], [modifieddate], [createdby], [modifiedby]) VALUES (39, N'Sea Serpent', N'https://cdnb.artstation.com/p/assets/images/images/007/388/835/large/svetlin-velinov-keiga-the-tide-star.jpg?1505812170', N'', 5, 1, CAST(N'2024-07-03T15:00:38.787' AS DateTime), CAST(N'2024-07-07T10:36:10.550' AS DateTime), N'', NULL)
GO
INSERT [dbo].[image] ([id], [name], [image], [description], [cate_id], [account_id], [createddate], [modifieddate], [createdby], [modifiedby]) VALUES (40, N'Mountain Drake', N'https://cdna.artstation.com/p/assets/images/images/025/506/404/large/svetlin-velinov-titanroth-rex.jpg?1586012498', N'', 2, 1, CAST(N'2024-07-03T15:00:38.790' AS DateTime), CAST(N'2024-07-07T10:36:10.900' AS DateTime), N'', NULL)
GO
INSERT [dbo].[image] ([id], [name], [image], [description], [cate_id], [account_id], [createddate], [modifieddate], [createdby], [modifiedby]) VALUES (41, N'War Bahamut', N'https://cdn.donmai.us/original/89/3b/893beb0ec93425a10d794c05b70cf923.jpg', N'', 1, 1, CAST(N'2024-07-03T15:00:38.790' AS DateTime), CAST(N'2024-07-07T17:15:23.513' AS DateTime), N'', N'Dragon')
GO
INSERT [dbo].[image] ([id], [name], [image], [description], [cate_id], [account_id], [createddate], [modifieddate], [createdby], [modifiedby]) VALUES (42, N'Rock Drake', N'https://images6.alphacoders.com/102/thumb-1920-1024520.png', N'', 2, 1, CAST(N'2024-07-03T15:00:38.793' AS DateTime), CAST(N'2024-07-07T10:36:11.503' AS DateTime), N'', NULL)
GO
INSERT [dbo].[image] ([id], [name], [image], [description], [cate_id], [account_id], [createddate], [modifieddate], [createdby], [modifiedby]) VALUES (43, N'Fire Dragon', N'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/bf1243dc-5053-4695-ae36-551a6174282a/dgaa1bn-5a1de50b-e4d9-43f6-989f-04a435682dd6.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2JmMTI0M2RjLTUwNTMtNDY5NS1hZTM2LTU1MWE2MTc0MjgyYVwvZGdhYTFibi01YTFkZTUwYi1lNGQ5LTQzZjYtOTg5Zi0wNGE0MzU2ODJkZDYuanBnIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.rVlHdbm1J7l-XFZ0pjwisJ58URrbk3xvHloqf-7SS5I', N'', 1, 1, CAST(N'2024-07-03T15:00:38.797' AS DateTime), CAST(N'2024-07-07T10:36:11.820' AS DateTime), N'', NULL)
GO
INSERT [dbo].[image] ([id], [name], [image], [description], [cate_id], [account_id], [createddate], [modifieddate], [createdby], [modifiedby]) VALUES (44, N'God Dragon', N'https://i.pinimg.com/originals/b1/b5/61/b1b5616248fbf3de2f195a3526e52c52.jpg', N'', 1, 1, CAST(N'2024-07-07T17:35:09.123' AS DateTime), CAST(N'2024-07-07T17:42:30.723' AS DateTime), N'Dragon', N'Hydra')
GO
INSERT [dbo].[image] ([id], [name], [image], [description], [cate_id], [account_id], [createddate], [modifieddate], [createdby], [modifiedby]) VALUES (45, N'Fiery Drake', N'https://c4.wallpaperflare.com/wallpaper/500/262/528/monster-hunter-wallpaper-preview.jpg', N'', 2, 1, CAST(N'2024-07-07T17:35:45.763' AS DateTime), CAST(N'2024-07-10T21:15:46.913' AS DateTime), N'Dragon', N'2')
GO
SET IDENTITY_INSERT [dbo].[image] OFF
GO
SET IDENTITY_INSERT [dbo].[permission] ON 
GO
INSERT [dbo].[permission] ([id], [role_id], [entity], [action]) VALUES (1, 1, N'image', N'view')
GO
INSERT [dbo].[permission] ([id], [role_id], [entity], [action]) VALUES (2, 1, N'account', N'manage')
GO
INSERT [dbo].[permission] ([id], [role_id], [entity], [action]) VALUES (3, 1, N'album', N'manage')
GO
INSERT [dbo].[permission] ([id], [role_id], [entity], [action]) VALUES (4, 2, N'image', N'manage')
GO
INSERT [dbo].[permission] ([id], [role_id], [entity], [action]) VALUES (5, 2, N'account', N'not permission')
GO
INSERT [dbo].[permission] ([id], [role_id], [entity], [action]) VALUES (6, 2, N'album', N'manage')
GO
SET IDENTITY_INSERT [dbo].[permission] OFF
GO
SET IDENTITY_INSERT [dbo].[role] ON 
GO
INSERT [dbo].[role] ([id], [name], [code], [createddate], [modifieddate], [createdby], [modifiedby]) VALUES (1, N'ADMIN', N'ADMIN', CAST(N'2024-07-03T15:00:38.560' AS DateTime), CAST(N'2024-07-03T15:00:38.560' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[role] ([id], [name], [code], [createddate], [modifieddate], [createdby], [modifiedby]) VALUES (2, N'USER', N'USER', CAST(N'2024-07-03T15:00:38.567' AS DateTime), CAST(N'2024-07-03T15:00:38.567' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[role] OFF
GO
ALTER TABLE [dbo].[account] ADD  DEFAULT (getdate()) FOR [createddate]
GO
ALTER TABLE [dbo].[account] ADD  DEFAULT (getdate()) FOR [modifieddate]
GO
ALTER TABLE [dbo].[album] ADD  DEFAULT (getdate()) FOR [createddate]
GO
ALTER TABLE [dbo].[album] ADD  DEFAULT (getdate()) FOR [modifieddate]
GO
ALTER TABLE [dbo].[category] ADD  DEFAULT (getdate()) FOR [createddate]
GO
ALTER TABLE [dbo].[category] ADD  DEFAULT (getdate()) FOR [modifieddate]
GO
ALTER TABLE [dbo].[image] ADD  DEFAULT (getdate()) FOR [createddate]
GO
ALTER TABLE [dbo].[image] ADD  DEFAULT (getdate()) FOR [modifieddate]
GO
ALTER TABLE [dbo].[role] ADD  DEFAULT (getdate()) FOR [createddate]
GO
ALTER TABLE [dbo].[role] ADD  DEFAULT (getdate()) FOR [modifieddate]
GO
ALTER TABLE [dbo].[account]  WITH CHECK ADD  CONSTRAINT [FK_account_role] FOREIGN KEY([role_id])
REFERENCES [dbo].[role] ([id])
GO
ALTER TABLE [dbo].[account] CHECK CONSTRAINT [FK_account_role]
GO
ALTER TABLE [dbo].[album]  WITH CHECK ADD FOREIGN KEY([account_id])
REFERENCES [dbo].[account] ([id])
GO
ALTER TABLE [dbo].[album]  WITH CHECK ADD FOREIGN KEY([cover_image_id])
REFERENCES [dbo].[image] ([id])
GO
ALTER TABLE [dbo].[album_image]  WITH CHECK ADD FOREIGN KEY([album_id])
REFERENCES [dbo].[album] ([id])
GO
ALTER TABLE [dbo].[album_image]  WITH CHECK ADD FOREIGN KEY([image_id])
REFERENCES [dbo].[image] ([id])
GO
ALTER TABLE [dbo].[image]  WITH CHECK ADD  CONSTRAINT [FK_image_account] FOREIGN KEY([account_id])
REFERENCES [dbo].[account] ([id])
GO
ALTER TABLE [dbo].[image] CHECK CONSTRAINT [FK_image_account]
GO
ALTER TABLE [dbo].[image]  WITH CHECK ADD  CONSTRAINT [FK_image_category] FOREIGN KEY([cate_id])
REFERENCES [dbo].[category] ([id])
GO
ALTER TABLE [dbo].[image] CHECK CONSTRAINT [FK_image_category]
GO
ALTER TABLE [dbo].[permission]  WITH CHECK ADD FOREIGN KEY([role_id])
REFERENCES [dbo].[role] ([id])
GO
USE [master]
GO
ALTER DATABASE [PHOTO_LIBRARY] SET  READ_WRITE 
GO
