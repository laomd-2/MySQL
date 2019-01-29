-- create database ecommerce;
use ecommerce;
-- 创建insert触发器
drop trigger if exists TRI_INSERT_ORDERITEM; 
delimiter $
create trigger TRI_INSERT_ORDERITEM
before insert on orders_orderitem
	for each row
    begin
		-- 保存购买数量
		declare purchase_num int;
        -- 保存商品剩余数量
		declare remain_num int;
        set purchase_num = new.quantity;
		select stock into remain_num
		from shop_product
		where new.product_id = id;
		-- 只有当剩余数量大于购买数量时才允许插入并进行商品剩余数量的更新
		if (remain_num>=purchase_num) then
		begin
			update shop_product 
			set stock = stock-purchase_num
			where id = new.product_id;
		end;
        -- 否则提示商品数量不足并拒绝插入
		else
			signal sqlstate '45000' set message_text = 'Remain quantity not enough!';
		end if;
    end$
delimiter ;



-- 创建delete触发器
drop trigger if exists TRI_DELETE_ORDERITEM; 
delimiter $

create trigger TRI_DELETE_ORDERITEM
before delete on orders_orderitem
	for each row
    begin
    
    declare purchase_num int;
    
    set purchase_num = old.quantity;
    -- 当初购买了多少数量现在就返回多少数量
    update shop_product
    set stock = stock + purchase_num 
    where id = old.product_id;
    
    end$

delimiter ;

-- 创建update触发器
drop trigger if exists TRI_UPDATE_ORDERITEM; 
delimiter $

create trigger TRI_UPDATE_ORDERITEM
before update on orders_orderitem
	for each row
    begin
    
		declare increase_num int;
		declare remain_num int;
		
		select stock into remain_num
		from shop_product
		where new.product_id = id;
		-- 如果新的数量更少，则直接返回减少的数量即可
		if (new.quantity <= old.quantity) then
			begin
				update shop_product 
				set stock = stock+old.quantity-new.quantity
				where id = new.product_id;		
			end ;
		else
			begin
				set increase_num = new.quantity - old.quantity;
				if (remain_num>=increase_num) then
				begin
					update shop_product 
					set stock = stock-increase_num
					where id = new.product_id;
				end;
				else
					signal sqlstate '45000' set message_text = 'Remain quantity not enough!';
				end if;       
			end;
		end if;

    end$

delimiter ;


-- 创建数据表
drop table if exists orders_orderitem;
drop table if exists product;
drop view if exists shop_product;
drop view if exists orders_order;
drop view if exists shop_category;
CREATE TABLE `shop_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `slug` varchar(150) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `shop_category_name_11b68823` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `orders_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(60) NOT NULL,
  `last_name` varchar(60) NOT NULL,
  `email` varchar(254) NOT NULL,
  `address` varchar(150) NOT NULL,
  `postal_code` varchar(30) NOT NULL,
  `city` varchar(100) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `paid` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `available` tinyint(1) NOT NULL,
  `stock` int(10) unsigned NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `image` varchar(100) NOT NULL,
  `category_id` int(11) NOT NULL,
  `like` decimal(2,1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_product_id_slug_68aad32e_idx` (`id`,`slug`),
  KEY `shop_product_category_id_14d7eea8_fk_shop_category_id` (`category_id`),
  KEY `shop_product_name_b8d5e94c` (`name`),
  KEY `shop_product_slug_30bd2d5d` (`slug`),
  CONSTRAINT `shop_product_category_id_14d7eea8_fk_shop_category_id` FOREIGN KEY (`category_id`) REFERENCES `shop_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

create view shop_product 
as select 
	id,name,slug,description,
    price,available,stock,created_at,
    updated_at,image,category_id
from product;
	

CREATE TABLE `orders_orderitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `price` decimal(10,2) NOT NULL,
  `quantity` int(10) unsigned NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_orderitem_order_id_fe61a34d_fk_orders_order_id` (`order_id`),
  KEY `orders_orderitem_product_id_afe4254a_fk_shop_product_id` (`product_id`),
  CONSTRAINT `orders_orderitem_order_id_fe61a34d_fk_orders_order_id` FOREIGN KEY (`order_id`) REFERENCES `orders_order` (`id`),
  CONSTRAINT `orders_orderitem_product_id_afe4254a_fk_shop_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 加载数据
use ecommerce;
LOAD DATA INFILE 'D:/data/shop_category.tbl' REPLACE INTO TABLE shop_category FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n';
LOAD DATA INFILE 'D:/data/shop_product.tbl' REPLACE INTO TABLE product FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n';
