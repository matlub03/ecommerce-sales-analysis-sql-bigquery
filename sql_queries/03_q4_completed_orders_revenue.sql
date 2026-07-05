-- ======================================================
-- Business Case 3
-- Completed Orders and Revenue in Q4 2025
-- ======================================================

SELECT
    COUNT(DISTINCT order_id) AS jumlah_pesanan,
    SUM(total_sales) AS total_revenue
FROM `inspiring-wares-501312-c9.toko_peralatan_dapur.orders_test`
WHERE status = 'completed'
  AND sales_date BETWEEN '2025-10-01' AND '2025-12-31';
