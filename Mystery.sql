use mystery;

DESCRIBE mystery.departments;
DESCRIBE mystery.dept_emp;
DESCRIBE mystery.dept_manager;
DESCRIBE mystery.employees;
DESCRIBE mystery.salaries;
DESCRIBE mystery.titles;

SELECT count(emp_no) FROM employees;
SELECT DISTINCT title FROM titles;

SELECT salary FROM salaries ORDER BY salary LIMIT 1;
SELECT salary FROM salaries ORDER BY salary  DESC LIMIT 1;
SELECT avg(salary) FROM salaries;

SELECT DISTINCT employees.first_name, employees.last_name FROM salaries INNER JOIN employees
    ON salaries.emp_no = employees.emp_no && to_date >= "2016-01-01" ORDER BY salary  DESC LIMIT 10;

SELECT sum(salary) from salaries;
SELECT last_name, first_name FROM employees ORDER BY birth_date LIMIT 1;
SELECT last_name, first_name FROM employees ORDER BY birth_date DESC LIMIT 1;

SELECT last_name, first_name FROM employees ORDER BY hire_date DESC limit 1;

SELECT count(emp_no) FROM employees WHERE gender = 'M';
SELECT count(emp_no) FROM employees WHERE gender = 'F';

SELECT count(emp_no) FROM employees WHERE birth_date > "1961-11-24";

select dept_no FROM  departments;
SELECT last_name, first_name FROM employees INNER JOIN dept_emp on
  employees.emp_no = dept_emp.emp_no WHERE dept_no = 'd009';

SELECT last_name, first_name FROM employees INNER JOIN dept_emp  ON
dept_emp.emp_no = employees.emp_no GROUP BY dept_emp.emp_no HAVING COUNT(dept_emp.emp_no) = 3;

SELECT last_name, first_name FROM employees WHERE hire_date < "2006-11-24";

SELECT last_name, first_name FROM employees ORDER BY (length(last_name) + length(first_name)) DESC;

SELECT dept_no FROM departments WHERE dept_name = "sales";
SELECT count(employees.emp_no) FROM employees INNER JOIN dept_emp ON
dept_emp.emp_no = employees.emp_no WHERE dept_no = 'd007' && gender = 'F';
SELECT count(employees.emp_no) FROM employees INNER JOIN dept_emp ON
dept_emp.emp_no = employees.emp_no WHERE dept_no = 'd007' && gender = 'M';