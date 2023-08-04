
CREATE FUNCTION TongDoanhThuNam1997() 
RETURNS decimal(10,2)
BEGIN
    DECLARE TongDoanhThu DECIMAL(10, 2);

    SELECT SUM(CT.SoLuong * MH.DonGia * (1 - CT.GiamGia)) INTO TongDoanhThu
    FROM DonDatHang DDH
    JOIN ChiTietDDH CT ON DDH.MaDDH = CT.MaDDH
    JOIN MatHang MH ON CT.MaMH = MH.MaMH
    WHERE YEAR(DDH.NgayDH) = 1997;

    RETURN TongDoanhThu;
END


CREATE  FUNCTION TongDoanhThuTheoNam(Nam INT) 
RETURNS decimal(10,2)
BEGIN
    DECLARE TongDoanhThu DECIMAL(10, 2);

    SELECT SUM(CT.SoLuong * MH.DonGia * (1 - CT.GiamGia)) INTO TongDoanhThu
    FROM DonDatHang DDH
    JOIN ChiTietDDH CT ON DDH.MaDDH = CT.MaDDH
    JOIN MatHang MH ON CT.MaMH = MH.MaMH
    WHERE YEAR(DDH.NgayDH) = Nam;

    RETURN TongDoanhThu;
END


CREATE FUNCTION TongThanhTienTheoMaDDH (MaDDH CHAR(5)) 
RETURNS int
BEGIN
    DECLARE TongThanhTien INT;

    SELECT SUM(CT.SoLuong * MH.DonGia * (1 - CT.GiamGia)) INTO TongThanhTien
    FROM ChiTietDDH CT
    JOIN MatHang MH ON CT.MaMH = MH.MaMH
    WHERE CT.MaDDH = MaDDH;

    RETURN TongThanhTien;
END


CREATE FUNCTION TongDoanhThuTheoMaNV (MaNV INT) 
RETURNS int
BEGIN
    DECLARE TongDoanhThu INT;

    SELECT SUM(CT.SoLuong * MH.DonGia * (1 - CT.GiamGia)) INTO TongDoanhThu
    FROM DonDatHang DDH
    JOIN ChiTietDDH CT ON DDH.MaDDH = CT.MaDDH
    JOIN MatHang MH ON CT.MaMH = MH.MaMH
    WHERE DDH.MaNV = MaNV;

    RETURN TongDoanhThu;
END


#cau 5.1
CREATE PROCEDURE TongDoanhThuNam1997()
BEGIN
    SELECT SUM(CT.SoLuong * MH.DonGia * (1 - CT.GiamGia)) AS TongDoanhThu
    FROM DonDatHang DDH
    JOIN ChiTietDDH CT ON DDH.MaDDH = CT.MaDDH
    JOIN MatHang MH ON CT.MaMH = MH.MaMH
    WHERE YEAR(DDH.NgayDH) = 1997;
END

#c�u 5.2
CREATE PROCEDURE TongDoanhThuTheoNam(IN p_Nam INT)
BEGIN
    SELECT SUM(CT.SoLuong * MH.DonGia * (1 - CT.GiamGia)) AS TongDoanhThu
    FROM DonDatHang DDH
    JOIN ChiTietDDH CT ON DDH.MaDDH = CT.MaDDH
    JOIN MatHang MH ON CT.MaMH = MH.MaMH
    WHERE YEAR(DDH.NgayDH) = p_Nam;
END

#c�u 5.3
CREATE PROCEDURE TongThanhTienTheoMaDDH(IN p_MaDDH CHAR(5))
BEGIN
    SELECT SUM(CT.SoLuong * MH.DonGia * (1 - CT.GiamGia)) AS TongThanhTien
    FROM ChiTietDDH CT
    JOIN MatHang MH ON CT.MaMH = MH.MaMH
    WHERE CT.MaDDH = p_MaDDH;
END

#c�u 5.4
CREATE PROCEDURE TongDoanhThuTheoMaNV(IN p_MaNV INT)
BEGIN
    SELECT SUM(CT.SoLuong * MH.DonGia * (1 - CT.GiamGia)) AS TongDoanhThu
    FROM DonDatHang DDH
    JOIN ChiTietDDH CT ON DDH.MaDDH = CT.MaDDH
    JOIN MatHang MH ON CT.MaMH = MH.MaMH
    WHERE DDH.MaNV = p_MaNV;
END

CREATE  PROCEDURE LietKeNhanVienTheoPhai(IN p_Phai CHAR(1))
BEGIN
    SELECT MaNV, HoLot, TenNV, DiaChiNV, NgayNViec, Phai
    FROM NhanVien
    WHERE Phai = p_Phai;
END

CREATE PROCEDURE LietKeMatHangTheoMaDDH(IN p_MaDDH CHAR(5))
BEGIN
    SELECT MH.MaMH, MH.TenMH, CT.SoLuong
    FROM MatHang MH
    JOIN ChiTietDDH CT ON MH.MaMH = CT.MaMH
    WHERE CT.MaDDH = p_MaDDH;
END


CREATE PROCEDURE LietKeMatHangTheoNhaCungCap(IN p_MaNCC INT)
BEGIN
    SELECT MH.MaMH, MH.TenMH, MH.DonViTinh, MH.DonGia
    FROM MatHang MH
    WHERE MH.MaNCC = p_MaNCC;
END


CREATE PROCEDURE LietKeDonDatHangTheoKhoangThoiGian(IN p_NgayBatDau DATE, IN p_NgayKetThuc DATE)
BEGIN
    SELECT DDH.MaDDH, DDH.NgayDH, DDH.NgayGiao, DDH.MaKH, KH.TenKH, MH.MaMH, MH.TenMH, CT.SoLuong
    FROM DonDatHang DDH
    JOIN ChiTietDDH CT ON DDH.MaDDH = CT.MaDDH
    JOIN MatHang MH ON CT.MaMH = MH.MaMH
    JOIN KhachHang KH ON DDH.MaKH = KH.MaKH
    WHERE DDH.NgayDH >= p_NgayBatDau AND DDH.NgayDH <= p_NgayKetThuc;
END