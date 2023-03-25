create database Furama;
use Furama;
create table vi_tri(
	ma_vi_tri int primary key,
    ten_vi_tri varchar(45)
);
create table trinh_do(
	ma_trinh_do int primary key,
    ten_trinh_do varchar(45)
);
create table bo_phan(
	ma_bo_phan int primary key,
    ten_bo_phan varchar(45)
);
create table nhan_vien(
	ma_nhan_vien int primary key,
    ho_ten varchar(45) not null,
    ngay_sinh date not null,
    so_cmnd varchar(45) not null,
    luong double not null,
    so_dien_thoai varchar(45) not null,
    email varchar(45),
    dia_chi varchar(45),
    ma_vi_tri int,
    ma_trinh_do int,
    ma_bo_phan int,
    foreign key (ma_vi_tri) references vi_tri(ma_vi_tri),
    foreign key (ma_trinh_do) references trinh_do(ma_trinh_do),
    foreign key (ma_bo_phan) references bo_phan(ma_bo_phan)
);
create table loai_khac(
	 ma_loai_khach int primary key,
     ten_khach_hang varchar(45)
);
create table khac_hang(
	ma_khach_hang int primary key,
    ma_loai_khach int,
    ho_ten varchar(45) not null,
    ngay_sinh date not null,
    gioi_tinh bit(1) not null,
    so_cmnd varchar(45) not null,
    so_dien_thoai varchar(45),
    email varchar(45),
    dia_chi varchar(45),
    foreign key(ma_loai_khach) references loai_khach(ma_loai_khach)
);
create table kieu_thue(
	ma_kieu_thue int primary key,
    ten_kieu_thue varchar(45)
);
create table dich_vu(	
	
);

create table dich_vu_di_kem(
	ma_dich_vu_di_kem int primary key,
    ten_dich_vu_di_kem varchar(45) not null,
	gia double not null,
    don_vi varchar(10) not null,
    trang_thai varchar(45)
);
create table hop_dong_chi_tiet(
	ma_hop_dong_chi_tiet int primary key,
    ma_hop_dong int,
    ma_dich_vu_di_kem int,
    so_luong int not null,
    foreign key(ma_hop_dong) references hop_dong(ma_hop_dong),
    foreign key(ma_dich_vu_di_kem) references dich_vu_di_kem(ma_dich_vu_di_kem)
);