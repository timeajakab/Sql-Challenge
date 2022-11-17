
CREATE TABLE departments( 
	dept_no varchar NOT NULL,
	dept_name varchar NOT NULL,
	PRIMARY KEY (dept_no)	
);

CREATE TABLE dept_emp( 
emp_no INT NOT NULL ,
	dept_no varchar NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE dept_manager( 
dept_no varchar,
emp_no varchar,
	Primary KEY (dept_no)
);

CREATE TABLE employees( 
emp_no INT NOT NULL,
title_id VARCHAR NOT NULL,
birth_date date NOT NULL,
first_name varchar NOT NULL,
last_name varchar NOT NULL ,
sex varchar ,
hire_date DATE NOT NULL ,
 Primary Key (emp_no)
	);

CREATE TABLE titles (
title_id varchar NOT NULL PRIMARY KEY,
title varchar NOT NULL
);

CREATE TABLE salaries (
	emp_no INT NOT NULL,
	salary INT NOT NULL,
	PRIMARY KEY (emp_no)
);
--------------------------------------
--list the employee number, last name etc

SELECT *
FROM employees;

SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex,
Salaries.salary

FROM employees
INNER JOIN Salaries ON
employees.emp_no = salaries.emp_no;

-- 2. List employees who were hired in 1986
SELECT emp_no, first_name, last_name, hire_date from employees
WHERE hire_date >= '1985-12-31'
AND hire_date < '1987-01-01'

--3.List the manager of each department along with their department number,department name, employee number, last name, and first name.
SELECT dept_manager.dept_no, 
	   departments.dept_name,
	   dept_manager.emp_no,
	   employees.last_name,
	   employees.first_name,
	   dept_manager.dept_no, 
	   dept_manager.emp_no 
FROM dept_manager
INNER JOIN departments ON
dept_manager.dept_no = departments.dept_no
INNER JOIN employees ON
dept_manager.emp_no = employees.emp_no;

--4.List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

SELECT employees.emp_no, 
	   employees.last_name, 
	   employees.first_name,
	   departments.dept_name
FROM employees
INNER JOIN dept_manager ON
employees.emp_no = dept_manager.emp_no
INNER JOIN departments ON
dept_manager.dept_no = departments.dept_no;

--5.List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT * FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

--6.List each employee in the Sales department, including their employee number, last name, and first name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
JOIN dept_emp ON
e.emp_no = dept_emp.emp_no
INNER JOIN departments AS d ON
dept_emp.dept_no = d.dept_no
WHERE dept_name = 'Sales';

--7.List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
JOIN dept_emp ON
e.emp_no = dept_emp.emp_no
INNER JOIN departments AS d ON
dept_emp.dept_no = d.dept_no
WHERE dept_name = 'Sales' OR 
	  dept_name = 'Development';
	  
--8.List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name, COUNT(last_name) FROM employees
GROUP BY last_name
ORDER BY count(last_name) desc;