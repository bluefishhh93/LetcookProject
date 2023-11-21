USE [master]
GO
/****** Object:  Database [t2]    Script Date: 10/10/2023 3:59:16 PM ******/
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
/****** Object:  Table [dbo].[admins]    Script Date: 10/10/2023 3:59:16 PM ******/
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
/****** Object:  Table [dbo].[admins_roles]    Script Date: 10/10/2023 3:59:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admins_roles](
	[admin_id] [bigint] NOT NULL,
	[role_id] [bigint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cart_item]    Script Date: 10/10/2023 3:59:16 PM ******/
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
/****** Object:  Table [dbo].[categories]    Script Date: 10/10/2023 3:59:16 PM ******/
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
/****** Object:  Table [dbo].[cities]    Script Date: 10/10/2023 3:59:16 PM ******/
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
/****** Object:  Table [dbo].[customers]    Script Date: 10/10/2023 3:59:16 PM ******/
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
/****** Object:  Table [dbo].[customers_roles]    Script Date: 10/10/2023 3:59:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customers_roles](
	[customer_id] [bigint] NOT NULL,
	[role_id] [bigint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[img_products]    Script Date: 10/10/2023 3:59:16 PM ******/
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
/****** Object:  Table [dbo].[measurements]    Script Date: 10/10/2023 3:59:16 PM ******/
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
/****** Object:  Table [dbo].[order_detail]    Script Date: 10/10/2023 3:59:16 PM ******/
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
/****** Object:  Table [dbo].[orders]    Script Date: 10/10/2023 3:59:16 PM ******/
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
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products]    Script Date: 10/10/2023 3:59:16 PM ******/
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
/****** Object:  Table [dbo].[roles]    Script Date: 10/10/2023 3:59:16 PM ******/
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
/****** Object:  Table [dbo].[shopping_cart]    Script Date: 10/10/2023 3:59:16 PM ******/
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
ALTER TABLE [dbo].[img_products]  WITH CHECK ADD  CONSTRAINT [FKrlyk6iog8b68wl0nxpktl3s74] FOREIGN KEY([product_id])
REFERENCES [dbo].[products] ([product_id])
GO
ALTER TABLE [dbo].[img_products] CHECK CONSTRAINT [FKrlyk6iog8b68wl0nxpktl3s74]
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
ALTER TABLE [dbo].[shopping_cart]  WITH CHECK ADD  CONSTRAINT [FK64hllmf43h6bixdqdyjfyl66c] FOREIGN KEY([customer_id])
REFERENCES [dbo].[customers] ([customer_id])
GO
ALTER TABLE [dbo].[shopping_cart] CHECK CONSTRAINT [FK64hllmf43h6bixdqdyjfyl66c]
GO
USE [master]
GO
ALTER DATABASE [t2] SET  READ_WRITE 
GO
