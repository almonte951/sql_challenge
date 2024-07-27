--List the employee number, last name, first name, sex, and salary of each employee.
SELECT 
	e.emp_no, 
	e.last_name, 
	e.first_name, 
	e.sex,
	s.salary
FROM employees AS e INNER JOIN
	salaries AS s ON
	e.emp_no = s.emp_no;
--List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT
	e.first_name,
	e.last_name,
	e.hire_date
FROM employees AS e
WHERE e.hire_date BETWEEN
	'1986-01-01' AND '1986-12-31';
--List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT
	dm.dept_no,
	dp.dept_name,
	dm.emp_no,
	e.last_name,
	e.first_name
FROM dept_manager AS dm INNER JOIN
	departments AS dp ON
	dm.dept_no = dp.dept_no INNER JOIN
	employees AS e ON
	dm.emp_no = e.emp_no;
--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT
	e.emp_no,
	e.last_name,
	e.first_name,
	de.dept_no,
	dp.dept_name
FROM employees AS e INNER JOIN
	dept_emp AS de ON
	e.emp_no = de.emp_no INNER JOIN
	departments AS dp ON
	de.dept_no = dp.dept_no;
--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT
	first_name,
	last_name,
	sex
FROM employees
WHERE first_name = 'Hercules' AND
last_name LIKE 'B%';
--List each employee in the Sales department, including their employee number, last name, and first name.
SELECT
	e.emp_no,
	e.last_name,
	e.first_name,
	dp.dept_name
FROM employees AS e INNER JOIN
	dept_emp AS de ON
	e.emp_no = de.emp_no INNER JOIN
	departments AS dp ON
	de.dept_no = dp.dept_no
WHERE dp.dept_name ='Sales';
--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT
	e.emp_no,
	e.last_name,
	e.first_name,
	dp.dept_name
FROM employees AS e INNER JOIN
	dept_emp AS de ON
	e.emp_no = de.emp_no INNER JOIN
	departments AS dp ON
	de.dept_no = dp.dept_no
WHERE dp.dept_name ='Sales' OR
	dp.dept_name = 'Development';
	
--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name, count(*)
FROM employees
GROUP BY last_name
ORDER BY count DESC;