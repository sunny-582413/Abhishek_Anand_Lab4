SELECT 
    COUNT(t2.CUS_GENDER) AS NoOfCustomers, 
    t2.CUS_GENDER 
FROM (
    SELECT 
        t1.CUS_ID, 
        t1.CUS_GENDER, 
        t1.CUS_NAME 
    FROM (
        SELECT 
            o.*, 
            c.CUS_GENDER, 
            c.CUS_NAME 
        FROM 
            `order` o 
        INNER JOIN 
            customer c 
        ON 
            o.CUS_ID = c.CUS_ID 
        WHERE 
            o.ORD_AMOUNT >= 3000
    ) AS t1 
    GROUP BY 
        t1.CUS_ID, 
        t1.CUS_GENDER, 
        t1.CUS_NAME
) AS t2 
GROUP BY 
    t2.CUS_GENDER;
