-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th7 29, 2023 lúc 12:31 PM
-- Phiên bản máy phục vụ: 10.4.24-MariaDB
-- Phiên bản PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `quanlybanhang`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chamcong`
--

CREATE TABLE `chamcong` (
  `Thang` tinyint(3) UNSIGNED NOT NULL,
  `Nam` smallint(5) UNSIGNED NOT NULL,
  `MaNV` int(11) NOT NULL,
  `NgayCong` tinyint(4) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `chamcong`
--

INSERT INTO `chamcong` (`Thang`, `Nam`, `MaNV`, `NgayCong`) VALUES
(3, 2021, 2, 28),
(3, 2021, 6, 29),
(3, 2023, 1, 26),
(3, 2023, 3, 26),
(3, 2023, 4, 27),
(3, 2023, 5, 28),
(3, 2023, 7, 30),
(3, 2023, 8, 31),
(4, 2023, 9, 1),
(4, 2023, 10, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitietddh`
--

CREATE TABLE `chitietddh` (
  `MaDDH` char(5) NOT NULL,
  `MaMH` int(11) NOT NULL,
  `SoLuong` int(11) NOT NULL,
  `GiamGia` date DEFAULT '2002-01-01'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `chitietddh`
--

INSERT INTO `chitietddh` (`MaDDH`, `MaMH`, `SoLuong`, `GiamGia`) VALUES
('M1', 1, 3, '0000-00-00'),
('M10', 1, 6, '0000-00-00'),
('M2', 2, 10, '0000-00-00'),
('M3', 3, 2, '0000-00-00'),
('M4', 4, 5, '0000-00-00'),
('M5', 4, 7, '0000-00-00'),
('M6', 2, 1, '0000-00-00'),
('M7', 4, 4, '0000-00-00'),
('M8', 1, 9, '0000-00-00'),
('M9', 3, 8, '0000-00-00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `dondathang`
--

CREATE TABLE `dondathang` (
  `MaDDH` char(5) NOT NULL,
  `MaKH` varchar(10) NOT NULL,
  `MaNV` int(11) NOT NULL,
  `NgayDH` date NOT NULL,
  `NgayGiao` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `dondathang`
--

INSERT INTO `dondathang` (`MaDDH`, `MaKH`, `MaNV`, `NgayDH`, `NgayGiao`) VALUES
('M1', 'CODACO', 1, '0000-00-00', '0000-00-00'),
('M10', 'VTP', 10, '0000-00-00', '0000-00-00'),
('M2', 'COTEC', 2, '0000-00-00', '0000-00-00'),
('M3', 'DHP', 3, '0000-00-00', '0000-00-00'),
('M4', 'GIAY32', 4, '0000-00-00', '0000-00-00'),
('M5', 'RUBIMEX', 5, '0000-00-00', '0000-00-00'),
('M6', 'SAMACO', 6, '0000-00-00', '0000-00-00'),
('M7', 'SAMECO', 7, '0000-00-00', '0000-00-00'),
('M8', 'TRACODI', 8, '0000-00-00', '0000-00-00'),
('M9', 'VITICO', 9, '0000-00-00', '0000-00-00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `donvi`
--

CREATE TABLE `donvi` (
  `MaDV` char(2) NOT NULL,
  `TenDV` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `donvi`
--

INSERT INTO `donvi` (`MaDV`, `TenDV`) VALUES
('GD', ' Giám Đốc'),
('NV', ' Nghiệp Vụ'),
('KT', 'Kế Toán'),
('TC', 'Tổ Chức');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khachhang`
--

CREATE TABLE `khachhang` (
  `MaKH` varchar(10) NOT NULL,
  `TenKH` varchar(40) NOT NULL DEFAULT ' ',
  `DiaChi` varchar(60) NOT NULL DEFAULT ' ',
  `DienThoai` varchar(11) NOT NULL DEFAULT ' ',
  `MaTP` char(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `khachhang`
--

INSERT INTO `khachhang` (`MaKH`, `TenKH`, `DiaChi`, `DienThoai`, `MaTP`) VALUES
('CODACO', 'Cơ khí dân dụng', '388 Hòa Hảo P5', '1185376', 'TP'),
('COTEC', 'Công Nghệ Mới', '319 Nguyễn Trãi P7', '2356783', 'CT'),
('DHP', 'Đại Hưng Phát', '343 Nhật Tảo P16', '2368473', 'NT'),
('GIAY32', 'Giày 32', '105A Ngô Quyền P11', '386922', 'CT'),
('RUBIMEX', 'Công nghiệp Cao Su', '220 Lê Văn Sỹ', '358423', 'NT'),
('SAMACO', 'SXKD Dịch Vụ Tổng Hợp', '56 Nguyễn Biểu P2', '7864823', 'CT'),
('SAMECO', 'Cơ khí Sài Gòn', '3156 Lê Đại Hành P7', '6723473', 'HN'),
('TRACODI', 'Đầu Tư phát triển GTVT', 'Hàm Nghi Q1', '736533', 'HP'),
('VITICO', 'Hóa nhựa Vĩnh Tiến', '35 Tô Hiến Thành P14', '7457382', 'TP'),
('VTP', 'Van Hưng Phát', '119 Bạch Vân P17', '11887873', 'HN');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mathang`
--

CREATE TABLE `mathang` (
  `MaMH` int(11) NOT NULL,
  `TenMH` varchar(30) NOT NULL,
  `DonViTinh` varchar(20) NOT NULL DEFAULT ' ',
  `DonGia` int(11) NOT NULL DEFAULT 0,
  `HinhSP` text DEFAULT NULL,
  `MaNCC` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `mathang`
--

INSERT INTO `mathang` (`MaMH`, `TenMH`, `DonViTinh`, `DonGia`, `HinhSP`, `MaNCC`) VALUES
(1, 'Rượu', 'Chai', 230, '', 7),
(2, 'Tiêu', 'Hộp', 40, '', 7),
(3, 'Bánh Kem', 'Cái', 10, '', 3),
(4, 'Bơ', 'Kg', 38, '', 6);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhacungcap`
--

CREATE TABLE `nhacungcap` (
  `MaNCC` int(11) NOT NULL,
  `TenNCC` varchar(30) NOT NULL,
  `DiaChi` varchar(60) NOT NULL DEFAULT ' ',
  `DienThoai` varchar(11) NOT NULL DEFAULT ' '
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `nhacungcap`
--

INSERT INTO `nhacungcap` (`MaNCC`, `TenNCC`, `DiaChi`, `DienThoai`) VALUES
(1, 'CTY Đồ hộp Tân Bình', 'TP.HCM', '123456'),
(2, 'CTY Rượu Bình Tân', 'TP.HCM', '342342'),
(3, 'CTY Đức Phát', 'TP.HCM', '453456'),
(4, 'CTY Rau Quả Việt Nam', 'Hà Nội', '637329'),
(5, 'CTY Thủy Sản Tiền Giang', 'Tiền Giang', '656357'),
(6, 'CTY VINAMILK', 'TP.HCM', '253675'),
(7, 'CTY Nông Sản Lâm Đồng', 'Đà Lạt', '6563567');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhanvien`
--

CREATE TABLE `nhanvien` (
  `MaNV` int(11) NOT NULL,
  `HoLot` varchar(30) NOT NULL DEFAULT ' ',
  `TenNV` varchar(20) NOT NULL DEFAULT ' ',
  `Phai` enum('F','M') NOT NULL DEFAULT 'F',
  `LuongCB` int(11) NOT NULL DEFAULT 0,
  `NgayNViec` date NOT NULL,
  `DiaChiNV` varchar(60) NOT NULL DEFAULT ' ',
  `DienThoaiNV` varchar(11) DEFAULT NULL,
  `HinhNV` text DEFAULT NULL,
  `MaDV` char(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `nhanvien`
--

INSERT INTO `nhanvien` (`MaNV`, `HoLot`, `TenNV`, `Phai`, `LuongCB`, `NgayNViec`, `DiaChiNV`, `DienThoaiNV`, `HinhNV`, `MaDV`) VALUES
(1, 'Nguyễn', 'Thương', 'F', 10000, '0000-00-00', 'Hà Nội', NULL, ' ', 'NV'),
(2, 'Nguyễn', 'Linh', 'F', 10000, '0000-00-00', 'Thanh Hóa', NULL, ' ', 'GD'),
(3, 'Phạm', 'Hạ', 'F', 20000, '0000-00-00', 'Bắc Giang', NULL, ' ', 'NV'),
(4, 'Phạm', 'Quang', 'M', 30000, '0000-00-00', 'Bắc Giang', NULL, ' ', 'KT'),
(5, 'Nguyễn', 'Lan', 'F', 10000, '0000-00-00', 'Hà Nội', NULL, ' ', 'TC'),
(6, 'Lê', 'Hoàng', 'M', 22000, '0000-00-00', 'Bắc Kạn', NULL, ' ', 'NV'),
(7, 'Phạm', 'Quân', 'M', 23000, '0000-00-00', 'Bắc Ninh', NULL, ' ', 'NV'),
(8, 'Nguyễn', 'Lan', 'F', 10000, '0000-00-00', 'Thái Nguyên', NULL, ' ', 'NV'),
(9, 'Lê', 'Hoà', 'M', 22000, '0000-00-00', 'Quảng Ninh', NULL, ' ', 'TC'),
(10, 'Trần', 'Quân', 'M', 23000, '0000-00-00', 'Thái Bình', NULL, ' ', 'NV');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tinhtp`
--

CREATE TABLE `tinhtp` (
  `MaTP` char(2) NOT NULL,
  `TenTP` varchar(30) NOT NULL DEFAULT ' '
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `tinhtp`
--

INSERT INTO `tinhtp` (`MaTP`, `TenTP`) VALUES
('CT', 'Cần Thơ'),
('HN', 'Hà Nội'),
('HP', 'Hải Phòng'),
('HU', 'Huế'),
('ND', 'Nam Định'),
('NT', 'Nha Trang'),
('TP', 'TP.Hồ Chí Minh'),
('VI', 'Vinh');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `chamcong`
--
ALTER TABLE `chamcong`
  ADD PRIMARY KEY (`Thang`,`Nam`,`MaNV`),
  ADD KEY `MaNV` (`MaNV`);

--
-- Chỉ mục cho bảng `chitietddh`
--
ALTER TABLE `chitietddh`
  ADD PRIMARY KEY (`MaDDH`,`MaMH`),
  ADD KEY `MaMH` (`MaMH`);

--
-- Chỉ mục cho bảng `dondathang`
--
ALTER TABLE `dondathang`
  ADD PRIMARY KEY (`MaDDH`),
  ADD KEY `MaNV` (`MaNV`),
  ADD KEY `MaKH` (`MaKH`);

--
-- Chỉ mục cho bảng `donvi`
--
ALTER TABLE `donvi`
  ADD PRIMARY KEY (`MaDV`),
  ADD UNIQUE KEY `TenDV` (`TenDV`);

--
-- Chỉ mục cho bảng `khachhang`
--
ALTER TABLE `khachhang`
  ADD PRIMARY KEY (`MaKH`),
  ADD UNIQUE KEY `TenKH` (`TenKH`),
  ADD KEY `MaTP` (`MaTP`);

--
-- Chỉ mục cho bảng `mathang`
--
ALTER TABLE `mathang`
  ADD PRIMARY KEY (`MaMH`),
  ADD UNIQUE KEY `TenMH` (`TenMH`),
  ADD KEY `MaNCC` (`MaNCC`);

--
-- Chỉ mục cho bảng `nhacungcap`
--
ALTER TABLE `nhacungcap`
  ADD PRIMARY KEY (`MaNCC`),
  ADD UNIQUE KEY `TenNCC` (`TenNCC`);

--
-- Chỉ mục cho bảng `nhanvien`
--
ALTER TABLE `nhanvien`
  ADD PRIMARY KEY (`MaNV`),
  ADD KEY `MaDV` (`MaDV`);

--
-- Chỉ mục cho bảng `tinhtp`
--
ALTER TABLE `tinhtp`
  ADD PRIMARY KEY (`MaTP`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `mathang`
--
ALTER TABLE `mathang`
  MODIFY `MaMH` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `nhacungcap`
--
ALTER TABLE `nhacungcap`
  MODIFY `MaNCC` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `nhanvien`
--
ALTER TABLE `nhanvien`
  MODIFY `MaNV` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `chamcong`
--
ALTER TABLE `chamcong`
  ADD CONSTRAINT `chamcong_ibfk_1` FOREIGN KEY (`MaNV`) REFERENCES `nhanvien` (`MaNV`);

--
-- Các ràng buộc cho bảng `chitietddh`
--
ALTER TABLE `chitietddh`
  ADD CONSTRAINT `chitietddh_ibfk_1` FOREIGN KEY (`MaDDH`) REFERENCES `dondathang` (`MaDDH`),
  ADD CONSTRAINT `chitietddh_ibfk_2` FOREIGN KEY (`MaMH`) REFERENCES `mathang` (`MaMH`);

--
-- Các ràng buộc cho bảng `dondathang`
--
ALTER TABLE `dondathang`
  ADD CONSTRAINT `dondathang_ibfk_1` FOREIGN KEY (`MaNV`) REFERENCES `nhanvien` (`MaNV`),
  ADD CONSTRAINT `dondathang_ibfk_2` FOREIGN KEY (`MaKH`) REFERENCES `khachhang` (`MaKH`);

--
-- Các ràng buộc cho bảng `khachhang`
--
ALTER TABLE `khachhang`
  ADD CONSTRAINT `khachhang_ibfk_1` FOREIGN KEY (`MaTP`) REFERENCES `tinhtp` (`MaTP`);

--
-- Các ràng buộc cho bảng `mathang`
--
ALTER TABLE `mathang`
  ADD CONSTRAINT `mathang_ibfk_1` FOREIGN KEY (`MaNCC`) REFERENCES `nhacungcap` (`MaNCC`);

--
-- Các ràng buộc cho bảng `nhanvien`
--
ALTER TABLE `nhanvien`
  ADD CONSTRAINT `nhanvien_ibfk_1` FOREIGN KEY (`MaDV`) REFERENCES `donvi` (`MaDV`),
  ADD CONSTRAINT `nhanvien_ibfk_2` FOREIGN KEY (`MaDV`) REFERENCES `donvi` (`MaDV`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
