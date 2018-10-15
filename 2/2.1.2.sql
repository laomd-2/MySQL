USE Sales;

-- 查询角色
CREATE ROLE PurchaseQueryRole;
GRANT SELECT ON part TO PurchaseQueryRole;
GRANT SELECT ON supplier TO PurchaseQueryRole;
GRANT SELECT ON partsupp TO PurchaseQueryRole;

CREATE ROLE SaleQueryRole;
GRANT SELECT ON orders TO SaleQueryRole;
GRANT SELECT ON lineitem TO SaleQueryRole;

CREATE ROLE CustomerQueryRole;
GRANT SELECT ON customer TO CustomerQueryRole;
GRANT SELECT ON nation TO CustomerQueryRole;
GRANT SELECT ON region TO CustomerQueryRole;

-- 职员角色
CREATE ROLE PurchaseEmployeeRole;
GRANT SELECT, INSERT ON part TO PurchaseEmployeeRole;
GRANT SELECT, INSERT ON supplier TO PurchaseEmployeeRole;
GRANT SELECT, INSERT ON partsupp TO PurchaseEmployeeRole;

CREATE ROLE SaleEmployeeRole;
GRANT SELECT, INSERT ON orders TO SaleEmployeeRole;
GRANT SELECT, INSERT ON lineitem TO SaleEmployeeRole;

CREATE ROLE CustomerEmployeeRole;
GRANT SELECT, INSERT ON customer TO CustomerEmployeeRole;
GRANT SELECT, INSERT ON nation TO CustomerEmployeeRole;
GRANT SELECT, INSERT ON region TO CustomerEmployeeRole;

-- 经理角色
CREATE ROLE PurchaseManagerRole;
GRANT CREATE ROLE ON *.* TO PurchaseManagerRole;
GRANT ALL PRIVILEGES ON part TO PurchaseManagerRole;
GRANT ALL PRIVILEGES ON supplier TO PurchaseManagerRole;
GRANT ALL PRIVILEGES ON partsupp TO PurchaseManagerRole;
GRANT SaleQueryRole TO PurchaseManagerRole;
GRANT CustomerQueryRole TO PurchaseManagerRole;

CREATE ROLE SaleManagerRole;
GRANT CREATE ROLE ON *.* TO SaleManagerRole;
GRANT ALL PRIVILEGES ON orders TO SaleManagerRole;
GRANT ALL PRIVILEGES ON lineitem TO SaleManagerRole;
GRANT PurchaseQueryRole TO SaleManagerRole;
GRANT CustomerQueryRole TO SaleManagerRole;

CREATE ROLE CustomerManagerRole;
GRANT CREATE ROLE ON *.* TO CustomerManagerRole;
GRANT ALL PRIVILEGES ON customer TO CustomerManagerRole;
GRANT ALL PRIVILEGES ON nation TO CustomerManagerRole;
GRANT ALL PRIVILEGES ON region TO CustomerManagerRole;
GRANT PurchaseQueryRole TO CustomerManagerRole;
GRANT SaleQueryRole TO CustomerManagerRole;