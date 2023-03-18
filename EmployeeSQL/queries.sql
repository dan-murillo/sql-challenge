-- Queries [DRAFT]

-- To list the employee number, last name, first name, sex, and salary of each employee:
SELECT e.emp_no AS "Employee Number",
e.last_name AS "Last Name",
e.first_name AS "First Name",
e.sex AS "Sex",
s.salary AS "Salary"
FROM employees e
LEFT JOIN salaries s ON e.emp_no = s.emp_no

-- To list the first name, last name, and hire date for the employees who were hired in 1986:
SELECT first_name AS "First Name",
last_name AS "Last Name",
hire_date AS "Hire Date"
FROM employees
WHERE hire_date LIKE '%1986'

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





- [ ]  List the department number for each employee along with that employee’s employee number, last name, first name, and department name (2 points)
- [ ]  List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B (2 points)
- [ ]  List each employee in the Sales department, including their employee number, last name, and first name (2 points)
- [ ]  List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name (4 points)
- [ ]  List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name) (4 points)