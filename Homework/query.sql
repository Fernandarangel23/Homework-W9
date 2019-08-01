-----------------------------------------------------------------
-----------------DATA ANALYTICS----------------------------------
-----------------------------------------------------------------

--1. List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT dm.dept_no, dept.dept_name, dm.emp_no, e.last_name, e.first_name, dm.from_date, dm.to_date
FROM dept_mananger dm, departments dept, employees e
WHERE dm.dept_no = dept.dept_no AND dm.emp_no = e.emp_no;

--2.  List employees who were hired in 1986.
SELECT e.emp_no, e.last_name, e.first_name, e.hire_date
FROM employees e
WHERE e.hire_date LIKE '1986%';


--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT dm.dept_no, dept.dept_name, dm.emp_no, e.last_name, e.first_name, dm.from_date, dm.to_date
FROM dept_mananger dm, departments dept, employees e
WHERE dm.dept_no = dept.dept_no AND dm.emp_no = e.emp_no;

--4. List the department of each employee with the following information:
--employee number, last name, first name, and department name.
SELECT deptemp.emp_no, e.last_name, e.first_name, dept.dept_name
FROM dept_emp deptemp, employees e, departments dept
WHERE deptemp.dept_no = dept.dept_no AND deptemp.emp_no = e.emp_no;

--5. List all employees whose first name is "Hercules" and last names begin with "B."
SELECT  e.first_name, e.last_name
FROM employees e
WHERE e.first_name = 'Hercules' AND e.last_name LIKE 'B%';

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT deptemp.emp_no, e.last_name, e.first_name, dept.dept_name
FROM dept_emp deptemp, employees e, departments dept
WHERE deptemp.dept_no = dept.dept_no AND deptemp.emp_no = e.emp_no AND dept.dept_name  = 'Sales';

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, dp.dept_name
FROM employees AS e
INNER JOIN dept_emp AS d ON
e.emp_no = d.emp_no
INNER JOIN departments AS dp ON
dp.dept_no = d.dept_no
WHERE dp.dept_name LIKE 'Development'
OR dp.dept_name LIKE 'Sales';

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(*) AS frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;
