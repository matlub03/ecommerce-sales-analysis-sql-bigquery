-- ======================================================
-- Business Case 8
-- Pareto 80% Revenue Analysis
-- ======================================================

WITH revenue_per_produk AS (
    SELECT
        product_name,
        SUM(total_sales) AS revenue
    FROM `inspiring-wares-501312-c9.toko_peralatan_dapur.orders_test`
    WHERE status_clean = 'complete'
    GROUP BY product_name
),

cum AS (
    SELECT
        product_name,
        revenue,
        SUM(revenue) OVER (
            ORDER BY revenue DESC
        ) AS cum_revenue,
        SUM(revenue) OVER () AS total_revenue,
        ROW_NUMBER() OVER (
            ORDER BY revenue DESC
        ) AS rank_produk
    FROM revenue_per_produk
)

SELECT
    MIN(rank_produk) AS jumlah_produk_80_persen
FROM cum
WHERE cum_revenue >= 0.8 * total_revenue;
