create database demo;
use demo;
create table products(
	id int primary key,
    productCode int,
	productName varchar(50) not null,
	productPrice int,
	productAmount int, 
	productDescription text,
	productStatus bit not null
);
insert into products
values (1, 1001, 'TV Samsung 55 inch', 20000, 10, 'This is a description for Samsung TV', 1),
       (2, 1002, 'Tủ lạnh LG 2 cửa', 15000, 5, 'This is a description for LG fridge', 1),
	   (3, 1003, 'TV Sony 65 inch', 30000, 20, 'This is a description for Sony TV', 0),
	   (4, 1004, 'Tủ lạnh Hitachi 3 cửa', 20000, 8, 'This is a description for Hitachi fridge', 1),
	   (5, 1005, 'TV LG 75 inch', 40000, 15, 'This is a description for LG TV', 1);
-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục 	 
create unique index index_code on products(productCode);
-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
create index index_name_price on products(productName,productPrice);
-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
explain select * from products 
where productCode = 1001;
explain select * from products
where productCode = 1003 and productName = 'TV Sony 65 inch';
explain select * from products
where productCode = 1003 or productName = 'TV Sony 65 inch';
-- view
create view viewProduct as
select productCode, productName, productPrice, productStatus
from products;
-- store procedures
-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
Delimiter // 
create procedure allProducts()
begin
select * from products;
end//
Delimiter ;
call allProduct;
-- Tạo store procedure thêm một sản phẩm mới
delimiter //
create procedure addProducts(
	id int ,
    productCode int,
	productName varchar(50),
	productPrice int,
	productAmount int, 
	productDescription text,
	productStatus bit)
begin
insert into products()
values(id,productCode,productName,productPrice,productAmount, productDescription, productStatus);

end//
delimiter ;
call addProducts(6,10006,'Máy giặt Panasonic 30L',100000,5,'Màu đen bản thường',1);
-- Tạo store procedure sửa thông tin sản phẩm theo id
delimiter //
create procedure updateProducts(
	id_in int ,
    product_Code int,
	product_Name varchar(50),
	product_Price int,
	product_Amount int, 
	product_Description text,
	product_Status bit)
begin
update products
set productCode = product_Code,
	productName = product_Name,
	productPrice = product_Price,
	productAmount = product_Amount, 
	productDescription = product_Description,
	productStatus = product_Status
where id = id_in;
end//
delimiter ;
call updateProducts(5,1005, 'LG 20L',13000,5,'Màu đen',1);
-- Tạo store procedure xoá sản phẩm theo id
delimiter //
create procedure deleteProducts(id_in int)
begin
delete from products
where id = id_in;
end//
delimiter ;
call deleteProducts(6);