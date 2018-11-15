-- 1
CREATE TABLE Supplier(
	suppkey INTEGER PRIMARY KEY,
    name CHAR(25),
    address VARCHAR(40),
    nationkey INTEGER,
    phone CHAR(15),
    acctbal REAL,
    comment VARCHAR(101)
);

-- 2
CREATE TABLE Supplier(
	suppkey INTEGER,
    name CHAR(25),
    address VARCHAR(40),
    nationkey INTEGER,
    phone CHAR(15),
    acctbal REAL,
    comment VARCHAR(101),
    CONSTRAINT PK_supplier PRIMARY KEY(suppkey)
);

-- 3
CREATE TABLE Supplier(
	suppkey INTEGER,
    name CHAR(25),
    address VARCHAR(40),
    nationkey INTEGER,
    phone CHAR(15),
    acctbal REAL,
    comment VARCHAR(101)
);
ALTER TABLE supplier
ADD CONSTRAINT PK_supplier PRIMARY KEY(suppkey);

-- 4
CREATE TABLE PartSupp(
	partkey INTEGER,
    suppkey INTEGER,
    availqty INTEGER,
    supplycost REAL,
    comment VARCHAR(199),
    PRIMARY KEY(partkey, suppkey)
);

-- 5
CREATE TABLE nation(
	nationkey INTEGER PRIMARY KEY,
    name CHAR(25) UNIQUE,
    regionkey INTEGER,
    comment VARCHAR(152)
);

-- 6
ALTER TABLE nation DROP PRIMARY KEY;

-- 7
INSERT INTO supplier(suppkey, name, address, nationkey, phone, acctbal, comment)
VALUES(11, 'test1', 'test1', 101, '12345678', 0.0, 'test1');

INSERT INTO supplier(suppkey, name, address, nationkey, phone, acctbal, comment)
VALUES(11, 'test2', 'test2', 102, '23456789', 0.0, 'test2');