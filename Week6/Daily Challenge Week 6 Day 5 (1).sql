UPDATE employees
SET department = 'Unknown'
WHERE department IS NULL;

WITH duplicates AS (
  SELECT 
    employee_id,
    ROW_NUMBER() OVER (
      PARTITION BY employee_name, salary, hire_date, department 
      ORDER BY employee_id
    ) AS rn
  FROM employees
)
DELETE FROM employees
WHERE employee_id IN (
  SELECT employee_id 
  FROM duplicates 
  WHERE rn > 1
);


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
ALTER TABLE employees ADD COLUMN first_name TEXT;
ALTER TABLE employees ADD COLUMN last_name TEXT;

UPDATE employees
SET 
  first_name = TRIM(SUBSTR(employee_name, 1, INSTR(employee_name || ' ', ' ') - 1),
  last_name = TRIM(SUBSTR(employee_name, INSTR(employee_name, ' ') + 1));

UPDATE employees
SET employee_name = 
  UPPER(SUBSTR(first_name, 1, 1)) || LOWER(SUBSTR(first_name, 2)) || ' ' ||
  UPPER(SUBSTR(last_name, 1, 1)) || LOWER(SUBSTR(last_name, 2));

UPDATE employees DROP COLUMN first_name;
UPDATE employees DROP COLUMN last_name;                    
                    

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////                    
ALTER TABLE employees ADD COLUMN new_hire_date DATE;
UPDATE employees SET new_hire_date = DATE(hire_date);
ALTER TABLE employees DROP COLUMN hire_date;
ALTER TABLE employees RENAME COLUMN new_hire_date TO hire_date;                   


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////                    
CREATE TEMP TABLE salary_stats AS
WITH ordered AS (
  SELECT salary, ROW_NUMBER() OVER (ORDER BY salary) AS rn
  FROM employees
), 
counts AS (
  SELECT COUNT(*) AS n FROM employees
)
SELECT 
  MIN(CASE WHEN rn = CEIL((SELECT n FROM counts) * 0.25) THEN salary END) AS q1,
  MIN(CASE WHEN rn = CEIL((SELECT n FROM counts) * 0.75) THEN salary END) AS q3
FROM ordered;
                    
CREATE TEMP TABLE salary_bounds AS
SELECT 
  q1 - 1.5*(q3 - q1) AS lower_bound,
  q3 + 1.5*(q3 - q1) AS upper_bound
FROM salary_stats;

UPDATE employees
SET salary = (
  SELECT 
    CASE 
      WHEN salary < lower_bound THEN lower_bound
      WHEN salary > upper_bound THEN upper_bound
      ELSE salary
    END
  FROM salary_bounds
)
WHERE employee_id IN (
  SELECT employee_id
  FROM employees, salary_bounds
  WHERE salary < lower_bound OR salary > upper_bound
);                    


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////                    
UPDATE employees
SET department = 
  CASE UPPER(TRIM(department))
    WHEN 'HR' THEN 'HR'
    WHEN 'IT' THEN 'IT'
    WHEN 'SALES' THEN 'Sales'
    WHEN 'MARKETING' THEN 'Marketing'
    WHEN 'FINANCE' THEN 'Finance'
    WHEN 'UNKNOWN' THEN 'Unknown'
    ELSE UPPER(SUBSTR(department, 1, 1)) || LOWER(SUBSTR(department, 2))
  END;

CREATE VIEW cleaned_employees AS
SELECT 
  employee_id,
  employee_name,
  salary,
  hire_date,
  department
FROM employees;

SELECT * FROM cleaned_employees ORDER BY employee_id;                    
                    