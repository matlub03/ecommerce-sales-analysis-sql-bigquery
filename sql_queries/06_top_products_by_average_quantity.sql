-- ======================================================
-- Business Case 6
-- Top 5 Products by Average Quantity per Order
-- ======================================================

SELECT
    product_name,
    COUNT(DISTINCT order_id) AS jumlah_pesanan,
    AVG(quantity) AS avg_qty_per_pesanan
FROM `inspiring-wares-501312-c9.toko_peralatan_dapur.orders_test`
WHERE status_clean = 'complete'
GROUP BY product_name
HAVING COUNT(DISTINCT order_id) >= 50
ORDER BY avg_qty_per_pesanan DESC
LIMIT 5;
