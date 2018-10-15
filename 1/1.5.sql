-- CREATE VIEW V_DLMU_PartSupp1 AS
-- SELECT P.partkey, P.name, PS.availqty, P.retailprice, PS.supplycost, P.comment
-- FROM part P, partsupp PS, supplier S
-- WHERE P.partkey = PS.partkey AND S.suppkey = PS.suppkey AND S.name = 'Supplier#000000004';

-- CREATE VIEW V_CustAvgOrder(custkey, cname, avgprice, avgquantity) AS
-- SELECT C.custkey, MAX(C.name), AVG(O.totalprice), AVG(L.quantity)
-- FROM customer C, orders O, lineitem L
-- WHERE C.custkey = O.custkey AND L.orderkey = O.orderkey
-- GROUP BY C.custkey;
-- 
-- CREATE VIEW V_DLMU_PartSupp2 AS
-- SELECT partkey, suppkey, availqty, supplycost
-- FROM partsupp
-- WHERE suppkey = (SELECT suppkey FROM supplier 
-- 				 WHERE name = 'Supplier#000000004')
-- WITH CHECK OPTION;

-- INSERT INTO v_dlmu_partsupp2 VALUES(58889, 4, 704, 77760);
-- 
-- UPDATE v_dlmu_partsupp2 SET supplycost = 12
-- WHERE partkey = 58889;
-- 
-- DELETE FROM v_dlmu_partsupp2 WHERE partkey = 58889;
-- SELECT * FROM v_dlmu_partsupp2 WHERE partkey = 58889;

-- CREATE VIEW V_DLMU_PartSupp3 AS
-- SELECT partkey, suppkey, availqty, supplycost FROM partsupp
-- WHERE suppkey = (SELECT suppkey FROM supplier
-- 				 WHERE name = 'Supplier#000000004');

-- INSERT INTO v_dlmu_partsupp3 VALUES(58889, 4, 704, 77760);

-- UPDATE v_dlmu_partsupp3 SET supplycost = 12
-- WHERE partkey = 58889;

-- DELETE FROM v_dlmu_partsupp3 WHERE partkey = 58889;

-- INSERT INTO v_custavgorder VALUES(100000, NULL, 20, 2000);

CREATE VIEW V_CustOrd(custkey, cname, qty, extprice) AS
SELECT C.custkey, C.name, L.quantity, L.extendedprice
FROM customer C, orders O, lineitem L
WHERE C.custkey = O.custkey AND O.orderkey = L.orderkey;

CREATE VIEW V_CustAvgOrder2(custkey, cname, avgqty, avgprice) AS
SELECT custkey, MAX(cname), AVG(qty), AVG(extprice)
FROM v_custord GROUP BY custkey;

DROP VIEW v_custord CASCADE;