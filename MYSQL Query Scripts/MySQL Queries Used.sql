SELECT * 
FROM dk_stats.purchase_sales_statdk
WHERE year >= 2002;

SELECT 
  year,
  sales_total,
  domestic_sales,
  ROUND(domestic_sales / sales_total * 100, 2) AS domestic_share_percent
FROM dk_stats.purchase_sales_statdk;
WHERE year >= 2002;


SELECT 
  year,
  sales_total,
  purchases_total,
  ROUND(purchases_total / sales_total * 100, 2) AS purchase_to_sales_percent
FROM dk_stats.purchase_sales_statdk;
WHERE year >= 2002;





SELECT 
  year,
  sales_total,
  purchases_total,
  ROUND((sales_total - LAG(sales_total) OVER (ORDER BY year)) / LAG(sales_total) OVER (ORDER BY year) * 100, 2) AS sales_growth_percent,
  ROUND((purchases_total - LAG(purchases_total) OVER (ORDER BY year)) / LAG(purchases_total) OVER (ORDER BY year) * 100, 2) AS purchases_growth_percent
FROM dk_stats.purchase_sales_statdk;
WHERE year >= 2002;



SELECT 
  year,
  enterprises_count,
  LAG(enterprises_count) OVER (ORDER BY year) AS previous_year_count,
  enterprises_count - LAG(enterprises_count) OVER (ORDER BY year) AS growth_absolute,
  ROUND((enterprises_count - LAG(enterprises_count) OVER (ORDER BY year)) / LAG(enterprises_count) OVER (ORDER BY year) * 100, 2) AS enterprise_growth_percent
FROM dk_stats.purchase_sales_statdk;
WHERE year >= 2002;


