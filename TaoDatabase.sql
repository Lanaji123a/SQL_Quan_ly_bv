create database QLBENHVIEN

on primary (
name=qlbv,
filename='C:\SQL Data\BTL08\qlbv.mdf',
size=20 MB,
maxsize= 100MB,
filegrowth=10%
)
log on(
name=qlbv_log,
filename='C:\SQL Data\BTL08\qlbv.log',
size=20 MB,
maxsize= 100MB,
filegrowth=1MB
)


use QLBENHVIEN
go

create table Admin(
MsDangNhap nvarchar(30) not null primary key,
MatKhau nvarchar(30),
)

create table Khoa(
MaKhoa nvarchar(30) not null primary key,
ChuyenKhoa nvarchar(30) not null,
Vitri nvarchar(30) not null,
TruongKhoa nvarchar(30) not null
)

create table BacSy(
MaBacSy nvarchar(30) not null primary key,
NgaySinh datetime ,
TenBacSy nvarchar(30) not null,
GioiTinh nvarchar(30) not null,
SDT nvarchar(30) not null,
DiaChi nvarchar(30) not null,
Luong float not null,
MaKhoa nvarchar(30) not null,
ChuyenKhoa nvarchar(30) not null,
constraint fk1 foreign key (MaKhoa) references Khoa(MaKhoa)
)

create table Yta(
MaYta nvarchar(30) not null primary key,
NgaySinh datetime ,
TenYta nvarchar(30) not null,
GioiTinh nvarchar(30) not null,
SDT nvarchar(30) not null,
DiaChi nvarchar(30) not null,
Luong float not null,
)

create table PhongKham(
Phong nvarchar(30) not null primary key,
MaBacSy nvarchar(30) not null,
MaKhoa nvarchar(30) not null,
ChuyenKhoa nvarchar(30) not null,
constraint fk2 foreign key (MaKhoa) references Khoa(MaKhoa),
constraint fk3 foreign key (MaBacSy) references BacSy(MaBacSy),
)

create table BenhNhan(
MaBN nvarchar(30) not null primary key,
NgaySinh datetime ,
TenBN nvarchar(30) not null,
GioiTinh nvarchar(30) not null,
SDT nvarchar(30) not null,
)

create table BHYT(
MaBN nvarchar(30) not null,
MaBHYT nvarchar(30) not null primary key,
TenBN nvarchar(30) not null,
constraint fk5 foreign key (MaBN) references BenhNhan(MaBN)
)

create table DatLich(
MaDatLich nvarchar(30) not null primary key,
MaBN nvarchar(30) not null ,
NgayDat datetime,
XacNhan nvarchar(30) not null ,
constraint fk6 foreign key (MaBN) references BenhNhan(MaBN)
)

create table KhamBenh(
MaSoKham nvarchar(30) not null primary key,
MaBN  nvarchar(30) not null,
Phong nvarchar(30) not null,
NgayKham datetime,
TrieuChung nvarchar(30) not null,
ChanDoan nvarchar(30) not null,
YeuCauXetNghiem nvarchar(30) not null,
DieuTriTaiBV nvarchar(30) not null,
constraint fk7 foreign key (MaBN) references BenhNhan(MaBN),
constraint fk8 foreign key (Phong) references PhongKham(Phong)
)

create table XetNghiem(
MaXN nvarchar(30) not null primary key,
MaSoKham nvarchar(30) not null,
MaBN  nvarchar(30) not null,
LoaiXetNghiem nvarchar(30) not null,
constraint fk9 foreign key (MaSoKham) references KhamBenh(MaSoKham),
constraint fk10 foreign key (MaBN) references BenhNhan(MaBN)
)

create table ThongTinThuoc(
MaThuoc nvarchar(30) not null primary key,
TenThuoc nvarchar(30) not null,
TheLoai nvarchar(30) not null,
)

create table Kho(
STT int primary key,
KhoSo nvarchar(30) not null ,
MaThuoc nvarchar(30) not null,
constraint fk11 foreign key (MaThuoc) references ThongTinThuoc(MaThuoc)
)


create table DonThuoc(
MaBN nvarchar(30) not null,
MaDon nvarchar(30) not null primary key,
MaSoKham nvarchar(30) not null,
TenThuoc nvarchar(30) not null,
MaThuoc nvarchar(30) not null ,
SoLuong int,
LieuLuong nvarchar(30) not null ,
constraint fk12 foreign key (MaThuoc) references ThongTinThuoc(MaThuoc),
constraint fk13 foreign key (MaBN) references BenhNhan(MaBN),
constraint fk14 foreign key (MaSoKham) references KhamBenh(MaSoKham)
)

create table PhongDieuTri(
MaPhong nvarchar(30) not null primary key,
Vitri nvarchar(30) not null ,
MaBacSy nvarchar(30) not null ,
MaYta nvarchar(30) not null ,
SoGiuong nvarchar(30) not null,
constraint fk15 foreign key (MaBacSy) references BacSy(MaBacSy),
constraint fk16 foreign key (MaYta) references Yta(MaYta),
)


create table PhieuNhapVien(
MaSoNhapVien nvarchar(30) not null primary key,
MaBN nvarchar(30) not null ,
MaSoKham nvarchar(30) not null,
NgayNhap datetime,
TienTamUng float,
MaPhong nvarchar(30) not null,
GiuongSo nvarchar(30) not null,
constraint fk17 foreign key (MaBN) references BenhNhan(MaBN),
constraint fk18 foreign key (MaSoKham) references KhamBenh(MaSoKham),
constraint fk19 foreign key (MaPhong) references PhongDieuTri(MaPhong)

)

create table PhieuXuatVien(
MaSoNhapVien nvarchar(30) not null,
MaSoXuatVien nvarchar(30) not null primary key,
MaBN nvarchar(30) not null ,
NgayXuatVien datetime,
ThanhToan float,
constraint fk20 foreign key (MaBN) references BenhNhan(MaBN),
constraint fk21 foreign key (MaSoNhapVien) references PhieuNhapVien(MaSoNhapVien)
)