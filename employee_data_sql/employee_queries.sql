-- 1.List of employees with their employee number, their last name, first name, sex and the salary
SELECT
	e.emp_no, 
	e.last_name,
	e.first_name,
	e.sex, 
	s.salary 
FROM employees AS e
JOIN salaries AS s ON e.emp_no = s.emp_no;

-- 2.List of employees with their first name, last name and the hire date who were hired in 1986
SELECT
	first_name,
	last_name,
	hire_date 
FROM employees 
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

-- 3. List of manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT 
    d.dept_no,
    d.dept_name,
    e.emp_no,
    e.last_name,
    e.first_name
FROM dept_manager AS dm
JOIN departments d ON dm.dept_no = d.dept_no
JOIN employees e ON dm.emp_no = e.emp_no;

-- 4. List of the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT
	d.dept_no,
	e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
FROM employees AS e
JOIN dept_emp AS de ON e.emp_no = de.emp_no
JOIN departments AS d ON de.dept_no = d.dept_no;

-- 5. List of first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT 
	first_name,
	last_name,
	sex
FROM employees 
WHERE first_name = 'Hercules' AND LEFT (last_name,1) = 'B';

-- 6. List of each employee in the Sales department, including their employee number, last name, and first name.
SELECT 
	d.dept_name,
	de.emp_no,
	e.last_name,
	e.first_name
FROM dept_emp AS de
JOIN departments AS d ON de.dept_no = d.dept_no
JOIN employees AS e ON de.emp_no = e.emp_no
WHERE d.dept_name = 'Sales';

-- 7. List of each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT 
	de.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
FROM dept_emp AS de
JOIN departments AS d ON de.dept_no = d.dept_no
JOIN employees AS e ON de.emp_no = e.emp_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development';

-- 8. List of last name and their respective frequency in descending.
SELECT 
    last_name, 
    COUNT(*) AS name_count
FROM employees
GROUP BY last_name
ORDER BY name_count DESC;
