-- Queries [pre-final]

-- To list the employee number, last name, first name, sex, and salary of each employee:
SELECT e.emp_no AS "Employee Number",
e.last_name AS "Last Name",
e.first_name AS "First Name",
e.sex AS "Sex",
s.salary AS "Salary"
FROM employees e
LEFT JOIN salaries s ON e.emp_no = s.emp_no;

-- To list the first name, last name, and hire date for the employees who were hired in 1986:
SELECT first_name AS "First Name",
last_name AS "Last Name",
hire_date AS "Hire Date"
FROM employees
WHERE hire_date LIKE '%1986';

-- To list the manager of each department along with their department number, department name,
-- employee number, last name, and first name:
SELECT dm.dept_no AS "Department Number",
d.dept_name AS "Department Name",
dm.emp_no AS "Employee Number",
e.last_name AS "Last Name",
e.first_name AS "First Name"
FROM dept_manager dm
LEFT JOIN departments d ON dm.dept_no = d.dept_no
LEFT JOIN employees e ON dm.emp_no = e.emp_no
ORDER BY dm.emp_no;

-- To list the department number for each employee along with that employee’s employee number,
-- last name, first name, and department name:
SELECT d.dept_no AS "Department No.",
e.emp_no  AS "Employee No.",
e.last_name  AS "Last Name",
e.first_name  AS "First Name",
d.dept_name AS "Department Name"
FROM departments d
JOIN dept_emp de ON d.dept_no = de.dept_no
JOIN employees e ON de.emp_no = e.emp_no;

-- To list first name, last name, and sex of each employee whose first name is Hercules and whose
-- last name begins with the letter B:
SELECT first_name AS "First Name",
last_name AS "Last Name",
sex AS "Sex"
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- To list each employee in the Sales department, including their employee number, last name, and
-- first name:
SELECT e.emp_no AS "Sales Employee Number",
e.last_name AS "Last Name",
e.first_name AS "First Name"
FROM employees e
INNER JOIN (
	SELECT de.emp_no 
	FROM dept_emp de
	INNER JOIN departments d ON de.dept_no = d.dept_no
	WHERE d.dept_name = 'Sales') dep
ON e.emp_no = dep.emp_no;

-- To list each employee in the Sales and Development departments, including their employee
-- number, last name, first name, and department name:
SELECT e.emp_no AS "Employee Number",
e.last_name AS "Last Name",
e.first_name AS "First Name",
dep.dept_name AS "Department Name"
FROM employees e
INNER JOIN (
	SELECT de.emp_no, d.dept_name 
	FROM dept_emp de
	INNER JOIN departments d ON de.dept_no = d.dept_no
	WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development') dep
ON e.emp_no = dep.emp_no;

-- To list the frequency counts, in descending order, of all the employee last names (that is,
-- how many employees share each last name):
SELECT last_name AS "Employees Last Names", COUNT(last_name) AS "Frequency"
FROM employees
GROUP BY last_name
ORDER BY "Frequency" DESC;
