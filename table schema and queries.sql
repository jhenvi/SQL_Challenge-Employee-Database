--In this assignment, you will design the tables to hold data in the CSVs,
--import the CSVs into a SQL database, and answer questions about the data

DROP TABLE departments
DROP TABLE dept_emp
DROP TABLE dept_manager
DROP TABLE salaries
DROP TABLE titles

CREATE TABLE departments (
    dept_no 	VARCHAR(4)   	NOT NULL,
    dept_name 	VARCHAR(30)  	NOT NULL,
    PRIMARY KEY (dept_no),
	UNIQUE (dept_name)
);

CREATE TABLE dept_emp (
    emp_no 		INT   		NOT NULL,
    dept_no 	VARCHAR(4)  NOT NULL,
    from_date 	DATE	    NOT NULL,
    to_date 	DATE        NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE employees (
	emp_no 		INT 		NOT NULL,
	birth_date 	DATE 		NOT NULL,
	first_name	VARCHAR(30)	NOT NULL,
	last_name 	VARCHAR(30)	NOT NULL,
	gender 		VARCHAR(1)	NOT NULL,
	hire_date 	DATE 		NOT NULL,
	PRIMARY KEY (emp_no)
);

CREATE TABLE dept_manager (
    dept_no 	VARCHAR(4)  NOT NULL,
    emp_no 		INT   		NOT NULL,
    from_date 	VARCHAR(30) NOT NULL,
    to_date 	VARCHAR(30) NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE salaries (
    emp_no 		INT			NOT NULL,
    salary 		INT   		NOT NULL,
    from_date 	VARCHAR(30) NOT NULL,
    to_date 	VARCHAR(30) NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	PRIMARY KEY (emp_no, from_date)
);

CREATE TABLE titles (
    emp_no 		INT			NOT NULL,
    title 		VARCHAR(30) NOT NULL,
    from_date 	VARCHAR(30) NOT NULL,
    to_date 	VARCHAR(30) NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	PRIMARY KEY (emp_no, title, from_date)
);

--Data Analysis
-- Q1 List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT e.emp_no, e.first_name,e.last_name, e.gender, s.salary
FROM employees AS e
LEFT JOIN
salaries AS s
ON (e.emp_no = s.emp_no)
ORDER BY e.emp_no; 
-- Q2 List employees who were hired in 1986.
SELECT emp_no, first_name, last_name, hire_date FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31'

-- Q3 List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT  dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name, dm.from_date, dm.to_date
FROM dept_manager AS dm
INNER JOIN departments AS d
ON (dm.dept_no = d.dept_no)
INNER JOIN employees AS e
ON (dm.emp_no = e.emp_no);
-- Q4 List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT e.emp_no, e.first_name, e.last_name, d.dept_name
FROM employees AS e
JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
JOIN departments AS d
ON (de.dept_no = d.dept_no);

-- Q5 List all employees whose first name is "Hercules" and last names begin with "B."
SELECT emp_no, first_name, last_name
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- Q6 List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
INNER JOIN dept_emp AS  de
ON (e.emp_no = de.emp_no)
INNER JOIN departments as d
ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales'
ORDER BY e.emp_no

-- Q7 List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
INNER JOIN dept_emp AS  de
ON (e.emp_no = de.emp_no)
INNER JOIN departments as d
ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development'
ORDER BY e.emp_no

-- Q8 In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT e.last_name, 
COUNT(e.emp_no) AS "Frequency"
FROM employees AS e
GROUP BY e.last_name
ORDER BY COUNT(e.emp_no) DESC;