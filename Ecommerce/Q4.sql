SELECT 
    product.PRO_NAME, 
    `order`.* 
FROM 
    `order`
JOIN 
    supplier_pricing
ON 
    `order`.PRICING_ID = supplier_pricing.PRICING_ID
JOIN 
    product 
ON 
    supplier_pricing.PRO_ID = product.PRO_ID
WHERE 
    `order`.CUS_ID = 2;
