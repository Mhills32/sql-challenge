--1.List the employee number, last name, first name, sex, and salary of each employee.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
JOIN salaries s ON e.emp_no = s.emp_no;


--2.List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT first_name, last_name, hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1985;

--3.List the manager of each department along with their department number, department name, 
--employee number, last name, and first name.

SELECT d.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
from departments d
join dept_emp dm ON d.dept_no = dm.dept_no
join(
	SELECT  e.emp_no, e.last_name, e.first_name
	from employees e
	join dept_manager dm ON e.emp_no = dm.emp_no

	)AS e ON dm.emp_no = e.emp_no;

--4. List the department number for each employee along with that employee’s employee number, 
--last name, first name, and department name.
SELECT d.dept_no, de.emp_no, e.last_name, e.first_name, d.dept_name
from departments d
join dept_emp de ON d.dept_no = de.dept_no
join (
	SELECT  e.emp_no, e.last_name, e.first_name
	from employees e
	join dept_emp de ON e.emp_no = de.emp_no 

	)AS e ON de.emp_no = e.emp_no;
	
--5.List first name, last name, and sex of each employee whose first name is Hercules 
--and whose last name begins with the letter B.

SELECT first_name, last_name, sex
from employees
where first_name ='Hercules' and last_name LIKE 'B%';