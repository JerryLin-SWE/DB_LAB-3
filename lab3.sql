
-- Lab 3
-- Jerry Lin

--Q1

SELECT category_name ,product_name , list_price 
FROM categories_mgs JOIN products_mgs 
    ON categories_mgs.CATEGORY_ID = products_mgs.CATEGORY_ID
ORDER BY category_name , product_name;

--Q2 
SELECT *
FROM CUSTOMERS_MGS;

SELECT c.first_name,c.last_name,a.line1, a.city,a.state, a.zip_code
FROM Customers_mgs c
JOIN Addresses_mgs a
    ON c.customer_id = a.customer_id
WHERE c.email_address = 'allan.sherwood@yahoo.com';


--Q3. 

SELECT c.first_name,c.last_name,a.line1,a.city,a.state,a.zip_code
FROM Customers_mgs c
JOIN Addresses_mgs a
    ON c.shipping_address_id = a.address_id;


--Q4. 

SELECT c.last_name, c.first_name, o.order_date, p.product_name, oi.item_price, oi.discount_amount, oi.quantity
FROM Customers_mgs c JOIN Orders_mgs o
    ON c.customer_id = o.customer_id
JOIN Order_Items_mgs oi
    ON o.order_id = oi.order_id
JOIN Products_mgs p
    ON oi.product_id = p.product_id
ORDER BY c.last_name, o.order_date, p.product_name;

--Q5. 

SELECT p1.product_name, p1.list_price
FROM Products_mgs p1 JOIN Products_mgs p2
    ON p1.list_price = p2.list_price
    AND p1.product_id <> p2.product_id
ORDER BY p1.product_name;

--Q6. 

SELECT c.category_name, p.product_id
FROM Categories_mgs c LEFT OUTER JOIN Products_mgs p
    ON c.category_id = p.category_id
WHERE p.product_id IS NULL;

--Q7.alter
SELECT 'SHIPPED' AS ship_status, order_id, order_date
FROM Orders_mgs
WHERE ship_date IS NOT NULL

UNION

SELECT 'NOT SHIPPED' AS ship_status, order_id, order_date
FROM Orders_mgs
WHERE ship_date IS NULL

ORDER BY order_date;