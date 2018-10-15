-- SELECT name, address, phone FROM Supplier;

SELECT * FROM Sales.Orders WHERE DATE("1997-12-25") - orderdate >= 0 AND DATE("1997-12-25") - orderdate < 7 AND totalprice > 1000;

/*SELECT C.custkey, SUM(O.totalprice) FROM customer C, orders O 
WHERE C.custkey = O.custkey GROUP BY C.custkey;

SELECT C.custkey, MAX(C.name) FROM customer C, orders O 
WHERE C.custkey = O.custkey 
GROUP BY C.custkey HAVING AVG(O.totalprice) > 1000;

SELECT F.suppkey, F.name, F.address
FROM supplier F, supplier S
WHERE F.nationkey = S.nationkey AND S.name = 'Supplier#000000009';

SELECT P.name, P.mfgr, P.retailprice, PS.supplycost
FROM part P, partsupp PS WHERE P.retailprice > PS.supplycost;

SELECT P.name, P.mfgr, P.retailprice, PS.supplycost
FROM part P, partsupp PS 
WHERE P.partkey = PS.partkey AND P.retailprice > PS.supplycost;

SELECT O.orderkey, O.totalprice, L.partkey, L.quantity, L.extendedprice
FROM customer C, orders O, lineitem L
WHERE C.custkey = O.custkey AND O.orderkey = L.orderkey AND C.name = 'Customer#000000370';

