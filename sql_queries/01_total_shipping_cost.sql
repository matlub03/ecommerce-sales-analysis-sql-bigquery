-- ======================================================
-- Business Case 1
-- Calculate Total and Average Shipping Cost
-- ======================================================

SELECT
    SUM(shipping_fee) AS total_shipping_cost,
    AVG(shipping_fee) AS average_shipping_cost
FROM `inspiring-wares-501312-c9.toko_peralatan_dapur.orders_test`
WHERE status = 'completed';
