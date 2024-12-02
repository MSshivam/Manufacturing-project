--1. Manufacturing Qty
SELECT SUM(manufactured_qty::integer) AS total_manufactured_qty
FROM prod_data_new;

--2. Rejected Qty
SELECT SUM(rejected_qty::integer) AS total_rejected_qty
FROM prod_data_new;

--3 Processed Qty
SELECT SUM(produced_qty::integer) AS total_processed_qty
FROM prod_data_new;

-- 4. Wastage Qty %
SELECT (SUM(rejected_qty::integer) / SUM(produced_qty::integer)) * 100 AS wastage_qty_percentage
FROM prod_data_new;

-- 5. Employee Wise Rejected Qty
SELECT emp_name, SUM(rejected_qty::integer) AS employee_rejected_qty
FROM prod_data_new
GROUP BY emp_name
ORDER BY employee_rejected_qty DESC;

-- 6. Machine Wise Rejected Qty
SELECT machine_name, SUM(rejected_qty::integer) AS machine_rejected_qty
FROM prod_data_new
GROUP BY machine_name
order by machine_rejected_qty desc;

-- 7. Production Comparison Trend
SELECT doc_date, SUM(manufactured_qty::integer) AS total_production
FROM prod_data_new
GROUP BY doc_date
ORDER BY doc_date;

-- 8. Manufacture Vs Rejected
SELECT doc_date, SUM(manufactured_qty::integer) AS total_manufactured_qty, SUM(rejected_qty::integer) AS total_rejected_qty
FROM prod_data_new
GROUP BY doc_date
ORDER BY doc_date;

-- 9. Department Wise Manufacture Vs Rejected
SELECT department_name, SUM(manufactured_qty::integer) AS total_manufactured_qty, SUM(rejected_qty::integer) AS total_rejected_qty
FROM prod_data_new
GROUP BY department_name;

-- 10. Emp Wise Rejected Qty
SELECT emp_name, SUM(rejected_qty::integer) AS total_rejected_qty
FROM prod_data_new
GROUP BY emp_name
Order BY total_rejected_qty desc;

