
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

