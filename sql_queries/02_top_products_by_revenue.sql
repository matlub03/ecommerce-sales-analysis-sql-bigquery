-- ======================================================
-- Business Case 2
-- Top 5 Products by Revenue
-- ======================================================

SELECT
    product_name,
    SUM(total_sales) AS total_revenue
FROM `inspiring-wares-501312-c9.toko_peralatan_dapur.orders_test`
WHERE status = 'completed'
GROUP BY product_name
ORDER BY total_revenue DESC
LIMIT 5;
