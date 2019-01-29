-- DELIMITER //

-- CREATE PROCEDURE Proc_CalTotalPrice()
-- BEGIN
--     UPDATE orders SET totalprice = 
-- 		   (SELECT SUM(extendedprice * (1-discount) * (1+tax))
--             FROM lineitem WHERE orders.orderkey = lineitem.orderkey);
-- END//

CALL Proc_CalTotalPrice();