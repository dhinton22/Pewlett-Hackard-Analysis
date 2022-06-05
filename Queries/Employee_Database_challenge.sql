/*
Deliverable 1: The Number of Retiring Employees by Title
Deliverable 2: The Employees Eligible for the Mentorship Program 
*/

--create a Retirement Titles table for employees who are born between January 1, 1952 and December 31, 1955
SELECT 
	e.emp_no, 
	e.first_name, 
	e.last_name,
	t.title,
	t.from_date,
	t.to_date
into retirement_titles
FROM employees AS e
INNER JOIN titles AS t ON (e.emp_no = t.emp_no)
WHERE (e.birth_date between '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;
--select * from retirement_titles;


--create a Unique Titles table that contains the employee number, first and last name, and most recent title
SELECT DISTINCT ON (emp_no) emp_no,
	first_name,
	last_name,
	title
INTO unique_titles
FROM retirement_titles 
WHERE (to_date = '9999-01-01')
ORDER BY emp_no, to_date DESC;

--select * from unique_titles;
--drop table unique_titles;

--create a Retiring Titles table that contains the number of titles filled by employees who are retiring
SELECT COUNT (title) as COUNT, 
			title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY 1 DESC;
--select * from retiring_titles;


--Deliverable 2: The Employees Eligible for the Mentorship Program 

--create a Mentorship Eligibility table that holds the employees who are eligible to participate in a mentorship program.
SELECT DISTINCT ON (e.emp_no) e.emp_no,
        e.first_name,
        e.last_name,
        e.birth_date,
        d.from_date,
        d.to_date,
        t.title
--INTO mentorship_eligibilty
FROM employees as e
INNER JOIN dept_emp as d on
                    (d.emp_no = e.emp_no)
INNER JOIN titles as t on
                    (t.emp_no = e.emp_no)
WHERE (d.to_date = '9999-01-01')
AND (e.birth_date between '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;
