use QLBENHVIEN
go

--cau1
SELECT *FROM BacSy WHERE TenBacSy LIKE 'Nguyen%'
--Cau2
select * from BenhNhan where NgaySinh >= '2000'
--Cau3
select * from Yta order by NgaySinh asc
--Cau4
select BenhNhan.MaBN,NgaySinh,TenBN,GioiTinh,SDT from 
BenhNhan inner join KhamBenh on BenhNhan.MaBN=KhamBenh.MaBN
where DieuTriTaiBV = 'Co'
--Cau5:Dua ra thong tin nhung benh nhan co nam sinh duoi 1990 va khong phai nhap vien
select BenhNhan.MaBN,NgaySinh,TenBN,GioiTinh,SDT
from BenhNhan inner join KhamBenh on BenhNhan.MaBN = KhamBenh.MaBN 
where year(NgaySinh)<1990 and DieuTriTaiBV = 'Khong'
--Cau6:
select BenhNhan.MaBN,NgaySinh,TenBN,GioiTinh,SDT
from BenhNhan inner join PhieuNhapVien on BenhNhan.MaBN=PhieuNhapVien.MaBN
where BenhNhan.GioiTinh='Nam' and year(NgayNhap)=2022
--Cau7:
select MaSoNhapVien,PhieuNhapVien.MaBN,MaSoKham,BenhNhan.TenBN
from PhieuNhapVien inner join BenhNhan on BenhNhan.MaBN=PhieuNhapVien.MaBN
where PhieuNhapVien.MaPhong='P501'
--Cau8
select top 1 * from BacSy order by Luong desc
--Cau9
select ThongTinThuoc.MaThuoc,TenThuoc,TheLoai
from ThongTinThuoc inner join Kho on ThongTinThuoc.MaThuoc=Kho.MaThuoc
where KhoSo='Kho2'
--Cau10:Tim tenbn co so don thuoc lon hon 1
select count(DonThuoc.MaDon) as SoMaDon,BenhNhan.TenBN
from DonThuoc left join BenhNhan on  DonThuoc.MaBN=BenhNhan.MaBN
group by TenBN
having count(DonThuoc.MaDon)>1


