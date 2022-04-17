
USE [master]
--drop database DienThoai
CREATE DATABASE [DienThoai]
GO
USE [DienThoai]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Chi_Tiet_Gio_Hang](
	[MaGioHang] [int] NOT NULL,
	[MaSP] [int] NOT NULL,
	[SoLuongMua] [int] NOT NULL,
	[GiaSP] [money] NOT NULL,
	constraint fk_Chi_Tiet_Gio_Hang foreign key (MaSP)
	references SanPham(MaSP),
	constraint fk1_Chi_Tiet_Gio_Hang foreign key (MaGioHang)
	references GioHang(MaGioHang),
PRIMARY KEY CLUSTERED 
(
	[MaGioHang] ASC,
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
/**/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhMucSP](
	[MaDM] [int] IDENTITY(1,1) NOT NULL,
	[TenDM] [nvarchar](80) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/**/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GioHang](
	[MaGioHang] [int] IDENTITY(1,1) NOT NULL,
	[MaTK] [int] NOT NULL,
	constraint fk_GioHang foreign key (MaTK)
	references TaiKhoan(MaTK),
PRIMARY KEY CLUSTERED 
(
	[MaGioHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/**/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER TABLE [dbo].[HoaDon]
DROP [MaSP];

CREATE TABLE [dbo].[HoaDon](
	[MaHD] [int] IDENTITY(1,1) NOT NULL,
	[NgayTao] [datetime] NOT NULL,
	[HinhThucVanChuyen] [nvarchar](100) NOT NULL,
	[HinhThucThanhToan] [nvarchar](100) NOT NULL,
	[MaGioHang] [int] NOT NULL,
	[GhiChu] [ntext] NULL,
	[HoTen] [nvarchar](50) NOT NULL,
	[DiaChi] [ntext] NULL,
	[SoDienThoai] [nchar](10) NULL,
	[TinhTrang] [nvarchar](100) NOT NULL,
	constraint fk_HoaDon foreign key (MaGioHang)
	references GioHang(MaGioHang),
	
PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/**/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanQuyen](
	[MaQuyen] [int] IDENTITY(1,1) NOT NULL,
	[TenQuyen] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaQuyen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/**/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSP] [int] IDENTITY(1,1) NOT NULL,
	[TenSP] [nvarchar](80) NOT NULL,
	[Gia] [money] NOT NULL,
	[MaHSX] [int] NULL,
	[TinhTrang] [nvarchar](80) NULL,
	[HinhAnh] [nvarchar](128) NULL,
	[ManHinh] [nvarchar](128) NULL,
	[HDH] [nvarchar](128) NULL,
	[CPU] [nvarchar](128) NULL,
	[Camera] [nvarchar](128) NULL,
	[Pin] [nvarchar](128) NULL,
	[Ram] [nvarchar](128) NULL,
	[BoNhoTrong] [nvarchar](128) NULL,
	[TheNhoNgoai] [nvarchar](128) NULL,
	[CameraTruoc] [nvarchar](128) NULL,
	[SoLuongTon] [int] NOT NULL,
	[MaMau] [int] NOT NULL,
	[MaDM] [int] NOT NULL,
	constraint fk_SanPham foreign key (MaMau)
	references MauSac(MaMau),
	constraint fk1_SanPham foreign key (MaHSX)
	references HangSanXuat(MaHSX),
	constraint fk2_SanPham foreign key (MaDM)
	references DanhMucSP(MaDM),
PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] 
GO
/**/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MauSac](
	[MaMau] [int] IDENTITY(1,1) NOT NULL,
	[TenMau] [nvarchar](80) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaMau] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/**/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HangSanXuat](
	[MaHSX] [int] IDENTITY(1,1) NOT NULL,
	[TenHSX] [nvarchar](80) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHSX] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/**/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[MaTK] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[MatKhau] [nvarchar](50) NOT NULL,
	[HoTen] [nvarchar](50) NOT NULL,
	[DiaChi] [ntext] NULL,
	[SoDienThoai] [nchar](10) NULL,
	[Anh] [nvarchar](50) NULL,
	[TinhTrang] [bit] NOT NULL,
	[MaQuyen] [int] NOT NULL,
	constraint fk_TaiKhoan foreign key (MaQuyen)
	references PhanQuyen(MaQuyen),
PRIMARY KEY CLUSTERED 
(
	[MaTK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
/**/
GO
SET IDENTITY_INSERT [dbo].[Chi_Tiet_Gio_Hang] ON 
INSERT [dbo].[Chi_Tiet_Gio_Hang] ([MaGioHang], [MaSP], [SoLuongMua], [GiaSP]) VALUES (2, 1, 3, 32319000.0000)
INSERT [dbo].[Chi_Tiet_Gio_Hang] ([MaGioHang], [MaSP], [SoLuongMua], [GiaSP]) VALUES (2, 21, 3, 45645000.0000)
INSERT [dbo].[Chi_Tiet_Gio_Hang] ([MaGioHang], [MaSP], [SoLuongMua], [GiaSP]) VALUES (4, 31, 1, 23545000.0000)
INSERT [dbo].[Chi_Tiet_Gio_Hang] ([MaGioHang], [MaSP], [SoLuongMua], [GiaSP]) VALUES (4, 41, 2, 34160000.0000)
INSERT [dbo].[Chi_Tiet_Gio_Hang] ([MaGioHang], [MaSP], [SoLuongMua], [GiaSP]) VALUES (5, 2, 1, 12149600.0000)
INSERT [dbo].[Chi_Tiet_Gio_Hang] ([MaGioHang], [MaSP], [SoLuongMua], [GiaSP]) VALUES (5, 61, 1, 30655000.0000)
INSERT [dbo].[Chi_Tiet_Gio_Hang] ([MaGioHang], [MaSP], [SoLuongMua], [GiaSP]) VALUES (6, 71, 1, 51045000.0000)
INSERT [dbo].[Chi_Tiet_Gio_Hang] ([MaGioHang], [MaSP], [SoLuongMua], [GiaSP]) VALUES (6, 81, 1, 12355000.0000)
INSERT [dbo].[Chi_Tiet_Gio_Hang] ([MaGioHang], [MaSP], [SoLuongMua], [GiaSP]) VALUES (7, 3, 2, 45224000.0000)
INSERT [dbo].[Chi_Tiet_Gio_Hang] ([MaGioHang], [MaSP], [SoLuongMua], [GiaSP]) VALUES (7, 10, 1, 30195000.0000)
INSERT [dbo].[Chi_Tiet_Gio_Hang] ([MaGioHang], [MaSP], [SoLuongMua], [GiaSP]) VALUES (7, 11, 1, 50100000.0000)
INSERT [dbo].[Chi_Tiet_Gio_Hang] ([MaGioHang], [MaSP], [SoLuongMua], [GiaSP]) VALUES (7, 4, 1, 20252000.0000)
INSERT [dbo].[Chi_Tiet_Gio_Hang] ([MaGioHang], [MaSP], [SoLuongMua], [GiaSP]) VALUES (7, 13, 1, 30150000.0000)
INSERT [dbo].[Chi_Tiet_Gio_Hang] ([MaGioHang], [MaSP], [SoLuongMua], [GiaSP]) VALUES (8, 5, 1, 50294000.0000)
INSERT [dbo].[Chi_Tiet_Gio_Hang] ([MaGioHang], [MaSP], [SoLuongMua], [GiaSP]) VALUES (8, 15, 1, 30336000.0000)
INSERT [dbo].[Chi_Tiet_Gio_Hang] ([MaGioHang], [MaSP], [SoLuongMua], [GiaSP]) VALUES (9, 6, 11, 45195000.0000)
INSERT [dbo].[Chi_Tiet_Gio_Hang] ([MaGioHang], [MaSP], [SoLuongMua], [GiaSP]) VALUES (11, 17, 1, 35595000.0000)
INSERT [dbo].[Chi_Tiet_Gio_Hang] ([MaGioHang], [MaSP], [SoLuongMua], [GiaSP]) VALUES (13, 7, 2, 320000.0000)
INSERT [dbo].[Chi_Tiet_Gio_Hang] ([MaGioHang], [MaSP], [SoLuongMua], [GiaSP]) VALUES (20, 19, 1, 31152000.0000)
INSERT [dbo].[Chi_Tiet_Gio_Hang] ([MaGioHang], [MaSP], [SoLuongMua], [GiaSP]) VALUES (20, 8, 1, 32210000.0000)
INSERT [dbo].[Chi_Tiet_Gio_Hang] ([MaGioHang], [MaSP], [SoLuongMua], [GiaSP]) VALUES (21, 21, 1, 25960000.0000)
INSERT [dbo].[Chi_Tiet_Gio_Hang] ([MaGioHang], [MaSP], [SoLuongMua], [GiaSP]) VALUES (24, 9, 1, 12330000.0000)
INSERT [dbo].[Chi_Tiet_Gio_Hang] ([MaGioHang], [MaSP], [SoLuongMua], [GiaSP]) VALUES (25, 10, 1, 41000000.0000)
SET IDENTITY_INSERT [dbo].[Chi_Tiet_Gio_Hang] OFF
GO
SET IDENTITY_INSERT [dbo].[DanhMucSP] ON 

INSERT [dbo].[DanhMucSP] ([MaDM], [TenDM]) VALUES (1, N'Iphone')
INSERT [dbo].[DanhMucSP] ([MaDM], [TenDM]) VALUES (2, N'Samsung')
INSERT [dbo].[DanhMucSP] ([MaDM], [TenDM]) VALUES (3, N'Oppo')
INSERT [dbo].[DanhMucSP] ([MaDM], [TenDM]) VALUES (4, N'Xiaomi')
INSERT [dbo].[DanhMucSP] ([MaDM], [TenDM]) VALUES (5, N'Realme')
INSERT [dbo].[DanhMucSP] ([MaDM], [TenDM]) VALUES (6, N'Asus')
INSERT [dbo].[DanhMucSP] ([MaDM], [TenDM]) VALUES (7, N'Nokia')
INSERT [dbo].[DanhMucSP] ([MaDM], [TenDM]) VALUES (8, N'Huawei')
INSERT [dbo].[DanhMucSP] ([MaDM], [TenDM]) VALUES (9, N'Vivo')
INSERT [dbo].[DanhMucSP] ([MaDM], [TenDM]) VALUES (10, N'Oneplus')
INSERT [dbo].[DanhMucSP] ([MaDM], [TenDM]) VALUES (11, N'Tecno')
INSERT [dbo].[DanhMucSP] ([MaDM], [TenDM]) VALUES (12, N'Blackberry')
INSERT [dbo].[DanhMucSP] ([MaDM], [TenDM]) VALUES (13, N'Motorola')
SET IDENTITY_INSERT [dbo].[DanhMucSP] OFF
GO
SET IDENTITY_INSERT [dbo].[GioHang] ON 
INSERT [dbo].[GioHang] ([MaGioHang], [MaTK]) VALUES (2, 3)
INSERT [dbo].[GioHang] ([MaGioHang], [MaTK]) VALUES (4, 2)
INSERT [dbo].[GioHang] ([MaGioHang], [MaTK]) VALUES (5, 2)
INSERT [dbo].[GioHang] ([MaGioHang], [MaTK]) VALUES (6, 2)
INSERT [dbo].[GioHang] ([MaGioHang], [MaTK]) VALUES (7, 4)
INSERT [dbo].[GioHang] ([MaGioHang], [MaTK]) VALUES (8, 4)
INSERT [dbo].[GioHang] ([MaGioHang], [MaTK]) VALUES (9, 5)
INSERT [dbo].[GioHang] ([MaGioHang], [MaTK]) VALUES (10, 5)
INSERT [dbo].[GioHang] ([MaGioHang], [MaTK]) VALUES (11, 6)
INSERT [dbo].[GioHang] ([MaGioHang], [MaTK]) VALUES (12, 6)
INSERT [dbo].[GioHang] ([MaGioHang], [MaTK]) VALUES (13, 7)
INSERT [dbo].[GioHang] ([MaGioHang], [MaTK]) VALUES (14, 7)
INSERT [dbo].[GioHang] ([MaGioHang], [MaTK]) VALUES (15, 4)
INSERT [dbo].[GioHang] ([MaGioHang], [MaTK]) VALUES (16, 4)
INSERT [dbo].[GioHang] ([MaGioHang], [MaTK]) VALUES (17, 4)
INSERT [dbo].[GioHang] ([MaGioHang], [MaTK]) VALUES (18, 4)
INSERT [dbo].[GioHang] ([MaGioHang], [MaTK]) VALUES (19, 4)
INSERT [dbo].[GioHang] ([MaGioHang], [MaTK]) VALUES (20, 11)
INSERT [dbo].[GioHang] ([MaGioHang], [MaTK]) VALUES (21, 11)
INSERT [dbo].[GioHang] ([MaGioHang], [MaTK]) VALUES (22, 11)
INSERT [dbo].[GioHang] ([MaGioHang], [MaTK]) VALUES (23, 11)
INSERT [dbo].[GioHang] ([MaGioHang], [MaTK]) VALUES (24, 2)
INSERT [dbo].[GioHang] ([MaGioHang], [MaTK]) VALUES (25, 2)
INSERT [dbo].[GioHang] ([MaGioHang], [MaTK]) VALUES (26, 2)
INSERT [dbo].[GioHang] ([MaGioHang], [MaTK]) VALUES (27, 2)
INSERT [dbo].[GioHang] ([MaGioHang], [MaTK]) VALUES (28, 2)
SET IDENTITY_INSERT [dbo].[GioHang] OFF
GO
SET IDENTITY_INSERT [dbo].[HoaDon] ON 
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [HinhThucVanChuyen], [HinhThucThanhToan], [MaGioHang], [GhiChu], [HoTen], [DiaChi], [SoDienThoai], [TinhTrang]) VALUES (2, CAST(N'2022-04-04T11:09:08.000' AS DateTime), N'Mặc định', N'Thanh toán khi nhận hàng', 1, NULL, N'Vinh Hà Đỗ', N'Hà Nội', N'0123456789', N'Đã nhận')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [HinhThucVanChuyen], [HinhThucThanhToan], [MaGioHang], [GhiChu], [HoTen], [DiaChi], [SoDienThoai], [TinhTrang]) VALUES (3, CAST(N'2022-04-04T21:08:00.860' AS DateTime), N'Giao hàng tiết kiệm', N'Thanh toán khi nhận hàng', 2, N'', N'Nguyễn Anh Linh', N'Ứng Hòa - Hà Nội', N'076545644 ', N'Đang chờ')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [HinhThucVanChuyen], [HinhThucThanhToan], [MaGioHang], [GhiChu], [HoTen], [DiaChi], [SoDienThoai], [TinhTrang]) VALUES (4, CAST(N'2022-04-04T21:17:24.000' AS DateTime), N'Giao hàng tiết kiệm', N'Thanh toán khi nhận hàng', 3, NULL, N'Hoàng Duy Khánh', N'Hải Phòng', N'075645676 ', N'Đang giao')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [HinhThucVanChuyen], [HinhThucThanhToan], [MaGioHang], [GhiChu], [HoTen], [DiaChi], [SoDienThoai], [TinhTrang]) VALUES (5, CAST(N'2022-04-04T21:34:04.323' AS DateTime), N'Giao hàng tiết kiệm', N'Thanh toán khi nhận hàng', 4, N'giao hàng trong giờ hành chính', N'Vũ Văn Doan', N'Nam Định', N'086743456 ', N'Đang chờ')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [HinhThucVanChuyen], [HinhThucThanhToan], [MaGioHang], [GhiChu], [HoTen], [DiaChi], [SoDienThoai], [TinhTrang]) VALUES (6, CAST(N'2022-04-04T21:35:01.053' AS DateTime), N'Giao hàng tiết kiệm', N'Thanh toán khi nhận hàng', 5, N'', N'Nguyễn Đức Điệp', N'Hà Nội', N'098765432 ', N'Đang chờ')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [HinhThucVanChuyen], [HinhThucThanhToan], [MaGioHang], [GhiChu], [HoTen], [DiaChi], [SoDienThoai], [TinhTrang]) VALUES (7, CAST(N'2022-04-04T21:44:47.000' AS DateTime), N'Giao hàng tiết kiệm', N'Thanh toán khi nhận hàng', 6, NULL, N'Nguyễn Anh Linh', N'Ứng Hòa - Hà Nội', N'0815619200', N'Đã hủy')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [HinhThucVanChuyen], [HinhThucThanhToan], [MaGioHang], [GhiChu], [HoTen], [DiaChi], [SoDienThoai], [TinhTrang]) VALUES (8, CAST(N'2022-04-04T21:48:34.000' AS DateTime), N'Giao hàng tiết kiệm', N'Thanh toán khi nhận hàng', 7, NULL, N'Nguyễn Anh Linh', N'Ứng Hòa - Hà Nội', N'0815619200', N'Đang giao')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [HinhThucVanChuyen], [HinhThucThanhToan], [MaGioHang], [GhiChu], [HoTen], [DiaChi], [SoDienThoai], [TinhTrang]) VALUES (9, CAST(N'2022-04-04T21:53:46.673' AS DateTime), N'Giao hàng tiết kiệm', N'Thanh toán khi nhận hàng', 8, N'', N'Nguyễn Ngọc Nam', N'Hà Nội', N'0815619233', N'Đang chờ')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [HinhThucVanChuyen], [HinhThucThanhToan], [MaGioHang], [GhiChu], [HoTen], [DiaChi], [SoDienThoai], [TinhTrang]) VALUES (10, CAST(N'2022-04-04T21:59:38.000' AS DateTime), N'Giao hàng tiết kiệm', N'Thanh toán khi nhận hàng', 9, NULL, N'Nguyễn Xuân Linh', N'Ứng Hòa - Hà Nội', N'0815619255', N'Đã nhận')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [HinhThucVanChuyen], [HinhThucThanhToan], [MaGioHang], [GhiChu], [HoTen], [DiaChi], [SoDienThoai], [TinhTrang]) VALUES (11, CAST(N'2022-04-04T22:00:18.143' AS DateTime), N'Giao hàng tiết kiệm', N'Thanh toán khi nhận hàng', 10, N'', N'Nguyễn Xuân Linh', N'Ứng Hòa - Hà Nội', N'0815619255', N'Đang chờ')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [HinhThucVanChuyen], [HinhThucThanhToan], [MaGioHang], [GhiChu], [HoTen], [DiaChi], [SoDienThoai], [TinhTrang]) VALUES (12, CAST(N'2022-04-04T22:19:24.673' AS DateTime), N'Giao hàng tiết kiệm', N'Thanh toán khi nhận hàng', 11, N'', N'Đoàn Duy Nam', N'Vĩnh Bảo - Hải Phòng', N'0397482016', N'Đơn hàng đã hủy')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [HinhThucVanChuyen], [HinhThucThanhToan], [MaGioHang], [GhiChu], [HoTen], [DiaChi], [SoDienThoai], [TinhTrang]) VALUES (13, CAST(N'2022-04-04T22:19:54.623' AS DateTime), N'Giao hàng tiết kiệm', N'Thanh toán khi nhận hàng', 12, N'', N'Đoàn Duy Nam', N'Vĩnh Bảo - Hải Phòng', N'0397482016', N'Đang chờ')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [HinhThucVanChuyen], [HinhThucThanhToan], [MaGioHang], [GhiChu], [HoTen], [DiaChi], [SoDienThoai], [TinhTrang]) VALUES (14, CAST(N'2022-04-04T22:20:26.120' AS DateTime), N'Giao hàng tiết kiệm', N'Thanh toán khi nhận hàng', 13, N'', N'Đoàn Duy Nam', N'Vĩnh Bảo - Hải Phòng', N'0397482016', N'Đang chờ')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [HinhThucVanChuyen], [HinhThucThanhToan], [MaGioHang], [GhiChu], [HoTen], [DiaChi], [SoDienThoai], [TinhTrang]) VALUES (15, CAST(N'2022-04-04T22:22:52.103' AS DateTime), N'Giao hàng tiết kiệm', N'Thanh toán khi nhận hàng', 14, N'', N'Trần Ngọc Hoàng', N'Vĩnh Bảo - Hải Phòng', N'0397482016', N'Đang chờ')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [HinhThucVanChuyen], [HinhThucThanhToan], [MaGioHang], [GhiChu], [HoTen], [DiaChi], [SoDienThoai], [TinhTrang]) VALUES (16, CAST(N'2022-04-04T22:23:01.923' AS DateTime), N'Giao hàng tiết kiệm', N'Thanh toán khi nhận hàng', 15, N'', N'Trần Ngọc Hoàng', N'Vĩnh Bảo - Hải Phòng', N'0397482016', N'Đang chờ')
SET IDENTITY_INSERT [dbo].[HoaDon] OFF
GO
SET IDENTITY_INSERT [dbo].[PhanQuyen] ON 
INSERT [dbo].[PhanQuyen] ([MaQuyen], [TenQuyen]) VALUES (1, N'Admin')
INSERT [dbo].[PhanQuyen] ([MaQuyen], [TenQuyen]) VALUES (2, N'NhanVien')
INSERT [dbo].[PhanQuyen] ([MaQuyen], [TenQuyen]) VALUES (3, N'KhachHang')
SET IDENTITY_INSERT [dbo].[PhanQuyen] OFF
GO
SET IDENTITY_INSERT [dbo].[MauSac] ON 
INSERT [dbo].[MauSac] ([MaMau], [TenMau]) VALUES (1, N'Màu đỏ')
INSERT [dbo].[MauSac] ([MaMau], [TenMau]) VALUES (2, N'Màu xanh')
INSERT [dbo].[MauSac] ([MaMau], [TenMau]) VALUES (3, N'Màu vàng')
INSERT [dbo].[MauSac] ([MaMau], [TenMau]) VALUES (4, N'Màu hồng')
SET IDENTITY_INSERT [dbo].[MauSac] OFF
GO
SET IDENTITY_INSERT [dbo].[HangSanXuat] ON 
INSERT [dbo].[HangSanXuat] ([MaHSX], [TenHSX]) VALUES (1, N'Apple')
INSERT [dbo].[HangSanXuat] ([MaHSX], [TenHSX]) VALUES (2, N'Oppo')
INSERT [dbo].[HangSanXuat] ([MaHSX], [TenHSX]) VALUES (3, N'Samsung')
INSERT [dbo].[HangSanXuat] ([MaHSX], [TenHSX]) VALUES (4, N'Xiaomi')
INSERT [dbo].[HangSanXuat] ([MaHSX], [TenHSX]) VALUES (5, N'Asus')
INSERT [dbo].[HangSanXuat] ([MaHSX], [TenHSX]) VALUES (6, N'Realme')
INSERT [dbo].[HangSanXuat] ([MaHSX], [TenHSX]) VALUES (7, N'Huawei')
INSERT [dbo].[HangSanXuat] ([MaHSX], [TenHSX]) VALUES (8, N'Nokia')
SET IDENTITY_INSERT [dbo].[HangSanXuat] OFF
GO
SET IDENTITY_INSERT [dbo].[SanPham] ON 
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MaHSX], [TinhTrang], [HinhAnh], [ManHinh], [HDH], [CPU], [Camera], [Pin], [Ram], [BoNhoTrong], [TheNhoNgoai], [CameraTruoc], [SoLuongTon],[MaMau], [MaDM]) VALUES (1,N'Iphone X',32319000.0000,1,N'Còn hàng','ipx.png',N'OLED 1170 x 2532 Pixels, 2 camera 12 MP, 12 MP','iOS 12',N'Apple A12 Bionic 6 nhân',N'2 camera 12 MP','2716 mAh','3GB','64GB',N'Không có','7 MP',30,1,1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MaHSX], [TinhTrang], [HinhAnh], [ManHinh], [HDH], [CPU], [Camera], [Pin], [Ram], [BoNhoTrong], [TheNhoNgoai], [CameraTruoc], [SoLuongTon], [MaMau],[MaDM]) VALUES (2,N'Iphone 11',42319000.0000,1,N'Còn hàng','ip11.png',N'OLED 1170 x 2532 Pixels, 2 camera 12 MP, 12 MP','iOS 13',N'Apple A13 Bionic 7 nhân',N'2 camera 12 MP','2716 mAh','3GB','64GB',N'Không có','7 MP',60,2,1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MaHSX], [TinhTrang], [HinhAnh], [ManHinh], [HDH], [CPU], [Camera], [Pin], [Ram], [BoNhoTrong], [TheNhoNgoai], [CameraTruoc], [SoLuongTon], [MaMau],[MaDM]) VALUES (3,N'Iphone 12',52319000.0000,1,N'Còn hàng','ip12.png',N'OLED 1170 x 2532 Pixels, 2 camera 12 MP, 12 MP','iOS 14',N'Apple A14 Bionic 8 nhân',N'2 camera 12 MP','2716 mAh','3GB','64GB',N'Không có','7 MP',20,3,1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MaHSX], [TinhTrang], [HinhAnh], [ManHinh], [HDH], [CPU], [Camera], [Pin], [Ram], [BoNhoTrong], [TheNhoNgoai], [CameraTruoc], [SoLuongTon], [MaMau],[MaDM]) VALUES (4,N'Iphone 13',62319000.0000,1,N'Còn hàng','ip13.png',N'OLED 1170 x 2532 Pixels, 3 camera 12 MP, 12 MP','iOS 15',N'Apple A15 Bionic 9 nhân',N'2 camera 12 MP','3716 mAh','4GB','128GB',N'Không có','7 MP',10,4,1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MaHSX], [TinhTrang], [HinhAnh], [ManHinh], [HDH], [CPU], [Camera], [Pin], [Ram], [BoNhoTrong], [TheNhoNgoai], [CameraTruoc], [SoLuongTon], [MaMau],[MaDM]) VALUES (5,N'Iphone 13 Promax',72319000.0000,1,N'Còn hàng','ip13promax.png',N'OLED 1170 x 2532 Pixels, 3 camera 12 MP, 16 MP','iOS 16',N'Apple A16 Bionic 6 nhân',N'2 camera 12 MP','4716 mAh','4GB','128GB',N'Không có','7 MP',50,1,1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MaHSX], [TinhTrang], [HinhAnh], [ManHinh], [HDH], [CPU], [Camera], [Pin], [Ram], [BoNhoTrong], [TheNhoNgoai], [CameraTruoc], [SoLuongTon], [MaMau],[MaDM]) VALUES (6,N'Samsung Galasy s8',7319000.0000,3,N'Còn hàng','ss1.png',N'Super AMOLED Full HD+ (1080 x 2400 Pixels), Chính 64 MP & Phụ 12 MP, 5 MP, 5 MP, 32 MP','Android 11',N'Snapdragon 720G 8 nhân',N'2 camera 12 MP','4500 mAh','8GB','128GB','16GB','7 MP',30,2,2)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MaHSX], [TinhTrang], [HinhAnh], [ManHinh], [HDH], [CPU], [Camera], [Pin], [Ram], [BoNhoTrong], [TheNhoNgoai], [CameraTruoc], [SoLuongTon],[MaMau], [MaDM]) VALUES (7,N'Samsung Galasy s9',7319000.0000,3,N'Còn hàng','ss2.png',N'Super AMOLED Full HD+ (1080 x 2400 Pixels), Chính 64 MP & Phụ 12 MP, 5 MP, 5 MP, 32 MP','Android 11',N'Snapdragon 720G 8 nhân',N'2 camera 12 MP','4500 mAh','8GB','128GB','16GB','7 MP',30,3,2)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MaHSX], [TinhTrang], [HinhAnh], [ManHinh], [HDH], [CPU], [Camera], [Pin], [Ram], [BoNhoTrong], [TheNhoNgoai], [CameraTruoc], [SoLuongTon],[MaMau], [MaDM]) VALUES (8,N'Samsung Galasy S20 Ultra',37319000.0000,3,N'Còn hàng','ss3.png',N'Super AMOLED Full HD+ (1080 x 2400 Pixels), Chính 64 MP & Phụ 12 MP, 5 MP, 5 MP, 32 MP','Android 11',N'Snapdragon 720G 8 nhân',N'2 camera 12 MP','4500 mAh','8GB','128GB','16GB','7 MP',30,4,2)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MaHSX], [TinhTrang], [HinhAnh], [ManHinh], [HDH], [CPU], [Camera], [Pin], [Ram], [BoNhoTrong], [TheNhoNgoai], [CameraTruoc], [SoLuongTon],[MaMau], [MaDM]) VALUES (9,N'Samsung Galasy S21 Ultra',37319000.0000,3,N'Còn hàng','ss4.png',N'Super AMOLED Full HD+ (1080 x 2400 Pixels), Chính 64 MP & Phụ 12 MP, 5 MP, 5 MP, 32 MP','Android 11',N'Snapdragon 720G 8 nhân',N'2 camera 12 MP','4500 mAh','8GB','128GB','16GB','7 MP',30,1,2)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MaHSX], [TinhTrang], [HinhAnh], [ManHinh], [HDH], [CPU], [Camera], [Pin], [Ram], [BoNhoTrong], [TheNhoNgoai], [CameraTruoc], [SoLuongTon], [MaMau],[MaDM]) VALUES (10,N'Oppo A55',7319000.0000,2,N'Còn hàng','op1.png',N'Super AMOLED Full HD+ (1080 x 2400 Pixels), Chính 64 MP & Phụ 12 MP, 5 MP, 5 MP, 32 MP','Android 11',N'Snapdragon 720G 8 nhân',N'2 camera 12 MP','4500 mAh','8GB','128GB','16GB','7 MP',30,2,3)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MaHSX], [TinhTrang], [HinhAnh], [ManHinh], [HDH], [CPU], [Camera], [Pin], [Ram], [BoNhoTrong], [TheNhoNgoai], [CameraTruoc], [SoLuongTon], [MaMau],[MaDM]) VALUES (11,N'Oppo A94',7319000.0000,2,N'Còn hàng','op2.png',N'Super AMOLED Full HD+ (1080 x 2400 Pixels), Chính 64 MP & Phụ 12 MP, 5 MP, 5 MP, 32 MP','Android 11',N'Snapdragon 720G 8 nhân',N'2 camera 12 MP','4500 mAh','8GB','128GB','16GB','7 MP',30,3,3)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MaHSX], [TinhTrang], [HinhAnh], [ManHinh], [HDH], [CPU], [Camera], [Pin], [Ram], [BoNhoTrong], [TheNhoNgoai], [CameraTruoc], [SoLuongTon], [MaMau],[MaDM]) VALUES (12,N'Oppo A74',7319000.0000,2,N'Còn hàng','op3.png',N'Super AMOLED Full HD+ (1080 x 2400 Pixels), Chính 64 MP & Phụ 12 MP, 5 MP, 5 MP, 32 MP','Android 11',N'Snapdragon 720G 8 nhân',N'2 camera 12 MP','4500 mAh','8GB','128GB','16GB','7 MP',30,4,3)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MaHSX], [TinhTrang], [HinhAnh], [ManHinh], [HDH], [CPU], [Camera], [Pin], [Ram], [BoNhoTrong], [TheNhoNgoai], [CameraTruoc], [SoLuongTon], [MaMau],[MaDM]) VALUES (13,N'Oppo A76',7319000.0000,2,N'Còn hàng','op4.png',N'Super AMOLED Full HD+ (1080 x 2400 Pixels), Chính 64 MP & Phụ 12 MP, 5 MP, 5 MP, 32 MP','Android 11',N'Snapdragon 720G 8 nhân',N'2 camera 12 MP','4500 mAh','8GB','128GB','16GB','7 MP',30,1,3)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MaHSX], [TinhTrang], [HinhAnh], [ManHinh], [HDH], [CPU], [Camera], [Pin], [Ram], [BoNhoTrong], [TheNhoNgoai], [CameraTruoc], [SoLuongTon],[MaMau], [MaDM]) VALUES (14,N'Xiaomi Redmi Note 11',7319000.0000,4,N'Còn hàng','xiaomi1.png',N'Super AMOLED Full HD+ (1080 x 2400 Pixels), Chính 64 MP & Phụ 12 MP, 5 MP, 5 MP, 32 MP','Android 11',N'Snapdragon 720G 8 nhân',N'2 camera 12 MP','4500 mAh','8GB','128GB','16GB','7 MP',30,2,4)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MaHSX], [TinhTrang], [HinhAnh], [ManHinh], [HDH], [CPU], [Camera], [Pin], [Ram], [BoNhoTrong], [TheNhoNgoai], [CameraTruoc], [SoLuongTon], [MaMau],[MaDM]) VALUES (15,N'Xiaomi Redmi Note 10',7319000.0000,4,N'Còn hàng','xiaomi2.png',N'Super AMOLED Full HD+ (1080 x 2400 Pixels), Chính 64 MP & Phụ 12 MP, 5 MP, 5 MP, 32 MP','Android 11',N'Snapdragon 720G 8 nhân',N'2 camera 12 MP','4500 mAh','8GB','128GB','16GB','7 MP',30,4,4)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MaHSX], [TinhTrang], [HinhAnh], [ManHinh], [HDH], [CPU], [Camera], [Pin], [Ram], [BoNhoTrong], [TheNhoNgoai], [CameraTruoc], [SoLuongTon], [MaMau],[MaDM]) VALUES (16,N'Xiaomi Redmi Note 9',7319000.0000,4,N'Còn hàng','xiaomi3.png',N'Super AMOLED Full HD+ (1080 x 2400 Pixels), Chính 64 MP & Phụ 12 MP, 5 MP, 5 MP, 32 MP','Android 11',N'Snapdragon 720G 8 nhân',N'2 camera 12 MP','4500 mAh','8GB','128GB','16GB','7 MP',30,3,4)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MaHSX], [TinhTrang], [HinhAnh], [ManHinh], [HDH], [CPU], [Camera], [Pin], [Ram], [BoNhoTrong], [TheNhoNgoai], [CameraTruoc], [SoLuongTon], [MaMau],[MaDM]) VALUES (17,N'Xiaomi Redmi Note 8',7319000.0000,4,N'Còn hàng','xiaomi4.png',N'Super AMOLED Full HD+ (1080 x 2400 Pixels), Chính 64 MP & Phụ 12 MP, 5 MP, 5 MP, 32 MP','Android 11',N'Snapdragon 720G 8 nhân',N'2 camera 12 MP','4500 mAh','8GB','128GB','16GB','7 MP',30,1,4)

INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MaHSX], [TinhTrang], [HinhAnh], [ManHinh], [HDH], [CPU], [Camera], [Pin], [Ram], [BoNhoTrong], [TheNhoNgoai], [CameraTruoc], [SoLuongTon], [MaMau],[MaDM]) VALUES (18,N'Iphone X',32319000.0000,1,N'Còn hàng','1.png',N'OLED 1170 x 2532 Pixels, 2 camera 12 MP, 12 MP','iOS 12',N'Apple A12 Bionic 6 nhân',N'2 camera 12 MP','2716 mAh','3GB','64GB',N'Không có','7 MP',30,1,1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MaHSX], [TinhTrang], [HinhAnh], [ManHinh], [HDH], [CPU], [Camera], [Pin], [Ram], [BoNhoTrong], [TheNhoNgoai], [CameraTruoc], [SoLuongTon], [MaMau],[MaDM]) VALUES (19,N'Iphone 11',42319000.0000,1,N'Còn hàng','2.png',N'OLED 1170 x 2532 Pixels, 2 camera 12 MP, 12 MP','iOS 13',N'Apple A13 Bionic 7 nhân',N'2 camera 12 MP','2716 mAh','3GB','64GB',N'Không có','7 MP',60,2,1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MaHSX], [TinhTrang], [HinhAnh], [ManHinh], [HDH], [CPU], [Camera], [Pin], [Ram], [BoNhoTrong], [TheNhoNgoai], [CameraTruoc], [SoLuongTon], [MaMau],[MaDM]) VALUES (20,N'Iphone 12',52319000.0000,1,N'Còn hàng','3.png',N'OLED 1170 x 2532 Pixels, 2 camera 12 MP, 12 MP','iOS 14',N'Apple A14 Bionic 8 nhân',N'2 camera 12 MP','2716 mAh','3GB','64GB',N'Không có','7 MP',20,3,1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MaHSX], [TinhTrang], [HinhAnh], [ManHinh], [HDH], [CPU], [Camera], [Pin], [Ram], [BoNhoTrong], [TheNhoNgoai], [CameraTruoc], [SoLuongTon], [MaMau],[MaDM]) VALUES (21,N'Iphone 13',62319000.0000,1,N'Còn hàng','4.png',N'OLED 1170 x 2532 Pixels, 3 camera 12 MP, 12 MP','iOS 15',N'Apple A15 Bionic 9 nhân',N'2 camera 12 MP','3716 mAh','4GB','128GB',N'Không có','7 MP',10,2,1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MaHSX], [TinhTrang], [HinhAnh], [ManHinh], [HDH], [CPU], [Camera], [Pin], [Ram], [BoNhoTrong], [TheNhoNgoai], [CameraTruoc], [SoLuongTon],[MaMau], [MaDM]) VALUES (22,N'Iphone 13 Promax',72319000.0000,1,N'Còn hàng','5.png',N'OLED 1170 x 2532 Pixels, 3 camera 12 MP, 16 MP','iOS 16',N'Apple A16 Bionic 6 nhân',N'2 camera 12 MP','4716 mAh','4GB','128GB',N'Không có','7 MP',50,4,1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MaHSX], [TinhTrang], [HinhAnh], [ManHinh], [HDH], [CPU], [Camera], [Pin], [Ram], [BoNhoTrong], [TheNhoNgoai], [CameraTruoc], [SoLuongTon],[MaMau], [MaDM]) VALUES (23,N'Iphone X',32319000.0000,1,N'Còn hàng','6.png',N'OLED 1170 x 2532 Pixels, 2 camera 12 MP, 12 MP','iOS 12',N'Apple A12 Bionic 6 nhân',N'2 camera 12 MP','2716 mAh','3GB','64GB',N'Không có','7 MP',30,1,1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MaHSX], [TinhTrang], [HinhAnh], [ManHinh], [HDH], [CPU], [Camera], [Pin], [Ram], [BoNhoTrong], [TheNhoNgoai], [CameraTruoc], [SoLuongTon],[MaMau],[MaDM]) VALUES (24,N'Iphone 11',42319000.0000,1,N'Còn hàng','7.png',N'OLED 1170 x 2532 Pixels, 2 camera 12 MP, 12 MP','iOS 13',N'Apple A13 Bionic 7 nhân',N'2 camera 12 MP','2716 mAh','3GB','64GB',N'Không có','7 MP',60,3,1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MaHSX], [TinhTrang], [HinhAnh], [ManHinh], [HDH], [CPU], [Camera], [Pin], [Ram], [BoNhoTrong], [TheNhoNgoai], [CameraTruoc], [SoLuongTon], [MaMau],[MaDM]) VALUES (25,N'Iphone 12',52319000.0000,1,N'Còn hàng','8.png',N'OLED 1170 x 2532 Pixels, 2 camera 12 MP, 12 MP','iOS 14',N'Apple A14 Bionic 8 nhân',N'2 camera 12 MP','2716 mAh','3GB','64GB',N'Không có','7 MP',20,2,1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MaHSX], [TinhTrang], [HinhAnh], [ManHinh], [HDH], [CPU], [Camera], [Pin], [Ram], [BoNhoTrong], [TheNhoNgoai], [CameraTruoc], [SoLuongTon], [MaMau],[MaDM]) VALUES (26,N'Iphone 13',62319000.0000,1,N'Còn hàng','9.png',N'OLED 1170 x 2532 Pixels, 3 camera 12 MP, 12 MP','iOS 15',N'Apple A15 Bionic 9 nhân',N'2 camera 12 MP','3716 mAh','4GB','128GB',N'Không có','7 MP',10,4,1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MaHSX], [TinhTrang], [HinhAnh], [ManHinh], [HDH], [CPU], [Camera], [Pin], [Ram], [BoNhoTrong], [TheNhoNgoai], [CameraTruoc], [SoLuongTon],[MaMau], [MaDM]) VALUES (27,N'Iphone 13 Promax',72319000.0000,1,N'Còn hàng','10.png',N'OLED 1170 x 2532 Pixels, 3 camera 12 MP, 16 MP','iOS 16',N'Apple A16 Bionic 6 nhân',N'2 camera 12 MP','4716 mAh','4GB','128GB',N'Không có','7 MP',50,1,1)

INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MaHSX], [TinhTrang], [HinhAnh], [ManHinh], [HDH], [CPU], [Camera], [Pin], [Ram], [BoNhoTrong], [TheNhoNgoai], [CameraTruoc], [SoLuongTon],[MaMau], [MaDM]) VALUES (28,N'Iphone X',32319000.0000,1,N'Còn hàng','1.png',N'OLED 1170 x 2532 Pixels, 2 camera 12 MP, 12 MP','iOS 12',N'Apple A12 Bionic 6 nhân',N'2 camera 12 MP','2716 mAh','3GB','64GB',N'Không có','7 MP',30,1,1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MaHSX], [TinhTrang], [HinhAnh], [ManHinh], [HDH], [CPU], [Camera], [Pin], [Ram], [BoNhoTrong], [TheNhoNgoai], [CameraTruoc], [SoLuongTon],[MaMau],[MaDM]) VALUES (29,N'Iphone 11',42319000.0000,1,N'Còn hàng','2.png',N'OLED 1170 x 2532 Pixels, 2 camera 12 MP, 12 MP','iOS 13',N'Apple A13 Bionic 7 nhân',N'2 camera 12 MP','2716 mAh','3GB','64GB',N'Không có','7 MP',60,2,1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MaHSX], [TinhTrang], [HinhAnh], [ManHinh], [HDH], [CPU], [Camera], [Pin], [Ram], [BoNhoTrong], [TheNhoNgoai], [CameraTruoc], [SoLuongTon],[MaMau], [MaDM]) VALUES (30,N'Iphone 12',52319000.0000,1,N'Còn hàng','3.png',N'OLED 1170 x 2532 Pixels, 2 camera 12 MP, 12 MP','iOS 14',N'Apple A14 Bionic 8 nhân',N'2 camera 12 MP','2716 mAh','3GB','64GB',N'Không có','7 MP',20,3,1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MaHSX], [TinhTrang], [HinhAnh], [ManHinh], [HDH], [CPU], [Camera], [Pin], [Ram], [BoNhoTrong], [TheNhoNgoai], [CameraTruoc], [SoLuongTon],[MaMau], [MaDM]) VALUES (31,N'Iphone 13',62319000.0000,1,N'Còn hàng','4.png',N'OLED 1170 x 2532 Pixels, 3 camera 12 MP, 12 MP','iOS 15',N'Apple A15 Bionic 9 nhân',N'2 camera 12 MP','3716 mAh','4GB','128GB',N'Không có','7 MP',10,1,1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MaHSX], [TinhTrang], [HinhAnh], [ManHinh], [HDH], [CPU], [Camera], [Pin], [Ram], [BoNhoTrong], [TheNhoNgoai], [CameraTruoc], [SoLuongTon],[MaMau], [MaDM]) VALUES (32,N'Iphone 13 Promax',72319000.0000,1,N'Còn hàng','5.png',N'OLED 1170 x 2532 Pixels, 3 camera 12 MP, 16 MP','iOS 16',N'Apple A16 Bionic 6 nhân',N'2 camera 12 MP','4716 mAh','4GB','128GB',N'Không có','7 MP',50,2,1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MaHSX], [TinhTrang], [HinhAnh], [ManHinh], [HDH], [CPU], [Camera], [Pin], [Ram], [BoNhoTrong], [TheNhoNgoai], [CameraTruoc], [SoLuongTon],[MaMau], [MaDM]) VALUES (33,N'Iphone X',32319000.0000,1,N'Còn hàng','6.png',N'OLED 1170 x 2532 Pixels, 2 camera 12 MP, 12 MP','iOS 12',N'Apple A12 Bionic 6 nhân',N'2 camera 12 MP','2716 mAh','3GB','64GB',N'Không có','7 MP',30,4,1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MaHSX], [TinhTrang], [HinhAnh], [ManHinh], [HDH], [CPU], [Camera], [Pin], [Ram], [BoNhoTrong], [TheNhoNgoai], [CameraTruoc], [SoLuongTon],[MaMau], [MaDM]) VALUES (34,N'Iphone 11',42319000.0000,1,N'Còn hàng','7.png',N'OLED 1170 x 2532 Pixels, 2 camera 12 MP, 12 MP','iOS 13',N'Apple A13 Bionic 7 nhân',N'2 camera 12 MP','2716 mAh','3GB','64GB',N'Không có','7 MP',60,1,1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MaHSX], [TinhTrang], [HinhAnh], [ManHinh], [HDH], [CPU], [Camera], [Pin], [Ram], [BoNhoTrong], [TheNhoNgoai], [CameraTruoc], [SoLuongTon],[MaMau], [MaDM]) VALUES (35,N'Iphone 12',52319000.0000,1,N'Còn hàng','8.png',N'OLED 1170 x 2532 Pixels, 2 camera 12 MP, 12 MP','iOS 14',N'Apple A14 Bionic 8 nhân',N'2 camera 12 MP','2716 mAh','3GB','64GB',N'Không có','7 MP',20,2,1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MaHSX], [TinhTrang], [HinhAnh], [ManHinh], [HDH], [CPU], [Camera], [Pin], [Ram], [BoNhoTrong], [TheNhoNgoai], [CameraTruoc], [SoLuongTon], [MaMau],[MaDM]) VALUES (36,N'Iphone 13',62319000.0000,1,N'Còn hàng','9.png',N'OLED 1170 x 2532 Pixels, 3 camera 12 MP, 12 MP','iOS 15',N'Apple A15 Bionic 9 nhân',N'2 camera 12 MP','3716 mAh','4GB','128GB',N'Không có','7 MP',10,3,1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MaHSX], [TinhTrang], [HinhAnh], [ManHinh], [HDH], [CPU], [Camera], [Pin], [Ram], [BoNhoTrong], [TheNhoNgoai], [CameraTruoc], [SoLuongTon],[MaMau], [MaDM]) VALUES (37,N'Iphone 13 Promax',72319000.0000,1,N'Còn hàng','10.png',N'OLED 1170 x 2532 Pixels, 3 camera 12 MP, 16 MP','iOS 16',N'Apple A16 Bionic 6 nhân',N'2 camera 12 MP','4716 mAh','4GB','128GB',N'Không có','7 MP',50,4,1)

INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MaHSX], [TinhTrang], [HinhAnh], [ManHinh], [HDH], [CPU], [Camera], [Pin], [Ram], [BoNhoTrong], [TheNhoNgoai], [CameraTruoc], [SoLuongTon],[MaMau], [MaDM]) VALUES (38,N'Samsung Galasy s8',7319000.0000,3,N'Còn hàng','11.png',N'Super AMOLED Full HD+ (1080 x 2400 Pixels), Chính 64 MP & Phụ 12 MP, 5 MP, 5 MP, 32 MP','Android 11',N'Snapdragon 720G 8 nhân',N'2 camera 12 MP','4500 mAh','8GB','128GB','16GB','7 MP',30,1,2)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MaHSX], [TinhTrang], [HinhAnh], [ManHinh], [HDH], [CPU], [Camera], [Pin], [Ram], [BoNhoTrong], [TheNhoNgoai], [CameraTruoc], [SoLuongTon], [MaMau],[MaDM]) VALUES (39,N'Samsung Galasy s9',7319000.0000,3,N'Còn hàng','12.png',N'Super AMOLED Full HD+ (1080 x 2400 Pixels), Chính 64 MP & Phụ 12 MP, 5 MP, 5 MP, 32 MP','Android 11',N'Snapdragon 720G 8 nhân',N'2 camera 12 MP','4500 mAh','8GB','128GB','16GB','7 MP',30,2,2)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MaHSX], [TinhTrang], [HinhAnh], [ManHinh], [HDH], [CPU], [Camera], [Pin], [Ram], [BoNhoTrong], [TheNhoNgoai], [CameraTruoc], [SoLuongTon],[MaMau], [MaDM]) VALUES (40,N'Samsung Galasy S20 Ultra',37319000.0000,3,N'Còn hàng','13.png',N'Super AMOLED Full HD+ (1080 x 2400 Pixels), Chính 64 MP & Phụ 12 MP, 5 MP, 5 MP, 32 MP','Android 11',N'Snapdragon 720G 8 nhân',N'2 camera 12 MP','4500 mAh','8GB','128GB','16GB','7 MP',30,3,2)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MaHSX], [TinhTrang], [HinhAnh], [ManHinh], [HDH], [CPU], [Camera], [Pin], [Ram], [BoNhoTrong], [TheNhoNgoai], [CameraTruoc], [SoLuongTon], [MaMau],[MaDM]) VALUES (41,N'Samsung Galasy S21 Ultra',37319000.0000,3,N'Còn hàng','14.png',N'Super AMOLED Full HD+ (1080 x 2400 Pixels), Chính 64 MP & Phụ 12 MP, 5 MP, 5 MP, 32 MP','Android 11',N'Snapdragon 720G 8 nhân',N'2 camera 12 MP','4500 mAh','8GB','128GB','16GB','7 MP',30,4,2)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MaHSX], [TinhTrang], [HinhAnh], [ManHinh], [HDH], [CPU], [Camera], [Pin], [Ram], [BoNhoTrong], [TheNhoNgoai], [CameraTruoc], [SoLuongTon],[MaMau], [MaDM]) VALUES (42,N'Samsung Galasy s8',7319000.0000,3,N'Còn hàng','15.png',N'Super AMOLED Full HD+ (1080 x 2400 Pixels), Chính 64 MP & Phụ 12 MP, 5 MP, 5 MP, 32 MP','Android 11',N'Snapdragon 720G 8 nhân',N'2 camera 12 MP','4500 mAh','8GB','128GB','16GB','7 MP',30,1,2)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MaHSX], [TinhTrang], [HinhAnh], [ManHinh], [HDH], [CPU], [Camera], [Pin], [Ram], [BoNhoTrong], [TheNhoNgoai], [CameraTruoc], [SoLuongTon],[MaMau], [MaDM]) VALUES (43,N'Samsung Galasy s9',7319000.0000,3,N'Còn hàng','16.png',N'Super AMOLED Full HD+ (1080 x 2400 Pixels), Chính 64 MP & Phụ 12 MP, 5 MP, 5 MP, 32 MP','Android 11',N'Snapdragon 720G 8 nhân',N'2 camera 12 MP','4500 mAh','8GB','128GB','16GB','7 MP',30,2,2)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MaHSX], [TinhTrang], [HinhAnh], [ManHinh], [HDH], [CPU], [Camera], [Pin], [Ram], [BoNhoTrong], [TheNhoNgoai], [CameraTruoc], [SoLuongTon], [MaMau],[MaDM]) VALUES (44,N'Samsung Galasy S20 Ultra',37319000.0000,3,N'Còn hàng','17.png',N'Super AMOLED Full HD+ (1080 x 2400 Pixels), Chính 64 MP & Phụ 12 MP, 5 MP, 5 MP, 32 MP','Android 11',N'Snapdragon 720G 8 nhân',N'2 camera 12 MP','4500 mAh','8GB','128GB','16GB','7 MP',30,3,2)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MaHSX], [TinhTrang], [HinhAnh], [ManHinh], [HDH], [CPU], [Camera], [Pin], [Ram], [BoNhoTrong], [TheNhoNgoai], [CameraTruoc], [SoLuongTon],[MaMau], [MaDM]) VALUES (45,N'Samsung Galasy S21 Ultra',37319000.0000,3,N'Còn hàng','18.png',N'Super AMOLED Full HD+ (1080 x 2400 Pixels), Chính 64 MP & Phụ 12 MP, 5 MP, 5 MP, 32 MP','Android 11',N'Snapdragon 720G 8 nhân',N'2 camera 12 MP','4500 mAh','8GB','128GB','16GB','7 MP',30,4,2)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MaHSX], [TinhTrang], [HinhAnh], [ManHinh], [HDH], [CPU], [Camera], [Pin], [Ram], [BoNhoTrong], [TheNhoNgoai], [CameraTruoc], [SoLuongTon], [MaMau],[MaDM]) VALUES (46,N'Samsung Galasy s8',7319000.0000,3,N'Còn hàng','19.png',N'Super AMOLED Full HD+ (1080 x 2400 Pixels), Chính 64 MP & Phụ 12 MP, 5 MP, 5 MP, 32 MP','Android 11',N'Snapdragon 720G 8 nhân',N'2 camera 12 MP','4500 mAh','8GB','128GB','16GB','7 MP',30,1,2)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MaHSX], [TinhTrang], [HinhAnh], [ManHinh], [HDH], [CPU], [Camera], [Pin], [Ram], [BoNhoTrong], [TheNhoNgoai], [CameraTruoc], [SoLuongTon],[MaMau], [MaDM]) VALUES (47,N'Samsung Galasy s9',7319000.0000,3,N'Còn hàng','20.png',N'Super AMOLED Full HD+ (1080 x 2400 Pixels), Chính 64 MP & Phụ 12 MP, 5 MP, 5 MP, 32 MP','Android 11',N'Snapdragon 720G 8 nhân',N'2 camera 12 MP','4500 mAh','8GB','128GB','16GB','7 MP',30,2,2)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MaHSX], [TinhTrang], [HinhAnh], [ManHinh], [HDH], [CPU], [Camera], [Pin], [Ram], [BoNhoTrong], [TheNhoNgoai], [CameraTruoc], [SoLuongTon],[MaMau], [MaDM]) VALUES (48,N'Samsung Galasy S20 Ultra',37319000.0000,3,N'Còn hàng','16.png',N'Super AMOLED Full HD+ (1080 x 2400 Pixels), Chính 64 MP & Phụ 12 MP, 5 MP, 5 MP, 32 MP','Android 11',N'Snapdragon 720G 8 nhân',N'2 camera 12 MP','4500 mAh','8GB','128GB','16GB','7 MP',30,3,2)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MaHSX], [TinhTrang], [HinhAnh], [ManHinh], [HDH], [CPU], [Camera], [Pin], [Ram], [BoNhoTrong], [TheNhoNgoai], [CameraTruoc], [SoLuongTon],[MaMau], [MaDM]) VALUES (49,N'Samsung Galasy S21 Ultra',37319000.0000,3,N'Còn hàng','17.png',N'Super AMOLED Full HD+ (1080 x 2400 Pixels), Chính 64 MP & Phụ 12 MP, 5 MP, 5 MP, 32 MP','Android 11',N'Snapdragon 720G 8 nhân',N'2 camera 12 MP','4500 mAh','8GB','128GB','16GB','7 MP',30,4,2)

INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MaHSX], [TinhTrang], [HinhAnh], [ManHinh], [HDH], [CPU], [Camera], [Pin], [Ram], [BoNhoTrong], [TheNhoNgoai], [CameraTruoc], [SoLuongTon], [MaMau],[MaDM]) VALUES (50,N'Oppo A55',7319000.0000,2,N'Còn hàng','21.png',N'Super AMOLED Full HD+ (1080 x 2400 Pixels), Chính 64 MP & Phụ 12 MP, 5 MP, 5 MP, 32 MP','Android 11',N'Snapdragon 720G 8 nhân',N'2 camera 12 MP','4500 mAh','8GB','128GB','16GB','7 MP',30,1,3)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MaHSX], [TinhTrang], [HinhAnh], [ManHinh], [HDH], [CPU], [Camera], [Pin], [Ram], [BoNhoTrong], [TheNhoNgoai], [CameraTruoc], [SoLuongTon],[MaMau], [MaDM]) VALUES (63,N'Oppo A55',7319000.0000,2,N'Còn hàng','22.png',N'Super AMOLED Full HD+ (1080 x 2400 Pixels), Chính 64 MP & Phụ 12 MP, 5 MP, 5 MP, 32 MP','Android 11',N'Snapdragon 720G 8 nhân',N'2 camera 12 MP','4500 mAh','8GB','128GB','16GB','7 MP',30,2,3)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MaHSX], [TinhTrang], [HinhAnh], [ManHinh], [HDH], [CPU], [Camera], [Pin], [Ram], [BoNhoTrong], [TheNhoNgoai], [CameraTruoc], [SoLuongTon], [MaMau],[MaDM]) VALUES (52,N'Oppo A94',7319000.0000,2,N'Còn hàng','23.png',N'Super AMOLED Full HD+ (1080 x 2400 Pixels), Chính 64 MP & Phụ 12 MP, 5 MP, 5 MP, 32 MP','Android 11',N'Snapdragon 720G 8 nhân',N'2 camera 12 MP','4500 mAh','8GB','128GB','16GB','7 MP',30,3,3)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MaHSX], [TinhTrang], [HinhAnh], [ManHinh], [HDH], [CPU], [Camera], [Pin], [Ram], [BoNhoTrong], [TheNhoNgoai], [CameraTruoc], [SoLuongTon],[MaMau], [MaDM]) VALUES (53,N'Oppo A74',7319000.0000,2,N'Còn hàng','24.png',N'Super AMOLED Full HD+ (1080 x 2400 Pixels), Chính 64 MP & Phụ 12 MP, 5 MP, 5 MP, 32 MP','Android 11',N'Snapdragon 720G 8 nhân',N'2 camera 12 MP','4500 mAh','8GB','128GB','16GB','7 MP',30,4,3)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MaHSX], [TinhTrang], [HinhAnh], [ManHinh], [HDH], [CPU], [Camera], [Pin], [Ram], [BoNhoTrong], [TheNhoNgoai], [CameraTruoc], [SoLuongTon],[MaMau], [MaDM]) VALUES (54,N'Oppo A76',7319000.0000,2,N'Còn hàng','25.png',N'Super AMOLED Full HD+ (1080 x 2400 Pixels), Chính 64 MP & Phụ 12 MP, 5 MP, 5 MP, 32 MP','Android 11',N'Snapdragon 720G 8 nhân',N'2 camera 12 MP','4500 mAh','8GB','128GB','16GB','7 MP',30,1,3)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MaHSX], [TinhTrang], [HinhAnh], [ManHinh], [HDH], [CPU], [Camera], [Pin], [Ram], [BoNhoTrong], [TheNhoNgoai], [CameraTruoc], [SoLuongTon],[MaMau], [MaDM]) VALUES (55,N'Oppo A55',7319000.0000,2,N'Còn hàng','26.png',N'Super AMOLED Full HD+ (1080 x 2400 Pixels), Chính 64 MP & Phụ 12 MP, 5 MP, 5 MP, 32 MP','Android 11',N'Snapdragon 720G 8 nhân',N'2 camera 12 MP','4500 mAh','8GB','128GB','16GB','7 MP',30,2,3)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MaHSX], [TinhTrang], [HinhAnh], [ManHinh], [HDH], [CPU], [Camera], [Pin], [Ram], [BoNhoTrong], [TheNhoNgoai], [CameraTruoc], [SoLuongTon], [MaMau],[MaDM]) VALUES (56,N'Oppo A94',7319000.0000,2,N'Còn hàng','27.png',N'Super AMOLED Full HD+ (1080 x 2400 Pixels), Chính 64 MP & Phụ 12 MP, 5 MP, 5 MP, 32 MP','Android 11',N'Snapdragon 720G 8 nhân',N'2 camera 12 MP','4500 mAh','8GB','128GB','16GB','7 MP',30,3,3)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MaHSX], [TinhTrang], [HinhAnh], [ManHinh], [HDH], [CPU], [Camera], [Pin], [Ram], [BoNhoTrong], [TheNhoNgoai], [CameraTruoc], [SoLuongTon],[MaMau], [MaDM]) VALUES (57,N'Oppo A74',7319000.0000,2,N'Còn hàng','28.png',N'Super AMOLED Full HD+ (1080 x 2400 Pixels), Chính 64 MP & Phụ 12 MP, 5 MP, 5 MP, 32 MP','Android 11',N'Snapdragon 720G 8 nhân',N'2 camera 12 MP','4500 mAh','8GB','128GB','16GB','7 MP',30,4,3)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MaHSX], [TinhTrang], [HinhAnh], [ManHinh], [HDH], [CPU], [Camera], [Pin], [Ram], [BoNhoTrong], [TheNhoNgoai], [CameraTruoc], [SoLuongTon],[MaMau], [MaDM]) VALUES (58,N'Oppo A76',7319000.0000,2,N'Còn hàng','29.png',N'Super AMOLED Full HD+ (1080 x 2400 Pixels), Chính 64 MP & Phụ 12 MP, 5 MP, 5 MP, 32 MP','Android 11',N'Snapdragon 720G 8 nhân',N'2 camera 12 MP','4500 mAh','8GB','128GB','16GB','7 MP',30,1,3)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MaHSX], [TinhTrang], [HinhAnh], [ManHinh], [HDH], [CPU], [Camera], [Pin], [Ram], [BoNhoTrong], [TheNhoNgoai], [CameraTruoc], [SoLuongTon], [MaMau],[MaDM]) VALUES (59,N'Oppo A55',7319000.0000,2,N'Còn hàng','30.png',N'Super AMOLED Full HD+ (1080 x 2400 Pixels), Chính 64 MP & Phụ 12 MP, 5 MP, 5 MP, 32 MP','Android 11',N'Snapdragon 720G 8 nhân',N'2 camera 12 MP','4500 mAh','8GB','128GB','16GB','7 MP',30,2,3)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MaHSX], [TinhTrang], [HinhAnh], [ManHinh], [HDH], [CPU], [Camera], [Pin], [Ram], [BoNhoTrong], [TheNhoNgoai], [CameraTruoc], [SoLuongTon], [MaMau],[MaDM]) VALUES (60,N'Oppo A94',7319000.0000,2,N'Còn hàng','31.png',N'Super AMOLED Full HD+ (1080 x 2400 Pixels), Chính 64 MP & Phụ 12 MP, 5 MP, 5 MP, 32 MP','Android 11',N'Snapdragon 720G 8 nhân',N'2 camera 12 MP','4500 mAh','8GB','128GB','16GB','7 MP',30,3,3)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MaHSX], [TinhTrang], [HinhAnh], [ManHinh], [HDH], [CPU], [Camera], [Pin], [Ram], [BoNhoTrong], [TheNhoNgoai], [CameraTruoc], [SoLuongTon], [MaMau],[MaDM]) VALUES (61,N'Oppo A74',7319000.0000,2,N'Còn hàng','25.png',N'Super AMOLED Full HD+ (1080 x 2400 Pixels), Chính 64 MP & Phụ 12 MP, 5 MP, 5 MP, 32 MP','Android 11',N'Snapdragon 720G 8 nhân',N'2 camera 12 MP','4500 mAh','8GB','128GB','16GB','7 MP',30,4,3)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MaHSX], [TinhTrang], [HinhAnh], [ManHinh], [HDH], [CPU], [Camera], [Pin], [Ram], [BoNhoTrong], [TheNhoNgoai], [CameraTruoc], [SoLuongTon],[MaMau], [MaDM]) VALUES (62,N'Oppo A76',7319000.0000,2,N'Còn hàng','26.png',N'Super AMOLED Full HD+ (1080 x 2400 Pixels), Chính 64 MP & Phụ 12 MP, 5 MP, 5 MP, 32 MP','Android 11',N'Snapdragon 720G 8 nhân',N'2 camera 12 MP','4500 mAh','8GB','128GB','16GB','7 MP',30,1,3)

INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MaHSX], [TinhTrang], [HinhAnh], [ManHinh], [HDH], [CPU], [Camera], [Pin], [Ram], [BoNhoTrong], [TheNhoNgoai], [CameraTruoc], [SoLuongTon],[MaMau], [MaDM]) VALUES (64,N'Xiaomi Redmi Note 11',7319000.0000,4,N'Còn hàng','32.png',N'Super AMOLED Full HD+ (1080 x 2400 Pixels), Chính 64 MP & Phụ 12 MP, 5 MP, 5 MP, 32 MP','Android 11',N'Snapdragon 720G 8 nhân',N'2 camera 12 MP','4500 mAh','8GB','128GB','16GB','7 MP',30,2,4)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MaHSX], [TinhTrang], [HinhAnh], [ManHinh], [HDH], [CPU], [Camera], [Pin], [Ram], [BoNhoTrong], [TheNhoNgoai], [CameraTruoc], [SoLuongTon], [MaMau],[MaDM]) VALUES (65,N'Xiaomi Redmi Note 10',7319000.0000,4,N'Còn hàng','33.png',N'Super AMOLED Full HD+ (1080 x 2400 Pixels), Chính 64 MP & Phụ 12 MP, 5 MP, 5 MP, 32 MP','Android 11',N'Snapdragon 720G 8 nhân',N'2 camera 12 MP','4500 mAh','8GB','128GB','16GB','7 MP',30,3,4)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MaHSX], [TinhTrang], [HinhAnh], [ManHinh], [HDH], [CPU], [Camera], [Pin], [Ram], [BoNhoTrong], [TheNhoNgoai], [CameraTruoc], [SoLuongTon],[MaMau], [MaDM]) VALUES (66,N'Xiaomi Redmi Note 9',7319000.0000,4,N'Còn hàng','34.png',N'Super AMOLED Full HD+ (1080 x 2400 Pixels), Chính 64 MP & Phụ 12 MP, 5 MP, 5 MP, 32 MP','Android 11',N'Snapdragon 720G 8 nhân',N'2 camera 12 MP','4500 mAh','8GB','128GB','16GB','7 MP',30,4,4)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MaHSX], [TinhTrang], [HinhAnh], [ManHinh], [HDH], [CPU], [Camera], [Pin], [Ram], [BoNhoTrong], [TheNhoNgoai], [CameraTruoc], [SoLuongTon], [MaMau],[MaDM]) VALUES (67,N'Xiaomi Redmi Note 8',7319000.0000,4,N'Còn hàng','35.png',N'Super AMOLED Full HD+ (1080 x 2400 Pixels), Chính 64 MP & Phụ 12 MP, 5 MP, 5 MP, 32 MP','Android 11',N'Snapdragon 720G 8 nhân',N'2 camera 12 MP','4500 mAh','8GB','128GB','16GB','7 MP',30,1,4)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MaHSX], [TinhTrang], [HinhAnh], [ManHinh], [HDH], [CPU], [Camera], [Pin], [Ram], [BoNhoTrong], [TheNhoNgoai], [CameraTruoc], [SoLuongTon],[MaMau], [MaDM]) VALUES (68,N'Xiaomi Redmi Note 11',7319000.0000,4,N'Còn hàng','36.png',N'Super AMOLED Full HD+ (1080 x 2400 Pixels), Chính 64 MP & Phụ 12 MP, 5 MP, 5 MP, 32 MP','Android 11',N'Snapdragon 720G 8 nhân',N'2 camera 12 MP','4500 mAh','8GB','128GB','16GB','7 MP',30,2,4)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MaHSX], [TinhTrang], [HinhAnh], [ManHinh], [HDH], [CPU], [Camera], [Pin], [Ram], [BoNhoTrong], [TheNhoNgoai], [CameraTruoc], [SoLuongTon],[MaMau], [MaDM]) VALUES (69,N'Xiaomi Redmi Note 10',7319000.0000,4,N'Còn hàng','37.png',N'Super AMOLED Full HD+ (1080 x 2400 Pixels), Chính 64 MP & Phụ 12 MP, 5 MP, 5 MP, 32 MP','Android 11',N'Snapdragon 720G 8 nhân',N'2 camera 12 MP','4500 mAh','8GB','128GB','16GB','7 MP',30,3,4)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MaHSX], [TinhTrang], [HinhAnh], [ManHinh], [HDH], [CPU], [Camera], [Pin], [Ram], [BoNhoTrong], [TheNhoNgoai], [CameraTruoc], [SoLuongTon], [MaMau],[MaDM]) VALUES (70,N'Xiaomi Redmi Note 9',7319000.0000,4,N'Còn hàng','38.png',N'Super AMOLED Full HD+ (1080 x 2400 Pixels), Chính 64 MP & Phụ 12 MP, 5 MP, 5 MP, 32 MP','Android 11',N'Snapdragon 720G 8 nhân',N'2 camera 12 MP','4500 mAh','8GB','128GB','16GB','7 MP',30,4,4)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MaHSX], [TinhTrang], [HinhAnh], [ManHinh], [HDH], [CPU], [Camera], [Pin], [Ram], [BoNhoTrong], [TheNhoNgoai], [CameraTruoc], [SoLuongTon],[MaMau], [MaDM]) VALUES (71,N'Xiaomi Redmi Note 8',7319000.0000,4,N'Còn hàng','39.png',N'Super AMOLED Full HD+ (1080 x 2400 Pixels), Chính 64 MP & Phụ 12 MP, 5 MP, 5 MP, 32 MP','Android 11',N'Snapdragon 720G 8 nhân',N'2 camera 12 MP','4500 mAh','8GB','128GB','16GB','7 MP',30,1,4)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MaHSX], [TinhTrang], [HinhAnh], [ManHinh], [HDH], [CPU], [Camera], [Pin], [Ram], [BoNhoTrong], [TheNhoNgoai], [CameraTruoc], [SoLuongTon], [MaMau],[MaDM]) VALUES (72,N'Xiaomi Redmi Note 11',7319000.0000,4,N'Còn hàng','40.png',N'Super AMOLED Full HD+ (1080 x 2400 Pixels), Chính 64 MP & Phụ 12 MP, 5 MP, 5 MP, 32 MP','Android 11',N'Snapdragon 720G 8 nhân',N'2 camera 12 MP','4500 mAh','8GB','128GB','16GB','7 MP',30,2,4)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MaHSX], [TinhTrang], [HinhAnh], [ManHinh], [HDH], [CPU], [Camera], [Pin], [Ram], [BoNhoTrong], [TheNhoNgoai], [CameraTruoc], [SoLuongTon],[MaMau], [MaDM]) VALUES (73,N'Xiaomi Redmi Note 10',7319000.0000,4,N'Còn hàng','41.png',N'Super AMOLED Full HD+ (1080 x 2400 Pixels), Chính 64 MP & Phụ 12 MP, 5 MP, 5 MP, 32 MP','Android 11',N'Snapdragon 720G 8 nhân',N'2 camera 12 MP','4500 mAh','8GB','128GB','16GB','7 MP',30,3,4)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MaHSX], [TinhTrang], [HinhAnh], [ManHinh], [HDH], [CPU], [Camera], [Pin], [Ram], [BoNhoTrong], [TheNhoNgoai], [CameraTruoc], [SoLuongTon],[MaMau], [MaDM]) VALUES (74,N'Xiaomi Redmi Note 9',7319000.0000,4,N'Còn hàng','42.png',N'Super AMOLED Full HD+ (1080 x 2400 Pixels), Chính 64 MP & Phụ 12 MP, 5 MP, 5 MP, 32 MP','Android 11',N'Snapdragon 720G 8 nhân',N'2 camera 12 MP','4500 mAh','8GB','128GB','16GB','7 MP',30,4,4)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MaHSX], [TinhTrang], [HinhAnh], [ManHinh], [HDH], [CPU], [Camera], [Pin], [Ram], [BoNhoTrong], [TheNhoNgoai], [CameraTruoc], [SoLuongTon],[MaMau], [MaDM]) VALUES (75,N'Xiaomi Redmi Note 8',7319000.0000,4,N'Còn hàng','43.png',N'Super AMOLED Full HD+ (1080 x 2400 Pixels), Chính 64 MP & Phụ 12 MP, 5 MP, 5 MP, 32 MP','Android 11',N'Snapdragon 720G 8 nhân',N'2 camera 12 MP','4500 mAh','8GB','128GB','16GB','7 MP',30,1,4)

INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MaHSX], [TinhTrang], [HinhAnh], [ManHinh], [HDH], [CPU], [Camera], [Pin], [Ram], [BoNhoTrong], [TheNhoNgoai], [CameraTruoc], [SoLuongTon], [MaMau],[MaDM]) VALUES (76,N'Realme Narzo 50i',300.0000,6,N'Còn hàng','44.jpg',N'Super AMOLED Full HD+ (1080 x 2400 Pixels), Chính 64 MP & Phụ 12 MP, 5 MP, 5 MP, 32 MP','Android 11',N'Snapdragon 720G 8 nhân',N'2 camera 12 MP','4500 mAh','8GB','128GB','16GB','7 MP',30,2,5)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MaHSX], [TinhTrang], [HinhAnh], [ManHinh], [HDH], [CPU], [Camera], [Pin], [Ram], [BoNhoTrong], [TheNhoNgoai], [CameraTruoc], [SoLuongTon],[MaMau], [MaDM]) VALUES (77,N'Realme Q3 Pro',300.0000,6,N'Còn hàng','45.jpg',N'Super AMOLED Full HD+ (1080 x 2400 Pixels), Chính 64 MP & Phụ 12 MP, 5 MP, 5 MP, 32 MP','Android 11',N'Snapdragon 720G 8 nhân',N'2 camera 12 MP','4500 mAh','8GB','128GB','16GB','7 MP',30,3,5)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MaHSX], [TinhTrang], [HinhAnh], [ManHinh], [HDH], [CPU], [Camera], [Pin], [Ram], [BoNhoTrong], [TheNhoNgoai], [CameraTruoc], [SoLuongTon],[MaMau], [MaDM]) VALUES (78,N'Realme GT Neo 2T',350.0000,6,N'Còn hàng','46.jpg',N'Super AMOLED Full HD+ (1080 x 2400 Pixels), Chính 64 MP & Phụ 12 MP, 5 MP, 5 MP, 32 MP','Android 11',N'Snapdragon 720G 8 nhân',N'2 camera 12 MP','4500 mAh','8GB','128GB','16GB','7 MP',30,4,5)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MaHSX], [TinhTrang], [HinhAnh], [ManHinh], [HDH], [CPU], [Camera], [Pin], [Ram], [BoNhoTrong], [TheNhoNgoai], [CameraTruoc], [SoLuongTon],[MaMau], [MaDM]) VALUES (79,N'Realme 9i',200.0000,6,N'Còn hàng','47.jpg',N'Super AMOLED Full HD+ (1080 x 2400 Pixels), Chính 64 MP & Phụ 12 MP, 5 MP, 5 MP, 32 MP','Android 11',N'Snapdragon 720G 8 nhân',N'2 camera 12 MP','4500 mAh','8GB','128GB','16GB','7 MP',30,1,5)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MaHSX], [TinhTrang], [HinhAnh], [ManHinh], [HDH], [CPU], [Camera], [Pin], [Ram], [BoNhoTrong], [TheNhoNgoai], [CameraTruoc], [SoLuongTon],[MaMau], [MaDM]) VALUES (80,N'Realme 9 Pro',300.0000,6,N'Còn hàng','48.jpg',N'Super AMOLED Full HD+ (1080 x 2400 Pixels), Chính 64 MP & Phụ 12 MP, 5 MP, 5 MP, 32 MP','Android 11',N'Snapdragon 720G 8 nhân',N'2 camera 12 MP','4500 mAh','8GB','128GB','16GB','7 MP',30,2,5)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MaHSX], [TinhTrang], [HinhAnh], [ManHinh], [HDH], [CPU], [Camera], [Pin], [Ram], [BoNhoTrong], [TheNhoNgoai], [CameraTruoc], [SoLuongTon], [MaMau],[MaDM]) VALUES (81,N'Realme Narzo 50i',300.0000,6,N'Còn hàng','49.jpg',N'Super AMOLED Full HD+ (1080 x 2400 Pixels), Chính 64 MP & Phụ 12 MP, 5 MP, 5 MP, 32 MP','Android 11',N'Snapdragon 720G 8 nhân',N'2 camera 12 MP','4500 mAh','8GB','128GB','16GB','7 MP',30,3,5)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MaHSX], [TinhTrang], [HinhAnh], [ManHinh], [HDH], [CPU], [Camera], [Pin], [Ram], [BoNhoTrong], [TheNhoNgoai], [CameraTruoc], [SoLuongTon], [MaMau],[MaDM]) VALUES (82,N'Realme Q3 Pro',300.0000,6,N'Còn hàng','50.jpg',N'Super AMOLED Full HD+ (1080 x 2400 Pixels), Chính 64 MP & Phụ 12 MP, 5 MP, 5 MP, 32 MP','Android 11',N'Snapdragon 720G 8 nhân',N'2 camera 12 MP','4500 mAh','8GB','128GB','16GB','7 MP',30,4,5)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MaHSX], [TinhTrang], [HinhAnh], [ManHinh], [HDH], [CPU], [Camera], [Pin], [Ram], [BoNhoTrong], [TheNhoNgoai], [CameraTruoc], [SoLuongTon],[MaMau], [MaDM]) VALUES (83,N'Realme GT Neo 2T',350.0000,6,N'Còn hàng','51.jpg',N'Super AMOLED Full HD+ (1080 x 2400 Pixels), Chính 64 MP & Phụ 12 MP, 5 MP, 5 MP, 32 MP','Android 11',N'Snapdragon 720G 8 nhân',N'2 camera 12 MP','4500 mAh','8GB','128GB','16GB','7 MP',30,1,5)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MaHSX], [TinhTrang], [HinhAnh], [ManHinh], [HDH], [CPU], [Camera], [Pin], [Ram], [BoNhoTrong], [TheNhoNgoai], [CameraTruoc], [SoLuongTon],[MaMau], [MaDM]) VALUES (84,N'Realme 9i',200.0000,6,N'Còn hàng','52.jpg',N'Super AMOLED Full HD+ (1080 x 2400 Pixels), Chính 64 MP & Phụ 12 MP, 5 MP, 5 MP, 32 MP','Android 11',N'Snapdragon 720G 8 nhân',N'2 camera 12 MP','4500 mAh','8GB','128GB','16GB','7 MP',30,2,5)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MaHSX], [TinhTrang], [HinhAnh], [ManHinh], [HDH], [CPU], [Camera], [Pin], [Ram], [BoNhoTrong], [TheNhoNgoai], [CameraTruoc], [SoLuongTon],[MaMau], [MaDM]) VALUES (85,N'Realme 9 Pro',300.0000,6,N'Còn hàng','53.jpg',N'Super AMOLED Full HD+ (1080 x 2400 Pixels), Chính 64 MP & Phụ 12 MP, 5 MP, 5 MP, 32 MP','Android 11',N'Snapdragon 720G 8 nhân',N'2 camera 12 MP','4500 mAh','8GB','128GB','16GB','7 MP',30,3,5)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MaHSX], [TinhTrang], [HinhAnh], [ManHinh], [HDH], [CPU], [Camera], [Pin], [Ram], [BoNhoTrong], [TheNhoNgoai], [CameraTruoc], [SoLuongTon],[MaMau], [MaDM]) VALUES (86,N'Realme Narzo 50i',300.0000,6,N'Còn hàng','54.jpg',N'Super AMOLED Full HD+ (1080 x 2400 Pixels), Chính 64 MP & Phụ 12 MP, 5 MP, 5 MP, 32 MP','Android 11',N'Snapdragon 720G 8 nhân',N'2 camera 12 MP','4500 mAh','8GB','128GB','16GB','7 MP',30,4,5)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MaHSX], [TinhTrang], [HinhAnh], [ManHinh], [HDH], [CPU], [Camera], [Pin], [Ram], [BoNhoTrong], [TheNhoNgoai], [CameraTruoc], [SoLuongTon],[MaMau], [MaDM]) VALUES (87,N'Realme Q3 Pro',300.0000,6,N'Còn hàng','55.jpg',N'Super AMOLED Full HD+ (1080 x 2400 Pixels), Chính 64 MP & Phụ 12 MP, 5 MP, 5 MP, 32 MP','Android 11',N'Snapdragon 720G 8 nhân',N'2 camera 12 MP','4500 mAh','8GB','128GB','16GB','7 MP',30,1,5)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MaHSX], [TinhTrang], [HinhAnh], [ManHinh], [HDH], [CPU], [Camera], [Pin], [Ram], [BoNhoTrong], [TheNhoNgoai], [CameraTruoc], [SoLuongTon],[MaMau], [MaDM]) VALUES (88,N'Realme GT Neo 2T',350.0000,6,N'Còn hàng','56.jpg',N'Super AMOLED Full HD+ (1080 x 2400 Pixels), Chính 64 MP & Phụ 12 MP, 5 MP, 5 MP, 32 MP','Android 11',N'Snapdragon 720G 8 nhân',N'2 camera 12 MP','4500 mAh','8GB','128GB','16GB','7 MP',30,2,5)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MaHSX], [TinhTrang], [HinhAnh], [ManHinh], [HDH], [CPU], [Camera], [Pin], [Ram], [BoNhoTrong], [TheNhoNgoai], [CameraTruoc], [SoLuongTon],[MaMau], [MaDM]) VALUES (89,N'Realme 9i',200.0000,6,N'Còn hàng','57.jpg',N'Super AMOLED Full HD+ (1080 x 2400 Pixels), Chính 64 MP & Phụ 12 MP, 5 MP, 5 MP, 32 MP','Android 11',N'Snapdragon 720G 8 nhân',N'2 camera 12 MP','4500 mAh','8GB','128GB','16GB','7 MP',30,3,5)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [MaHSX], [TinhTrang], [HinhAnh], [ManHinh], [HDH], [CPU], [Camera], [Pin], [Ram], [BoNhoTrong], [TheNhoNgoai], [CameraTruoc], [SoLuongTon], [MaMau],[MaDM]) VALUES (90,N'Realme 9 Pro',300.0000,6,N'Còn hàng','58.jpg',N'Super AMOLED Full HD+ (1080 x 2400 Pixels), Chính 64 MP & Phụ 12 MP, 5 MP, 5 MP, 32 MP','Android 11',N'Snapdragon 720G 8 nhân',N'2 camera 12 MP','4500 mAh','8GB','128GB','16GB','7 MP',30,4,5)

