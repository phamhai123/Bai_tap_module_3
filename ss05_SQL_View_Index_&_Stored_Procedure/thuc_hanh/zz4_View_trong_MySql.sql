-- Tạo View có tên customer_views truy vấn dữ liệu từ bảng customers để lấy các dữ liệu: customerNumber, customerName, phone bằng câu lệnh SELECT:
CREATE VIEW customer_views AS

SELECT customerNumber, customerName, phone

FROM  customers;
-- Kết quả, ta sẽ có 1 bảng ảo customer_views, và sau đó chúng ta hoàn toàn có thể lấy dữ liệu từ bảng ảo này bằng lệnh:
select * from customer_views;
-- Cập nhật view
/* CREATE OR REPLACE VIEW view_name AS

SELECT column1, column2, ...

FROM table_name */
--  Cập nhật view customer_views: 

CREATE OR REPLACE VIEW customer_views AS

SELECT customerNumber, customerName, contactFirstName, contactLastName, phone

FROM customers

WHERE city = 'Nantes';
-- Xoá view
/* DROP VIEW view_name; */
-- xoá view customer_views:
DROP VIEW customer_views;