-- ======================================================
-- Business Case 7
-- Best Sales Month by Product Category
-- ======================================================

WITH per_bulan AS (
    SELECT
        category_clean,
        FORMAT_DATE('%Y-%m', sales_date) AS bulan,
        SUM(total_sales) AS revenue
    FROM `inspiring-wares-501312-c9.toko_peralatan_dapur.orders_test`
    WHERE status_clean = 'complete'
    GROUP BY category_clean, bulan
),

ranked AS (
    SELECT
        *,
        ROW_NUMBER() OVER (
            PARTITION BY category_clean
            ORDER BY revenue DESC
        ) AS rn
    FROM per_bulan
)

SELECT
    category_clean,
    bulan,
    revenue
FROM ranked
WHERE rn = 1;