go
SET IDENTITY_INSERT [dbo].[SanPham] OFF
GO
SET IDENTITY_INSERT [dbo].[TaiKhoan] ON 

INSERT [dbo].[TaiKhoan] ([MaTK], [Email], [MatKhau], [HoTen], [DiaChi], [SoDienThoai], [Anh], [TinhTrang], [MaQuyen]) VALUES (2, N'namdoan@gmail.com', N'123456', N'Đoàn Duy Nam', N'Vĩnh Bảo - Hải Phòng', N'0397482016', N'th.jpg', 1, 1)
INSERT [dbo].[TaiKhoan] ([MaTK], [Email], [MatKhau], [HoTen], [DiaChi], [SoDienThoai], [Anh], [TinhTrang], [MaQuyen]) VALUES (3, N'hadv@gmail.com', N'123456', N'Vinh Hà Đỗ', N'Hà Nội', N'0123456789', N'anh-gai-xinh-2000-de-thuong.jpg', 1, 3)
INSERT [dbo].[TaiKhoan] ([MaTK], [Email], [MatKhau], [HoTen], [DiaChi], [SoDienThoai], [Anh], [TinhTrang], [MaQuyen]) VALUES (4, N'linhloc27092000@gmail.com', N'123456', N'Nguyễn Anh Linh', N'Ứng Hòa - Hà Nội', N'0815619200', NULL, 1, 3)
INSERT [dbo].[TaiKhoan] ([MaTK], [Email], [MatKhau], [HoTen], [DiaChi], [SoDienThoai], [Anh], [TinhTrang], [MaQuyen]) VALUES (5, N'duykhanh@gmail.com', N'123456', N'Hoàng Duy Khánh', N'Hải Phòng', N'075645676 ', NULL, 1, 3)
INSERT [dbo].[TaiKhoan] ([MaTK], [Email], [MatKhau], [HoTen], [DiaChi], [SoDienThoai], [Anh], [TinhTrang], [MaQuyen]) VALUES (6, N'doanvu@gmail.com', N'123456', N'Vũ Văn Doan', N'Nam Định', N'086743456 ', NULL, 1, 3)
INSERT [dbo].[TaiKhoan] ([MaTK], [Email], [MatKhau], [HoTen], [DiaChi], [SoDienThoai], [Anh], [TinhTrang], [MaQuyen]) VALUES (7, N'ducdiep@gmail.com', N'123456', N'Nguyễn Đức Điệp', N'Hà Nội', N'098765432 ', NULL, 1, 3)
INSERT [dbo].[TaiKhoan] ([MaTK], [Email], [MatKhau], [HoTen], [DiaChi], [SoDienThoai], [Anh], [TinhTrang], [MaQuyen]) VALUES (10, N'lehongphong@gmail.com', N'123456', N'Lê Hồng Phong', N'Đại Học Công Nghiệp Hà Nội', N'0815619222', N'avata.jpg', 1, 2)
INSERT [dbo].[TaiKhoan] ([MaTK], [Email], [MatKhau], [HoTen], [DiaChi], [SoDienThoai], [Anh], [TinhTrang], [MaQuyen]) VALUES (11, N'xuanlinh@gmail.com', N'123456', N'Nguyễn Xuân Linh', N'Ứng Hòa - Hà Nội', N'0815619255', NULL, 1, 3)
SET IDENTITY_INSERT [dbo].[TaiKhoan] OFF
GO

