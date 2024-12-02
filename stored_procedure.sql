Benefits of Using Stored Procedures:
----------------------------------------
A stored procedure in SQL is a precompiled collection of one or more SQL statements that can be executed as a single unit. 

Stored procedures are typically used to perform operations like retrieving, inserting, updating, or deleting data from a database. 

They allow for code reusability, security, and performance optimization.

Performance: Since stored procedures are precompiled, they can improve performance compared to executing individual SQL statements.

Security: Stored procedures can help encapsulate the SQL logic, restricting direct access to the underlying database tables.

Reusability: Stored procedures allow for code reuse, making it easier to maintain and update.

Consistency: By using stored procedures, we can ensure that the logic is executed consistently.

CREATE PROCEDURE CheckEmployeeSalary
    @EmployeeID INT
AS
BEGIN
    DECLARE @Salary DECIMAL(10, 2);
    
    SELECT @Salary = Salary FROM Employees WHERE EmployeeID = @EmployeeID;
    
    IF @Salary > 50000
        PRINT 'Employee earns a high salary.';
    ELSE
        PRINT 'Employee earns a low salary.';
END;
