SELECT 
    supplier.* 
FROM 
    supplier 
WHERE 
    supplier.SUPP_ID IN (
        SELECT 
            SUPP_ID 
        FROM 
            supplier_pricing 
        GROUP BY 
            SUPP_ID 
        HAVING 
            COUNT(SUPP_ID) > 1
    );
