-- ======================================================
-- Business Case 4
-- Compare Average Shipping Cost by City
-- ======================================================

WITH per_kota AS (
    SELECT
        city_clean,
        AVG(shipping_fee) AS avg_ongkir
    FROM `inspiring-wares-501312-c9.toko_peralatan_dapur.orders_test`
    WHERE city_clean IS NOT NULL
      AND shipping_fee IS NOT NULL
    GROUP BY city_clean
)

SELECT
    (SELECT city_clean
     FROM per_kota
     ORDER BY avg_ongkir DESC
     LIMIT 1) AS kota_termahal,

    (SELECT MAX(avg_ongkir)
     FROM per_kota) AS ongkir_termahal,

    (SELECT city_clean
     FROM per_kota
     ORDER BY avg_ongkir ASC
     LIMIT 1) AS kota_termurah,

    (SELECT MIN(avg_ongkir)
     FROM per_kota) AS ongkir_termurah,

    (SELECT MAX(avg_ongkir) - MIN(avg_ongkir)
     FROM per_kota) AS selisih;
