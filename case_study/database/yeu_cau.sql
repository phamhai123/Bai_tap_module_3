use quanlynghiduongfurama;
select @@sql_mode;
SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
/*2. Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là
một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.*/
select * from nhan_vien
where (ho_ten like "% % H%") or (ho_ten like "% % t%") or (ho_ten like "% % k%") and (select length(ho_ten)<15);
/*3. Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và
có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.*/
select *,year(now()) - year(kh.ngay_sinh) as tuoi
from khach_hang kh
having (tuoi between 18 and 50) and((kh.dia_chi like '%đa nẵng') or (kh.dia_chi like '%quảng trị'));
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
/*5 Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong,
ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien */
select distinct kh.ma_khach_hang, kh.ho_ten, lk.ten_loai_khach, hd.ma_hop_dong, dv.ten_dich_vu, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, 
sum((ifnull((hdct.so_luong * dvdk.gia),0) + ifnull(dv.chi_phi_thue,0))) as tong_tien
from khach_hang kh 
left join loai_khach lk on lk.ma_loai_khach = kh.ma_loai_khach
left join hop_dong hd on hd.ma_khach_hang = kh.ma_khach_hang
left join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
left join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong
left join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
group by hd.ma_hop_dong
order by kh.ma_khach_hang;

/*6. Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue,
ten_loai_dich_vu của tất cả các loại dịch vụ chưa từng được khách hàng
thực hiện đặt từ quý 1 của 2021 (Quý 1 là tháng 1, 2, 3) */
select dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.chi_phi_thue, ldv.ten_loai_dich_vu 
from loai_dich_vu ldv
join dich_vu dv on ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu 
where not exists(select hd.ma_hop_dong from hop_dong hd 
where (month(hd.ngay_lam_hop_dong) between 1 and 3) and hd.ma_dich_vu = dv.ma_dich_vu);
-- 7
-- sai
select dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.so_nguoi_toi_da,dv.chi_phi_thue, ldv.ten_loai_dich_vu, hd.ngay_lam_hop_dong
from loai_dich_vu ldv
join dich_vu dv on ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu
join hop_dong hd on hd.ma_dich_vu = dv.ma_dich_vu
where year(hd.ngay_lam_hop_dong) = 2020 and year(hd.ngay_lam_hop_dong) <> 2021; 
-- c2
select dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.so_nguoi_toi_da,dv.chi_phi_thue, ldv.ten_loai_dich_vu
from loai_dich_vu ldv
join dich_vu dv on ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu
where exists(select hd.ma_hop_dong from hop_dong hd 
where year(hd.ngay_lam_hop_dong)=2020 and hd.ma_dich_vu=dv.ma_dich_vu)
and not exists(select hd.ma_hop_dong from hop_dong hd 
where year(hd.ngay_lam_hop_dong)=2021 and hd.ma_dich_vu=dv.ma_dich_vu);
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
select temp.month, count(month(hd.ngay_lam_hop_dong)) as so_khach_hang_dang_ki, sum(ifnull(hd.tien_dat_coc,0)) as tong_tien from
(select 1 as month
union select 2 as month
union select 3 as month
union select 4 as month
union select 5 as month
union select 6 as month
union select 7 as month
union select 8 as month
union select 9 as month
union select 10 as month
union select 11 as month
union select 12 as month) as temp
left join hop_dong hd on month(hd.ngay_lam_hop_dong)=temp.month
left join khach_hang kh on kh.ma_khach_hang = hd.ma_hop_dong
where year(hd.ngay_lam_hop_dong)='2021' or year(hd.ngay_lam_hop_dong) is null or month(hd.ngay_lam_hop_dong) is null
group by temp.month
order by temp.month;
 /* 10 Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu
dịch vụ đi kèm. */
select hd.ma_hop_dong, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, hd.tien_dat_coc, ifnull(sum(hdct.so_luong),0) as so_luong_dich_vu_di_kem
from hop_dong hd 
left join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong
left join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
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
where hd.ma_hop_dong in (select hd.ma_hop_dong where (year(hd.ngay_lam_hop_dong) = 2020) and (month(hd.ngay_lam_hop_dong) between 10 and 12))
and hd.ma_hop_dong not in (select hd.ma_hop_dong where (year(hd.ngay_lam_hop_dong) = 2021) and (month(hd.ngay_lam_hop_dong) between 1 and 6));

-- 13 
select dvdk.ten_dich_vu_di_kem, sum(hdct.so_luong) as so_lan_su_dung
from dich_vu_di_kem dvdk
join hop_dong_chi_tiet hdct on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
group by dvdk.ten_dich_vu_di_kem 	
having so_lan_su_dung >= all(select sum(hdct.so_luong) as so_lan_su_dung
from dich_vu_di_kem dvdk
join hop_dong_chi_tiet hdct on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
group by dvdk.ten_dich_vu_di_kem);

