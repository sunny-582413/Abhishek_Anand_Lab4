SELECT 
    customer.CUS_NAME,
    customer.CUS_GENDER 
FROM 
    customer 
WHERE 
    customer.CUS_NAME LIKE 'A%' 
    OR 
    customer.CUS_NAME LIKE '%A';
