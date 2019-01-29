SELECT lineitem.orderkey, extendedprice, discount, tax, totalprice 
FROM lineitem, orders WHERE lineitem.orderkey=orders.orderkey GROUP BY lineitem.orderkey;