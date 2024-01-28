INSERT INTO Categories (category_id,Category_Name)
VALUES 
(1,'Men'),
(2,'Women'),
(3,'Shirts'),
(4,'Pants'),
(5,'Dresses'),
(6, 'Skirts');

INSERT INTO Products (product_id,Product_Name, Category_ID, Price)
VALUES 
(1,'Men''s Casual Shirt', 3, 29.99),
(2,'Men''s Dress Pants', 4, 49.99),
(3,'Women''s Summer Dress', 5, 39.99),
(4,'Women''s A-Line Skirt', 6, 34.99);

INSERT INTO Customers (customer_id,customer_name, email, address)
VALUES 
(1,'John Doe', 'john@example.com', '123 Main St'),
(2,'Jane Smith', 'jane@example.com','456 Elm St'),
(3,'Alice Johnson', 'alice@example.com',  '789 Oak St, Village'),
(4,'Bob Williams', 'bob@example.com',  '456 Maple St, Town'),
(5,'Charlie Brown', 'charlie@example.com',  '321 Pine St, City'),
(6,'David Lee', 'david@example.com',  '987 Birch St, Village'),
(7,'Eve Taylor', 'eve@example.com',  '654 Cedar St, Town');

INSERT INTO Orders (order_id,customer_id, order_date, Total_Amount)
VALUES 
(1,1, '2024/01/26', null),
(2,2, '2024/01/27', null),
(3,3, '2024/01/28', null),
(4,4, '2024/01/29', null),
(5,5, '2024/01/30', null),
(6,1, '2024/01/31', null),
(7,2, '2024/02/01', null);
DELETE FROM orders;

INSERT INTO OrderDetails (order_detail_id,Order_ID, Product_ID, Quantity, unit_Price,status)
VALUES 
(1,1, 1, 2, 29.99,1),
(2,1, 4, 1, 49.99,1),
(3,2, 3, 1, 39.99,1),
(4,2, 4, 1, 34.99,1);

-- Order 3 Details
INSERT INTO OrderDetails (order_detail_id,Order_ID, Product_ID, Quantity, unit_Price,status)
VALUES 
(5,3, 1, 3, 29.99,1),
(6,3, 4, 2, 49.99,1);

-- Order 4 Details
INSERT INTO OrderDetails (order_detail_id,Order_ID, Product_ID, Quantity, unit_Price,status)
VALUES 
(7,4, 2, 1, 39.99,1),
(8,4, 3, 1, 39.99,1),
(9,4, 4, 2, 34.99,1);

-- Order 5 Details
INSERT INTO OrderDetails (order_detail_id,Order_ID, Product_ID, Quantity, unit_Price,status)
VALUES 
(10,5, 1, 2, 29.99,1),
(11,5, 2, 1, 49.99,1),
(12,5, 3, 3, 39.99,1),
(13,5, 4, 2, 34.99,1);

-- Order 6 Details
INSERT INTO OrderDetails (order_detail_id,Order_ID, Product_ID, Quantity, unit_Price,status)
VALUES 
(14,6, 1, 1, 29.99,1),
(15,6, 4, 2, 49.99,1),
(16,6, 3, 1, 39.99,1),
(17,6, 2, 3, 49.99,1);

-- Order 7 Details
INSERT INTO OrderDetails (order_detail_id,Order_ID, Product_ID, Quantity, unit_Price,status)
VALUES 
(18,7, 2, 2, 49.99,1),
(19,7, 3, 1, 39.99,1),
(20,7, 4, 1, 34.99,1),
(21,7, 1, 1, 29.99,1);