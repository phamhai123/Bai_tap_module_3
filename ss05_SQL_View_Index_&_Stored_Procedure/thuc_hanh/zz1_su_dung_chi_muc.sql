use classicmodels;
--  tìm thông tin của khách hàng có tên là Land Of Toys Inc.
SELECT * FROM customers WHERE customerName = 'Land of Toys Inc.'; 
-- Bằng lệnh này bạn sẽ nhận ra được với câu Query của bạn, điều gì đang xảy ra và kiểu kết hợp (Join) nào đang diễn ra bên trong.
EXPLAIN SELECT * FROM customers WHERE customerName = 'Land of Toys Inc.';
-- thêm chỉ mục cho bảng customers
ALTER TABLE customers ADD INDEX idx_customerName(customerName);
EXPLAIN SELECT * FROM customers WHERE customerName = 'Land of Toys Inc.'; 
-- thêm Index cho những cột mà có thể có nhiều hơn 1 kết quả khi query 
ALTER TABLE customers ADD INDEX idx_full_name(contactFirstName, contactLastName);
EXPLAIN SELECT * FROM customers WHERE contactFirstName = 'Jean' or contactFirstName = 'King';
-- xóa chỉ mục trong bảng
ALTER TABLE customers DROP INDEX idx_full_name;