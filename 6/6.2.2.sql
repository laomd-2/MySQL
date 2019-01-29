DELIMITER //

CREATE PROCEDURE CalTotalPrice4Order(p_okey INTEGER)
BEGIN
    UPDATE orders SET totalprice = 
		   (SELECT SUM(extendedprice * (1-discount) * (1+tax))
            FROM lineitem 
            WHERE orders.orderkey = lineitem.orderkey AND lineitem.orderkey = p_okey);
END//

-- CALL Proc_CalTotalPrice4Order(100);