create database QuanLyDeAn on primary 
(  size = 20 ,
filegrowth = 1 ,
maxsize = 1000 ,
filename = 'D:\HaTrungKien\QuanLyDeAn_Data.mdf' ,
name = QuanLyDeAn_Data)
log on 
( size = 6 ,
filegrowth = 0.3 ,
maxsize = 20 ,
filename = 'D:\HaTrungKien\QuanLyDeAn_Log.ldf' ,
name = QuanLyDeAn_Log);

create table DEAN(
MaDA varchar(2),
TenDA nvarchar(50),
DDiemDA varchar(20),
primary key (MaDA)
);

create table PHANCONG(
MaNV varchar(9),
MaDA varchar(2),
ThoiGian numberic(18,0),
foreign key(MaNV) references NHANVIEN(MaNV),
foreign key(MaDA) references DEAN(MaDA)
);

create table NHANVIEN(
MaNV varchar(9),
HoNV nvarchar(15),
TenLot nvarchar(30),
TenNV nvarchar(30),
Ngsinh smalldatetime,
Diachi nvarchar(150),
Phai nvarchar(3),
Luong numberic(18,0)
Phong varchar(2),
primary key (MaNV)
);

create table THANNHAN(
MaNV varchar(9),
TenTN varchar(20),
NgaySinh smalldatetime,
Phai varchar(3),
QuanHe varchar(15),
foreign key(MaNV) references NHANVIEN(MaNV),
primary key (TenTN)
);

create table PHONGBAN(
MaPhg varchar(2),
TenPhg nvarchar(20),
primary key (MaPhg)
);

alter table PHONGBAN
alter column TenPhg nvarchar(30);

alter table DEAN
alter column DDiemDA varchar(20);

alter table THANNHAN
alter column TenTN varchar(20);

alter table THANNHAN
alter column Phai nvarchar(3);

alter table THANNHAN
alter column QuanHe nvarchar(15);


INSERT INTO NHANVIEN (MaNV, HoVN, TenLot, TenNV, NgSinh, DiaChi, Phai, Luong, Phong)
VALUES (123, 'Đinh', 'Bá', 'Tiến', 27/2/1982, 'Mộ Đức', 'Nam', '', 4),
(234, 'Nguyễn', 'Thanh', 'Tùng', 12/8/1956, 'Tư Nghĩa', 'Nam', '', 5),
(345, 'Bùi', 'Thúy', 'Vũ','', 'Sơn Tịnh', 'Nam', '', 4),
(456, 'Lê', 'Thị', 'Nhàn', 12/7/1962, 'Mộ Đức', 'Nam', '', 4),
(567, 'Nguyễn', 'Mạnh', 'Hùng', 25/3/1985, 'Sơn Tịnh', 'Nam', '', 5),
(678, 'Trần', 'Hồng', 'Quang', '', 'Bình Sơn', 'Nam', '', 5),
(789, 'Trần', 'Thanh', 'Tâm', 17/6/1972, 'Quãng Ngãi', 'Nam', '', 5),
(890, 'Cao', 'Thanh', 'Huyền', 27/2/1982, 'Tư Nghĩa', 'Nam', '', 1),
(901, 'Vương', 'Ngọc', 'Quyền', 12/12/198, 'Mộ Đức', 'Nam', '', 1);

insert into PHONGBAN(MaPhg, TenPhg) 
VALUES(1, 'Quản lý'),(4, 'Điều hành'),(5, 'Nghiên cứu ' );

insert into DEAN(MaDA, TenDA, DDiemDA)
VALUES(1, ' Nâng cao chất lượng ', ' Sa Huỳnh'),
(10, 'Xây dựng nhà máy chế biến thủy sản', 'Dung Quất'),
(2, 'Phát triển hạ tầng mạng', 'Tp Quảng Ngãi'),
(20, 'Truyền tải cáp quang', 'Tp Quảng Ngãi'),
(3, 'Tin học hóa trường học', 'Ba Tơ'),
(30, 'Đào tạo nhân lực', 'Tịnh Phong');


insert into PHANCONG(MaNV, MaDA, ThoiGian)
VALUES( 123,1 ,44 ),
(123 , 1,33 ),
(123, 2, 8),
(345 ,10 ,10 ),
(345 ,20, 10),
(345 ,3 ,10),
(456,1 ,20 ),
(456 ,1 ,20 ),
(678 ,3 ,40),
(789 ,10,35 ),
(789 ,20 ,30 );

insert into THANHNHAN(MaNV, TenTN, NgSinh, Phai, QuanHe)
VALUES( 123, 'Châu',30/10/2005 , 'Nữ', 'Con gái'),
( 123, 'Duy',25/10/2001 , 'Nam', 'Con trai'),
( 123, 'Phương',30/10/1956 , 'Nữ', 'Vợ chồng'),
( 234, 'Thanh',30/10/1985 , 'Nữ', 'Con gái'),
( 345, 'Dương',05/04/1980 , 'Nam', 'Vợ chồng'),
( 345, 'Khang',25/10/1982 , 'Nam', 'Con trai'),
( 456, 'Hùng',01/01/1987 , 'Nam', 'Con trai'),
( 901, 'Vương',05/04/1989 , 'Nữ', 'Vợ chồng');

