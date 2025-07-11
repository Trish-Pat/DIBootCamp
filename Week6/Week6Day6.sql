CREATE TABLE df_employee AS
SELECT 
  s.employee_id || '_' || s.date AS id,  
  
  CASE
    WHEN s.date LIKE '____-__-__%' THEN DATE(SUBSTR(s.date, 1, 10))
    WHEN s.date LIKE '__/__/____%' THEN DATE(
        SUBSTR(s.date, 7, 4) || '-' || 
        SUBSTR(s.date, 4, 2) || '-' || 
        SUBSTR(s.date, 1, 2)
    )
    ELSE NULL
  END AS month_year,
  
  e.employee_code_emp AS employee_id,
  e.employee_name_emp AS employee_name,
  e."GEN(M_F)" AS gender,
  e.age,
  CAST(REPLACE(s.salary, ',', '') AS REAL) AS salary,  
  f.function_group,
  c.company_name,
  c.company_city,
  c.company_state,
  c.company_type,
  c.const_site_category
FROM salaries s
LEFT JOIN employees e 
  ON s.employee_id = e.employee_code_emp 
  AND s.comp_code = e.comp_code_emp
LEFT JOIN functions f 
  ON s.func_code = f.function_code
LEFT JOIN companies c 
  ON TRIM(s.comp_name) = TRIM(c.company_name);


SELECT * FROM df_employee;


UPDATE df_employee
SET
  id = TRIM(id),
  employee_name = TRIM(employee_name),
  gender = TRIM(gender),
  function_group = TRIM(function_group),
  company_name = TRIM(company_name),
  company_city = TRIM(company_city),
  company_state = TRIM(company_state),
  company_type = TRIM(company_type),
  const_site_category = TRIM(const_site_category);


SELECT COUNT(*) FROM df_employee WHERE 
  month_year IS NULL OR
  employee_id IS NULL OR 
  salary IS NULL OR 
  function_group IS NULL OR function_group = '';


DELETE FROM df_employee
WHERE 
  month_year IS NULL OR  
  employee_id IS NULL OR
  salary IS NULL;


WITH latest_month AS (
  SELECT MAX(month_year) AS max_date FROM df_employee
)
SELECT 
  company_name,
  COUNT(DISTINCT employee_id) AS current_employees
FROM df_employee
WHERE month_year = (SELECT max_date FROM latest_month)
GROUP BY company_name;


WITH city_counts AS (
  SELECT
    company_city,
    COUNT(DISTINCT employee_id) AS total_employees
  FROM df_employee
  WHERE month_year = (SELECT MAX(month_year) FROM df_employee)
  GROUP BY company_city
)
SELECT 
  company_city,
  total_employees,
  ROUND(total_employees * 100.0 / SUM(total_employees) OVER(), 1) AS pct
FROM city_counts;


SELECT
  month_year,
  COUNT(DISTINCT employee_id) AS total_employees
FROM df_employee
GROUP BY month_year
ORDER BY month_year;


SELECT 
  ROUND(AVG(total_employees), 0) AS avg_monthly_employees
FROM (
  SELECT 
    month_year,
    COUNT(DISTINCT employee_id) AS total_employees
  FROM df_employee
  GROUP BY month_year
);


WITH monthly_counts AS (
  SELECT
    month_year,
    COUNT(DISTINCT employee_id) AS total_employees
  FROM df_employee
  GROUP BY month_year
)
SELECT * FROM (
  SELECT 
    total_employees,
    month_year,
    'Maximum' AS record_type
  FROM monthly_counts
  ORDER BY total_employees DESC
  LIMIT 1
)
UNION ALL
SELECT * FROM (
  SELECT 
    total_employees,
    month_year,
    'Minimum'
  FROM monthly_counts
  ORDER BY total_employees ASC
  LIMIT 1
);


SELECT
  function_group,
  ROUND(AVG(employee_count), 0) AS avg_monthly_employees
FROM (
  SELECT
    month_year,
    function_group,
    COUNT(DISTINCT employee_id) AS employee_count
  FROM df_employee
  GROUP BY month_year, function_group
) 
GROUP BY function_group;


SELECT
  STRFTIME('%Y', month_year) AS year,
  ROUND(AVG(salary), 2) AS avg_annual_salary
FROM df_employee
GROUP BY year;