-- Queries [DRAFT]

-- Listed the employee number, last name, first name, sex, and salary of each employee:
SELECT e.emp_no AS "Employee Number",
e.last_name AS "Last Name",
e.first_name AS "First Name",
e.sex AS "Sex",
s.salary AS "Salary"
FROM employees e
INNER JOIN salaries s ON e.emp_no = s.emp_no





- [ ]  List the first name, last name, and hire date for the employees who were hired in 1986 (2 points)
- [ ]  List the manager of each department along with their department number, department name, employee number, last name, and first name (2 points)
- [ ]  List the department number for each employee along with that employee’s employee number, last name, first name, and department name (2 points)
- [ ]  List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B (2 points)
- [ ]  List each employee in the Sales department, including their employee number, last name, and first name (2 points)
- [ ]  List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name (4 points)
- [ ]  List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name) (4 points)