-- ======================================================
-- Business Case 9
-- Customer Purchase Interval Analysis
-- ======================================================

WITH pelanggan_valid AS (
    SELECT
        customer_name_clean
    FROM `inspiring-wares-501312-c9.toko_peralatan_dapur.orders_test`
    WHERE status_clean = 'complete'
    GROUP BY customer_name_clean
    HAVING COUNT(DISTINCT order_id) > 5
),

tanggal_urut AS (
    SELECT
        t.customer_name_clean,
        t.sales_date,
        LAG(t.sales_date) OVER (
            PARTITION BY t.customer_name_clean
            ORDER BY t.sales_date
        ) AS tanggal_sebelumnya
    FROM `inspiring-wares-501312-c9.toko_peralatan_dapur.orders_test` AS t
    JOIN pelanggan_valid AS p
        ON t.customer_name_clean = p.customer_name_clean
    WHERE t.status_clean = 'complete'
),

jeda AS (
    SELECT
        customer_name_clean,
        AVG(DATE_DIFF(sales_date, tanggal_sebelumnya, DAY)) AS avg_jeda_hari
    FROM tanggal_urut
    WHERE tanggal_sebelumnya IS NOT NULL
    GROUP BY customer_name_clean
)

SELECT
    (SELECT AVG(avg_jeda_hari)
     FROM jeda) AS rata_rata_jeda_keseluruhan,

    (SELECT customer_name_clean
     FROM jeda
     ORDER BY avg_jeda_hari ASC
     LIMIT 1) AS pelanggan_jeda_tersingkat,

    (SELECT MIN(avg_jeda_hari)
     FROM jeda) AS jeda_tersingkat_hari;
