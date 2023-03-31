USE QLBanHang
//Hiển thị thông tin các dữ liệu trên
1. select * from Sanpham, Hangsx, Nhanvien, Nhap, Xuat

//Đưa ra thông tin masp, tensp, tenhang, soluong, mausac, giaban, donvitinh, mota
2. select masp, tensp, tenhang, soluong, mausac, giaban, donvitinh, mota from Sanpham ORDER BY giaban DESC

//Đưa ra thông tin các mặt hàng có đơn vị là SamSung sản xuất
3. select * from Sanpham WHERE hangsx='Samsung'

//Đưa ra thông tin của các nhân viên nữ phòng kế toán
4. select * from sv where gt=N'Nữ' and phong='Kế toán'

//Đưa ra thông tin phiếu nhập gồm: sohdn, masp, tensp, tenhang, soluongnhap, dongianhap, soluongnhap*dongianhap as tiennhap, mausac, donvitinh, mota, ngaynhap, tennv, phong. Sắp xếp theo chiều tăng dần của hóa đơn nhập
5. select sohdn, masp, tensp, tenhang, soluongnhap, dongianhap, soluongnhap*dongianhap as tiennhap, mausac, donvitinh, mota, ngaynhap, tennv, phong from Sanpham, Nhanvien, Nhap ORDER BY sohdn ASC

//Đưa ra thông tin phiếu xuất, trong đó tienxuat=soluongX*giaban. Sắp xếp theo chiều tăng dần của sohdx
6. select sohdx, masp, tensp, tenhang, soluongxuat, giaban, soluongxuat*giaban as tienxuat, mausac, donvitinh, mota, ngayxuat, tennv, phong from Sanpham, Nhanvien, Xuat WHERE MONTH(Xuat.ngayxuat)='10' and YEAR(Xuat.ngayxuat)='2018' ORDER BY sohdx ASC

//Đưa ra các thông tin mà hãng Samsung đã nhập trong năm 2017
7. select sohdn, masp, tensp, soluongnhap, dongianhap, ngaynhap, Manv, tennv, Phong from Nhanvien, Sanpham, Nhap WHERE YEAR(Nhap.ngaynhap)='2017'

//Đưa ra top 10 hóa đơn có số lượng xuất nhiều nhất năm 2018 theo chiều giảm dần của soluongxuat
8. select top 10 sohdx, masp, manv, ngayxuat, soluongxuat from Xuat WHERE YEAR(Xuat.ngayxuat)='2018' ORDER BY soluongxuat DESC

//Đưa ra thông tin 10 sản phẩm bán đắt trong cửa hàng theo chiều giảm dần của giá bán
9. select top 10 masp, tensp, tenhang, soluong, mausac, giaban, donvitinh, mota ORDER BY giaban DESC

//Đưa ra thông tin các sản phẩm có giá bán từ 100000 đến 500000 trong của hàng của hãng Samsung
10. select * from Sanpham WHERE giaban >= 100000 and giaban <= 500000 and tenhang='Samsung'

//Tính tổng tiền các sản phẩm đã nhập của SamSung trong năm 2018
11. select SUM(dongianhap) as "Tong so tien " from Nhap, Hangsx WHERE tenhang = 'Samsung' YEAR(Nhap.ngaynhap)='2018'

//Thống kê tổng tiền đã xuất trong ngày 02/09/2018
12. select sohdx, masp, manv, ngayxuat, soluongxuat, giaban, SUM(giaban) as "Tong tien hoa don xuat" from Sanpham, Xuat WHERE ngayxuat='02/09/2018' 

//Đưa ra sohdn, ngaynhap có tổng tiền phải trả cao nhất trong năm 2018
13. select sohdn, ngaynhap, SUM(dongianhap) as tongtiennhap,  MAX(tongtiennhap) from Nhap WHERE YEAR(Nhap.ngaynhap)='2018'

//Đưa ra 10 mặt hàng có số lượng nhập nhiều nhất trong năm 2019
14. select top 10 masp, tensp, soluongnhap, dongianhap from Sanpham, Hangsx WHERE YEAR(Nhap.ngaynhap)='2019' ORDER BY soluongnhap 

//Đưa ra masp, tensp của cấc sản phẩm do công ty SamSung sản xuất và có mã NV01 nhập vào kho
15. select	masp, tensp, tenhang, manv, tennv from Sanpham, Nhap WHERE manv='NV01' and tenhang='Samsung'

//Đưa ra sohdn, masp, soluongnhap, ngaynhap của mặt hàng có masp là SP02, được nhân viên có mã NV02 xuất
16. select sohdn, masp, soluongnhap, ngaynhap, manv, tennv from Sanpham, Nhap WHERE manv='NV02' and masp='SP02'

//Đưa ra manv, tennv đã xuất mặt hàng SP02 vào ngày 03/02/2020
17. select manv, tennv, sohdx, tensp, ngayxuat from Xuat, Sanpham, Nhanvien WHERE manv='SP02' and ngayxuat='03-02-2020'