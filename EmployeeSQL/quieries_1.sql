--6.List each employee in the Sales department, including their employee number, last name, and first name.
SELECT d.dept_name, e.emp_no, e.last_name, e.first_name
From departments d
join dept_emp de ON d.dept_no = de.dept_no
join(
	SELECT  e.emp_no, e.last_name, e.first_name
	from employees e
	join dept_emp de ON e.emp_no = de.emp_no

	)AS e ON de.emp_no = e.emp_no
	Where dept_name = 'Sales';

--7. List each employee in the Sales and Development departments, including their employee number, 
--last name, first name, and department name.

SELECT  e.emp_no, e.last_name, e.first_name, d.dept_name
From departments d
join dept_emp de ON d.dept_no = de.dept_no
join(
	SELECT  e.emp_no, e.last_name, e.first_name
	from employees e
	join dept_emp de ON e.emp_no = de.emp_no

	)AS e ON de.emp_no = e.emp_no
	Where dept_name IN ('Sales', 'Development');

--8. List the frequency counts, in descending order, of all the employee last names 
--(that is, how many employees share each last name).

SELECT last_name, COUNT(*) AS frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;
