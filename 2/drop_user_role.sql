DROP ROLE PurchaseQueryRole;
DROP ROLE PurchaseEmployeeRole;
DROP ROLE PurchaseManagerRole;

DROP ROLE SaleQueryRole;
DROP ROLE SaleEmployeeRole;
DROP ROLE SaleManagerRole;

DROP ROLE CustomerQueryRole;
DROP ROLE CustomerEmployeeRole;
DROP ROLE CustomerManagerRole;

DROP USER David;
DROP USER Tom;
DROP USER Kathy;
DROP USER Jeffery;
DROP USER Jane;
DROP USER Mike;

-- select user, table_name, table_priv from mysql.tables_priv WHERE host='%';