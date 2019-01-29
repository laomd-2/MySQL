-- UPDATE `mysql`.`proc`
-- SET name='CalTotalPrice4Order',specific_name='CalTotalPrice4Order'
-- WHERE name='Proc_CalTotalPrice4Order';

-- DROP PROCEDURE CalTotalPrice4Order;
CALL Proc_CalTotalPrice();

SELECT orderkey, totalprice FROM orders;
-- GROUP BY lineitem.orderkey;
