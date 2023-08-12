SELECT 
    category.CAT_ID,
    category.CAT_NAME,
    MIN(t3.min_price) AS min_price
FROM 
    category
INNER JOIN (
    SELECT 
        product.CAT_ID,
        product.PRO_NAME,
        t2.min_price
    FROM 
        product
    INNER JOIN (
        SELECT 
            PRO_ID,
            MIN(SUPP_PRICE) AS min_price
        FROM 
            supplier_pricing
        GROUP BY 
            PRO_ID
    ) AS t2 ON t2.PRO_ID = product.PRO_ID
) AS t3 ON t3.CAT_ID = category.CAT_ID
GROUP BY 
    category.CAT_ID, category.CAT_NAME;
