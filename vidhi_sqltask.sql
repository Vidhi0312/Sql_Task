--Query 1: Get All Employees Under Each Manager

SELECT manager_name, CONCAT(first_name, ' ', last_name) AS full_name
FROM manager_details
JOIN employee_details ON manager_details.empid = employee_details.empid
ORDER BY manager_name;

--Query 2: Count of Employees Under a Specific Manager 

SELECT manager_name, COUNT(empid) AS employee_count
FROM manager_details
WHERE manager_name = 'Bob'
GROUP BY manager_name;

--Query 3: Get All Managers Details (Distinct List of Managers)

SELECT DISTINCT manager_name
FROM manager_details;

--Query 4: Find Any Employee Who Has Not Been Assigned a Manager

SELECT empid, first_name, last_name
FROM employee_details
WHERE empid NOT IN (SELECT empid FROM manager_details);

--Query 5. Create a Function to Get Full Name
--This function concatenates the first and last names of an employee.
DELIMITER $$
CREATE FUNCTION get_fullname(emp_id INT) 
RETURNS VARCHAR(50) DETERMINISTIC
BEGIN
    DECLARE full_name VARCHAR(50);
    SELECT CONCAT(first_name, ' ', last_name) INTO full_name
    FROM employee_details
    WHERE empid = emp_id;
    RETURN full_name;
END $$
DELIMITER ; 

--Query to test the 'get_fullname' Function

SELECT get_fullname(1);