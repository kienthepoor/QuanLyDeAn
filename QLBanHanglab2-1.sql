USE QLBanHang
1. select * from Sanpham, Hangsx, Nhanvien, Nhap, Xuat


2. select masp, tensp, tenhang, soluong, mausac, giaban, donvitinh, mota from Sanpham ORDER BY giaban DESC


3. select * from Sanpham WHERE hangsx='Samsung'


4. select * from sv where gt=N'Nữ' and phong='Kế toán'


5. select sohdn, masp, tensp, tenhang, soluongnhap, dongianhap, soluongnhap*dongianhap as tiennhap, mausac, donvitinh, mota, ngaynhap, tennv, phong from Sanpham, Nhanvien, Nhap ORDER BY sohdn ASC


6. select sohdx, masp, tensp, tenhang, soluongxuat, giaban, soluongxuat*giaban as tienxuat, mausac, donvitinh, mota, ngayxuat, tennv, phong from Sanpham, Nhanvien, Xuat WHERE MONTH(Xuat.ngayxuat)='10' and YEAR(Xuat.ngayxuat)='2018' ORDER BY sohdx ASC


7. select sohdn, masp, tensp, soluongnhap, dongianhap, ngaynhap, Manv, tennv, Phong from Nhanvien, Sanpham, Nhap WHERE YEAR(Nhap.ngaynhap)='2017'


8. select top 10 sohdx, masp, manv, ngayxuat, soluongxuat from Xuat WHERE YEAR(Xuat.ngayxuat)='2018' ORDER BY soluongxuat DESC


9. select top 10 masp, tensp, tenhang, soluong, mausac, giaban, donvitinh, mota ORDER BY giaban DESC


10. select * from Sanpham WHERE giaban >= 100000 and giaban <= 500000 and tenhang='Samsung'


11. select SUM(dongianhap) as "Tong so tien " from Nhap, Hangsx WHERE tenhang = 'Samsung'


12. 


13. select sohdn, ngaynhap, SUM(dongianhap) as tongtiennhap,  MAX(tongtiennhap) from Nhap WHERE YEAR(Nhap.ngaynhap)='2018'


14. select top 10 masp, tensp, soluongnhap, dongianhap from Sanpham, Hangsx ORDER BY soluongnhap 


15. select	masp, tensp, tenhang, manv, tennv from Sanpham, Nhap WHERE manv='NV01' and tenhang='Samsung'


16. select sohdn, masp, soluongnhap, ngaynhap, manv, tennv from Sanpham, Nhap WHERE manv='NV02' and masp='SP02'


17. select manv, tennv, sohdx, tensp, ngayxuat from Xuat, Sanpham, Nhanvien WHERE manv='SP02' and ngayxuat='03-02-2020'