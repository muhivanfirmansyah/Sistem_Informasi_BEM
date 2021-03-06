USE [master]
GO
/****** Object:  Database [DBSIBEM]    Script Date: 2/5/2021 4:56:41 PM ******/
CREATE DATABASE [DBSIBEM]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DBSIBEM', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\DBSIBEM.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DBSIBEM_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\DBSIBEM_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [DBSIBEM] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBSIBEM].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBSIBEM] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBSIBEM] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBSIBEM] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBSIBEM] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBSIBEM] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBSIBEM] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [DBSIBEM] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBSIBEM] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBSIBEM] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBSIBEM] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBSIBEM] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBSIBEM] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBSIBEM] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBSIBEM] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBSIBEM] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DBSIBEM] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBSIBEM] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBSIBEM] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBSIBEM] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBSIBEM] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBSIBEM] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DBSIBEM] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBSIBEM] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DBSIBEM] SET  MULTI_USER 
GO
ALTER DATABASE [DBSIBEM] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBSIBEM] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBSIBEM] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBSIBEM] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DBSIBEM] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DBSIBEM] SET QUERY_STORE = OFF
GO
USE [DBSIBEM]
GO
/****** Object:  Table [dbo].[dtlnotulensi]    Script Date: 2/5/2021 4:56:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dtlnotulensi](
	[idnotulensi] [int] NOT NULL,
	[idanggota] [int] NOT NULL,
	[keterangan] [varchar](max) NULL,
 CONSTRAINT [PK_dtlnotulensi] PRIMARY KEY CLUSTERED 
(
	[idnotulensi] ASC,
	[idanggota] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[msanggotabem]    Script Date: 2/5/2021 4:56:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[msanggotabem](
	[idanggota] [int] IDENTITY(1,1) NOT NULL,
	[iddepartemen] [int] NULL,
	[idjabatan] [int] NULL,
	[idperiode] [int] NULL,
	[nama] [varchar](50) NULL,
	[nim] [varchar](10) NULL,
	[alamat] [varchar](100) NULL,
	[no_telp] [varchar](15) NULL,
	[email] [varchar](50) NULL,
	[password] [varchar](20) NULL,
	[status] [int] NULL,
	[creaby] [varchar](50) NULL,
	[creadate] [datetime] NULL,
	[modiby] [varchar](50) NULL,
	[modidate] [datetime] NULL,
	[foto] [text] NULL,
 CONSTRAINT [PK_msanggotabem] PRIMARY KEY CLUSTERED 
(
	[idanggota] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[msdepartemen]    Script Date: 2/5/2021 4:56:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[msdepartemen](
	[iddepartemen] [int] IDENTITY(1,1) NOT NULL,
	[namadepartemen] [varchar](50) NULL,
	[status] [int] NULL,
	[creaby] [varchar](50) NULL,
	[creadate] [datetime] NULL,
	[modiby] [varchar](50) NULL,
	[modidate] [datetime] NULL,
 CONSTRAINT [PK_msdepartemen] PRIMARY KEY CLUSTERED 
(
	[iddepartemen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[msformatksk]    Script Date: 2/5/2021 4:56:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[msformatksk](
	[idftksk] [int] IDENTITY(1,1) NOT NULL,
	[nama] [varchar](100) NULL,
	[status] [int] NULL,
	[creaby] [varchar](50) NULL,
	[creadate] [datetime] NULL,
	[modiby] [varchar](50) NULL,
	[modidate] [datetime] NULL,
	[dataBerkas] [varchar](max) NULL,
 CONSTRAINT [PK_msformatksk] PRIMARY KEY CLUSTERED 
(
	[idftksk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[msjabatan]    Script Date: 2/5/2021 4:56:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[msjabatan](
	[idjabatan] [int] IDENTITY(1,1) NOT NULL,
	[idukm_hima] [int] NULL,
	[namajabatan] [varchar](50) NULL,
	[status] [int] NULL,
	[creaby] [varchar](50) NULL,
	[creadate] [datetime] NULL,
	[modiby] [varchar](50) NULL,
	[modidate] [datetime] NULL,
 CONSTRAINT [PK_msjabatan] PRIMARY KEY CLUSTERED 
(
	[idjabatan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[msnews]    Script Date: 2/5/2021 4:56:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[msnews](
	[idnews] [int] IDENTITY(1,1) NOT NULL,
	[judul] [varchar](100) NULL,
	[preview] [varchar](max) NULL,
	[deskripsi] [varchar](max) NULL,
	[gambar] [varchar](max) NULL,
	[status] [int] NULL,
	[creaby] [varchar](50) NULL,
	[creadate] [datetime] NULL,
	[modiby] [varchar](50) NULL,
	[modidate] [datetime] NULL,
 CONSTRAINT [PK_msnews] PRIMARY KEY CLUSTERED 
(
	[idnews] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[msperiode]    Script Date: 2/5/2021 4:56:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[msperiode](
	[idperiode] [int] IDENTITY(1,1) NOT NULL,
	[tahunperiode] [varchar](10) NULL,
	[status] [int] NULL,
	[creaby] [varchar](50) NULL,
	[creadate] [datetime] NULL,
	[modiby] [varchar](50) NULL,
	[modidate] [datetime] NULL,
 CONSTRAINT [PK_msperiode] PRIMARY KEY CLUSTERED 
(
	[idperiode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[msukm_hima]    Script Date: 2/5/2021 4:56:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[msukm_hima](
	[idukm_hima] [int] IDENTITY(1,1) NOT NULL,
	[nama] [varchar](50) NULL,
	[status] [int] NULL,
	[creaby] [varchar](50) NULL,
	[creadate] [datetime] NULL,
	[modiby] [varchar](50) NULL,
	[modidate] [datetime] NULL,
 CONSTRAINT [PK_msukm_hima] PRIMARY KEY CLUSTERED 
(
	[idukm_hima] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[trkas]    Script Date: 2/5/2021 4:56:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[trkas](
	[idkas] [int] IDENTITY(1,1) NOT NULL,
	[idanggota] [int] NULL,
	[nominal] [int] NULL,
	[jeniskas] [varchar](50) NULL,
	[status] [int] NULL,
	[creaby] [varchar](50) NULL,
	[creadate] [datetime] NULL,
	[modiby] [varchar](50) NULL,
	[modidate] [datetime] NULL,
	[uplod_bukti] [varchar](max) NULL,
 CONSTRAINT [PK_trkas] PRIMARY KEY CLUSTERED 
(
	[idkas] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[trlaporanksk]    Script Date: 2/5/2021 4:56:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[trlaporanksk](
	[idlpksk] [int] IDENTITY(1,1) NOT NULL,
	[idukm_hima] [int] NULL,
	[namaberkas] [varchar](50) NULL,
	[keterangan] [varchar](max) NULL,
	[status] [int] NULL,
	[komentar] [varchar](max) NULL,
	[tglpresent] [datetime] NULL,
	[creaby] [varchar](50) NULL,
	[creadate] [datetime] NULL,
	[modiby] [varchar](50) NULL,
	[modidate] [datetime] NULL,
 CONSTRAINT [PK_trlaporanksk] PRIMARY KEY CLUSTERED 
(
	[idlpksk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[trnotulensi]    Script Date: 2/5/2021 4:56:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[trnotulensi](
	[idnotulensi] [int] IDENTITY(1,1) NOT NULL,
	[idrapat] [int] NULL,
	[jmlhadir] [int] NULL,
	[notulensi] [varchar](max) NULL,
	[creaby] [varchar](50) NULL,
	[creadate] [datetime] NULL,
	[modiby] [varchar](50) NULL,
	[modidate] [datetime] NULL,
	[status] [int] NULL,
 CONSTRAINT [PK_trnotulensi] PRIMARY KEY CLUSTERED 
(
	[idnotulensi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[trpengajuandana]    Script Date: 2/5/2021 4:56:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[trpengajuandana](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idanggota] [int] NULL,
	[event] [varchar](max) NULL,
	[tujuan] [varchar](max) NULL,
	[jumlah] [int] NULL,
	[status] [int] NULL,
	[creaby] [varchar](50) NULL,
	[creadate] [date] NULL,
	[modiby] [varchar](50) NULL,
	[modidate] [date] NULL,
	[kepada] [varchar](50) NULL,
	[Bukti_kirim] [varchar](max) NULL,
 CONSTRAINT [PK_trpengajuandana] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[trrapat]    Script Date: 2/5/2021 4:56:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[trrapat](
	[idrapat] [int] IDENTITY(1,1) NOT NULL,
	[iddepartemen] [int] NULL,
	[judulrapat] [varchar](50) NULL,
	[tglrapat] [datetime] NULL,
	[status] [int] NULL,
	[creaby] [varchar](50) NULL,
	[creadate] [datetime] NULL,
	[modiby] [varchar](50) NULL,
	[modidate] [datetime] NULL,
 CONSTRAINT [PK_trrapat] PRIMARY KEY CLUSTERED 
(
	[idrapat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[msanggotabem] ON 

INSERT [dbo].[msanggotabem] ([idanggota], [iddepartemen], [idjabatan], [idperiode], [nama], [nim], [alamat], [no_telp], [email], [password], [status], [creaby], [creadate], [modiby], [modidate], [foto]) VALUES (1, 1, 1, 3, N'Muhamad Ivan Firmansyah', N'0320190018', N'pemalang, jateng', N'085702348073', N'muhivanfirmansyah@gmail.com', N'polmanastra', 1, N'bambang', CAST(N'2021-01-18T00:00:00.000' AS DateTime), N'Muhamad Ivan Firmansyah', CAST(N'2021-01-30T18:04:35.340' AS DateTime), N'~/SaveImage/1396986552van.jpg')
INSERT [dbo].[msanggotabem] ([idanggota], [iddepartemen], [idjabatan], [idperiode], [nama], [nim], [alamat], [no_telp], [email], [password], [status], [creaby], [creadate], [modiby], [modidate], [foto]) VALUES (2, 1, 3, 2, N'daryanto', N'0320190022', N'Jakarta', N'082322320234', N'firmadf2@gmail.com', N'IWAIUNJC', 1, N'muhmad ivan', CAST(N'2021-01-18T17:11:08.373' AS DateTime), N'muhamad ivan firmansyah', CAST(N'2021-01-27T14:07:03.303' AS DateTime), N'~/SaveImage/917956557bph phoenix.jpg')
INSERT [dbo].[msanggotabem] ([idanggota], [iddepartemen], [idjabatan], [idperiode], [nama], [nim], [alamat], [no_telp], [email], [password], [status], [creaby], [creadate], [modiby], [modidate], [foto]) VALUES (3, 2, 7, 3, N'Romi Muhyiddin dds', N'0220190026', N'Pekalongan okelah', N'082322320234', N'romi.omera07@gmail.com', N'fghfghcgh', 1, N'dfgdh', CAST(N'2021-01-18T00:00:00.000' AS DateTime), N'Muhamad Ivan Firmansyah', CAST(N'2021-01-31T04:16:47.640' AS DateTime), N'~/SaveImage/917956557bph phoenix.jpg')
INSERT [dbo].[msanggotabem] ([idanggota], [iddepartemen], [idjabatan], [idperiode], [nama], [nim], [alamat], [no_telp], [email], [password], [status], [creaby], [creadate], [modiby], [modidate], [foto]) VALUES (4, 2, 1, 2, N'Rifky Muhazirin', N'0320190017', N'Jakarta', N'085702348077', N'firmansyahivan382@gmail.com', N'polman', 1, N'dgdfhdfh', CAST(N'2018-01-18T00:00:00.000' AS DateTime), N'muhmad ivan', CAST(N'2021-01-18T22:23:29.373' AS DateTime), N'~/SaveImage/917956557bph phoenix.jpg')
INSERT [dbo].[msanggotabem] ([idanggota], [iddepartemen], [idjabatan], [idperiode], [nama], [nim], [alamat], [no_telp], [email], [password], [status], [creaby], [creadate], [modiby], [modidate], [foto]) VALUES (5, 1, 2, 3, N'Romi Muhyiddin', N'0320190002', N'Jakarta', N'08232232', N'fsyah8912@gmail.com', N'polman', 1, N'muhamad ivan firmansyah', CAST(N'2021-01-19T05:08:11.330' AS DateTime), N'Aditya Surya', CAST(N'2021-01-31T03:55:38.587' AS DateTime), N'~/SaveImage/1033089021Romi Muhyiddin_PMO.jpg')
INSERT [dbo].[msanggotabem] ([idanggota], [iddepartemen], [idjabatan], [idperiode], [nama], [nim], [alamat], [no_telp], [email], [password], [status], [creaby], [creadate], [modiby], [modidate], [foto]) VALUES (6, 1, 1, 1, N'Shifa habibah anl', N'0320190028', N'Pemalang', N'085848634740', N'na.jaemin@gmail.com', N'DSHV5QTI', 0, N'muhamad ivan firmansyah', CAST(N'2021-01-20T04:10:23.457' AS DateTime), N'muhamad ivan firmansyah', CAST(N'2021-01-20T04:10:23.457' AS DateTime), N'~/SaveImage/917956557bph phoenix.jpg')
INSERT [dbo].[msanggotabem] ([idanggota], [iddepartemen], [idjabatan], [idperiode], [nama], [nim], [alamat], [no_telp], [email], [password], [status], [creaby], [creadate], [modiby], [modidate], [foto]) VALUES (7, 3, 5, 3, N'Shifa habibah', N'0320190030', N'Pemalang', N'085848634740', N'h.renjun@gmail.com', N'2OEQ934H', 1, N'muhamad ivan firmansyah', CAST(N'2021-01-20T04:12:29.310' AS DateTime), N'Shifa habibah', CAST(N'2021-01-31T03:51:19.527' AS DateTime), N'~/SaveImage/47313618TKBG_PUTRI SHEILA .jpg')
INSERT [dbo].[msanggotabem] ([idanggota], [iddepartemen], [idjabatan], [idperiode], [nama], [nim], [alamat], [no_telp], [email], [password], [status], [creaby], [creadate], [modiby], [modidate], [foto]) VALUES (8, 2, 6, 3, N'M Rizky Maulana', N'0320190018', N'Pemalang', N'08978765676', N'sw.pujiati@gmail.com', N'A4MYDZBZ', 1, N'muhamad ivan firmansyah', CAST(N'2021-01-20T04:27:51.463' AS DateTime), N'Muhamad Ivan Firmansyah', CAST(N'2021-01-30T14:49:59.227' AS DateTime), N'~/SaveImage/917956557bph phoenix.jpg')
INSERT [dbo].[msanggotabem] ([idanggota], [iddepartemen], [idjabatan], [idperiode], [nama], [nim], [alamat], [no_telp], [email], [password], [status], [creaby], [creadate], [modiby], [modidate], [foto]) VALUES (9, 3, 7, 2, N'Pujiati', N'0320200022', N'Pemalang', N'085848634', N'jeno.lee@gmail.com', N'pujiati', 1, N'muhamad ivan firmansyah', CAST(N'2021-01-20T11:10:18.950' AS DateTime), N'Pujiati', CAST(N'2021-01-31T03:47:18.957' AS DateTime), N'~/SaveImage/1695675394Elora Manuella Amei_MI.jpg')
INSERT [dbo].[msanggotabem] ([idanggota], [iddepartemen], [idjabatan], [idperiode], [nama], [nim], [alamat], [no_telp], [email], [password], [status], [creaby], [creadate], [modiby], [modidate], [foto]) VALUES (17, 5, 6, 3, N'Samodra', N'0320190026', N'Ponorogo', N'082322320234', N'muehivanfirmansyah@gmail.com', N'46DEG15G', 1, N'Muhamad Ivan Firmansyah', CAST(N'2021-01-31T14:42:57.490' AS DateTime), N'Samodr', CAST(N'2021-01-31T14:53:44.433' AS DateTime), N'~/SaveImage/1985469111Irfan widiantoro.jpg')
INSERT [dbo].[msanggotabem] ([idanggota], [iddepartemen], [idjabatan], [idperiode], [nama], [nim], [alamat], [no_telp], [email], [password], [status], [creaby], [creadate], [modiby], [modidate], [foto]) VALUES (18, 4, 5, 3, N'Salsabila', N'0320190025', N'Jakarta', N'082322320234', N'jenso.lee@gmail.com', N'UK7AEYU2', 1, N'Muhamad Ivan Firmansyah', CAST(N'2021-01-31T14:44:10.387' AS DateTime), N'Muhamad Ivan Firmansyah', NULL, N'')
INSERT [dbo].[msanggotabem] ([idanggota], [iddepartemen], [idjabatan], [idperiode], [nama], [nim], [alamat], [no_telp], [email], [password], [status], [creaby], [creadate], [modiby], [modidate], [foto]) VALUES (19, 4, 6, 3, N'Kayu', N'4353456463', N'3455', N'346436457457', N'Le22mari@gmail.com', N'YKA5IIOP', 1, N'Muhamad Ivan Firmansyah', CAST(N'2021-02-01T07:55:16.520' AS DateTime), N'Muhamad Ivan Firmansyah', CAST(N'2021-02-01T07:55:31.730' AS DateTime), N'~/SaveImage/1407249354der.png')
SET IDENTITY_INSERT [dbo].[msanggotabem] OFF
SET IDENTITY_INSERT [dbo].[msdepartemen] ON 

INSERT [dbo].[msdepartemen] ([iddepartemen], [namadepartemen], [status], [creaby], [creadate], [modiby], [modidate]) VALUES (1, N'BPH UMUM', 1, N'muhamad ivan', CAST(N'2021-01-18T00:00:00.000' AS DateTime), N'muhamad ivan firmansyah', CAST(N'2021-01-19T12:15:31.083' AS DateTime))
INSERT [dbo].[msdepartemen] ([iddepartemen], [namadepartemen], [status], [creaby], [creadate], [modiby], [modidate]) VALUES (2, N'Sosial dan Pengabdian Masyarakat', 1, N'muhamad ivan', CAST(N'2021-01-18T00:00:00.000' AS DateTime), N'muhamad ivan', CAST(N'2021-01-18T00:00:00.000' AS DateTime))
INSERT [dbo].[msdepartemen] ([iddepartemen], [namadepartemen], [status], [creaby], [creadate], [modiby], [modidate]) VALUES (3, N'Teknokasi Informasi dan Komunikasi', 1, N'muhamad ivan firmansyah', CAST(N'2021-01-19T11:51:41.310' AS DateTime), N'Muhamad Ivan', CAST(N'2021-01-30T05:22:54.450' AS DateTime))
INSERT [dbo].[msdepartemen] ([iddepartemen], [namadepartemen], [status], [creaby], [creadate], [modiby], [modidate]) VALUES (4, N'Olahraga dan Kesenian', 1, N'Muhamad Ivan', CAST(N'2021-01-30T05:24:00.650' AS DateTime), N'Muhamad Ivan', NULL)
INSERT [dbo].[msdepartemen] ([iddepartemen], [namadepartemen], [status], [creaby], [creadate], [modiby], [modidate]) VALUES (5, N'Hima & Ikatan Alumni', 1, N'Muhamad Ivan', CAST(N'2021-01-30T05:24:00.650' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[msdepartemen] OFF
SET IDENTITY_INSERT [dbo].[msformatksk] ON 

INSERT [dbo].[msformatksk] ([idftksk], [nama], [status], [creaby], [creadate], [modiby], [modidate], [dataBerkas]) VALUES (3, N'LPJ KEUANGAN 12', 1, N'samodra', CAST(N'2021-01-25T02:22:24.207' AS DateTime), N'muhamad ivan firmansyah', CAST(N'2021-01-26T14:06:20.913' AS DateTime), N'FORMAT LPJ Keuangan BARU.xls')
INSERT [dbo].[msformatksk] ([idftksk], [nama], [status], [creaby], [creadate], [modiby], [modidate], [dataBerkas]) VALUES (4, N'LPJ KESEKRETARIATAN', 1, N'samodra', CAST(N'2021-01-25T02:22:44.710' AS DateTime), N'samodra', CAST(N'2021-01-25T02:22:44.710' AS DateTime), N'FORMAT OSP BARU B. Indo 1920.xls')
INSERT [dbo].[msformatksk] ([idftksk], [nama], [status], [creaby], [creadate], [modiby], [modidate], [dataBerkas]) VALUES (5, N'Gergaji', 0, N'muhamad ivan firmansyah', CAST(N'2021-01-26T11:39:37.787' AS DateTime), NULL, NULL, N'023 Undangan Kepala Departemen Kemahasiswaan dan Ikatan Alumni.docx')
SET IDENTITY_INSERT [dbo].[msformatksk] OFF
SET IDENTITY_INSERT [dbo].[msjabatan] ON 

INSERT [dbo].[msjabatan] ([idjabatan], [idukm_hima], [namajabatan], [status], [creaby], [creadate], [modiby], [modidate]) VALUES (1, 0, N'Admin', 1, N'muhamad ivan', CAST(N'2021-01-18T00:00:00.000' AS DateTime), N'muhamad ivan firmansyah', CAST(N'2021-01-25T00:54:47.053' AS DateTime))
INSERT [dbo].[msjabatan] ([idjabatan], [idukm_hima], [namajabatan], [status], [creaby], [creadate], [modiby], [modidate]) VALUES (2, 0, N'Presiden BEM', 1, N'muhamad ivan', CAST(N'2021-01-18T00:00:00.000' AS DateTime), N'muhamad ivan firmansyah', CAST(N'2021-01-25T00:54:54.283' AS DateTime))
INSERT [dbo].[msjabatan] ([idjabatan], [idukm_hima], [namajabatan], [status], [creaby], [creadate], [modiby], [modidate]) VALUES (3, 0, N'Wakil Presiden BEM', 2, N'muhamad ivan', CAST(N'2021-01-18T00:00:00.000' AS DateTime), N'muhamad ivan', CAST(N'2021-01-18T00:00:00.000' AS DateTime))
INSERT [dbo].[msjabatan] ([idjabatan], [idukm_hima], [namajabatan], [status], [creaby], [creadate], [modiby], [modidate]) VALUES (4, 2, N'SEKRETARIS UMUM 1 ', 0, N'muhamad ivan firmansyah', CAST(N'2021-01-19T16:16:39.203' AS DateTime), N'muhamad ivan firmansyah', CAST(N'2021-01-19T16:17:43.360' AS DateTime))
INSERT [dbo].[msjabatan] ([idjabatan], [idukm_hima], [namajabatan], [status], [creaby], [creadate], [modiby], [modidate]) VALUES (5, 3, N'PIC HIMA MI', 1, N'muhamad ivan firmansyah', CAST(N'2021-01-25T00:55:56.770' AS DateTime), N'muhamad ivan firmansyah', CAST(N'2021-01-25T00:55:56.770' AS DateTime))
INSERT [dbo].[msjabatan] ([idjabatan], [idukm_hima], [namajabatan], [status], [creaby], [creadate], [modiby], [modidate]) VALUES (6, 6, N'PIC Robotik', 1, N'muhamad ivan firmansyah', CAST(N'2021-01-25T01:01:46.613' AS DateTime), N'muhamad ivan firmansyah', CAST(N'2021-01-25T01:01:46.613' AS DateTime))
INSERT [dbo].[msjabatan] ([idjabatan], [idukm_hima], [namajabatan], [status], [creaby], [creadate], [modiby], [modidate]) VALUES (7, 0, N'Sekretaris Departemen', 1, N'muhamad ivan firmansyah', CAST(N'2021-01-25T01:02:29.347' AS DateTime), N'muhamad ivan firmansyah', CAST(N'2021-01-25T01:02:29.347' AS DateTime))
SET IDENTITY_INSERT [dbo].[msjabatan] OFF
SET IDENTITY_INSERT [dbo].[msnews] ON 

INSERT [dbo].[msnews] ([idnews], [judul], [preview], [deskripsi], [gambar], [status], [creaby], [creadate], [modiby], [modidate]) VALUES (1, N'BPH Phoenix', N'Informasi mengenai Badan Pengurus Harian', N'<p style="margin: 0px 0px 10px; font-family: Ubuntu, sans-serif; font-size: 14px; text-align: justify;">Majelis Permusyawaratan Mahasiswa adalah Lembaga Kemahasiswaan Tertinggi yang merupakan perwakilan dari mahasiswa setiap program studi dan perwakilan mahasiswa yang dipilih. MPM berfungsi sebagai Lembaga Legislatif dan Yudikatif</p>
<p style="margin: 0px 0px 10px; font-family: Ubuntu, sans-serif; font-size: 14px; text-align: justify;"><strong>Tugas Pokok dan Fungsi Organisasi</strong></p>
<ol>
<li>Menentukan Visi dan Misi MPM Membuat Ketetapan Garis-garis Besar Haluan</li>
<li>Kerja Organisasi Kemahasiswaan sesuai dengan Visi dan Misi STIKes DHB</li>
<li>Membuat Program Kerja MPM</li>
<li>Melaksanakan Pemilihan Umum Raya untuk memilih Anggota MPM dan Ketua BEM.</li>
<li>Melaksanakan pengawasan pada organisasi kemahasiswaan</li>
<li>Membuat dan menetapkan Tata Tertib/Peraturan Organisasi Kemahasiswaan</li>
<li>Mensyahkan pembentukan, pembekuan, dan pembubaran UKM</li>
<li>Membuat laporan pertanggungjawaban kegiatan</li>
</ol>', N'~/SaveImage/917956557bph phoenix.jpg', 1, N'muhamad ivan firmansyah', CAST(N'2021-01-26T12:33:05.550' AS DateTime), N'Muhamad Ivan Firmansyah', CAST(N'2021-02-02T13:15:30.277' AS DateTime))
INSERT [dbo].[msnews] ([idnews], [judul], [preview], [deskripsi], [gambar], [status], [creaby], [creadate], [modiby], [modidate]) VALUES (2, N'Logo Baru BEM', N'agaha', N'<p style="margin: 0.5em 0px; color: #202122; font-family: sans-serif; font-size: 14px; text-align: center;"><strong>Badan eksekutif mahasiswa</strong>&nbsp;(disingkat&nbsp;<strong>BEM</strong>)&nbsp;</p>
<p style="margin: 0.5em 0px; color: #202122; font-family: sans-serif; font-size: 14px;">Merupakan&nbsp;<a style="text-decoration-line: none; color: #0b0080; background: none;" title="Organisasi mahasiswa" href="https://id.wikipedia.org/wiki/Organisasi_mahasiswa">organisasi mahasiswa</a>&nbsp;intra kampus yang merupakan lembaga&nbsp;<a style="text-decoration-line: none; color: #0b0080; background: none;" title="Eksekutif" href="https://id.wikipedia.org/wiki/Eksekutif">eksekutif</a>&nbsp;di tingkat&nbsp;<a class="mw-redirect" style="text-decoration-line: none; color: #0b0080; background: none;" title="Pendidikan tinggi" href="https://id.wikipedia.org/wiki/Pendidikan_tinggi">pendidikan tinggi</a>. Dalam melaksanakan program-programnya, umumnya BEM memiliki beberapa kementerian dan departemen.</p>
<p style="margin: 0.5em 0px; color: #202122; font-family: sans-serif; font-size: 14px;">Berbeda dengan himpunan mahasiswa di setiap jurusan, cakupan atau ruang lingkup Badan Eksekutif Mahasiswa bisa lebih luas mencakup satu fakultas atau satu perguruan tinggi. Dalam hal ini Badan Eksekutif Mahasiswa mengadaptasi&nbsp;<a style="text-decoration-line: none; color: #0b0080; background: none;" title="Eksekutif" href="https://id.wikipedia.org/wiki/Eksekutif">eksekutif</a>&nbsp;dalam&nbsp;<a class="mw-redirect" style="text-decoration-line: none; color: #0b0080; background: none;" title="Pemerintahan" href="https://id.wikipedia.org/wiki/Pemerintahan">pemerintahan</a>&nbsp;yang bertanggung jawab untuk menerapkan&nbsp;<a style="text-decoration-line: none; color: #0b0080; background: none;" title="Hukum" href="https://id.wikipedia.org/wiki/Hukum">hukum</a>&nbsp;atau kebijakan lainnya yang berlaku pada suatu&nbsp;<a style="text-decoration-line: none; color: #0b0080; background: none;" title="Fakultas" href="https://id.wikipedia.org/wiki/Fakultas">fakultas</a>&nbsp;atau pun pada suatu&nbsp;<a style="text-decoration-line: none; color: #0b0080; background: none;" title="Perguruan tinggi" href="https://id.wikipedia.org/wiki/Perguruan_tinggi">perguruan tinggi</a>.</p>
<p style="margin: 0.5em 0px; color: #202122; font-family: sans-serif; font-size: 14px;"><a style="text-decoration-line: none; color: #0b0080; background: none;" title="Organisasi mahasiswa" href="https://id.wikipedia.org/wiki/Organisasi_mahasiswa">Organisasi mahasiswa</a>&nbsp;intra kampus selain BEM, adalah&nbsp;<a style="text-decoration-line: none; color: #0b0080; background: none;" title="Senat mahasiswa" href="https://id.wikipedia.org/wiki/Senat_mahasiswa">senat mahasiswa</a>,&nbsp;<a style="text-decoration-line: none; color: #0b0080; background: none;" title="Unit kegiatan mahasiswa" href="https://id.wikipedia.org/wiki/Unit_kegiatan_mahasiswa">unit kegiatan mahasiswa</a>, dan&nbsp;<a style="text-decoration-line: none; color: #0b0080; background: none;" title="Himpunan mahasiswa jurusan" href="https://id.wikipedia.org/wiki/Himpunan_mahasiswa_jurusan">himpunan mahasiswa jurusan</a>. Ada atau tidaknya masing-masing, bergantung pada dinamika mahasiswa di setiap kampus.</p>
<p style="margin: 0.5em 0px; color: #202122; font-family: sans-serif; font-size: 14px;">Badan eksekutif mahasiswa seringkali dianggap sebagai versi perguruan tinggi dari&nbsp;<a class="new" style="text-decoration-line: none; color: #a55858; background: none;" title="Organisasi Siswa Intrasekolah (halaman belum tersedia)" href="https://id.wikipedia.org/w/index.php?title=Organisasi_Siswa_Intrasekolah&amp;action=edit&amp;redlink=1">Organisasi Siswa Intrasekolah</a>&nbsp;(OSIS).</p>', N'~/SaveImage/1564061226logo_bem.png', 0, N'muhamad ivan firmansyah', CAST(N'2021-01-26T12:34:12.537' AS DateTime), N'Muhamad Ivan', CAST(N'2021-01-30T08:28:44.883' AS DateTime))
INSERT [dbo].[msnews] ([idnews], [judul], [preview], [deskripsi], [gambar], [status], [creaby], [creadate], [modiby], [modidate]) VALUES (12, N'Open Donasi RUmah OKI', N'Ayo Bersedekah', N'<p style="text-align: justify;"><span style="color: rgb(38, 38, 38); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Helvetica, Arial, sans-serif; font-size: 14px;">[Bantu Renovasi Kelas Belajar Oky]??</span><br style="color: rgb(38, 38, 38); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Helvetica, Arial, sans-serif; font-size: 14px;" /><span style="color: rgb(38, 38, 38); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Helvetica, Arial, sans-serif; font-size: 14px;">??</span><span style="color: rgb(38, 38, 38); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Helvetica, Arial, sans-serif; font-size: 14px;">Melihat kondisi sosial anak-anak di daerah Cilincing menjadi perhatian bagi kita untuk tidak bisa bertutup mata. ??</span><span style="color: rgb(38, 38, 38); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Helvetica, Arial, sans-serif; font-size: 14px;">??</span><br style="color: rgb(38, 38, 38); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Helvetica, Arial, sans-serif; font-size: 14px;" /><span style="color: rgb(38, 38, 38); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Helvetica, Arial, sans-serif; font-size: 14px;">Pendidikan harusnya menjadi hak bagi setiap anak untuk mendapatkannya. Namun, kondisi ekonomi dan faktor lain membuat anak-anak daerah Cilincing rentan putus sekolah atau bahkan putus sekolah.??&nbsp;</span><span style="color: rgb(38, 38, 38); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Helvetica, Arial, sans-serif; font-size: 14px;">Kelas Belajar Oky merupakan tindakan nyata tumbuhnya rasa peduli terhadap mereka. Kini, Kelas Belajar Oky kondisinya rapuh dan kurang memiliki fungsi pakai.??&nbsp;</span><span style="color: rgb(38, 38, 38); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Helvetica, Arial, sans-serif; font-size: 14px;">Oleh karena itu, mari bersama kita tumbuhkan rasa peduli untuk saling berbagi. Dengan bantu renovasi Kelas Belajar Oky, agar anak-anak daerah Cilincing dapat kembali mendapatkan sokongan pendidikan.??</span><br style="color: rgb(38, 38, 38); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Helvetica, Arial, sans-serif; font-size: 14px;" /><span style="color: rgb(38, 38, 38); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Helvetica, Arial, sans-serif; font-size: 14px;">??</span><br style="color: rgb(38, 38, 38); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Helvetica, Arial, sans-serif; font-size: 14px;" /><span style="color: rgb(38, 38, 38); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Helvetica, Arial, sans-serif; font-size: 14px;">Kirim Donasi Anda melalui link berikut :??</span><br style="color: rgb(38, 38, 38); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Helvetica, Arial, sans-serif; font-size: 14px;" /><span style="color: rgb(38, 38, 38); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Helvetica, Arial, sans-serif; font-size: 14px;">https://kitabisa.com/campaign/renovkelasoky??</span><br style="color: rgb(38, 38, 38); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Helvetica, Arial, sans-serif; font-size: 14px;" /><span style="color: rgb(38, 38, 38); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Helvetica, Arial, sans-serif; font-size: 14px;">Link video : ??</span><br style="color: rgb(38, 38, 38); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Helvetica, Arial, sans-serif; font-size: 14px;" /><span style="color: rgb(38, 38, 38); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Helvetica, Arial, sans-serif; font-size: 14px;">https://drive.google.com/file/d/1mEFivczAuM8hVZ6h2r8H6JjvDMc6QmB1/view?usp=sharing??</span><br style="color: rgb(38, 38, 38); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Helvetica, Arial, sans-serif; font-size: 14px;" /><br style="color: rgb(38, 38, 38); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Helvetica, Arial, sans-serif; font-size: 14px;" /><span style="color: rgb(38, 38, 38); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Helvetica, Arial, sans-serif; font-size: 14px;">(Link ada di bio)</span><br style="color: rgb(38, 38, 38); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Helvetica, Arial, sans-serif; font-size: 14px;" /><span style="color: rgb(38, 38, 38); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Helvetica, Arial, sans-serif; font-size: 14px;">??</span><br style="color: rgb(38, 38, 38); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Helvetica, Arial, sans-serif; font-size: 14px;" /><span style="color: rgb(38, 38, 38); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Helvetica, Arial, sans-serif; font-size: 14px;">Contact Person ??</span><br style="color: rgb(38, 38, 38); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Helvetica, Arial, sans-serif; font-size: 14px;" /><span style="color: rgb(38, 38, 38); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Helvetica, Arial, sans-serif; font-size: 14px;">?? Muhammad Hattabrani 0812-8335-0430??</span><br style="color: rgb(38, 38, 38); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Helvetica, Arial, sans-serif; font-size: 14px;" /><span style="color: rgb(38, 38, 38); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Helvetica, Arial, sans-serif; font-size: 14px;">??</span><br style="color: rgb(38, 38, 38); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Helvetica, Arial, sans-serif; font-size: 14px;" /><span style="color: rgb(38, 38, 38); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Helvetica, Arial, sans-serif; font-size: 14px;">&copy;BEM Polman Astra 2020???????</span><br style="color: rgb(38, 38, 38); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Helvetica, Arial, sans-serif; font-size: 14px;" /><span style="color: rgb(38, 38, 38); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Helvetica, Arial, sans-serif; font-size: 14px;">Tim Galang Dana??</span></p>', N'~/SaveImage/632919346rumahoki.PNG', 1, N'Muhamad Ivan', CAST(N'2021-01-30T08:32:07.060' AS DateTime), NULL, NULL)
INSERT [dbo].[msnews] ([idnews], [judul], [preview], [deskripsi], [gambar], [status], [creaby], [creadate], [modiby], [modidate]) VALUES (13, N'Berkah Ramadan', N'polman', N'<p style="text-align: center;"><span style="text-decoration: underline;"><strong>halo saya mahasiswa polman astra</strong></span></p>', N'~/SaveImage/262307610Logo_Polman.png', 1, N'Muhamad Ivan Firmansyah', CAST(N'2021-02-01T14:38:18.820' AS DateTime), NULL, NULL)
INSERT [dbo].[msnews] ([idnews], [judul], [preview], [deskripsi], [gambar], [status], [creaby], [creadate], [modiby], [modidate]) VALUES (14, N'Bantu Korban Bajir', N'Badan Nasional Penanggulangan Bencana (BNPB) melaporkan tiga kecamatan di Kabupaten Kudus, Jawa tengah terendam banjir pada', N'<p style="box-sizing: border-box; color: #444444; font-family: AcuminPro, arial, helvetica, sans-serif; font-size: 15px;">"Korban Susminarti&nbsp;ditemukan sekitar 1 kilometer dari tempat tinggalnya yang kini sudah rata dengan tanah," katanya dikutip dari Antara, Kamis (4/2/2021).&nbsp;</p>
<p style="box-sizing: border-box; color: #444444; font-family: AcuminPro, arial, helvetica, sans-serif; font-size: 15px;">Ia mengatakan, masyarakat yang menemukan keberadaan korban, langsung melakukan evakuasi dengan kantong jenazah ke RS Asih Abyakta.&nbsp;Sementara korban hilang yang bernama Nanda Zeni Sekar Arum ditemukan di Dusun Tempel, Desa Legok, Kecamatan Gempol, Kabupaten Pasuruan.&nbsp;</p>
<p style="box-sizing: border-box; color: #444444; font-family: AcuminPro, arial, helvetica, sans-serif; font-size: 15px;">"Korban kedua ditemukan beberapa kilometer dari tempat kejadian. Kini keduanya sudah disalatkan dan dimakamkan di tempat pemakaman umum setempat," ujarnya.&nbsp;</p>
<p style="box-sizing: border-box; color: #444444; font-family: AcuminPro, arial, helvetica, sans-serif; font-size: 15px;">Ia mengatakan&nbsp;akibat kejadian banjir bandang itu, sebanyak enam rumah rata dengan tanah akibat terseret<a style="box-sizing: border-box; background-color: transparent; color: #ff3300; text-decoration-line: none;" title=" banjir" href="https://www.liputan6.com/news/read/4474422/kudus-dilanda-banjir-10672-jiwa-terdampak">&nbsp;banjir</a>, sebelas rumah mengalami kerusakan berat dan sebanyak 13 rumah mengalami kerusakan sedang.&nbsp;</p>
<p style="box-sizing: border-box; color: #444444; font-family: AcuminPro, arial, helvetica, sans-serif; font-size: 15px;">Di lokasi kejadian, warga menggelar tahlil kepada kedua korban sebelum dikuburkan di pemakaman umum. Beberapa anggota keluarga juga tampak menangis atas kepergian anggota keluarganya. Bahkan ada salah satu keluarga yang pingsan di dekat jenazah dua korban tersebut.&nbsp;</p>', N'~/SaveImage/885096205MACIL [08-09 Feb]_201214_0420.jpg', 1, N'Muhamad Ivan Firmansyah', CAST(N'2021-02-05T14:26:26.557' AS DateTime), N'Muhamad Ivan Firmansyah', CAST(N'2021-02-05T14:26:51.420' AS DateTime))
SET IDENTITY_INSERT [dbo].[msnews] OFF
SET IDENTITY_INSERT [dbo].[msperiode] ON 

INSERT [dbo].[msperiode] ([idperiode], [tahunperiode], [status], [creaby], [creadate], [modiby], [modidate]) VALUES (1, N'2017/2018', 0, N'muhamad ivan', CAST(N'2021-01-18T00:00:00.000' AS DateTime), N'muhamad ivan', CAST(N'2021-01-18T00:00:00.000' AS DateTime))
INSERT [dbo].[msperiode] ([idperiode], [tahunperiode], [status], [creaby], [creadate], [modiby], [modidate]) VALUES (2, N'2018/2019', 1, N'muhamad ivan', CAST(N'2021-01-18T00:00:00.000' AS DateTime), N'muhamad ivan', CAST(N'2021-01-18T00:00:00.000' AS DateTime))
INSERT [dbo].[msperiode] ([idperiode], [tahunperiode], [status], [creaby], [creadate], [modiby], [modidate]) VALUES (3, N'2019/2020', 1, N'muhamad ivan', CAST(N'2021-01-18T00:00:00.000' AS DateTime), N'muhamad ivan', CAST(N'2021-01-18T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[msperiode] OFF
SET IDENTITY_INSERT [dbo].[msukm_hima] ON 

INSERT [dbo].[msukm_hima] ([idukm_hima], [nama], [status], [creaby], [creadate], [modiby], [modidate],[iddepartemen]) VALUES (0, N'Tidak Ada', 1, N'muhamad ivan', CAST(N'2021-01-18T00:00:00.000' AS DateTime), N'muhamad ivan', CAST(N'2021-01-18T00:00:00.000' AS DateTime),3)
INSERT [dbo].[msukm_hima] ([idukm_hima], [nama], [status], [creaby], [creadate], [modiby], [modidate],[iddepartemen]) VALUES (1, N'Pembuatan Peralatan dan Perkakas Produksi', 1, N'muhamad ivan', CAST(N'2021-01-18T00:00:00.000' AS DateTime), N'muhamad ivan', CAST(N'2021-01-18T00:00:00.000' AS DateTime),3)
INSERT [dbo].[msukm_hima] ([idukm_hima], [nama], [status], [creaby], [creadate], [modiby], [modidate],[iddepartemen]) VALUES (2, N'Teknik Produksi dan Proses Manufaktur', 1, N'pujiati', CAST(N'2021-01-18T00:00:00.000' AS DateTime), N'pujiati', CAST(N'2021-01-18T00:00:00.000' AS DateTime),3)
INSERT [dbo].[msukm_hima] ([idukm_hima], [nama], [status], [creaby], [creadate], [modiby], [modidate],[iddepartemen]) VALUES (3, N'Manajemen Informatika', 1, N'muhamad ivan', CAST(N'2021-01-18T00:00:00.000' AS DateTime), N'muhamad ivan', CAST(N'2021-01-18T00:00:00.000' AS DateTime),3)
INSERT [dbo].[msukm_hima] ([idukm_hima], [nama], [status], [creaby], [creadate], [modiby], [modidate],[iddepartemen]) VALUES (4, N'Mesin Otomotif', 1, N'muhamad ivan firmansyah', CAST(N'2021-01-25T00:57:27.030' AS DateTime), N'muhamad ivan firmansyah', CAST(N'2021-01-25T00:59:10.697' AS DateTime),3)
INSERT [dbo].[msukm_hima] ([idukm_hima], [nama], [status], [creaby], [creadate], [modiby], [modidate],[iddepartemen]) VALUES (5, N'Mekatronika', 1, N'muhamad ivan firmansyah', CAST(N'2021-01-25T01:00:54.827' AS DateTime), N'muhamad ivan firmansyah', CAST(N'2021-01-25T01:00:54.827' AS DateTime),3)
INSERT [dbo].[msukm_hima] ([idukm_hima], [nama], [status], [creaby], [creadate], [modiby], [modidate],[iddepartemen]) VALUES (6, N'Robotik', 1, N'muhamad ivan firmansyah', CAST(N'2021-01-25T01:01:14.690' AS DateTime), N'muhamad ivan firmansyah', CAST(N'2021-01-25T01:01:14.690' AS DateTime),3)
INSERT [dbo].[msukm_hima] ([idukm_hima], [nama], [status], [creaby], [creadate], [modiby], [modidate],[iddepartemen]) VALUES (7, N'Jurnalistik', 1, N'muhamad ivan firmansyah', CAST(N'2021-01-25T01:01:27.723' AS DateTime), N'muhamad ivan firmansyah', CAST(N'2021-01-25T01:01:27.723' AS DateTime),3)
SET IDENTITY_INSERT [dbo].[msukm_hima] OFF
SET IDENTITY_INSERT [dbo].[trkas] ON 

INSERT [dbo].[trkas] ([idkas], [idanggota], [nominal], [jeniskas], [status], [creaby], [creadate], [modiby], [modidate], [uplod_bukti]) VALUES (1, 1, 100000, N'BEM', 3, N'dgdfhdfh', CAST(N'2021-01-25T18:35:58.930' AS DateTime), NULL, CAST(N'2021-01-26T23:54:29.000' AS DateTime), NULL)
INSERT [dbo].[trkas] ([idkas], [idanggota], [nominal], [jeniskas], [status], [creaby], [creadate], [modiby], [modidate], [uplod_bukti]) VALUES (2, 22, 10000, N'Departemen', 3, N'dgdfhdfh', CAST(N'2021-01-25T18:54:21.957' AS DateTime), NULL, CAST(N'2021-01-26T23:05:54.573' AS DateTime), NULL)
INSERT [dbo].[trkas] ([idkas], [idanggota], [nominal], [jeniskas], [status], [creaby], [creadate], [modiby], [modidate], [uplod_bukti]) VALUES (3, 23, 10000, N'BEM', 1, N'dgdfhdfh', CAST(N'2021-01-25T19:05:39.157' AS DateTime), N'M Rizky Maulana', CAST(N'2021-01-26T06:44:07.523' AS DateTime), NULL)
INSERT [dbo].[trkas] ([idkas], [idanggota], [nominal], [jeniskas], [status], [creaby], [creadate], [modiby], [modidate], [uplod_bukti]) VALUES (4, 24, 30000, N'Departemen', 1, N'M Rizky Maulana', CAST(N'2021-01-25T19:44:06.847' AS DateTime), N'M Rizky Maulana', CAST(N'2021-01-27T17:12:48.257' AS DateTime), N'')
INSERT [dbo].[trkas] ([idkas], [idanggota], [nominal], [jeniskas], [status], [creaby], [creadate], [modiby], [modidate], [uplod_bukti]) VALUES (5, 1, 20000, N'BEM', 3, N'Shifa habibah anl', CAST(N'2021-01-26T05:18:46.507' AS DateTime), N'Shifa habibah anl', CAST(N'2021-01-27T17:06:32.750' AS DateTime), N'')
INSERT [dbo].[trkas] ([idkas], [idanggota], [nominal], [jeniskas], [status], [creaby], [creadate], [modiby], [modidate], [uplod_bukti]) VALUES (6, 22, 1000, N'BEM', 1, N'M Rizky Maulana', CAST(N'2021-01-26T06:23:32.980' AS DateTime), N'M Rizky Maulana', CAST(N'2021-01-27T17:43:10.270' AS DateTime), N'')
INSERT [dbo].[trkas] ([idkas], [idanggota], [nominal], [jeniskas], [status], [creaby], [creadate], [modiby], [modidate], [uplod_bukti]) VALUES (7, 23, 5000, N'Departemen', 1, N'M Rizky Maulana', CAST(N'2021-01-26T06:25:03.510' AS DateTime), NULL, NULL, N'')
INSERT [dbo].[trkas] ([idkas], [idanggota], [nominal], [jeniskas], [status], [creaby], [creadate], [modiby], [modidate], [uplod_bukti]) VALUES (8, 24, 12000, N'Departemen', 3, N'Shifa habibah anl', CAST(N'2021-01-26T09:06:07.707' AS DateTime), N'Shifa habibah anl', CAST(N'2021-01-27T16:52:26.930' AS DateTime), N'')
INSERT [dbo].[trkas] ([idkas], [idanggota], [nominal], [jeniskas], [status], [creaby], [creadate], [modiby], [modidate], [uplod_bukti]) VALUES (9, 22, 50000, N'BEM', 2, N'M Rizky Maulana', CAST(N'2021-01-26T15:33:28.337' AS DateTime), N'Pujiati', CAST(N'2021-01-27T18:02:48.797' AS DateTime), N'')
INSERT [dbo].[trkas] ([idkas], [idanggota], [nominal], [jeniskas], [status], [creaby], [creadate], [modiby], [modidate], [uplod_bukti]) VALUES (12, 23, 2000, N'BEM', 1, NULL, CAST(N'2021-01-27T16:08:26.463' AS DateTime), NULL, NULL, N'')
INSERT [dbo].[trkas] ([idkas], [idanggota], [nominal], [jeniskas], [status], [creaby], [creadate], [modiby], [modidate], [uplod_bukti]) VALUES (13, 24, 40000, N'BEM', 3, N'dgdfhdfh', CAST(N'2021-01-27T16:28:41.237' AS DateTime), N'aditya', CAST(N'2021-01-28T01:47:10.547' AS DateTime), N'')
INSERT [dbo].[trkas] ([idkas], [idanggota], [nominal], [jeniskas], [status], [creaby], [creadate], [modiby], [modidate], [uplod_bukti]) VALUES (14, 1, 20000, N'Departemen', 3, N'Shifa habibah anl', CAST(N'2021-01-27T16:29:18.667' AS DateTime), N'Pujiati', CAST(N'2021-01-28T01:43:40.503' AS DateTime), N'')
INSERT [dbo].[trkas] ([idkas], [idanggota], [nominal], [jeniskas], [status], [creaby], [creadate], [modiby], [modidate], [uplod_bukti]) VALUES (15, 22, 10000, N'Departemen', 1, N'M Rizky Maulana', CAST(N'2021-01-27T16:49:21.337' AS DateTime), NULL, NULL, N'')
INSERT [dbo].[trkas] ([idkas], [idanggota], [nominal], [jeniskas], [status], [creaby], [creadate], [modiby], [modidate], [uplod_bukti]) VALUES (16, 23, 10000, N'Departemen', 3, N'Pujiati', CAST(N'2021-01-27T18:08:09.823' AS DateTime), N'Pujiati', CAST(N'2021-01-27T18:10:13.333' AS DateTime), N'')
INSERT [dbo].[trkas] ([idkas], [idanggota], [nominal], [jeniskas], [status], [creaby], [creadate], [modiby], [modidate], [uplod_bukti]) VALUES (17, 24, 20000, N'BEM', 2, N'Pujiati', CAST(N'2021-01-27T18:12:37.897' AS DateTime), N'Pujiati', CAST(N'2021-01-27T18:12:47.513' AS DateTime), N'')
INSERT [dbo].[trkas] ([idkas], [idanggota], [nominal], [jeniskas], [status], [creaby], [creadate], [modiby], [modidate], [uplod_bukti]) VALUES (18, 24, 10000, N'Departemen', 3, N'Shifa habibah anl', CAST(N'2021-01-28T01:41:01.603' AS DateTime), N'Pujiati', CAST(N'2021-01-28T01:43:57.813' AS DateTime), N'')
INSERT [dbo].[trkas] ([idkas], [idanggota], [nominal], [jeniskas], [status], [creaby], [creadate], [modiby], [modidate], [uplod_bukti]) VALUES (19, 1, 5000, N'BEM', 3, N'Shifa habibah anl', CAST(N'2021-01-28T01:41:19.060' AS DateTime), N'aditya', CAST(N'2021-01-28T01:47:13.987' AS DateTime), N'')
INSERT [dbo].[trkas] ([idkas], [idanggota], [nominal], [jeniskas], [status], [creaby], [creadate], [modiby], [modidate], [uplod_bukti]) VALUES (20, 22, 3000, N'Departemen', 3, N'Pujiati', CAST(N'2021-01-28T01:44:21.917' AS DateTime), N'Pujiati', CAST(N'2021-01-28T01:44:30.777' AS DateTime), N'')
INSERT [dbo].[trkas] ([idkas], [idanggota], [nominal], [jeniskas], [status], [creaby], [creadate], [modiby], [modidate], [uplod_bukti]) VALUES (21, 23, 4000, N'BEM', 2, N'aditya', CAST(N'2021-01-28T01:47:54.757' AS DateTime), N'aditya', CAST(N'2021-01-28T01:48:09.820' AS DateTime), N'')
INSERT [dbo].[trkas] ([idkas], [idanggota], [nominal], [jeniskas], [status], [creaby], [creadate], [modiby], [modidate], [uplod_bukti]) VALUES (22, 23, 20000, N'Departemen', 1, N'Shifa habibah', CAST(N'2021-01-30T08:21:15.773' AS DateTime), N'Shifa habibah', CAST(N'2021-01-30T08:22:04.317' AS DateTime), N'')
INSERT [dbo].[trkas] ([idkas], [idanggota], [nominal], [jeniskas], [status], [creaby], [creadate], [modiby], [modidate], [uplod_bukti]) VALUES (23, 24, 50000, N'BEM', 2, N'Samodra', CAST(N'2021-02-05T15:06:19.640' AS DateTime), N'Samodra', CAST(N'2021-02-05T15:38:36.573' AS DateTime), N'~/Bukti_khas/235791965laptop.png')
INSERT [dbo].[trkas] ([idkas], [idanggota], [nominal], [jeniskas], [status], [creaby], [creadate], [modiby], [modidate], [uplod_bukti]) VALUES (24, 22, 10000, N'BEM', 1, N'Samodra', CAST(N'2021-02-05T15:07:16.363' AS DateTime), NULL, NULL, N'')
INSERT [dbo].[trkas] ([idkas], [idanggota], [nominal], [jeniskas], [status], [creaby], [creadate], [modiby], [modidate], [uplod_bukti]) VALUES (25, 1, 40000, N'Departemen', 2, N'Samodra', CAST(N'2021-02-05T15:27:04.210' AS DateTime), NULL, NULL, N'~/Bukti_khas/1708714691Juve.png')
INSERT [dbo].[trkas] ([idkas], [idanggota], [nominal], [jeniskas], [status], [creaby], [creadate], [modiby], [modidate], [uplod_bukti]) VALUES (26, 22, 5000, N'BEM', 1, N'Samodra', CAST(N'2021-02-05T15:27:31.627' AS DateTime), NULL, NULL, N'')
INSERT [dbo].[trkas] ([idkas], [idanggota], [nominal], [jeniskas], [status], [creaby], [creadate], [modiby], [modidate], [uplod_bukti]) VALUES (27, 1, 12000, N'BEM', 2, N'Samodra', CAST(N'2021-02-05T15:27:55.677' AS DateTime), NULL, NULL, N'~/Bukti_khas/731342728adidas.png')
INSERT [dbo].[trkas] ([idkas], [idanggota], [nominal], [jeniskas], [status], [creaby], [creadate], [modiby], [modidate], [uplod_bukti]) VALUES (28, 1, 888, N'BEM', 1, N'Samodra', CAST(N'2021-02-05T15:31:45.377' AS DateTime), N'Samodra', CAST(N'2021-02-05T15:35:30.673' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[trkas] OFF
SET IDENTITY_INSERT [dbo].[trlaporanksk] ON 

INSERT [dbo].[trlaporanksk] ([idlpksk], [idukm_hima], [namaberkas], [keterangan], [status], [komentar], [tglpresent], [creaby], [creadate], [modiby], [modidate]) VALUES (1, 6, N'FORMAT LPJ Keuangan BARU.xls', N'OSP', 1, N'-', CAST(N'2021-01-25T00:00:00.000' AS DateTime), N'samodra', CAST(N'2021-01-25T03:00:23.187' AS DateTime), N'samodra', CAST(N'2021-01-25T03:00:23.187' AS DateTime))
INSERT [dbo].[trlaporanksk] ([idlpksk], [idukm_hima], [namaberkas], [keterangan], [status], [komentar], [tglpresent], [creaby], [creadate], [modiby], [modidate]) VALUES (2, 0, N'OSP OH MPM 2020.xlsx', N'OSP', 4, N'-', NULL, N'samodra', CAST(N'2021-01-25T07:38:12.433' AS DateTime), N'aditya', CAST(N'2021-01-25T09:43:41.630' AS DateTime))
INSERT [dbo].[trlaporanksk] ([idlpksk], [idukm_hima], [namaberkas], [keterangan], [status], [komentar], [tglpresent], [creaby], [creadate], [modiby], [modidate]) VALUES (3, 6, N'OSP OH MPM 2020.xlsx', N'OSP', 6, N'-', CAST(N'2021-01-25T00:00:00.000' AS DateTime), N'samodra', CAST(N'2021-01-25T08:24:44.937' AS DateTime), N'M Rizky Maulana', CAST(N'2021-01-27T17:44:05.493' AS DateTime))
INSERT [dbo].[trlaporanksk] ([idlpksk], [idukm_hima], [namaberkas], [keterangan], [status], [komentar], [tglpresent], [creaby], [creadate], [modiby], [modidate]) VALUES (4, 3, N'KAS MPM PHOENIX 2020-2021 TERBARU.xlsx', N'OSP', 5, N'-', CAST(N'2021-01-25T00:00:00.000' AS DateTime), N'Shifa habibah anl', CAST(N'2021-01-25T16:47:14.950' AS DateTime), N'Shifa habibah anl', CAST(N'2021-01-27T17:39:47.203' AS DateTime))
INSERT [dbo].[trlaporanksk] ([idlpksk], [idukm_hima], [namaberkas], [keterangan], [status], [komentar], [tglpresent], [creaby], [creadate], [modiby], [modidate]) VALUES (5, 3, N'PM1302_P06_018.xlsx', N'OSP', 1, N'-', CAST(N'2021-01-25T00:00:00.000' AS DateTime), N'Shifa habibah anl', CAST(N'2021-01-27T17:39:04.343' AS DateTime), N'Shifa habibah anl', CAST(N'2021-01-27T17:39:43.000' AS DateTime))
INSERT [dbo].[trlaporanksk] ([idlpksk], [idukm_hima], [namaberkas], [keterangan], [status], [komentar], [tglpresent], [creaby], [creadate], [modiby], [modidate]) VALUES (6, 3, N'PM1302_P06_018.xlsx', N'OSP', 1, N'-', CAST(N'2021-08-28T00:00:00.000' AS DateTime), N'Shifa habibah anl', CAST(N'2021-01-29T07:09:21.823' AS DateTime), N'Shifa habibah', CAST(N'2021-01-30T16:19:01.077' AS DateTime))
INSERT [dbo].[trlaporanksk] ([idlpksk], [idukm_hima], [namaberkas], [keterangan], [status], [komentar], [tglpresent], [creaby], [creadate], [modiby], [modidate]) VALUES (7, 3, N'OSP OH MPM 2020.xlsx', N'OSP', 1, N'-', CAST(N'2021-01-21T00:00:00.000' AS DateTime), N'Shifa habibah', CAST(N'2021-01-30T16:18:33.410' AS DateTime), N'Shifa habibah', CAST(N'2021-01-30T16:18:52.797' AS DateTime))
SET IDENTITY_INSERT [dbo].[trlaporanksk] OFF
SET IDENTITY_INSERT [dbo].[trpengajuandana] ON 

INSERT [dbo].[trpengajuandana] ([id], [idanggota], [event], [tujuan], [jumlah], [status], [creaby], [creadate], [modiby], [modidate], [kepada], [Bukti_kirim]) VALUES (1, 1, N'Holiday', N'keperluan holiday', 1000000, 3, N'Pujiati', CAST(N'2021-01-27' AS Date), N'aditya', NULL, N'BEM', N'')
INSERT [dbo].[trpengajuandana] ([id], [idanggota], [event], [tujuan], [jumlah], [status], [creaby], [creadate], [modiby], [modidate], [kepada], [Bukti_kirim]) VALUES (2, 7, N'Makrab', N'Untuk membeli bola pantai', 10000, 0, N'Shifa habibah anl', CAST(N'2021-01-27' AS Date), N'Shifa habibah anl', CAST(N'2021-01-27' AS Date), N'Departemen', N'')
INSERT [dbo].[trpengajuandana] ([id], [idanggota], [event], [tujuan], [jumlah], [status], [creaby], [creadate], [modiby], [modidate], [kepada], [Bukti_kirim]) VALUES (3, 8, N'Makrab', N'Untuk membeli bola pantai', 10000, 4, N'M Rizky Maulana', CAST(N'2021-01-27' AS Date), N'aditya', CAST(N'2021-01-28' AS Date), N'BEM', N'')
INSERT [dbo].[trpengajuandana] ([id], [idanggota], [event], [tujuan], [jumlah], [status], [creaby], [creadate], [modiby], [modidate], [kepada], [Bukti_kirim]) VALUES (4, 7, N'Buka Bersama', N'kekeluargaan', 15000, 1, N'Shifa habibah anl', CAST(N'2021-01-27' AS Date), N'Shifa habibah anl', CAST(N'2021-01-27' AS Date), N'Departemen', N'')
INSERT [dbo].[trpengajuandana] ([id], [idanggota], [event], [tujuan], [jumlah], [status], [creaby], [creadate], [modiby], [modidate], [kepada], [Bukti_kirim]) VALUES (5, 8, N'Futsal', N'Untuk membeli bola futsal', 40000, 4, N'M Rizky Maulana', CAST(N'2021-01-27' AS Date), N'aditya', CAST(N'2021-01-28' AS Date), N'BEM', N'')
INSERT [dbo].[trpengajuandana] ([id], [idanggota], [event], [tujuan], [jumlah], [status], [creaby], [creadate], [modiby], [modidate], [kepada], [Bukti_kirim]) VALUES (6, 8, N'Holiday', N'keperluan holiday', 100000, 1, N'M Rizky Maulana', CAST(N'2021-01-28' AS Date), N'M Rizky Maulana', CAST(N'2021-01-28' AS Date), N'Departemen', N'')
INSERT [dbo].[trpengajuandana] ([id], [idanggota], [event], [tujuan], [jumlah], [status], [creaby], [creadate], [modiby], [modidate], [kepada], [Bukti_kirim]) VALUES (7, 8, N'Makrab', N'Untuk membeli bola pantai', 10, 0, N'M Rizky Maulana', CAST(N'2021-01-28' AS Date), N'M Rizky Maulana', NULL, N'BEM', N'')
INSERT [dbo].[trpengajuandana] ([id], [idanggota], [event], [tujuan], [jumlah], [status], [creaby], [creadate], [modiby], [modidate], [kepada], [Bukti_kirim]) VALUES (8, 7, N'Makrab', N'Untuk membayar lapangan', 30000, 1, N'Shifa habibah', CAST(N'2021-01-30' AS Date), N'Shifa habibah', CAST(N'2021-01-30' AS Date), N'Departemen', N'')
INSERT [dbo].[trpengajuandana] ([id], [idanggota], [event], [tujuan], [jumlah], [status], [creaby], [creadate], [modiby], [modidate], [kepada], [Bukti_kirim]) VALUES (9, 17, N'Sarasehan', N'keperluan holiday', 13000, 2, N'Samodra', CAST(N'2021-02-05' AS Date), N'Samodra', NULL, N'Departemen', N'')
INSERT [dbo].[trpengajuandana] ([id], [idanggota], [event], [tujuan], [jumlah], [status], [creaby], [creadate], [modiby], [modidate], [kepada], [Bukti_kirim]) VALUES (10, 17, N'open house', N'memperkenalkan bem', 100000, 2, N'Samodra', CAST(N'2021-02-05' AS Date), NULL, NULL, N'BEM', N'')
INSERT [dbo].[trpengajuandana] ([id], [idanggota], [event], [tujuan], [jumlah], [status], [creaby], [creadate], [modiby], [modidate], [kepada], [Bukti_kirim]) VALUES (11, 17, N'Holiday', N'keperluan holiday', 5066, 6, N'Samodra', CAST(N'2021-02-05' AS Date), N'Samodra', NULL, N'BEM', N'')
INSERT [dbo].[trpengajuandana] ([id], [idanggota], [event], [tujuan], [jumlah], [status], [creaby], [creadate], [modiby], [modidate], [kepada], [Bukti_kirim]) VALUES (12, 17, N'Buka Bersama', N'Untuk membeli bola futsal', 40000, 1, N'Samodra', CAST(N'2021-02-05' AS Date), N'Samodra', CAST(N'2021-02-05' AS Date), N'BEM', N'')
SET IDENTITY_INSERT [dbo].[trpengajuandana] OFF
ALTER TABLE [dbo].[dtlnotulensi]  WITH CHECK ADD  CONSTRAINT [FK_dtlnotulensi_msanggotabem] FOREIGN KEY([idanggota])
REFERENCES [dbo].[msanggotabem] ([idanggota])
GO
ALTER TABLE [dbo].[dtlnotulensi] CHECK CONSTRAINT [FK_dtlnotulensi_msanggotabem]
GO
ALTER TABLE [dbo].[dtlnotulensi]  WITH CHECK ADD  CONSTRAINT [FK_dtlnotulensi_trnotulensi] FOREIGN KEY([idnotulensi])
REFERENCES [dbo].[trnotulensi] ([idnotulensi])
GO
ALTER TABLE [dbo].[dtlnotulensi] CHECK CONSTRAINT [FK_dtlnotulensi_trnotulensi]
GO
ALTER TABLE [dbo].[msanggotabem]  WITH CHECK ADD  CONSTRAINT [FK_msanggotabem_msdepartemen] FOREIGN KEY([iddepartemen])
REFERENCES [dbo].[msdepartemen] ([iddepartemen])
GO
ALTER TABLE [dbo].[msanggotabem] CHECK CONSTRAINT [FK_msanggotabem_msdepartemen]
GO
ALTER TABLE [dbo].[msanggotabem]  WITH CHECK ADD  CONSTRAINT [FK_msanggotabem_msjabatan] FOREIGN KEY([idjabatan])
REFERENCES [dbo].[msjabatan] ([idjabatan])
GO
ALTER TABLE [dbo].[msanggotabem] CHECK CONSTRAINT [FK_msanggotabem_msjabatan]
GO
ALTER TABLE [dbo].[msanggotabem]  WITH CHECK ADD  CONSTRAINT [FK_msanggotabem_msperiode] FOREIGN KEY([idperiode])
REFERENCES [dbo].[msperiode] ([idperiode])
GO
ALTER TABLE [dbo].[msanggotabem] CHECK CONSTRAINT [FK_msanggotabem_msperiode]
GO
ALTER TABLE [dbo].[msjabatan]  WITH CHECK ADD  CONSTRAINT [FK_msjabatan_msukm_hima] FOREIGN KEY([idukm_hima])
REFERENCES [dbo].[msukm_hima] ([idukm_hima])
GO
ALTER TABLE [dbo].[msjabatan] CHECK CONSTRAINT [FK_msjabatan_msukm_hima]
GO
ALTER TABLE [dbo].[trkas]  WITH CHECK ADD  CONSTRAINT [FK_trkas_msanggotabem] FOREIGN KEY([idanggota])
REFERENCES [dbo].[msanggotabem] ([idanggota])
GO
ALTER TABLE [dbo].[trkas] CHECK CONSTRAINT [FK_trkas_msanggotabem]
GO
ALTER TABLE [dbo].[trlaporanksk]  WITH CHECK ADD  CONSTRAINT [FK_trlaporanksk_msukm_hima] FOREIGN KEY([idukm_hima])
REFERENCES [dbo].[msukm_hima] ([idukm_hima])
GO
ALTER TABLE [dbo].[trlaporanksk] CHECK CONSTRAINT [FK_trlaporanksk_msukm_hima]
GO
ALTER TABLE [dbo].[trnotulensi]  WITH CHECK ADD  CONSTRAINT [FK_trnotulensi_trrapat] FOREIGN KEY([idrapat])
REFERENCES [dbo].[trrapat] ([idrapat])
GO
ALTER TABLE [dbo].[trnotulensi] CHECK CONSTRAINT [FK_trnotulensi_trrapat]
GO
ALTER TABLE [dbo].[trpengajuandana]  WITH CHECK ADD  CONSTRAINT [FK_trpengajuandana_msanggotabem] FOREIGN KEY([idanggota])
REFERENCES [dbo].[msanggotabem] ([idanggota])
GO
ALTER TABLE [dbo].[trpengajuandana] CHECK CONSTRAINT [FK_trpengajuandana_msanggotabem]
GO
ALTER TABLE [dbo].[trrapat]  WITH CHECK ADD  CONSTRAINT [FK_trrapat_msdepartemen] FOREIGN KEY([iddepartemen])
REFERENCES [dbo].[msdepartemen] ([iddepartemen])
GO
ALTER TABLE [dbo].[trrapat] CHECK CONSTRAINT [FK_trrapat_msdepartemen]
GO
USE [master]
GO
ALTER DATABASE [DBSIBEM] SET  READ_WRITE 
GO
