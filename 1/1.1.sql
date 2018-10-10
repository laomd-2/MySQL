CREATE DATABASE IF NOT EXISTS TPCH DEFAULT CHARACTER SET GBK COLLATE GBK_CHINESE_CI;
CREATE SCHEMA IF NOT EXISTS Sales DEFAULT CHARACTER SET GBK COLLATE GBK_CHINESE_CI;
USE Sales;

CREATE TABLE IF NOT EXISTS Region (     --地区表
    regionkey INTEGER PRIMARY KEY,      --地区编号（主键）
    name CHAR(25),                      --地区名称
    comment VARCHAR(152)                --备注
);
CREATE TABLE IF NOT EXISTS Nation (     --国家表
    nationkey INTEGER PRIMARY KEY,      --国家编号（主键）
    name CHAR(25),                      --国家名称
    regionkey INTEGER REFERENCES Region (regionkey),    --地区编号（外键）
    comment VARCHAR(152)                --备注
);
CREATE TABLE IF NOT EXISTS Supplier (   --供应商基本表
    suppkey INTEGER PRIMARY KEY,        --供应商编号（主键）
    name CHAR(25),                      --供应商名称
    address VARCHAR(40),                --供应商地址
    nationkey INTEGER REFERENCES Nation (nationkey),    --国家编号（外键）
    phone CHAR(15),                     --供应商电话
    accbal REAL,                        --供应商账户余额
    comment VARCHAR(101)                --备注
);
CREATE TABLE IF NOT EXISTS Part (
    partkey INTEGER PRIMARY KEY,
    name VARCHAR(55),
    mfgr CHAR(25),
    brand CHAR(10),
    type VARCHAR(25),
    size INTEGER,
    container CHAR(10),
    retailprice REAL,
    comment VARCHAR(23)
);
CREATE TABLE IF NOT EXISTS PartSupp (
    partkey INTEGER REFERENCES Part (partkey),
    suppkey INTEGER REFERENCES Supplier (suppkey),
    availqty INTEGER,
    supplycost REAL,
    comment VARCHAR(199),
    PRIMARY KEY (partkey , suppkey)
);
CREATE TABLE IF NOT EXISTS Customer (
    custkey INTEGER PRIMARY KEY,
    name VARCHAR(25),
    address VARCHAR(40),
    nationkey INTEGER REFERENCES Nation (nationkey),
    phone CHAR(15),
    acctbal REAL,
    mktsegment CHAR(10),
    comment VARCHAR(117)
);
CREATE TABLE IF NOT EXISTS Orders (
    orderkey INTEGER PRIMARY KEY,
    custkey INTEGER REFERENCES Customer (custkey),
    orderstatus CHAR(1),
    totalprice REAL,
    orderdate DATE,
    orderpriority CHAR(15),
    clerk CHAR(15),
    shippriority INTEGER,
    comment VARCHAR(79)
);
CREATE TABLE IF NOT EXISTS Lineitem (
    orderkey INTEGER REFERENCES Orders (orderkey),
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
    FOREIGN KEY (partkey , suppkey)
        REFERENCES PartSupp (partkey , suppkey)
);