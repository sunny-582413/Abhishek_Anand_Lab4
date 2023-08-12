SELECT 
    product.PRO_ID,
    product.PRO_NAME
FROM 
    `order`
INNER JOIN 
    supplier_pricing
ON 
    supplier_pricing.PRICING_ID = `order`.PRICING_ID
INNER JOIN 
    product 
ON 
    product.PRO_ID = supplier_pricing.PRO_ID
WHERE 
    `order`.ORD_DATE > '2021-10-05';
