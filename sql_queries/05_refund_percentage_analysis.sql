-- ======================================================
-- Business Case 5
-- Refund Percentage Analysis
-- ======================================================

SELECT
    SUM(CASE
            WHEN status_clean = 'refund'
            THEN total_sales
            ELSE 0
        END) AS total_refund,

    SUM(total_sales) AS gross_sales,

    ROUND(
        SUM(CASE
                WHEN status_clean = 'refund'
                THEN total_sales
                ELSE 0
            END)
        / SUM(total_sales) * 100,
        2
    ) AS persen_refund

FROM `inspiring-wares-501312-c9.toko_peralatan_dapur.orders_test`;
