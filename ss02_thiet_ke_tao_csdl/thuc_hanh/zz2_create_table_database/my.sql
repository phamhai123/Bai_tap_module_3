create database QuanLyDiemThi;
use QuanLyDiemThi;
create table HocSinh(
	MaHS varchar(20) primary key,
    TenHS varchar(50),
    NgaySinh datetime,
    Lop varchar(20),
    GT varchar(20)
);
create table MonHoc(
	MaMH varchar(20) primary key,
    TenMH varchar(50)
);
create table BangDiem(
	MaHS varchar(20),
    MaMH varchar(20),
    DiemThi int,
    NgayKT datetime,
    primary key(MaHS,MaMH),
    foreign key(MaHS) references HocSinh(MaHS),
    foreign key(MaMH) references MonHoc(MaMH)
);
create table GiaoVien(
	MaGV varchar(20),
    TenGV varchar(20),
    SDT varchar(10)
);
ALTER TABLE MonHoc ADD MaGV VARCHAR(20);
ALTER TABLE MonHoc ADD CONSTRAINT FK_MaGV FOREIGN KEY (MaGV) REFERENCES GiaoVien(MaGV);