-- 14
select hd.ma_hop_dong, ldv.ten_loai_dich_vu, dvdk.ten_dich_vu_di_kem, count(hdct.ma_dich_vu_di_kem) as so_lan_su_dung
from dich_vu_di_kem dvdk 
join hop_dong_chi_tiet hdct on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
join hop_dong hd on hd.ma_hop_dong = hdct.ma_hop_dong
join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
join loai_dich_vu ldv on ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu 
group by hdct.ma_dich_vu_di_kem
having so_lan_su_dung = 1;
-- 15
select nv.ma_nhan_vien, nv.ho_ten, td.ten_trinh_do, bp.ten_bo_phan, nv.so_dien_thoai, nv.dia_chi, count(nv.ma_nhan_vien) as tong_so_hop_dong
from nhan_vien nv
join hop_dong hd using(ma_nhan_vien)
join trinh_do td using(ma_trinh_do)
join bo_phan bp using(ma_bo_phan)
where year(hd.ngay_lam_hop_dong) between 2020 and 2021
group by nv.ma_nhan_vien
having tong_so_hop_dong <=3
order by nv.ma_nhan_vien;
-- 16 
delete from nhan_vien nv
where not exists(select nv.ma_nhan_vien from hop_dong hd 
where year(hd.ngay_lam_hop_dong) between 2019 and 2021 and hd.ma_nhan_vien = nv.ma_nhan_vien); 
-- 17
update khach_hang kh
set kh.ma_loai_khach = 1
where kh.ma_khach_hang in (
	select t.ma_khach_hang 
	from (
		select kh.ho_ten, lk.ten_loai_khach, sum((ifnull((hdct.so_luong * dvdk.gia),0) + dv.chi_phi_thue)) as tong_tien
		from khach_hang kh
		join loai_khach lk using(ma_loai_khach)
		join hop_dong hd using(ma_khach_hang)
		join hop_dong_chi_tiet hdct using(ma_hop_dong)
		join dich_vu_di_kem dvdk using(ma_dich_vu_di_kem)
		join dich_vu dv using(ma_dich_vu)
		where lk.ten_loai_khach = 'Platinium' and year(hd.ngay_lam_hop_dong) = 2021 
		group by hd.ma_hop_dong
		having tong_tien > 1000000
		) t 
);

-- c2

UPDATE
    khach_hang
set
    ma_loai_khach = 1
WHERE
    ma_khach_hang in (
        select
            t.ma_khach_hang
        from
            (
                SELECT
                    kh.ma_khach_hang,
                    kh.ho_ten,
                    lk.ten_loai_khach,
                    hd.ma_hop_dong,
                    dv.ten_dich_vu,
                    hd.ngay_lam_hop_dong,
                    hd.ngay_ket_thuc,
                    (sum(dvdk.gia * hdct.so_luong) + tmp.gia_dv) tong_tien
                FROM
                    khach_hang kh
                    left JOIN loai_khach lk USING (ma_loai_khach)
                    left join hop_dong hd USING (ma_khach_hang)
                    left join dich_vu dv USING (ma_dich_vu)
                    left JOIN hop_dong_chi_tiet hdct USING (ma_hop_dong)
                    left join dich_vu_di_kem dvdk USING (ma_dich_vu_di_kem)
                    left JOIN (
                        SELECT
                            kh.ma_khach_hang as ma_khach_hang,
                            sum(dv.chi_phi_thue) as gia_dv
                        from
                            khach_hang kh
                            join hop_dong hd USING (ma_khach_hang)
                            join dich_vu dv USING (ma_dich_vu)
                        GROUP by
                            kh.ma_khach_hang
                    ) as tmp USING (ma_khach_hang)
                where
                    ten_loai_khach = 'Platinium'
                GROUP by
                    kh.ma_khach_hang
                HAVING
                    tong_tien > 1000000
            ) t
    );
	
-- 18 
delete khach_hang,hop_dong,hop_dong_chi_tiet 
from khach_hang kh
join hop_dong hd on hd.ma_khach_hang = kh.ma_khach_hang
join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong
where not exists(select hd.ma_hop_dong where year(hd.ngay_lam_hop_dong) >= '2021' and kh.ma_khach_hang = hd.ma_khach_hang);
-- c2
DELETE FROM
    khach_hang kh
WHERE
    NOT EXISTS (
        select
            1
        FROM
            hop_dong
        WHERE
            kh.ma_khach_hang = ma_khach_hang
            and YEAR(ngay_lam_hop_dong) >= 2021
    );
-- 19 
UPDATE
    dich_vu_di_kem
set
    gia = gia * 2
WHERE
    ma_dich_vu_di_kem in (
        SELECT
            tmp.ma_dich_vu_di_kem
        FROM
            (
                SELECT
                    ma_dich_vu_di_kem,
                    sum(so_luong) t
                FROM
                    dich_vu
                    JOIN hop_dong USING(ma_dich_vu)
                    JOIN hop_dong_chi_tiet USING(ma_hop_dong)
                GROUP by
                    ma_dich_vu_di_kem
                    order by hop_dong 
                having
                    t > 10
            ) tmp
    );
-- 20
SELECT
    ma_nhan_vien as id,
    ho_ten,
    email,
    so_dien_thoai,
    ngay_sinh,
    dia_chi
FROM
    nhan_vien
UNION ALL
SELECT
    ma_khach_hang,
    ho_ten,
    email,
    so_dien_thoai,
    ngay_sinh,
    dia_chi
FROM
    khach_hang;
    