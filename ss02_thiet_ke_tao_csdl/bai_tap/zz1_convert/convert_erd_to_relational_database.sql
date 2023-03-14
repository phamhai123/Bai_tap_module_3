create database ban_hang;
use ban_hang;
create table Phieu_Xuat(
	soPX int primary key,
    ngayXuat date not null
);
create table Vat_Tu(
	maVTu int primary key,
    tenVTu varchar(45) not null
);
create table Phieu_Nhap(
	soPN int primary key,
    ngayNhap date not null
);
create table DON_DH(
	soDH int primary key,
    ngayDH date not null
);
create table nhaCC(
	maNCC int primary key,
    tenNCC varchar(45) not null,
    diaChi varchar(45) not null,
    soDH int not null,
    foreign key(soDH) references DON_DH(soDH)
);
create table PhieuXuat_VatTu(
	soPX int not null,
    maVTu int not null,
    DGXuat long,
    SLXuat long,
    foreign key(soPX) references Phieu_Xuat(soPX),
    foreign key(maVTu) references Vat_Tu(maVTu)
);
create table PhieuNhap_VatTu(
	soPN int not null,
    maVTu int not null,
    DGNhap long,
    SLNhap long,
    foreign key(soPN) references Phieu_Nhap(soPN),
    foreign key(maVTu) references Vat_Tu(maVTu)
);
create table DonHang_VatTu(
	soDH int not null,
    maVTu int not null,
    foreign key(soDH) references DON_DH(soDH),
    foreign key(maVTu) references Vat_tu(maVTu)
);
create table NhaCC_SDT(
	SDT varchar(10) primary key,
    maNCC int not null,
    foreign key(maNCC) references NhaCC(maNCC)
);