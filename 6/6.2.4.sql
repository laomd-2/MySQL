-- DELIMITER //

-- CREATE PROCEDURE Proc_CalTotalPrice4Customer2(p_custname CHAR(25), OUT p_totalprice REAL)
-- BEGIN
--     DECLARE L_custkey INTEGER;
--     
--     SELECT custkey INTO L_custkey FROM customer WHERE name=trim(p_custname);
--     
--     UPDATE orders SET totalprice =
-- 	       (SELECT SUM(extendedprice * (1-discount) * (1+tax))
--            FROM lineitem WHERE orders.orderkey=lineitem.orderkey
--            AND orders.custkey=L_custkey);
-- 	SELECT SUM(totalprice) INTO p_totalprice FROM orders WHERE custkey=L_custkey;
-- END//

-- SET @p_totalprice = 0;
-- CALL Proc_CalTotalPrice4Customer2('Customer#000000100', @p_totalprice);
-- SELECT @p_totalprice;
SELECT SUM(totalprice) FROM orders WHERE custkey=
(SELECT custkey FROM customer WHERE name='Customer#000000100');