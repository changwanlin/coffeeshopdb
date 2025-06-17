CREATE DATABASE coffeeshopdb;
USE coffeeshopdb;

-- 建立顧客資料表（customer）
CREATE TABLE customer (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    phone VARCHAR(10)
);

-- 建立商品類別表（category）
CREATE TABLE category (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(20) NOT NULL
);

-- 建立商品資料表（product）
CREATE TABLE product (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    price DECIMAL(6,2) NOT NULL,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES category(category_id)
);

-- 建立訂單資料表（order）
CREATE TABLE `order` (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    dine_type ENUM('內用', '外帶') NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

-- 建立訂單明細表（order_detail）
CREATE TABLE order_detail (
    order_detail_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    unit_price DECIMAL(6,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES `order`(order_id),
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);

SHOW TABLES;

-- 插入商品分類資料，共五大類
INSERT INTO category (category_id, name) VALUES
(1, '咖啡'),
(2, '茶飲'),
(3, '果汁'),
(4, '奶昔'),
(5, '冰沙');

-- 插入商品資料，共 30 筆，每類商品各 6 種

-- 咖啡類 (1)
INSERT INTO product (product_id, name, price, category_id) VALUES
(1, '拿鐵', 108, 1),
(2, '美式', 102, 1),
(3, '卡布奇諾', 89, 1),
(4, '焦糖瑪奇朵', 81, 1),
(5, '濃縮咖啡', 109, 1),
(6, '摩卡咖啡', 115, 1),

-- 茶飲類 (2)
(7, '綠茶', 133, 2),
(8, '紅茶', 148, 2),
(9, '烏龍茶', 96, 2),
(10, '奶茶', 130, 2),
(11, '水果茶', 95, 2),
(12, '四季春', 108, 2),

-- 果汁類 (3)
(13, '葡萄汁', 95, 3),
(14, '柳橙汁', 100, 3),
(15, '蘋果汁', 92, 3),
(16, '奇異果汁', 110, 3),
(17, '鳳梨汁', 97, 3),
(18, '綜合果汁', 105, 3),

-- 奶昔類 (4)
(19, '香草奶昔', 120, 4),
(20, '草莓奶昔', 125, 4),
(21, '巧克力奶昔', 130, 4),
(22, '抹茶奶昔', 118, 4),
(23, '香蕉奶昔', 122, 4),
(24, '花生奶昔', 128, 4),

-- 冰沙類 (5)
(25, '藍莓冰沙', 100, 5),
(26, '芒果冰沙', 105, 5),
(27, '草莓冰沙', 110, 5),
(28, '鳳梨冰沙', 98, 5),
(29, '西瓜冰沙', 102, 5),
(30, '奇異果冰沙', 108, 5);

-- 插入 30 位顧客的基本資料（顧客 ID、姓名、電話）
INSERT INTO customer (customer_id, name, phone) VALUES
(1, '張依婷', '0934125545'),
(2, '瞿琬婷', '0944610537'),
(3, '何雅筑', '0925226704'),
(4, '牟家銘', '0943545597'),
(5, '李詩涵', '0967103400'),
(6, '楊志宏', '0980484765'),
(7, '劉龍安', '0983719511'),
(8, '黃心怡', '0953604005'),
(9, '李飛宇', '0921688585'),
(10, '秦家銘', '0946233634'),
(11, '卞冠霖', '0996881107'),
(12, '李中山', '0991515041'),
(13, '崔雅琪', '0935300780'),
(14, '呂俊宏', '0976014650'),
(15, '鮑怡萱', '0976116393'),
(16, '孫思穎', '0967461289'),
(17, '許家瑋', '0947278467'),
(18, '顧依婷', '0969078991'),
(19, '王雅文', '0918198122'),
(20, '閻庭瑋', '0973249936'),
(21, '王惠如', '0985842884'),
(22, '郭雅筑', '0943142943'),
(23, '張雅芳', '0940897560'),
(24, '方瑋婷', '0932951755'),
(25, '蘇怡安', '0972921626'),
(26, '章庭瑋', '0954261710'),
(27, '彭淑芬', '0991372700'),
(28, '王懿宇', '0962796927'),
(29, '呂雅惠', '0945059145'),
(30, '徐淑玲', '0942045418');

-- 插入 55 筆訂單資料（訂單 ID、顧客 ID、訂單時間、用餐方式）
INSERT INTO `order` (order_id, customer_id, order_time, dine_type) VALUES
(1, 21, '2025-04-28 19:33:01', '內用'),
(2, 4, '2025-04-14 19:54:11', '內用'),
(3, 28, '2025-04-13 03:00:35', '外帶'),
(4, 27, '2025-04-15 00:56:45', '內用'),
(5, 24, '2025-05-31 02:59:34', '外帶'),
(6, 16, '2025-04-18 22:20:35', '內用'),
(7, 18, '2025-05-25 17:03:07', '內用'),
(8, 4, '2025-04-22 12:27:33', '內用'),
(9, 23, '2025-04-22 17:47:02', '內用'),
(10, 9, '2025-05-31 09:29:02', '外帶'),
(11, 20, '2025-05-09 17:40:36', '內用'),
(12, 19, '2025-06-01 02:21:10', '內用'),
(13, 14, '2025-05-06 20:06:58', '內用'),
(14, 10, '2025-06-11 13:26:54', '外帶'),
(15, 4, '2025-05-10 17:09:42', '內用'),
(16, 1, '2025-05-19 00:19:22', '外帶'),
(17, 28, '2025-05-30 02:11:17', '外帶'),
(18, 1, '2025-05-18 20:13:02', '內用'),
(19, 3, '2025-04-25 12:22:50', '外帶'),
(20, 13, '2025-06-09 19:01:23', '外帶'),
(21, 18, '2025-06-07 20:52:50', '外帶'),
(22, 18, '2025-06-10 05:54:46', '內用'),
(23, 21, '2025-06-04 06:14:14', '外帶'),
(24, 6, '2025-05-15 13:16:44', '內用'),
(25, 26, '2025-04-26 05:30:20', '內用'),
(26, 2, '2025-04-16 07:06:43', '內用'),
(27, 22, '2025-05-17 09:22:54', '內用'),
(28, 29, '2025-04-25 09:17:49', '外帶'),
(29, 23, '2025-04-26 03:39:24', '內用'),
(30, 20, '2025-05-02 20:02:52', '外帶'),
(31, 20, '2025-06-03 13:03:28', '內用'),
(32, 8, '2025-04-18 22:17:15', '外帶'),
(33, 24, '2025-05-18 02:44:42', '外帶'),
(34, 22, '2025-04-21 21:17:28', '外帶'),
(35, 3, '2025-06-01 08:40:40', '外帶'),
(36, 18, '2025-05-28 17:34:19', '內用'),
(37, 8, '2025-05-15 09:00:58', '外帶'),
(38, 13, '2025-05-29 07:36:56', '外帶'),
(39, 26, '2025-06-05 15:25:39', '外帶'),
(40, 25, '2025-06-03 12:36:13', '外帶'),
(41, 24, '2025-05-11 12:02:27', '內用'),
(42, 18, '2025-05-18 01:21:07', '內用'),
(43, 1, '2025-05-21 23:46:40', '內用'),
(44, 16, '2025-05-06 18:04:36', '內用'),
(45, 8, '2025-06-03 00:32:32', '內用'),
(46, 11, '2025-04-25 23:48:04', '內用'),
(47, 8, '2025-05-19 15:22:08', '外帶'),
(48, 24, '2025-04-17 15:12:09', '內用'),
(49, 27, '2025-04-23 18:28:17', '外帶'),
(50, 20, '2025-04-21 10:31:43', '內用'),
(51, 25, '2025-05-10 15:32:05', '外帶'),
(52, 13, '2025-05-10 19:46:51', '外帶'),
(53, 29, '2025-06-07 04:38:15', '外帶'),
(54, 1, '2025-04-20 00:48:49', '內用'),
(55, 19, '2025-04-30 18:30:51', '內用');

-- 插入 143 筆訂單明細資料（每筆包含訂單明細 ID、所屬訂單 ID、商品 ID、數量、單價）
INSERT INTO order_detail (order_detail_id, order_id, product_id, quantity, unit_price) VALUES
(1, 1, 17, 1, 91),
(2, 1, 21, 2, 79),
(3, 2, 2, 3, 102),
(4, 3, 7, 2, 148),
(5, 3, 22, 2, 79),
(6, 3, 13, 1, 157),
(7, 4, 13, 1, 157),
(8, 4, 20, 3, 116),
(9, 4, 8, 2, 96),
(10, 5, 10, 1, 95),
(11, 5, 13, 1, 157),
(12, 5, 16, 3, 159),
(13, 5, 23, 2, 152),
(14, 6, 8, 1, 96),
(15, 6, 16, 1, 159),
(16, 6, 6, 2, 133),
(17, 6, 10, 2, 95),
(18, 7, 2, 1, 102),
(19, 7, 20, 3, 116),
(20, 7, 23, 1, 152),
(21, 7, 18, 2, 144),
(22, 8, 11, 2, 109),
(23, 8, 12, 1, 153),
(24, 8, 19, 1, 62),
(25, 8, 6, 1, 133),
(26, 9, 5, 3, 109),
(27, 9, 1, 2, 108),
(28, 9, 21, 1, 79),
(29, 9, 19, 1, 62),
(30, 10, 20, 3, 116),
(31, 10, 1, 3, 108),
(32, 10, 18, 1, 144),
(33, 11, 24, 2, 100),
(34, 11, 6, 3, 133),
(35, 11, 2, 3, 102),
(36, 11, 17, 3, 91),
(37, 12, 16, 3, 159),
(38, 12, 3, 3, 89),
(39, 13, 7, 2, 148),
(40, 14, 9, 1, 130),
(41, 14, 16, 3, 159),
(42, 15, 1, 2, 108),
(43, 15, 23, 2, 152),
(44, 15, 10, 1, 95),
(45, 15, 4, 3, 81),
(46, 16, 22, 3, 79),
(47, 16, 15, 2, 61),
(48, 16, 25, 3, 81),
(49, 17, 3, 2, 89),
(50, 17, 12, 2, 153),
(51, 18, 15, 2, 61),
(52, 18, 6, 1, 133),
(53, 19, 3, 1, 89),
(54, 20, 10, 1, 95),
(55, 20, 11, 1, 109),
(56, 20, 1, 2, 108),
(57, 21, 1, 1, 108),
(58, 22, 17, 2, 91),
(59, 22, 25, 1, 81),
(60, 22, 9, 2, 130),
(61, 23, 16, 3, 159),
(62, 23, 22, 3, 79),
(63, 23, 9, 2, 130),
(64, 23, 20, 3, 116),
(65, 24, 8, 2, 96),
(66, 24, 1, 3, 108),
(67, 25, 7, 3, 148),
(68, 26, 10, 1, 95),
(69, 26, 9, 2, 130),
(70, 26, 3, 3, 89),
(71, 27, 5, 3, 109),
(72, 27, 13, 3, 157),
(73, 27, 18, 1, 144),
(74, 28, 21, 2, 79),
(75, 28, 8, 3, 96),
(76, 28, 12, 3, 153),
(77, 29, 14, 1, 133),
(78, 29, 21, 1, 79),
(79, 29, 8, 2, 96),
(80, 29, 2, 3, 102),
(81, 30, 1, 2, 108),
(82, 30, 6, 3, 133),
(83, 30, 16, 1, 159),
(84, 31, 20, 3, 116),
(85, 31, 2, 2, 102),
(86, 31, 24, 2, 100),
(87, 31, 4, 3, 81),
(88, 32, 18, 3, 144),
(89, 33, 25, 3, 81),
(90, 34, 3, 3, 89),
(91, 35, 15, 2, 61),
(92, 35, 14, 1, 133),
(93, 35, 13, 1, 157),
(94, 36, 18, 2, 144),
(95, 37, 12, 3, 153),
(96, 37, 16, 1, 159),
(97, 37, 7, 3, 148),
(98, 37, 24, 3, 100),
(99, 38, 22, 2, 79),
(100, 38, 23, 1, 152),
(101, 39, 21, 2, 79),
(102, 39, 9, 2, 130),
(103, 40, 24, 1, 100),
(104, 40, 3, 1, 89),
(105, 40, 8, 1, 96),
(106, 40, 17, 3, 91),
(107, 41, 3, 2, 89),
(108, 42, 8, 2, 96),
(109, 42, 6, 1, 133),
(110, 42, 5, 1, 109),
(111, 43, 19, 1, 62),
(112, 43, 1, 1, 108),
(113, 43, 16, 1, 159),
(114, 44, 12, 3, 153),
(115, 45, 3, 2, 89),
(116, 45, 7, 2, 148),
(117, 46, 3, 2, 89),
(118, 46, 5, 1, 109),
(119, 47, 24, 1, 100),
(120, 47, 3, 3, 89),
(121, 48, 8, 2, 96),
(122, 48, 18, 1, 144),
(123, 48, 7, 2, 148),
(124, 48, 9, 1, 130),
(125, 49, 17, 2, 91),
(126, 49, 14, 2, 133),
(127, 49, 16, 2, 159),
(128, 50, 13, 2, 157),
(129, 50, 20, 1, 116),
(130, 50, 25, 1, 81),
(131, 51, 15, 1, 61),
(132, 52, 14, 1, 133),
(133, 52, 16, 2, 159),
(134, 52, 15, 2, 61),
(135, 53, 3, 1, 89),
(136, 53, 12, 1, 153),
(137, 54, 10, 2, 95),
(138, 54, 9, 1, 130),
(139, 54, 8, 1, 96),
(140, 55, 24, 1, 100),
(141, 55, 22, 3, 79),
(142, 55, 19, 3, 62),
(143, 55, 14, 3, 133);

-- 查詢資料表中所有資料
SELECT * FROM customer;
SELECT * FROM category;
SELECT * FROM product;
SELECT * FROM `order`;
SELECT * FROM order_detail;

-- 熱銷飲品排行
SELECT 
    p.name AS product_name,
    SUM(od.quantity) AS total_quantity
FROM 
    order_detail od
JOIN 
    product p ON od.product_id = p.product_id
GROUP BY 
    od.product_id
ORDER BY 
    total_quantity DESC;
   
-- 顧客消費紀錄（包含每筆訂單及總金額）
   SELECT 
    c.name AS customer_name,
    o.order_id,
    o.order_time,
    SUM(od.quantity * od.unit_price) AS order_total
FROM 
    `order` o
JOIN 
    customer c ON o.customer_id = c.customer_id
JOIN 
    order_detail od ON o.order_id = od.order_id
GROUP BY 
    o.order_id
ORDER BY 
    o.order_time;
   
-- 每日營業額（以日期為單位）
SELECT 
    DATE(order_time) AS date,
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(od.quantity * od.unit_price) AS total_revenue
FROM 
    `order` o
JOIN 
    order_detail od ON o.order_id = od.order_id
GROUP BY 
    DATE(order_time)
ORDER BY 
    date;
   
-- 每月商品統計（商品、總數量、商品總銷售額）
SELECT 
    DATE_FORMAT(o.order_time, '%Y-%m') AS month,
    p.name AS product_name,
    SUM(od.quantity) AS total_quantity,
    SUM(od.quantity * od.unit_price) AS total_sales
FROM 
    `order` o
JOIN 
    order_detail od ON o.order_id = od.order_id
JOIN 
    product p ON od.product_id = p.product_id
GROUP BY 
    month, od.product_id
ORDER BY 
    month, total_sales DESC;
   
-- 每月總營收（整體月營業額）
SELECT 
    DATE_FORMAT(o.order_time, '%Y-%m') AS month,
    SUM(od.quantity * od.unit_price) AS monthly_total_sales
FROM 
    `order` o
JOIN 
    order_detail od ON o.order_id = od.order_id
GROUP BY 
    month
ORDER BY 
    month;
   
-- 為查詢產品資訊加速
CREATE INDEX idx_orderdetail_product ON order_detail(product_id);

-- 為查詢訂單明細加速
CREATE INDEX idx_order_customer ON `order`(customer_id);

-- 為統計日期查詢加速
CREATE INDEX idx_order_time ON `order`(order_time);



-- 交易控制 正常交易流程（使用 COMMIT）
START TRANSACTION;
-- 插入訂單資料
INSERT INTO `order` (customer_id, order_time, dine_type)
VALUES (5, NOW(), '內用');
-- 取得剛剛插入的訂單 ID
SET @last_order_id = LAST_INSERT_ID();
-- 插入對應的訂單明細資料
INSERT INTO order_detail (order_id, product_id, quantity, unit_price)
VALUES 
(@last_order_id, 2, 2, 102.00),
(@last_order_id, 5, 1, 109.00);
-- 提交交易
COMMIT;
-- 查最後幾筆明細
SELECT * FROM order_detail
ORDER BY order_detail_id DESC
LIMIT 5;


START TRANSACTION;
-- 插入錯誤訂單（customer_id = 999 不存在）
INSERT INTO `order` (customer_id, order_time, dine_type)
VALUES (999, NOW(), '內用');

-- 插入失敗，MariaDB 自動觸發 rollback
-- 無需手動寫 ROLLBACK，但你也可以手動測試：
-- ROLLBACK;

-- GROUP BY + HAVING
SELECT 
    p.name AS product_name,
    SUM(od.quantity) AS total_quantity
FROM 
    order_detail od
JOIN 
    product p ON od.product_id = p.product_id
GROUP BY 
    od.product_id
HAVING 
    total_quantity > 20
ORDER BY 
    total_quantity DESC;

   
-- 建立視圖 View
CREATE OR REPLACE VIEW hot_products_view AS
SELECT 
    p.name AS product_name,
    SUM(od.quantity) AS total_quantity
FROM 
    order_detail od
JOIN 
    product p ON od.product_id = p.product_id
GROUP BY 
    od.product_id
HAVING 
    total_quantity > 20;
   
SELECT * FROM hot_products_view;

DELIMITER $$

-- Stored Procedure
CREATE PROCEDURE sp_monthly_sales_report(IN input_month VARCHAR(7))
BEGIN
  SELECT 
    DATE_FORMAT(o.order_time, '%Y-%m') AS month,
    SUM(od.quantity * od.unit_price) AS total_sales
  FROM `order` o
  JOIN order_detail od ON o.order_id = od.order_id
  WHERE DATE_FORMAT(o.order_time, '%Y-%m') = input_month
  GROUP BY month;
END;

DELIMITER ;

CALL sp_monthly_sales_report('2025-06');

SHOW PROCEDURE STATUS WHERE Db = 'coffeeshopdb';

-- Function
DELIMITER $$

CREATE FUNCTION fn_total_by_order(orderId INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
  DECLARE total DECIMAL(10,2);
  SELECT SUM(quantity * unit_price)
  INTO total
  FROM order_detail
  WHERE order_id = orderId;
  RETURN total;
END;

DELIMITER ;
SELECT fn_total_by_order(10);

-- Trigger（訂單新增時寫入日誌）
-- 建立日誌表
CREATE TABLE order_log (
  log_id INT AUTO_INCREMENT PRIMARY KEY,
  order_id INT,
  log_time DATETIME DEFAULT CURRENT_TIMESTAMP,
  action VARCHAR(20)
);
-- 建立 Trigger
DELIMITER $$

CREATE TRIGGER trg_log_order_insert
AFTER INSERT ON `order`
FOR EACH ROW
BEGIN
  INSERT INTO order_log (order_id, action)
  VALUES (NEW.order_id, 'INSERTED');
END;

DELIMITER ;

-- Trigger（自動更新顧客最近消費時間）
-- 加欄位到 customer 表
ALTER TABLE customer ADD COLUMN last_order_time DATETIME;
DELIMITER $$

CREATE TRIGGER trg_update_last_order
AFTER INSERT ON `order`
FOR EACH ROW
BEGIN
  UPDATE customer
  SET last_order_time = NEW.order_time
  WHERE customer_id = NEW.customer_id;
END;

DELIMITER ;

-- 建立角色
CREATE USER 'clerk_user'@'192.168.215.%' IDENTIFIED BY 'clerkpass';

CREATE USER 'manager_user'@'192.168.215.%' IDENTIFIED BY 'managerpass';

-- 指定權限
-- clerk_user 只能查詢與新增
GRANT SELECT, INSERT ON coffeeshopdb.* TO 'clerk_user'@'192.168.215.%';

-- manager_user 擁有完整權限
GRANT ALL PRIVILEGES ON coffeeshopdb.* TO 'manager_user'@'192.168.215.%';


FLUSH PRIVILEGES;
























