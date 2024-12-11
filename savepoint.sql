Key Features of savepoint
-----------------------------
1) A savepoint in sql allows to set a checkpoint within a transaction. 

2) It enables to roll back part of a transaction instead of the entire transaction. 

3) This feature is particularly useful in large or complex transactions 

4) undo specific operations without discarding the rest of the transaction.

5) define multiple savepoints within a single transaction.

6) Use Rollbacks to savepoint to undo changes made after a specific savepoint.

7) savepoint is especially useful when executing conditional or multi-step operations.

BEGIN TRANSACTION;

-- First Update
UPDATE employees SET salary = salary * 1.10 WHERE department = 'Sales';

SAVEPOINT after_sales_update;

-- Second Update
UPDATE employees SET salary = salary * 1.20 WHERE department = 'HR';

SAVEPOINT after_hr_update;

-- Third Update (Error occurs here)
UPDATE employees SET salary = salary * 1.30 WHERE department = 'Finance';

-- Rollback only the last update
ROLLBACK TO SAVEPOINT after_hr_update;

-- Commit the rest
COMMIT;
