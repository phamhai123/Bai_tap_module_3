-- Tạo Mysql Stored Procedure 
DELIMITER //

CREATE PROCEDURE findAllCustomers()

BEGIN

  SELECT * FROM customers;

END //

DELIMITER ;findAllCustomers
-- Cách gọi procedure
call findAllCustomers();
-- Lệnh Drop để xóa đi Procedure đó và tạo lại:
DELIMITER //
DROP PROCEDURE IF EXISTS `findAllCustomers`//

CREATE PROCEDURE findAllCustomers()

BEGIN

SELECT * FROM customers where customerNumber = 175;

END //