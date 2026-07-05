-- ======================================================
-- Business Case 2
-- Top 5 Products by Units Sold
-- ======================================================

SELECT
    product_name,
    SUM(quantity) AS total_unit
FROM `inspiring-wares-501312-c9.toko_peralatan_dapur.orders_test`
WHERE status = 'completed'
GROUP BY product_name
ORDER BY total_unit DESC
LIMIT 5;
