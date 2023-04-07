--1-- Thong ke moi hang san xuat co bao nhieu san pham
SELECT Hangsx.tenhang, COUNT(Sanpham.masp) AS so_luong_sp
FROM Hangsx
JOIN Sanpham ON Hangsx.mahangsx = Sanpham.mahangsx
GROUP BY Hangsx.tenhang
--2-- Thong ke xem tong tien nhap cua moi san pham trong nam 2018
SELECT masp, SUM(soluongN * dongiaN) AS TongTienNhap
FROM Nhap
WHERE YEAR(ngaynhap) = 2020
GROUP BY masp;
--3-- Hay thong ke cac san pham co tong san luong xuat nam 2018 la lon hon 10.000 san pham cua hang Samsung
SELECT Sanpham.masp, Sanpham.tensp, SUM(Xuat.soluongX) as tong_soluong_xuat
FROM Sanpham
JOIN Xuat ON Sanpham.masp = Xuat.masp
JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
WHERE YEAR(Xuat.ngayxuat) = 2018 AND Hangsx.tenhang = 'Samsung'
GROUP BY Sanpham.masp, Sanpham.tensp
HAVING SUM(Xuat.soluongX) > 10000;
--4--Thong ke so luong nhan vien NAM cua moi phong ban
SELECT phong, COUNT(*) AS SoLuongNam
FROM Nhanvien
WHERE gioitinh = 'Nam'
GROUP BY phong
--5-- Thong ke tong so luong nhap cua moi hang san xuat trong nam 2018
SELECT Hangsx.tenhang, SUM(Nhap.soluongN) as TongSoLuongNhap
FROM Nhap
JOIN Sanpham ON Nhap.masp = Sanpham.masp
JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
WHERE YEAR(Nhap.ngaynhap) = 2018
GROUP BY Hangsx.tenhang
--6-- Thong ke xem tong luong tien xuat cua moi nhan vien trong nam 2018 la bao nhieu
SELECT Nhanvien.manv, Nhanvien.tennv, SUM(Xuat.soluongX * Sanpham.giaban) AS tongtienxuat
FROM Xuat
INNER JOIN Sanpham ON Xuat.masp = Sanpham.masp
INNER JOIN Nhanvien ON Xuat.manv = Nhanvien.manv
WHERE YEAR(Xuat.ngayxuat) = 2018
GROUP BY Nhanvien.manv, Nhanvien.tennv
--7-- Hay dua ra tong tien nhap cua nhan vien trong thang 8-2018 tong gia tri lon hon 100.000
SELECT manv, SUM(soluongN * dongiaN) AS tong_tien_nhap
FROM Nhap
WHERE MONTH(ngaynhap) = 8 AND YEAR(ngaynhap) = 2018
GROUP BY manv
HAVING SUM(soluongN * dongiaN) > 100000
--8-- Hay dua ra danh sach cac san pham da nhap nhung chua xuat bao gio
SELECT Sanphm.masp, Sanpham.tensp
FROM Nhap
WHERE soluongX = 0
GROUP BY Sanphm.masp, Sanpham.tensp
--9-- Hay dua ra danh sach cac san pham da nhap vaf xuat trong nam 2018
SELECT Sanphm.masp, Sanpham.tensp 
FROM Nhap
WHERE YEAR(ngaynhap) = 2018 AND YEAR(ngayxuat) = 2018
GROUP BY Sanphm.masp, Sanpham.tensp 
--10-- Hay dua ra danh sach cac nhan vien vua nhap vua xuat
SELECT Nhanvien.manv, Nhanvien.tennv, COUNT(Nhap.manv) as Solannhap, COUNT(Xuat.manv) as Solanxuat
FROM Nhanvien
GROUP BY manv
HAVING COUNT(Nhap.manv) > 1 AND COUNT(Xuat.manv) > 1
--11-- Hay dua ra danh sach cac nhan vien khong tham gia vien nhap va xuat
SELECT Nhanvien.manv, Nhanvien.tennv, COUNT(Nhap.manv) as Solannhap, COUNT(Xuat.manv) as Solanxuat
FROM Nhanvien
GROUP BY manv
HAVING COUNT(Nhap.manv) = 0 AND COUNT(Xuat.manv) = 0