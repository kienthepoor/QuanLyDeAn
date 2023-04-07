go 
create view View1 as
select * from Sanpham;
go
select * from View1;

go 
create view View2 as
select * from Hangsx where Tenhang='Samsung';
go
select * from View2;

go 
create view View3 as
select * from Nhanvien where gioitinh='Nữ' and phong='Kế toán'
go 
select * from View3;

go 
create view View4 as
select top 10 tensp, giaban
from SanPham
order by giaban desc;
go 
select * from View4;

go 
create view View5 as
select sp.MaSP, sp.TenSP
from SanPham sp
inner join HangSX hsx on sp.MaHangSX = hsx.MaHangSX
inner join Nhap n on sp.MaSP = n.MaSP
inner join NhanVien nv on n.MaNV = nv.MaNV
WHERE hsx.TenHang = 'samsung' and nv.MaNV = 'NV01'
go 
select * from View5;

go 
create view View6 as
select Hangsx.tenhang, count(Sanpham.masp) as so_luong_sp
from Hangsx
join Sanpham on Hangsx.mahangsx = Sanpham.mahangsx
group by Hangsx.tenhang
go 
select * from View6;

go 
create view View7 as
select masp, sum(soluongN * dongiaN) as TongTienNhap
from Nhap
where year(ngaynhap) = 2020
group by masp;
go 
select * from View7;

go 
create view View8 as
select phong, COUNT(*) AS SoLuongNam
from Nhanvien
where gioitinh = 'Nam'
group by phong
go 
select * from View8;

go 
create view View9 as
select SP.masp, SP.tensp
from Sanpham SP
left join Nhap N on SP.masp = N.masp
left join Xuat X on SP.masp = X.masp
where N.soluongN is not null and X.masp is null
group by SP.masp, SP.tensp
go 
select * from View9;

go 
create view View10 as
select NV.Manv, Tennv
from Nhanvien NV
left join Nhap N on NV.Manv = N.Manv
left join Xuat X on NV.Manv = X.Manv
where soluongN is not null and soluongX  is not null
group by NV.Manv, NV.Tennv
go 
select * from View10;

go 
create view View11 as
select NV.Manv, Tennv
from Nhanvien NV
left join Nhap N on NV.Manv = N.Manv
left join Xuat X on NV.Manv = X.Manv
where soluongN is not null and soluongX  is null
group by NV.Manv, NV.Tennv
go 
select * from View11;

go 
create view View12 as
select Sanpham.masp, Sanpham.tensp, sum(Xuat.soluongX) as tong_soluong_xuat
from Sanpham
join Xuat on Sanpham.masp = Xuat.masp
join Hangsx on Sanpham.mahangsx = Hangsx.mahangsx
where year(Xuat.ngayxuat) = 2018 AND Hangsx.tenhang = 'Samsung'
group by Sanpham.masp, Sanpham.tensp
having sum(Xuat.soluongX) > 10000;
go 
select * from View12;

go 
create view View13 as
select Hangsx.tenhang, sum(Nhap.soluongN) as TongSoLuongNhap
from Nhap
join Sanpham on Nhap.masp = Sanpham.masp
join Hangsx on Sanpham.mahangsx = Hangsx.mahangsx
where year(Nhap.ngaynhap) = 2018
group by Hangsx.tenhang
go 
select * from View13;

go 
create view View14 as
select Nhanvien.manv, Nhanvien.tennv, sum(Xuat.soluongX * Sanpham.giaban) AS tongtienxuat
from Xuat
inner join Sanpham on Xuat.masp = Sanpham.masp
INNER JOIN Nhanvien on Xuat.manv = Nhanvien.manv
where year(Xuat.ngayxuat) = 2018
group by Nhanvien.manv, Nhanvien.tennv
go 
select * from View14;

go 
create view View15 as
select manv, sum(soluongN * dongiaN) as tong_tien_nhap
from Nhap
where month(ngaynhap) = 8 and year(ngaynhap) = 2018
group by manv
having sum(soluongN * dongiaN) > 100000;
go 
select * from View15;