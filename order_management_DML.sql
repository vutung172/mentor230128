-- 問1
-- ・「Customers」マスター及び「Orders」マスターから、客さんの「住所」及び「名前」を取得する
SELECT cus.customer_id ,cus.address, cus.customer_name, o.order_date
	FROM customers cus
    INNER JOIN orders o ON o.customer_id = cus.customer_id -- chỉ hiện thị bảng được chọn và hiển thị theo tiêu chí có điều kiện nói là đúng
;

-- ・「Products」マスター及び「OrderDetails」マスターから、売れられない商品一覧を取得する
-- cách 1 -- dùng having 
SELECT p.*, count(od.product_id) as total_product_sold
	FROM products p
	LEFT JOIN orderdetails od ON od.product_id = p.product_id
    GROUP BY p.product_id
    HAVING total_product_sold = 0
;
-- cách 2 -- dùng where
SELECT p.*
	FROM products p
	LEFT JOIN orderdetails od ON od.product_id = p.product_id
    WHERE od.product_id is null 
    GROUP BY p.product_id
;

-- 問２
--  ・「Orders」マスターで支払い済みの客さんの合計金額を計算する
SELECT o.order_id,o.customer_id, DATE_FORMAT(o.order_date, '%Y/%m/%d') AS formatted_date, CONCAT(sum(od.quantity*od.unit_price),' yen') as 合計 
	FROM orders o
	INNER JOIN orderdetails od ON od.order_id = o.order_id
    GROUP BY o.order_id
;

-- 
SELECT c.customer_id, c.customer_name, CONCAT(sum(od.quantity*od.unit_price),' yen') as 合計
	FROM customers c
    INNER JOIN orders o ON o.customer_id = c.customer_id
    INNER JOIN orderdetails od ON od.order_id = o.order_id
    GROUP BY c.customer_id, c.customer_name
;

-- ・「OrderDetails」マスターから、売った商品の量を数える
SELECT p.*, sum(od.quantity) as 売った商品_量
	FROM products p
	LEFT JOIN orderdetails od ON od.product_id = p.product_id
    GROUP BY p.product_id
    ORDER BY 売った商品_量 DESC
;

-- 
SELECT count(*) as 売った商品_量
	FROM orderdetails od
;

-- 問３
-- ・商品を買った客さんの中に、一番買ったのが多い客さんの「名前」を検索する
SELECT cus.customer_name
	FROM customers cus
    LEFT JOIN orders o ON o.customer_id = cus.customer_id
    LEFT JOIN orderdetails od ON od.order_id = o.order_id
    GROUP BY  cus.customer_id 
    ORDER BY sum(od.quantity) DESC
    LIMIT 1
;


-- 問４
-- ・「Categories」ごとに、一番流行っている商品を検索する
SELECT tbl_temp.category_name, tbl_temp.product_name, max(total)
FROM
(SELECT p.product_name, c.category_name, sum(od.quantity) as total
	FROM categories c
    INNER JOIN products p ON p.category_id = c.category_id
    INNER JOIN orderdetails od ON od.product_id = p.product_id
    GROUP BY  p.product_id, c.category_name) as tbl_temp
    GROUP BY tbl_temp.category_name,tbl_temp.product_name
;


-- 問５
-- ・「Products」マスターの「product_name」項目に、クエリ速度を改善するため、「INDEX」を作成する 


-- 問６
-- ・新規の客さん情報を作成する（どんなレコードでもいい）
INSERT INTO Customers (customer_id,customer_name, email, address)
VALUES 
(8,'Tung VU', 'tung@example.com', '123 JAapan');

-- ・商品値を編集する（どんなレコードでもいい）
INSERT INTO Products (product_id,Product_Name, Category_ID, Price)
VALUES 
(6,'Men''s Sneaker', 4, 19.99);