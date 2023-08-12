DELIMITER ;;
CREATE PROCEDURE proc()
BEGIN
    SELECT
        report.SUPP_ID,
        report.SUPP_NAME,
        report.Average,
        CASE
            WHEN report.Average = 5 THEN 'Excellent Service'
            WHEN report.Average > 4 THEN 'Good Service'
            WHEN report.Average > 2 THEN 'Average Service'
            ELSE 'Poor Service'
        END AS Type_of_Service
    FROM (
        SELECT
            final.SUPP_ID,
            supplier.SUPP_NAME,
            final.Average
        FROM (
            SELECT
                test2.SUPP_ID,
                SUM(test2.RAT_RATSTARS) / COUNT(test2.RAT_RATSTARS) AS Average
            FROM (
                SELECT
                    supplier_pricing.SUPP_ID,
                    test.ORD_ID,
                    test.RAT_RATSTARS
                FROM
                    supplier_pricing
                INNER JOIN (
                    SELECT
                        `order`.PRICING_ID,
                        rating.ORD_ID,
                        rating.RAT_RATSTARS
                    FROM
                        `order`
                    INNER JOIN
                        rating
                    ON rating.`ORD_ID` = `order`.ORD_ID
                ) AS test
                ON test.PRICING_ID = supplier_pricing.PRICING_ID
            ) AS test2
            GROUP BY
                supplier_pricing.SUPP_ID
        ) AS final
        INNER JOIN
            supplier
        WHERE final.SUPP_ID = supplier.SUPP_ID
    ) AS report;
END ;;
DELIMITER ;

call proc();
