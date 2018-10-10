CREATE DATABASE IF NOT EXISTS TPCH DEFAULT CHARACTER SET GBK COLLATE GBK_CHINESE_CI;
CREATE SCHEMA IF NOT EXISTS Sales DEFAULT CHARACTER SET GBK COLLATE GBK_CHINESE_CI;
USE Sales;

CREATE TABLE IF NOT EXISTS Region (     -- 地区表
    regionkey INTEGER PRIMARY KEY,      -- 地区编号（主键）
    name CHAR(25),                      -- 地区名称
    comment VARCHAR(152)                -- 备注
);
CREATE TABLE IF NOT EXISTS Nation (     -- 国家表
    nationkey INTEGER PRIMARY KEY,      -- 国家编号（主键）
    name CHAR(25),                      -- 国家名称
    regionkey INTEGER REFERENCES Region (regionkey),    -- 地区编号（外键）
    comment VARCHAR(152)                -- 备注
);
CREATE TABLE IF NOT EXISTS Supplier (   -- 供应商基本表
    suppkey INTEGER PRIMARY KEY,        -- 供应商编号（主键）
    name CHAR(25),                      -- 供应商名称
    address VARCHAR(40),                -- 供应商地址
    nationkey INTEGER REFERENCES Nation (nationkey),    -- 国家编号（外键）
    phone CHAR(15),                     -- 供应商电话
    accbal REAL,                        -- 供应商账户余额
    comment VARCHAR(101)                -- 备注
);
CREATE TABLE IF NOT EXISTS Part (       -- 零件基本表
    partkey INTEGER PRIMARY KEY,        -- 零件编号（主键）
    name VARCHAR(55),                   -- 零件名称
    mfgr CHAR(25),                      -- 制造厂
    brand CHAR(10),                     -- 品牌
    type VARCHAR(25),                   -- 零件类型
    size INTEGER,                       -- 尺寸
    container CHAR(10),                 -- 包装
    retailprice REAL,                   -- 零售价格
    comment VARCHAR(23)                 -- 备注
);
CREATE TABLE IF NOT EXISTS PartSupp (   -- 零件供应联系表
    partkey INTEGER REFERENCES Part (partkey),  -- 零件编号（外键）
    suppkey INTEGER REFERENCES Supplier (suppkey),  -- 零件供应商编号（外键）
    availqty INTEGER,                   -- 可用数量
    supplycost REAL,                    -- 供应价格
    comment VARCHAR(199),               -- 备注
    PRIMARY KEY (partkey , suppkey)     -- 主键，表级约束
);
CREATE TABLE IF NOT EXISTS Customer (   -- 顾客表
    custkey INTEGER PRIMARY KEY,        -- 顾客编号（主键）
    name VARCHAR(25),                   -- 顾客名字
    address VARCHAR(40),                -- 地址
    nationkey INTEGER REFERENCES Nation (nationkey),    -- 国籍编号
    phone CHAR(15),                     -- 电话
    acctbal REAL,                       -- 账户余额
    mktsegment CHAR(10),                -- 市场分区
    comment VARCHAR(117)                -- 备注
);
CREATE TABLE IF NOT EXISTS Orders (     -- 订单表
    orderkey INTEGER PRIMARY KEY,       -- 订单编号（主键）
    custkey INTEGER REFERENCES Customer (custkey),  -- 顾客编号（外键）
    orderstatus CHAR(1),                -- 订单状态
    totalprice REAL,                    -- 总金额
    orderdate DATE,                     -- 日期
    orderpriority CHAR(15),             -- 优先级
    clerk CHAR(15),                     -- 记账员
    shippriority INTEGER,               -- 运输优先级
    comment VARCHAR(79)                 -- 备注
);
CREATE TABLE IF NOT EXISTS Lineitem (   -- 订单明细表
    orderkey INTEGER REFERENCES Orders (orderkey),  -- 订单编号
    partkey INTEGER REFERENCES Part (partkey),      -- 零件编号
    suppkey INTEGER REFERENCES Supplier (suppkey),  -- 供应商编号
    linenumber INTEGER,                             -- 订单明细编号
    quantity REAL,                                  -- 数量
    extendedprice REAL,                             -- 订单明细价格
    discount REAL,                                  -- 折扣[0.00, 1.00]
    tax REAL,                                       -- 税率[0.00， 0.08]
    returnflag CHAR(1),                             -- 退货标记
    linestatus CHAR(1),                             -- 订单明细状态
    shipdate DATE,                                  -- 装运日期
    commitdate DATE,                                -- 委托日期
    receipdate DATE,                                -- 签收日期
    shipinstruct CHAR(25),                          -- 装运说明
    shipmode CHAR(10),                              -- 装运方式
    comment VARCHAR(44),                            -- 备注
    PRIMARY KEY (orderkey , linenumber),
    FOREIGN KEY (partkey , suppkey)
        REFERENCES PartSupp (partkey , suppkey)
);