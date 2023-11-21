USE [master]
GO
/****** Object:  Database [t2]    Script Date: 11/3/2023 5:23:28 PM ******/
CREATE DATABASE [t2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N't2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.XUANTHANH\MSSQL\DATA\t2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N't2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.XUANTHANH\MSSQL\DATA\t2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [t2] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [t2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [t2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [t2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [t2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [t2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [t2] SET ARITHABORT OFF 
GO
ALTER DATABASE [t2] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [t2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [t2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [t2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [t2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [t2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [t2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [t2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [t2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [t2] SET  ENABLE_BROKER 
GO
ALTER DATABASE [t2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [t2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [t2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [t2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [t2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [t2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [t2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [t2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [t2] SET  MULTI_USER 
GO
ALTER DATABASE [t2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [t2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [t2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [t2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [t2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [t2] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [t2] SET QUERY_STORE = OFF
GO
USE [t2]
GO
/****** Object:  Table [dbo].[admins]    Script Date: 11/3/2023 5:23:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admins](
	[admin_id] [bigint] IDENTITY(1,1) NOT NULL,
	[first_name] [nvarchar](20) NULL,
	[image] [varchar](255) NULL,
	[last_name] [nvarchar](20) NULL,
	[password] [varchar](255) NULL,
	[username] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[admin_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[admins_roles]    Script Date: 11/3/2023 5:23:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admins_roles](
	[admin_id] [bigint] NOT NULL,
	[role_id] [bigint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cart_item]    Script Date: 11/3/2023 5:23:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cart_item](
	[order_detail_id] [bigint] IDENTITY(1,1) NOT NULL,
	[quantity] [int] NOT NULL,
	[total_price] [float] NOT NULL,
	[shopping_cart_id] [bigint] NULL,
	[product_id] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[order_detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[categories]    Script Date: 11/3/2023 5:23:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categories](
	[category_id] [bigint] IDENTITY(1,1) NOT NULL,
	[is_activated] [bit] NOT NULL,
	[is_deleted] [bit] NOT NULL,
	[name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UKt8o6pivur7nn124jehx7cygw5] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cities]    Script Date: 11/3/2023 5:23:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cities](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[city] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[comments]    Script Date: 11/3/2023 5:23:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[comments](
	[comment_id] [bigint] IDENTITY(1,1) NOT NULL,
	[content] [nvarchar](1000) NULL,
	[customer_id] [bigint] NULL,
	[recipe_id] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[comment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customers]    Script Date: 11/3/2023 5:23:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customers](
	[customer_id] [bigint] IDENTITY(1,1) NOT NULL,
	[address] [nvarchar](100) NULL,
	[city] [nvarchar](50) NULL,
	[country] [nvarchar](50) NULL,
	[first_name] [nvarchar](50) NULL,
	[image] [varchar](255) NULL,
	[last_name] [nvarchar](50) NULL,
	[password] [varchar](255) NULL,
	[phone_number] [varchar](255) NULL,
	[username] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UK6v6x92wb400iwh6unf5rwiim4] UNIQUE NONCLUSTERED 
(
	[phone_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customers_roles]    Script Date: 11/3/2023 5:23:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customers_roles](
	[customer_id] [bigint] NOT NULL,
	[role_id] [bigint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[favourite_recipes]    Script Date: 11/3/2023 5:23:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[favourite_recipes](
	[user_id] [bigint] NOT NULL,
	[recipe_id] [bigint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[follow]    Script Date: 11/3/2023 5:23:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[follow](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[follower_customer_id] [bigint] NULL,
	[following_customer_id] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[img_comments]    Script Date: 11/3/2023 5:23:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[img_comments](
	[img_comment_id] [bigint] IDENTITY(1,1) NOT NULL,
	[img_url] [varchar](255) NULL,
	[comment_id] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[img_comment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[img_products]    Script Date: 11/3/2023 5:23:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[img_products](
	[img_product_id] [bigint] IDENTITY(1,1) NOT NULL,
	[img_path] [varchar](255) NULL,
	[product_id] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[img_product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[img_steps]    Script Date: 11/3/2023 5:23:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[img_steps](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[img_path] [varchar](255) NULL,
	[step_id] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ingredients]    Script Date: 11/3/2023 5:23:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ingredients](
	[ingredient_id] [bigint] IDENTITY(1,1) NOT NULL,
	[amount] [float] NULL,
	[name] [nvarchar](50) NULL,
	[measurement_id] [bigint] NULL,
	[recipe_id] [bigint] NULL,
	[product_id] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[ingredient_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[measurements]    Script Date: 11/3/2023 5:23:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[measurements](
	[measurement_id] [bigint] IDENTITY(1,1) NOT NULL,
	[is_deleted] [bit] NOT NULL,
	[name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[measurement_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UK45ogveehr7qgdkmutpa2ddv1m] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Months]    Script Date: 11/3/2023 5:23:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Months](
	[MonthID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MonthID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[notification]    Script Date: 11/3/2023 5:23:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[notification](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[create_at] [datetime2](6) NULL,
	[is_read] [bit] NOT NULL,
	[message] [nvarchar](100) NULL,
	[title] [nvarchar](50) NULL,
	[type] [varchar](255) NULL,
	[url] [varchar](255) NULL,
	[customer_id] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_detail]    Script Date: 11/3/2023 5:23:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_detail](
	[order_detail_id] [bigint] IDENTITY(1,1) NOT NULL,
	[quantity] [int] NOT NULL,
	[total_price] [float] NOT NULL,
	[unit_price] [float] NOT NULL,
	[order_id] [bigint] NULL,
	[product_id] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[order_detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 11/3/2023 5:23:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[order_id] [bigint] IDENTITY(1,1) NOT NULL,
	[delivery_date] [datetime2](6) NULL,
	[notes] [varchar](255) NULL,
	[order_date] [datetime2](6) NULL,
	[order_status] [varchar](255) NULL,
	[shipping_fee] [float] NOT NULL,
	[total_price] [float] NOT NULL,
	[customer_id] [bigint] NULL,
	[is_accepted] [bit] NOT NULL,
	[shipping_address] [nvarchar](100) NULL,
	[payment_method] [varchar](255) NULL,
	[transaction_id] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products]    Script Date: 11/3/2023 5:23:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[product_id] [bigint] IDENTITY(1,1) NOT NULL,
	[amount_to_sell] [float] NULL,
	[average_weight] [float] NOT NULL,
	[calories] [float] NOT NULL,
	[carbs] [float] NOT NULL,
	[cost_price] [float] NOT NULL,
	[current_quantity] [int] NOT NULL,
	[description] [nvarchar](255) NULL,
	[fat] [float] NOT NULL,
	[fiber] [float] NOT NULL,
	[is_activated] [bit] NOT NULL,
	[is_deleted] [bit] NOT NULL,
	[name] [nvarchar](50) NULL,
	[sale_price] [float] NOT NULL,
	[sodium] [float] NOT NULL,
	[sugar] [float] NOT NULL,
	[category_id] [bigint] NULL,
	[measurement_id] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UKo61fmio5yukmmiqgnxf8pnavn] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[reactions]    Script Date: 11/3/2023 5:23:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reactions](
	[reaction_id] [bigint] IDENTITY(1,1) NOT NULL,
	[type] [varchar](255) NULL,
	[comment_comment_id] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[reaction_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[reactions_customers]    Script Date: 11/3/2023 5:23:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reactions_customers](
	[reaction_reaction_id] [bigint] NOT NULL,
	[customers_customer_id] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[reaction_reaction_id] ASC,
	[customers_customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[recipes]    Script Date: 11/3/2023 5:23:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[recipes](
	[recipe_id] [bigint] IDENTITY(1,1) NOT NULL,
	[cooking_time] [int] NULL,
	[description] [nvarchar](500) NULL,
	[is_confirmed] [bit] NOT NULL,
	[name] [nvarchar](100) NULL,
	[portion] [int] NULL,
	[customer_id] [bigint] NULL,
	[is_checked] [bit] NULL,
	[create_at] [datetime2](6) NULL,
	[image] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[recipe_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[roles]    Script Date: 11/3/2023 5:23:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roles](
	[role_id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[shopping_cart]    Script Date: 11/3/2023 5:23:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shopping_cart](
	[shopping_cart_id] [bigint] IDENTITY(1,1) NOT NULL,
	[total_items] [int] NOT NULL,
	[total_prices] [float] NOT NULL,
	[customer_id] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[shopping_cart_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[steps]    Script Date: 11/3/2023 5:23:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[steps](
	[step_id] [bigint] IDENTITY(1,1) NOT NULL,
	[description] [nvarchar](500) NULL,
	[recipe_id] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[step_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[admins_roles]  WITH CHECK ADD  CONSTRAINT [FK6ioy9osuscmkmt3b0c32c5w9y] FOREIGN KEY([role_id])
REFERENCES [dbo].[roles] ([role_id])
GO
ALTER TABLE [dbo].[admins_roles] CHECK CONSTRAINT [FK6ioy9osuscmkmt3b0c32c5w9y]
GO
ALTER TABLE [dbo].[admins_roles]  WITH CHECK ADD  CONSTRAINT [FK8535wewsp17vgt2scahieovxu] FOREIGN KEY([admin_id])
REFERENCES [dbo].[admins] ([admin_id])
GO
ALTER TABLE [dbo].[admins_roles] CHECK CONSTRAINT [FK8535wewsp17vgt2scahieovxu]
GO
ALTER TABLE [dbo].[cart_item]  WITH CHECK ADD  CONSTRAINT [FKe89gjdx91fxnmkkssyoim8xfu] FOREIGN KEY([shopping_cart_id])
REFERENCES [dbo].[shopping_cart] ([shopping_cart_id])
GO
ALTER TABLE [dbo].[cart_item] CHECK CONSTRAINT [FKe89gjdx91fxnmkkssyoim8xfu]
GO
ALTER TABLE [dbo].[cart_item]  WITH CHECK ADD  CONSTRAINT [FKqkqmvkmbtiaqn2nfqf25ymfs2] FOREIGN KEY([product_id])
REFERENCES [dbo].[products] ([product_id])
GO
ALTER TABLE [dbo].[cart_item] CHECK CONSTRAINT [FKqkqmvkmbtiaqn2nfqf25ymfs2]
GO
ALTER TABLE [dbo].[comments]  WITH CHECK ADD  CONSTRAINT [FKdtb5nfo2c69a6chahuihyaqx] FOREIGN KEY([recipe_id])
REFERENCES [dbo].[recipes] ([recipe_id])
GO
ALTER TABLE [dbo].[comments] CHECK CONSTRAINT [FKdtb5nfo2c69a6chahuihyaqx]
GO
ALTER TABLE [dbo].[comments]  WITH CHECK ADD  CONSTRAINT [FKev1bd87g1c51ujncao608e6qa] FOREIGN KEY([customer_id])
REFERENCES [dbo].[customers] ([customer_id])
GO
ALTER TABLE [dbo].[comments] CHECK CONSTRAINT [FKev1bd87g1c51ujncao608e6qa]
GO
ALTER TABLE [dbo].[customers_roles]  WITH CHECK ADD  CONSTRAINT [FKc43ultbfo55uyy6ljpi8x87mf] FOREIGN KEY([role_id])
REFERENCES [dbo].[roles] ([role_id])
GO
ALTER TABLE [dbo].[customers_roles] CHECK CONSTRAINT [FKc43ultbfo55uyy6ljpi8x87mf]
GO
ALTER TABLE [dbo].[customers_roles]  WITH CHECK ADD  CONSTRAINT [FKmn5q3x2wakfnrby09kb5n2bxs] FOREIGN KEY([customer_id])
REFERENCES [dbo].[customers] ([customer_id])
GO
ALTER TABLE [dbo].[customers_roles] CHECK CONSTRAINT [FKmn5q3x2wakfnrby09kb5n2bxs]
GO
ALTER TABLE [dbo].[favourite_recipes]  WITH CHECK ADD  CONSTRAINT [FK5gc7ndy7wcqinmb763k5o6mwj] FOREIGN KEY([recipe_id])
REFERENCES [dbo].[recipes] ([recipe_id])
GO
ALTER TABLE [dbo].[favourite_recipes] CHECK CONSTRAINT [FK5gc7ndy7wcqinmb763k5o6mwj]
GO
ALTER TABLE [dbo].[favourite_recipes]  WITH CHECK ADD  CONSTRAINT [FK8ukbh9q7ks2a6db9q9j0vsyc5] FOREIGN KEY([user_id])
REFERENCES [dbo].[customers] ([customer_id])
GO
ALTER TABLE [dbo].[favourite_recipes] CHECK CONSTRAINT [FK8ukbh9q7ks2a6db9q9j0vsyc5]
GO
ALTER TABLE [dbo].[follow]  WITH CHECK ADD  CONSTRAINT [FKaf1r6mbij4e5aonulhg95a52t] FOREIGN KEY([following_customer_id])
REFERENCES [dbo].[customers] ([customer_id])
GO
ALTER TABLE [dbo].[follow] CHECK CONSTRAINT [FKaf1r6mbij4e5aonulhg95a52t]
GO
ALTER TABLE [dbo].[follow]  WITH CHECK ADD  CONSTRAINT [FKe209qwansvu1h36tuyvqjwcgy] FOREIGN KEY([follower_customer_id])
REFERENCES [dbo].[customers] ([customer_id])
GO
ALTER TABLE [dbo].[follow] CHECK CONSTRAINT [FKe209qwansvu1h36tuyvqjwcgy]
GO
ALTER TABLE [dbo].[img_comments]  WITH CHECK ADD  CONSTRAINT [FK8yy6vrc37te3cjib51yan4bbv] FOREIGN KEY([comment_id])
REFERENCES [dbo].[comments] ([comment_id])
GO
ALTER TABLE [dbo].[img_comments] CHECK CONSTRAINT [FK8yy6vrc37te3cjib51yan4bbv]
GO
ALTER TABLE [dbo].[img_products]  WITH CHECK ADD  CONSTRAINT [FKrlyk6iog8b68wl0nxpktl3s74] FOREIGN KEY([product_id])
REFERENCES [dbo].[products] ([product_id])
GO
ALTER TABLE [dbo].[img_products] CHECK CONSTRAINT [FKrlyk6iog8b68wl0nxpktl3s74]
GO
ALTER TABLE [dbo].[img_steps]  WITH CHECK ADD  CONSTRAINT [FKobry6qk2vekbw1slxmmw3tgu0] FOREIGN KEY([step_id])
REFERENCES [dbo].[steps] ([step_id])
GO
ALTER TABLE [dbo].[img_steps] CHECK CONSTRAINT [FKobry6qk2vekbw1slxmmw3tgu0]
GO
ALTER TABLE [dbo].[ingredients]  WITH CHECK ADD  CONSTRAINT [FK34jbb91wprx6ys2443vf43cxj] FOREIGN KEY([product_id])
REFERENCES [dbo].[products] ([product_id])
GO
ALTER TABLE [dbo].[ingredients] CHECK CONSTRAINT [FK34jbb91wprx6ys2443vf43cxj]
GO
ALTER TABLE [dbo].[ingredients]  WITH CHECK ADD  CONSTRAINT [FK7p08vcn6wf7fd6qp79yy2jrwg] FOREIGN KEY([recipe_id])
REFERENCES [dbo].[recipes] ([recipe_id])
GO
ALTER TABLE [dbo].[ingredients] CHECK CONSTRAINT [FK7p08vcn6wf7fd6qp79yy2jrwg]
GO
ALTER TABLE [dbo].[ingredients]  WITH CHECK ADD  CONSTRAINT [FKpbg24mabu57gq2l3v7osgk0fw] FOREIGN KEY([measurement_id])
REFERENCES [dbo].[measurements] ([measurement_id])
GO
ALTER TABLE [dbo].[ingredients] CHECK CONSTRAINT [FKpbg24mabu57gq2l3v7osgk0fw]
GO
ALTER TABLE [dbo].[notification]  WITH CHECK ADD  CONSTRAINT [FK3omyahwka0giimh1ny2qw81yw] FOREIGN KEY([customer_id])
REFERENCES [dbo].[customers] ([customer_id])
GO
ALTER TABLE [dbo].[notification] CHECK CONSTRAINT [FK3omyahwka0giimh1ny2qw81yw]
GO
ALTER TABLE [dbo].[order_detail]  WITH CHECK ADD  CONSTRAINT [FKc7q42e9tu0hslx6w4wxgomhvn] FOREIGN KEY([product_id])
REFERENCES [dbo].[products] ([product_id])
GO
ALTER TABLE [dbo].[order_detail] CHECK CONSTRAINT [FKc7q42e9tu0hslx6w4wxgomhvn]
GO
ALTER TABLE [dbo].[order_detail]  WITH CHECK ADD  CONSTRAINT [FKrws2q0si6oyd6il8gqe2aennc] FOREIGN KEY([order_id])
REFERENCES [dbo].[orders] ([order_id])
GO
ALTER TABLE [dbo].[order_detail] CHECK CONSTRAINT [FKrws2q0si6oyd6il8gqe2aennc]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FKpxtb8awmi0dk6smoh2vp1litg] FOREIGN KEY([customer_id])
REFERENCES [dbo].[customers] ([customer_id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FKpxtb8awmi0dk6smoh2vp1litg]
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD  CONSTRAINT [FKk2j0t5xcj9af4nffirke3qc1v] FOREIGN KEY([measurement_id])
REFERENCES [dbo].[measurements] ([measurement_id])
GO
ALTER TABLE [dbo].[products] CHECK CONSTRAINT [FKk2j0t5xcj9af4nffirke3qc1v]
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD  CONSTRAINT [FKog2rp4qthbtt2lfyhfo32lsw9] FOREIGN KEY([category_id])
REFERENCES [dbo].[categories] ([category_id])
GO
ALTER TABLE [dbo].[products] CHECK CONSTRAINT [FKog2rp4qthbtt2lfyhfo32lsw9]
GO
ALTER TABLE [dbo].[reactions]  WITH CHECK ADD  CONSTRAINT [FKpolptd8n954ne8jx0pgul8mdl] FOREIGN KEY([comment_comment_id])
REFERENCES [dbo].[comments] ([comment_id])
GO
ALTER TABLE [dbo].[reactions] CHECK CONSTRAINT [FKpolptd8n954ne8jx0pgul8mdl]
GO
ALTER TABLE [dbo].[reactions_customers]  WITH CHECK ADD  CONSTRAINT [FKbec0bp71jhch246lhk6rc1jb6] FOREIGN KEY([reaction_reaction_id])
REFERENCES [dbo].[reactions] ([reaction_id])
GO
ALTER TABLE [dbo].[reactions_customers] CHECK CONSTRAINT [FKbec0bp71jhch246lhk6rc1jb6]
GO
ALTER TABLE [dbo].[reactions_customers]  WITH CHECK ADD  CONSTRAINT [FKp5lb8ahilpwx0hp9sylvtblas] FOREIGN KEY([customers_customer_id])
REFERENCES [dbo].[customers] ([customer_id])
GO
ALTER TABLE [dbo].[reactions_customers] CHECK CONSTRAINT [FKp5lb8ahilpwx0hp9sylvtblas]
GO
ALTER TABLE [dbo].[recipes]  WITH CHECK ADD  CONSTRAINT [FKldl8wvggwu062fpyadgv9amux] FOREIGN KEY([customer_id])
REFERENCES [dbo].[customers] ([customer_id])
GO
ALTER TABLE [dbo].[recipes] CHECK CONSTRAINT [FKldl8wvggwu062fpyadgv9amux]
GO
ALTER TABLE [dbo].[shopping_cart]  WITH CHECK ADD  CONSTRAINT [FK64hllmf43h6bixdqdyjfyl66c] FOREIGN KEY([customer_id])
REFERENCES [dbo].[customers] ([customer_id])
GO
ALTER TABLE [dbo].[shopping_cart] CHECK CONSTRAINT [FK64hllmf43h6bixdqdyjfyl66c]
GO
ALTER TABLE [dbo].[steps]  WITH CHECK ADD  CONSTRAINT [FK729dw6qpupm85tlbq57rqbpru] FOREIGN KEY([recipe_id])
REFERENCES [dbo].[recipes] ([recipe_id])
GO
ALTER TABLE [dbo].[steps] CHECK CONSTRAINT [FK729dw6qpupm85tlbq57rqbpru]
GO
USE [master]
GO
ALTER DATABASE [t2] SET  READ_WRITE 
GO
