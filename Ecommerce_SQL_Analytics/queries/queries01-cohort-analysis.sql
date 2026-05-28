WITH first_purchase AS (
  SELECT 
    customer_id,
    DATE_TRUNC(order_purchase_timestamp, MONTH) as cohort_month,
    ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_purchase_timestamp) as purchase_rank
  FROM `ecommerce-analytics-497615.ecommerce.Orders`
  WHERE order_status = 'delivered'
),

all_purchases AS (
  SELECT 
    fp.cohort_month,
    fp.customer_id,
    DATE_TRUNC(o.order_purchase_timestamp, MONTH) as order_month
  FROM first_purchase fp
  INNER JOIN `ecommerce-analytics-497615.ecommerce.Orders` o USING (customer_id)
  WHERE fp.purchase_rank = 1 AND o.order_status = 'delivered'
),

cohort_size AS (
  SELECT 
    cohort_month,
    COUNT(DISTINCT customer_id) as cohort_size
  FROM first_purchase
  WHERE purchase_rank = 1
  GROUP BY cohort_month
),

cohort_retention AS (
  SELECT 
    ap.cohort_month,
    ap.order_month,
    COUNT(DISTINCT ap.customer_id) as returning_customers,
    DATE_DIFF(DATE(ap.order_month), DATE(ap.cohort_month), MONTH) as months_since_first
  FROM all_purchases ap
  GROUP BY ap.cohort_month, ap.order_month
)

SELECT 
  cr.cohort_month,
  cr.months_since_first,
  cr.returning_customers,
  cs.cohort_size,
  ROUND(100.0 * cr.returning_customers / cs.cohort_size, 2) as retention_rate
FROM cohort_retention cr
INNER JOIN cohort_size cs USING (cohort_month)
WHERE cr.cohort_month >= '2016-10-01'
ORDER BY cr.cohort_month DESC, cr.months_since_first ASC;