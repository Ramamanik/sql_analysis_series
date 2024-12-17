Primary Key and Foreign Key 
-------------------------------
In databases, Primary Key and Foreign Key are crucial concepts that maintain data integrity and relationships between tables.

Primary Key
-------------
Uniqueness: Ensures that each record in a table is unique.

Data Integrity: Prevents duplicate or NULL values, ensuring reliable data.

Efficient Indexing: Automatically creates a clustered index, improving query performance.

Simplified Identifiers: Acts as a unique identifier for referencing records in other tables.

Disadvantages
----------------
One per Table: A table can have only one primary key, limiting options.

Storage Overhead: Enforcing uniqueness and indexing can consume storage and slow performance for very large tables.

Complexity: Strict enforcement can make inserts and updates complex, especially when dealing with duplicate data.

Foreign Key
-------------
Referential Integrity: Ensures relationships between two tables. 

Data Consistency: Prevents invalid data insertion by enforcing dependencies.

Simplifies Joins: Makes it easier to write SQL queries to fetch related data.

Cascade Operations: Supports automatically update or delete related rows.

Disadvantages
----------------

Performance Overhead: Foreign key constraints can slow down insert, update, and delete operations due to dependency checks.

Complex Relationships: Managing multiple foreign keys in large schemas can complicate database design.

Cascading Issues: Improper use of cascade operations can accidentally delete important data.

Indexing Required: Foreign keys often require indexing on referenced columns, increasing storage usage.

  CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,      
    DepartmentName VARCHAR(50) NOT NULL
);

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,         
    EmployeeName VARCHAR(50) NOT NULL,
    DepartmentID INT,                   
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

