-- DATA ANALYSIS

-- List employee number, last name, first name, sex, and salary
SELECT employees.emp_no, employees.last_name, employee.first_name, employees.sex, salaries.salary
FROM employees
INNER JOIN salary ON employees.emp_no = salaries.emp_no

-- List first name, last name, hire data for employees hired in 1986
SELECT employees.first_name, employees.last_name, employees.hire_date
FROM employees
WHERE hire_date >= '1986-01-01' AND hire_date <= '1986-12-31'

-- List the manager of each department with the following information
-- * department number
-- * department name
-- * manager's employee number
-- * last name
-- * first name
SELECT dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name 
FROM dept_manager
INNER JOIN departments ON dept_manager.dept_no = departments.dept_no
INNER JOIN employees ON dept_manager.emp_no = employees.emp_no

-- List the department of each employee with the following information
-- * employee number
-- * last name
-- * first name
-- * department name
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_manager
INNER JOIN employees ON employees.emp_no = dept_manager.emp_no
INNER JOIN departments ON dept_manager.dept_no = departments.dept_no;

-- List the first name, last name, sex for employees with the following criteria
-- * first name is 'Hercules'
-- * last name begins with 'B'
SELECT employees.first_name, employees.last_name, employees.sex
FROM employees
WHERE employees.first_name = 'Hercules' AND employees.last_name LIKE 'B%'

-- List all employees in Sales department with the following information
-- * employee number
-- * last name
-- * first name
-- * department name
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
INNER JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
INNER JOIN departments ON departments.dept_no = dept_emp.dept_no
WHERE dept_name = 'Sales'

-- List all the employees in the Sales and Development departments, including
-- * employee number
-- * last name
-- * first name
-- * department name
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
INNER JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
INNER JOIN departments ON departments.dept_no = dept_emp.dept_no
WHERE dept_name = 'Sales' OR dept_name = 'Development'

-- In descending order, list the frequency count of employee last names
SELECT employees.last_name, COUNT(employees.last_name) AS "Count"
FROM employees
GROUP BY employees.last_name
ORDER BY "Count" DESC


