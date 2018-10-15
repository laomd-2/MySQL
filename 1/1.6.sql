-- CREATE UNIQUE INDEX Idx_nation_name ON nation(name);

-- CREATE UNIQUE INDEX Idx_cust_name_addr ON customer(name, address);

-- EXPLAIN SELECT * FROM nation WHERE name = 'CHINA';
-- 
-- DELIMITER //  
-- CREATE FUNCTION TestIndex(p_partname CHAR(55)) RETURNS INTEGER
-- NOT DETERMINISTIC READS SQL DATA
-- BEGIN
-- 	DECLARE begintime, endtime DATE;
--     SELECT now() INTO begintime;
-- 	-- SELECT * FROM part WHERE name = p_partname;
--     
--     SELECT now() INTO endtime;
--     RETURN timestampdiff(second, begintime, endtime);
-- END//
-- 

CREATE INDEX part_name ON part(name);
SELECT * FROM part WHERE name = 'lalala';

INSERT INTO part SELECT partkey + (SELECT COUNT(*) FROM part), 
					    name, mfgr, brand, type, size, container, retailprice, comment
				FROM part;