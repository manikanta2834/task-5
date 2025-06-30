# task-5
sql internship
# SQL Joins Internship Task

This repository contains my solution for Task 5 of the SQL Developer Internship, focusing on different types of SQL joins.

## Contents

- SQL scripts demonstrating INNER, LEFT, RIGHT, FULL OUTER, CROSS, and SELF joins
- Answers to interview questions about SQL joins
- Sample database schema (Customers and Orders tables)

## How to Use

1. Run `create_tables.sql` to set up the database
2. Execute queries from `join_examples.sql` to see different join types in action

## Key Learnings

- Understanding how different joins affect result sets
- Practical applications for each join type
- Performance considerations when joining tables


Interview Questions Answers
1.Difference between INNER and LEFT JOIN?

A.INNER JOIN returns only rows with matching values in both tables.

LEFT JOIN returns all rows from the left table and matched rows from the right table (with NULLs for non-matches).

2.What is a FULL OUTER JOIN?

A. Returns all rows when there's a match in either table, combining LEFT and RIGHT JOIN results.

3. Can joins be nested?

A. Yes, you can nest joins by joining multiple tables in a single query or using subqueries.

4. How to join more than 2 tables?

A. Chain JOIN clauses: SELECT * FROM table1 JOIN table2 ON ... JOIN table3 ON ...

5. What is a cross join?

A. Produces Cartesian product - every row from first table combined with every row from second table.

6. What is a natural join?

A. Joins tables on columns with the same name automatically (not recommended due to ambiguity).

7. Can you join tables without foreign key?

A. Yes, foreign keys enforce referential integrity but aren't required for joins.

8. What is a self-join?

A. Joining a table to itself, often to compare rows within the same table.

9. What causes Cartesian product?

A. CROSS JOINs or when JOIN conditions are omitted/mistaken.

10. How to optimize joins?

A .Use indexes on join columns, limit selected columns, filter early with WHERE, and analyze query execution plans.
