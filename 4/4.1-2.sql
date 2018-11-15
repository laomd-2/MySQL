-- DELIMITER //

-- CREATE TRIGGER TRI_Lineitem_Quantity_UPDATE
-- BEFORE UPDATE ON lineitem
-- FOR EACH ROW
-- BEGIN
-- 	DECLARE L_valuediff, L_availqty INTEGER;
--     
--     SET L_valuediff = NEW.quantity - OLD.quantity;
--     SELECT availqty INTO L_availqty FROM partsupp
-- 		WHERE partkey = NEW.partkey AND suppkey = NEW.suppkey;
-- 	IF (L_availqty - L_valuediff >= 0) THEN
-- 		BEGIN
--             UPDATE partsupp SET availqty = availqty - L_valuediff
-- 				WHERE partkey = NEW.partkey AND suppkey = NEW.suppkey;
-- 		END;
--     ELSE
--         SIGNAL SQLSTATE '45000' SET message_text='Available quantity is NOT ENOUGH';
--     END IF;
-- END//

-- CREATE TRIGGER TRI_Lineitem_Quantity_INSERT
-- BEFORE INSERT ON lineitem
-- FOR EACH ROW
-- BEGIN
-- 	DECLARE L_valuediff, L_availqty INTEGER;
--     
--     SET L_valuediff = NEW.quantity;
--     SELECT availqty INTO L_availqty FROM partsupp
-- 		WHERE partkey = NEW.partkey AND suppkey = NEW.suppkey;
-- 	IF (L_availqty - L_valuediff >= 0) THEN
-- 		BEGIN
--             UPDATE partsupp SET availqty = availqty - L_valuediff
--             WHERE partkey = NEW.partkey AND suppkey = NEW.suppkey;
-- 		END;
--     ELSE
--         SIGNAL SQLSTATE '45000' SET message_text='Available quantity is NOT ENOUGH';
--     END IF;
-- END//

-- CREATE TRIGGER TRI_Lineitem_Quantity_DELETE
-- BEFORE DELETE ON lineitem
-- FOR EACH ROW
-- BEGIN
-- 	DECLARE L_valuediff, L_availqty INTEGER;
--     
--     SET L_valuediff = -OLD.quantity;
--     UPDATE partsupp SET availqty = availqty - L_valuediff
-- 		WHERE partkey = OLD.partkey AND suppkey = OLD.suppkey;
-- END//

-- SELECT L.partkey, L.suppkey, L.quantity, PS.availqty
-- FROM lineitem L, partsupp PS
-- WHERE L.partkey = PS.partkey AND L.suppkey = PS.suppkey 
-- 	AND L.orderkey = 1 AND L.linenumber=1;

-- UPDATE lineitem SET quantity = quantity + 10000
-- WHERE orderkey = 1 AND linenumber = 1;

-- INSERT INTO lineitem VALUES(1, 1552, 93, 101, 10000, 24710.35, 0.04, 0.025, 'N', 'O', '1996-03-13', '1996-02-12', '1996-03-22', 'DELIVER IN PERSON', 'TRUCK', 'egular courts above the');

DELETE FROM lineitem WHERE orderkey = 1 AND linenumber = 100;
