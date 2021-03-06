-- DELIMITER //  
-- CREATE TRIGGER TRI_Lineitem_Price_UPDATE
-- AFTER UPDATE ON lineitem
--  FOR EACH ROW
--  BEGIN
-- 	DECLARE L_valuediff REAL;
--     SET L_valuediff=NEW.extendedprice * (1-NEW.discount) * (1+NEW.tax) - 
-- 				OLD.extendedprice * (1-OLD.discount) * (1+OLD.tax);
-- 	UPDATE orders SET totalprice = totalprice + L_valuediff
--     WHERE orderkey = NEW.orderkey;
--  END//
--  
-- CREATE TRIGGER TRI_Lineitem_Price_INSERT
-- AFTER INSERT ON lineitem
--  FOR EACH ROW
--  BEGIN
-- 	DECLARE L_valuediff REAL;
--     SET L_valuediff=NEW.extendedprice * (1-NEW.discount) * (1+NEW.tax);
-- 	UPDATE orders SET totalprice = totalprice + L_valuediff
--     WHERE orderkey = NEW.orderkey;
--  END//
--  
-- CREATE TRIGGER TRI_Lineitem_Price_DELETE
-- AFTER DELETE ON lineitem
--  FOR EACH ROW
--  BEGIN
-- 	DECLARE L_valuediff REAL;
--     SET L_valuediff=-OLD.extendedprice * (1-OLD.discount) * (1+OLD.tax);
-- 	UPDATE orders SET totalprice = totalprice + L_valuediff
--     WHERE orderkey = OLD.orderkey;
--  END//

SELECT totalprice FROM orders WHERE orderkey=1;
-- UPDATE lineitem SET tax = tax - 0.005 WHERE orderkey = 1 AND linenumber = 1;
-- INSERT INTO lineitem VALUES(1, 1552, 93, 1, 17, 24710.35, 0.04, 0.025, 'N', 'O', '1996-03-13', '1996-02-12', '1996-03-22', 'DELIVER IN PERSON', 'TRUCK', 'egular courts above the');
DELETE FROM lineitem WHERE orderkey=1 AND linenumber=1;