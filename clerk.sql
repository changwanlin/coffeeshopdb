SELECT * FROM product;

INSERT INTO product (name, price, category_id) 
VALUES ('測試用飲品', 88, 1);

DELETE FROM product WHERE name = '測試用飲品';

UPDATE product SET price = 999 WHERE name = '測試用飲品';
