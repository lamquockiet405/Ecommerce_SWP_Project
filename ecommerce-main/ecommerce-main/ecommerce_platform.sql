USE [master]
GO
CREATE DATABASE [ecommerce_platform]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ecommerce_platform', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ecommerce_platform.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ecommerce_platform_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ecommerce_platform_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ecommerce_platform] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
	EXEC [ecommerce_platform].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
USE [ecommerce_platform]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carriers]
(
	[CarrierID] [int] IDENTITY(1,1) NOT NULL,
	[CarrierName] [nvarchar](100) NOT NULL,
	[ContactInfo] [nvarchar](255) NULL,
	PRIMARY KEY CLUSTERED 
(
	[CarrierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart]
(
	[CartID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[ProductVariantID] [int] NULL,
	[Quantity] [int] NOT NULL,
	PRIMARY KEY CLUSTERED 
(
	[CartID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories]
(
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NOT NULL,
	PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItems]
(
	[OrderItemID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NULL,
	[ProductVariantID] [int] NULL,
	[Quantity] [int] NOT NULL,
	[Price] [decimal](10, 2) NOT NULL,
	PRIMARY KEY CLUSTERED 
(
	[OrderItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders]
(
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[OrderDate] [datetime2](7) NULL,
	[TotalAmount] [decimal](10, 2) NOT NULL,
	[Status] [nvarchar](20) NOT NULL,
	[ShipingAddress] [nvarchar](MAX),
	[PaymentMethod] [nvarchar](50) NULL,
	PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment]
(
	[PaymentID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NULL,
	[Amount] [decimal](10, 2) NOT NULL,
	[PaymentMethod] [nvarchar](50) NOT NULL,
	[TransactionID] [nvarchar](100) NULL,
	[Status] [nvarchar](20) NOT NULL,
	[PaymentDate] [datetime2](7) NULL,
	PRIMARY KEY CLUSTERED 
(
	[PaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products]
(
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Status] [int] NOT NULL,
	[CategoryID] [int] NULL,
	[ShopId] int NOT NULL,
	[CreatedAt] [datetime2](7) NULL,
		PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE TABLE [dbo].[ProductsVariant](
	[ProductVariantID] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[ProductVariantName] [nvarchar](100) NOT NULL,
	[ProductID] [int] NULL FOREIGN KEY REFERENCES [Products]([ProductID]),
	[Price] [decimal](10, 2) NOT NULL,
	[StockQuantity] [int] NOT NULL,
	[Image] [nvarchar]
)
GO
CREATE TABLE [images] 
(
	[id] INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[image] NVARCHAR(MAX) NOT NULL,
	[status] INT,
	[ProductID] INT FOREIGN KEY REFERENCES [Products]([ProductID])
)
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reviews]
(
	[ReviewID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NULL,
	[UserID] [int] NULL,
	[Rating] [int] NOT NULL,
	[Comment] [nvarchar](max) NULL,
	[ReviewDate] [datetime2](7) NULL,
	PRIMARY KEY CLUSTERED 
(
	[ReviewID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shipping]
(
	[ShippingID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NULL,
	[CarrierID] [int] NULL,
	[TrackingNumber] [nvarchar](100) NULL,
	[ShippingDate] [datetime2](7) NULL,
	[EstimatedDeliveryDate] [date] NULL,
	[ActualDeliveryDate] [date] NULL,
	[Status] [nvarchar](20) NOT NULL,
	PRIMARY KEY CLUSTERED 
(
	[ShippingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](255) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Address] [nvarchar](255) NULL,
	[DateOfBirth] [date] NULL,
	[Gender] [bit] NULL,
	[PhoneNumber] [nvarchar](20) NULL,
	[Image] [nvarchar](max) NULL,
	[UserRole] [nvarchar](10) NOT NULL,
	[Status] [nvarchar](20) NOT NULL, 
	[CreatedAt] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)
WITH
(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED
(
	[Username] ASC
)
WITH
(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED
(
	[Email] ASC
)
WITH
(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [Shops] 
(
	[id] INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[name] NVARCHAR(max) NOT NULL,
	[tax] NVARCHAR(20) NOT NULL,
	[describe] NVARCHAR (MAX),
	[logo] NVARCHAR(max),
	[userId] INT UNIQUE
)

GO
ALTER TABLE [Shops] ADD FOREIGN KEY ([userId]) REFERENCES [Users]([userId])
GO
CREATE TABLE [ShippingAddresses] 
(
	[id] INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[username] NVARCHAR(200) NOT NULL,
	[phoneNumber] NVARCHAR(13) NOT NULL,
	[address] NVARCHAR(MAX) NOT NULL,
	[status] bit,
	[userId] INT FOREIGN KEY REFERENCES [Users]([userId])
)
GO
ALTER TABLE [Products] ADD FOREIGN KEY ([ShopId]) REFERENCES [Shops]([id])
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT (getdate()) FOR [OrderDate]
GO
ALTER TABLE [dbo].[Payment] ADD  DEFAULT (getdate()) FOR [PaymentDate]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Reviews] ADD  DEFAULT (getdate()) FOR [ReviewDate]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([ProductVariantID])
REFERENCES [dbo].[ProductsVariant] ([ProductVariantID])
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO

ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD FOREIGN KEY([ProductVariantID])
REFERENCES [dbo].[ProductsVariant] ([ProductVariantID])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Shipping]  WITH CHECK ADD FOREIGN KEY([CarrierID])
REFERENCES [dbo].[Carriers] ([CarrierID])
GO
ALTER TABLE [dbo].[Shipping]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD CHECK  (([Status]='Cancelled' OR [Status]='Delivered' OR [Status]='Shipped' OR [Status]='Processing' OR [Status]='Pending'))
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD CHECK  (([Status]='Refunded' OR [Status]='Failed' OR [Status]='Completed' OR [Status]='Pending'))
GO
ALTER TABLE [dbo].[Shipping]  WITH CHECK ADD CHECK  (([Status]='Delivered' OR [Status]='In Transit' OR [Status]='Pending'))
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD CHECK  (([UserRole]='Admin' OR [UserRole]='Seller' OR [UserRole]='User' OR [UserRole]='Guest'))
GO
ALTER TABLE ProductsVariant ALTER COLUMN Image NVARCHAR(MAX);
GO
alter table [Categories] add [status] int;
GO
alter table [ProductsVariant] add [status] int;
go
USE [master]
GO
ALTER DATABASE [ecommerce_platform] SET  READ_WRITE 
GO
