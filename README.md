Employee Data Base
 

 
Data Modeling, Data Engineering and Data Analysis of an Employee DB using PostgreSQL

DATA MODELLING
ERD of employee database tables was created, specifying data types, primary keys and foreign keys, using  the http://www.quickdatabasediagrams.com.

DATA INGENEERING
I reviewed information and created a table schema for each of the six data files. Specifying data types, primary keys, foreign keys, and other constraints. Imported csv files to a SQL database to its respective tables. 

DATA ANALYSIS
SQL folder with query analysis that provide the following results:

- Details of each employee: employee number, last name, first name, gender, and salary.
- Employees who were hired in 1986.
- Manager of each department with the following information: department number, department name, the manager's employee number, last name,   first name, and start and end employment dates.
- Department of each employee with the following information: employee number, last name, first name, and department name.
- Employees whose first name is "Hercules" and last names begin with "B."
- Employees in the Sales department, including their employee number, last name, first name, and department name.
- Employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
- In descending order, the frequency count of employee last names, i.e., how many employees share each last name.

Confirming data analysis with Pandas
   ```sql
 from sqlalchemy import create_engine
 engine = create_engine('postgresql://localhost:5432/<your_db_name>')
 connection = engine.connect()
Report
- The HP data base (DB) concists of 6 csv tables: Salaries, Employee data, Titles, Departments Manager/Employees and Salaries. 
- The employees table contains 300,024 records from employees hired for the period of 1985-01-01 to 2000-01-28. 
- There are 1638 unique last names, with the most common last name Baba. 
- HP has 9 departments: Marketing, Finance, Human Resources, Production, Development, Quality Management, Customer Service, Research and Sales. 
- 24 department managers have been identified from data range 1985 to 2000. 
The salary average data needs further investigation with Payroll data.

The data shows a decrease in hiring levels which requires further data validation with HR department.
 
 