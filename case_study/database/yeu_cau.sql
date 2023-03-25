use quanlynghiduongfurama;
select @@sql_mode;
SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
/*2. Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là
một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.*/
select * from nhan_vien
where (ho_ten like "% % H%") or (ho_ten like "% % t%") or (ho_ten like "% % k%") and (select length(ho_ten)<15);
/*3. Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và
có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.*/
select *,year(now()) - year(ngay_sinh) as tuoi
from khach_hang 
having (tuoi >= 18) and (tuoi <= 50) and((dia_chi like '%đa nẵng') or (dia_chi like '%quảng trị'));
/*4. hiển thị được sắp xếp tăng dần theo số lần đặt phòng của
khách hàng. Chỉ đếm những khách hàng nào có Tên loại khách hàng là
“Diamond”.*/
select kh.ma_khach_hang, kh.ho_ten, lk.ten_loai_khach, count(hd.ma_hop_dong) as so_lan_dat
from khach_hang kh 
join loai_khach lk on kh.ma_loai_khach = lk.ma_loai_khach
join hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang
where ten_loai_khach = 'diamond'
group by kh.ma_khach_hang
order by so_lan_dat;
/* Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong,
ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien */
select distinct kh.ma_khach_hang, kh.ho_ten, lk.ten_loai_khach, hd.ma_hop_dong, dv.ten_dich_vu, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, 
ifnull((dv.chi_phi_thue + hdct.so_luong * dvdk.gia),0) as tong_tien
from khach_hang kh 
left join loai_khach lk on lk.ma_loai_khach = kh.ma_loai_khach
left join hop_dong hd on hd.ma_khach_hang = kh.ma_khach_hang
left join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
left join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong
left join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem;

/*6. Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue,
ten_loai_dich_vu của tất cả các loại dịch vụ chưa từng được khách hàng
thực hiện đặt từ quý 1 của 2021 (Quý 1 là tháng 1, 2, 3) */
select dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.chi_phi_thue, ldv.ten_loai_dich_vu 
from loai_dich_vu ldv
join dich_vu dv on ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu
join hop_dong hd on hd.ma_dich_vu = dv.ma_dich_vu
where year(hd.ngay_lam_hop_dong) = 2021 and month(hd.ngay_lam_hop_dong) >=1 and month(hd.ngay_lam_hop_dong) <=3; 
-- 7
select dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.so_nguoi_toi_da,dv.chi_phi_thue, ldv.ten_loai_dich_vu
from loai_dich_vu ldv
join dich_vu dv on ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu
join hop_dong hd on hd.ma_dich_vu = dv.ma_dich_vu
where year(hd.ngay_lam_hop_dong) = 2020; 
/* 8. Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu
ho_ten không trùng nhau.*/
-- c1
select ho_ten from khach_hang 
group by ho_ten;
-- c2 
select distinct ho_ten from khach_hang;
-- c3
select ho_ten from khach_hang
union
select ho_ten from khach_hang;



/* 9. Thực hiện thống kê doanh thu theo tháng */
select kh.ma_khach_hang, kh.ho_ten, lk.ten_loai_khach, hd.ma_hop_dong, dv.ten_dich_vu, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, 
ifnull((dv.chi_phi_thue + hdct.so_luong * dvdk.gia),0) as tong_tien
from khach_hang kh 
join loai_khach lk on lk.ma_loai_khach = kh.ma_loai_khach
join hop_dong hd on hd.ma_khach_hang = kh.ma_khach_hang
join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong
join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem;
 /* 10 Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu
dịch vụ đi kèm. */
select hd.ma_hop_dong, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, hd.tien_dat_coc, sum(hdct.so_luong) as so_luong_dich_vu_di_kem
from hop_dong hd 
join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong
join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
group by hd.ma_hop_dong; 
/* 11. Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách
hàng có ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc
“Quảng Ngãi”.*/
select *,lk.ten_loai_khach, kh.dia_chi 
from dich_vu_di_kem dvdk
join hop_dong_chi_tiet hdct on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
join hop_dong hd on hd.ma_hop_dong = hdct.ma_hop_dong
join khach_hang kh on kh.ma_khach_hang = hd.ma_khach_hang
join loai_khach lk on lk.ma_loai_khach = kh.ma_loai_khach
where lk.ten_loai_khach = 'diamond' and ((kh.dia_chi like '%vinh') or (kh.dia_chi like '%Quảng Ngãi'));
-- 12 .
select hd.ma_hop_dong, nv.ho_ten, kh.ho_ten, kh.so_dien_thoai, dv.ten_dich_vu, sum(hdct.so_luong) as so_luong_dich_vu_di_kem
from hop_dong hd 
join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong
join nhan_vien nv on nv.ma_nhan_vien = hd.ma_nhan_vien
join khach_hang kh on kh.ma_khach_hang = hd.ma_khach_hang
join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
where year(hd.ngay_lam_hop_dong) = 2021 and (month(hd.ngay_lam_hop_dong)<=12 and month(hd.ngay_lam_hop_dong)>=9) 
group by hd.ma_hop_dong;
-- 13 
select dvdk.ten_dich_vu_di_kem, count(kh.ma_khach_hang) as so_khach_su_dung
from dich_vu_di_kem dvdk
join hop_dong_chi_tiet hdct on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
join hop_dong hd on hd.ma_hop_dong = hdct.ma_hop_dong
join khach_hang kh on kh.ma_khach_hang = hd.ma_khach_hang
group by dvdk.ten_dich_vu_di_kem 	
having so_khach_su_dung >= all( select count(kh.ma_khach_hang) as so_khach_su_dung
from dich_vu_di_kem dvdk
join hop_dong_chi_tiet hdct on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
join hop_dong hd on hd.ma_hop_dong = hdct.ma_hop_dong
join khach_hang kh on kh.ma_khach_hang = hd.ma_khach_hang
group by dvdk.ten_dich_vu_di_kem);
-- 14
select hd.ma_hop_dong, ldv.ten_loai_dich_vu, dvdk.ten_dich_vu_di_kem, count(hdct.ma_dich_vu_di_kem) as so_lan_su_dung
from dich_vu_di_kem dvdk 
join hop_dong_chi_tiet hdct on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
join hop_dong hd on hd.ma_hop_dong = hdct.ma_hop_dong
join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
join loai_dich_vu ldv on ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu 
group by hd.ma_hop_dong, ldv.ten_loai_dich_vu, dvdk.ten_dich_vu_di_kem
having so_lan_su_dung = 1;

select nv.ma_nhan_vien, nv.ho_ten, td.ten_trinh_do, bp.ten_bo_phan, nv.so_dien_thoai, nv.dia_chi
from nhan_vien nv
join trinh_do td on td.ma_trinh_do = nv.ma_trinh_do
join bo_phan bp on bp.ma_bo_phan = nv.ma_bo_phan
join hop_dong hd on hd.ma_nhan_vien = nv.ma_nhan_vien;
create temporary table temp






