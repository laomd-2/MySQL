-- 1
CREATE TABLE region(
	regionkey INTEGER PRIMARY KEY,
    name CHAR(25),
    comment VARCHAR(152)
);

CREATE TABLE nation(
	nationkey INTEGER PRIMARY KEY,
    name CHAR(25),
    regionkey INTEGER,
    comment VARCHAR(152),
    CONSTRAINT FK_nation_regoinkey FOREIGN KEY (regionkey) REFERENCES region(regionkey)
);

-- 2
CREATE TABLE nation(
	nationkey INTEGER PRIMARY KEY,
    name CHAR(25),
    regionkey INTEGER,
    comment VARCHAR(152)
);
ALTER TABLE nation
ADD CONSTRAINT FK_Nation_regionkey
FOREIGN KEY(regionkey) REFERENCES Region(regionkey);

-- 3
CREATE TABLE PartSupp (
    partkey INTEGER,
    suppkey INTEGER,
    availqty INTEGER,
    supplycost REAL,
    comment VARCHAR(199),
    PRIMARY KEY (partkey , suppkey),
    FOREIGN KEY (partkey) REFERENCES Part (partkey),
    FOREIGN KEY (suppkey) REFERENCES Supplier (suppkey)
);
-- 
CREATE TABLE Lineitem (
    orderkey INTEGER,
    partkey INTEGER REFERENCES Part (partkey),
    suppkey INTEGER REFERENCES Supplier (suppkey),
    linenumber INTEGER,
    quantity REAL,
    extendedprice REAL,
    discount REAL,
    tax REAL,
    returnflag CHAR(1),
    linestatus CHAR(1),
    shipdate DATE,
    commitdate DATE,
    receipdate DATE,
    shipinstruct CHAR(25),
    shipmode CHAR(10),
    comment VARCHAR(44),
    PRIMARY KEY (orderkey , linenumber),
    FOREIGN KEY (partkey)
        REFERENCES Part(partkey),
	FOREIGN KEY (suppkey)
        REFERENCES Supplier(suppkey),
    FOREIGN KEY (partkey , suppkey)
        REFERENCES PartSupp (partkey , suppkey),
	FOREIGN KEY (orderkey) REFERENCES Orders (orderkey)
);

-- 4
CREATE TABLE nation(
	nationkey INTEGER PRIMARY KEY,
    name CHAR(25),
    regionkey INTEGER,
    comment VARCHAR(152),
    CONSTRAINT FK_Nation_regionkey FOREIGN KEY(regionkey)
		REFERENCES region(regionkey)
        ON DELETE SET NULL ON UPDATE SET NULL
);
-- DELETE FROM region;
-- DELETE FROM nation;
INSERT INTO region VALUES(0, 'region1', 'region1');
INSERT INTO nation VALUES(0, 'nation1', 0, 'nation1');
INSERT INTO region VALUES(1, 'region2', 'region2');
INSERT INTO nation VALUES(1, 'nation2', 1, 'nation2');
-- UPDATE region SET regionkey=1 WHERE regionkey=0;

-- 5
ALTER TABLE nation DROP FOREIGN KEY FK_Nation_regionkey;

-- 6
-- INSERT INTO nation VALUES (1001, 'nation1', 1001, 'comment1');