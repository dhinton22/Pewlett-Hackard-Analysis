--Create table departments (
	dept_no Varchar(4) NOT NULL,
	dept_name Varchar(50) NOT NULL,
	PRIMARY KEY (dept_no),
	UNIQUE (dept_name)
	);
	
select * from departments;
select * from employees;
select * from dept_manager;
select * from dept_emp;
select * from titles;


drop table employees

Create table employees (
	emp_no int NOT NULL,
	birth_date date NOT NULL,
	first_name Varchar(50) NOT NULL,
	last_name Varchar(50) NOT NULL,
	gender VARCHAR(10) NOT NULL,
	hire_date date NOT NULL,
	PRIMARY KEY (emp_no));
	
CREATE TABLE dept_manager (
dept_no VARCHAR(4) NOT NULL,
    emp_no INT NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    PRIMARY KEY (emp_no, dept_no)
);
	
CREATE TABLE salaries (
  emp_no INT NOT NULL,
  salary INT NOT NULL,
  from_date DATE NOT NULL,
  to_date DATE NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
  PRIMARY KEY (emp_no)
);

create table dept_emp (
	emp_no INT NOT NULL,
	dept_no INT NOT NULL,
	from_date date NOT NULL,
	to_date date NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	PRIMARY KEY (emp_no) 
);

create table titles (
	emp_no INT NOT NULL,
	title Varchar(50) NOT NULL,
	from_date date NOT NULL,
	to_date date NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	PRIMARY KEY (emp_no) 
);