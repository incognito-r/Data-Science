use company_management;

show tables;

SELECT * FROM employee;
SELECT * FROM department;
SELECT * FROM manager;
SELECT * FROM projects;
SELECT * FROM employee_projects;

# show emplyee name and department name 
SELECT
	employee.first_name as Employee,
    department.department_name as Department
FROM employee JOIN department -- INNER JOIN only the records that are common on both the tables will be joined.
ON employee.department_id = department.department_id;

# show all the employee and department name;
SELECT
	employee.first_name as Employee,
    department.department_name as Department
FROM employee LEFT JOIN department -- returns all records from left table and NULL from right table where the records are not there.
ON employee.department_id = department.department_id;
-- INNER JOIN + any additional records in left table

# show all the department and their employees
SELECT
	employee.first_name as Employee,
    department.department_name as Department
FROM employee RIGHT JOIN department -- returns all records from RIGHT table and NULL from LEFT table where the records are not there.
ON employee.department_id = department.department_id;
-- INNER JOIN + any additional records in right table 

# fetch all Employees, their department, their manager, and the projects they are working on.
SELECT 
	employee.first_name as Employee,
    department.department_name as Department,
    manager.first_name as Manager,
    projects.project_name as Project
FROM employee 
	LEFT JOIN department ON employee.department_id = department.department_id
	INNER JOIN manager ON manager.manager_id = employee.manager_id
	LEFT JOIN projects ON projects.team_member_id= employee.employee_id;