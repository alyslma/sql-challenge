-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT e.emp_no,
	e.last_name,
	e.first_name,
	e.sex,
	s.salary
FROM employees AS e
LEFT JOIN salaries AS s ON 
e.emp_no = s.emp_no
ORDER BY e.emp_no;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name,
	last_name,
	hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986
ORDER BY hire_date;

-- 3. List the manager of each department with department number, department name, the manager's employee number, last name, first name.
SELECT dm.dept_no,
	d.dept_name,
	dm.emp_no,
	e.last_name,
	e.first_name
FROM dept_manager AS dm
LEFT JOIN departments AS d
	ON dm.dept_no = d.dept_no
LEFT JOIN employees AS e
	ON dm.emp_no = e.emp_no;

-- 4. List the department of each employee with employee number, last name, first name, and department name.
SELECT e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
FROM employees AS e
LEFT JOIN dept_emp
	ON e.emp_no = dept_emp.emp_no
LEFT JOIN departments AS d
	ON dept_emp.dept_no = d.dept_no
ORDER BY e.emp_no;
	
-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name,
	last_name,
	sex
FROM employees
WHERE first_name = 'Hercules' AND LEFT(last_name, 1) = 'B';

-- 6. List all employees in the Sales department with employee number, last name, first name, and department name.
SELECT e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
FROM employees AS e
INNER JOIN dept_emp
	ON e.emp_no = dept_emp.emp_no
INNER JOIN departments AS d
	ON dept_emp.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales')
ORDER BY e.emp_no;

-- 7. List all employees in the Sales and Development departments with employee number, last name, first name, and department name.
SELECT e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
FROM employees AS e
LEFT JOIN dept_emp
	ON e.emp_no = dept_emp.emp_no
LEFT JOIN departments AS d
	ON dept_emp.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales', 'Development')
ORDER BY e.emp_no;

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) AS last_name_count
FROM employees
GROUP BY last_name
ORDER BY last_name_count DESC;