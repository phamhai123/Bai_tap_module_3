create database Order_Management;
use Order_Management;
create table Customer(
	cID int primary key,
    cName varchar(45),
    cAge int 
);
create table `Order`(
	oID int primary key,
	cID int,
    oDate datetime,
    oTotalPrice long,
    foreign key(cID) references Customer(cID)
);
create table product(
	pID int primary key,
    pName varchar(45),
    pPrice long
);
create table OrderDetail(
	oID int,
    pID int,
    odQTY int,
    foreign key(oID) references `Order`(oID),
    foreign key(pID) references product(pID) 
);
insert into customer (cID,cName,cAge)
values (1,'Minh Quan',10),
(2,'Ngoc Oanh',20),
(3,'Hong Ha',50);
insert into `order` (oID,cID,oDate,oTotalPrice)
values (1,1,'2006-03-21',null),
(2,2,'2006-03-23',null),
(3,1,'2006-03-16',null);
insert into product(pID,pName,pPrice)
values (1,'May Giat',3),
(2,'Tu Lanh',5),
(3,'Dieu Hoa',7),
(4,'Quat',1),
(5,'Bep Dien',2);
insert into orderdetail(oID,pID,odQTY)
values (1,1,3),
(1,3,7),
(1,4,2),
(2,1,1),
(3,1,8),
(2,5,4),
(2,3,3);
select oID, oDate, oTotalPrice 
from `order`;
select customer.cName, pName 
from customer 
join `order`on customer.cID = `order`.cID 
join orderdetail on orderdetail.oID = `order`.oID 
join product on product.pID = orderdetail.pID; 
select cName, cAge
from customer 
left join `order` on customer.cID = `order`.cID
where `order`.cID is null;
select `order`.oID,oDate, sum(orderdetail.odQTY * product.pPrice) as totalPrice
from `order` 
join orderdetail on `order`.oID = orderdetail.oID 
join product on orderdetail.pID = product.pID
group by oid;