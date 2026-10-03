
-- Lab 3
-- Jerry Lin

--Q1

SELECT category_name ,product_name , list_price 
FROM categories_mgs JOIN products_mgs 
    ON categories_mgs.CATEGORY_ID = products_mgs.CATEGORY_ID
ORDER BY category_name , product_name;

--Q2 
SELECT cus.FIRST_NAME, cus.last_name, addr.line1 , addr.city, addr.state, addr.zip_code
FROM CUSTOMERS_MGS cus JOIN ADDRESSES_MGS addr
    USING (CUSTOMER_ID)
WHERE cus.EMAIL_ADDRESS = 'allan.sherwood@yahoo.com';


--Q3

SELECT cus.FIRST_NAME, cus.LAST_NAME, addr.LINE1,addr.CITY,addr.STATE,addr.ZIP_CODE
FROM CUSTOMERS_MGS cus JOIN ADDRESSES_MGS addr 
    ON cus.customer_id = addr.customer_id
WHERE cus.shipping_address_id = addr.address_id;

--Q4 
SELECT cus.last_name , cus.first_name, osg.order_date, pm.product_name, oim.item_price, oim.discount_amount, oim.quantity
FROM Customers_mgs cus JOIN ORDERs_Mgs osg 
    USING (customer_id)
JOIN ORDER_ITEMS_MGS oim 
    USING (order_id)
JOIN products_mgs pm 
    USING (product_id)
ORDER BY cus.LAST_NAME,osg.order_date,pm.product_name;


--Q5
SELECT v2.product_name, v2.list_price
FROM products_mgs v1 JOIN products_mgs v2 
    ON v1.LIST_PRICE = v2.LIST_PRICE
    AND v1.PRODUCT_ID <> v2.PRODUCT_ID
ORDER BY v2.product_name;


--Q6 
SELECT cmg.CATEGORY_NAME, pgs.product_id
FROM categories_mgs cmg LEFT JOIN products_mgs pgs
    USING (category_id)
WHERE pgs.product_id IS NULL;

--Q7
SELECT 'SHIPPED' AS ship_status, order_id, order_date
FROM ORDERs_Mgs
WHERE ship_date IS NOT NULL
UNION

SELECT 'NOT SHIPPED' AS ship_status,order_id,order_date
FROM ORDERs_Mgs
WHERE ship_date IS NULL;