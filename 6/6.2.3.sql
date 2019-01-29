DELIMITER //

CREATE PROCEDURE Proc_CalTotalPrice4Customer(p_custname CHAR(25))
BEGIN
    DECLARE L_custkey INTEGER;
    
    SELECT custkey INTO L_custkey FROM customer WHERE name=trim(p_custname);
    UPDATE orders SET totalprice =
	       (SELECT SUM(extendedprice * (1-discount) * (1+tax))
           FROM lineitem WHERE orders.orderkey=lineitem.orderkey
           AND orders.custkey=L_custkey);
END//


CALL Proc_CalTotalPrice4Customer('Customer#000000100');