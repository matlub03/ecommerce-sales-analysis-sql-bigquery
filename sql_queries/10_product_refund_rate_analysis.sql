-- ======================================================
-- Business Case 10
-- Product Refund Rate Analysis
-- ======================================================

WITH per_produk AS (
    SELECT
        product_name,
        COUNTIF(status_clean = 'refund') AS jumlah_refund,
        COUNT(*) AS total_pesanan,
        SUM(
            CASE
                WHEN status_clean = 'refund'
                THEN total_sales
                ELSE 0
            END
        ) AS revenue_refund,
        SAFE_DIVIDE(
            COUNTIF(status_clean = 'refund'),
            COUNT(*)
        ) AS refund_rate
    FROM `inspiring-wares-501312-c9.toko_peralatan_dapur.orders_test`
    GROUP BY product_name
)

SELECT
    product_name,
    refund_rate,
    revenue_refund,
    revenue_refund * GREATEST(refund_rate - 0.05, 0) / refund_rate
        AS potensi_revenue_terselamatkan
FROM per_produk
ORDER BY refund_rate DESC
LIMIT 1;
