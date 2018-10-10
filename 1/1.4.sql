-- INSERT INTO customer VALUES(2030, '张三', '北京市', 40, '010-51001199', 0.00, 'Northeast', 'vip customer');
-- SELECT * FROM customer WHERE name = '张三';

-- INSERT INTO lineitem(orderkey, Linenumber, partkey, suppkey, quantity, shipdate)
-- VALUES (862, ROUND(rand() * 100.0), 1, 27, 10, '2012-3-6');

-- CREATE TABLE NewCustomer LIKE customer;

-- INSERT INTO newcustomer 
-- SELECT C.*
-- FROM customer C, nation N
-- WHERE C.nationkey = N.nationkey AND N.name = 'CHINA';

-- CREATE TABLE ShoppingStat(
-- 	custkey INTEGER,
--     quantity REAL,
--     totalprice REAL
-- );
-- INSERT INTO shoppingstat
-- SELECT C.custkey, SUM(L.quantity), SUM(O.totalprice)
-- FROM customer C, orders O, lineitem L
-- WHERE C.custkey = O.custkey AND O.orderkey = L.orderkey
-- GROUP BY C.custkey;

-- INSERT INTO part
-- SELECT partkey + (SELECT COUNT(*) FROM part),
-- 	   name, mfgr, brand, type, size, container, retailprice, comment
-- FROM part;

-- UPDATE partsupp
-- SET supplycost = supplycost * 0.9
-- WHERE suppkey = (SELECT suppkey FROM supplier WHERE name = 'Supplier#000000009');

-- UPDATE lineitem L, part P
-- SET L.extendedprice = P.retailprice * L.quantity
-- WHERE L.partkey = P.partkey;


DELETE FROM lineitem
WHERE orderkey IN (SELECT orderkey FROM orders O, customer C
				   WHERE O.custkey = C.custkey AND C.name = 'Customer#000000001');
DELETE FROM orders
WHERE custkey = (SELECT custkey FROM customer WHERE name = 'Customer#000000001');