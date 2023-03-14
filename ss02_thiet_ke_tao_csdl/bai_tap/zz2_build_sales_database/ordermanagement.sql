create database Order_Management;
use Order_Management;
create table Customer(
	cID int primary key,
    cName varchar(45) not null,
    cAge int not null check(cAge >= 18)
);
create table `Order`(
	oID int primary key,
	cID int,
    oDate date not null,
    oTotalPrice long,
    foreign key(cID) references Customer(cID)
);
create table product(
	pID int primary key,
    pName varchar(45) not null,
    pPrice long
);
create table OrderDetail(
	oID int,
    pID int,
    foreign key(oID) references `Order`(oID),
    foreign key(pID) references product(pID) 
);