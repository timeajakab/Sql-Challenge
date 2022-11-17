
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




	
	