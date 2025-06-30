-- Create Customers table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    signup_date DATE
);

-- Create Orders table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Insert sample data into Customers
INSERT INTO Customers VALUES
(1, 'John Doe', 'john@example.com', '2023-01-15'),
(2, 'Jane Smith', 'jane@example.com', '2023-02-20'),
(3, 'Bob Johnson', 'bob@example.com', '2023-03-10'),
(4, 'Alice Brown', 'alice@example.com', '2023-04-05');

-- Insert sample data into Orders
INSERT INTO Orders VALUES
(101, 1, '2023-05-10', 150.00),
(102, 1, '2023-05-15', 200.00),
(103, 2, '2023-06-01', 75.50),
(104, 3, '2023-06-15', 300.00),
(105, NULL, '2023-06-20', 50.00);  -- Order with no associated customer


-- 1. INNER JOIN (returns only matching records from both tables)
SELECT c.customer_id, c.name, o.order_id, o.amount
FROM Customers c
INNER JOIN Orders o ON c.customer_id = o.customer_id;

-- 2. LEFT JOIN (returns all records from left table and matched records from right)
SELECT c.customer_id, c.name, o.order_id, o.amount
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id;

-- 3. RIGHT JOIN (returns all records from right table and matched records from left)
-- Note: SQLite doesn't support RIGHT JOIN directly, so we'll use LEFT JOIN with reversed tables
SELECT c.customer_id, c.name, o.order_id, o.amount
FROM Orders o
LEFT JOIN Customers c ON o.customer_id = c.customer_id;

-- 4. FULL OUTER JOIN (returns all records when there's a match in either table)
-- SQLite doesn't support FULL OUTER JOIN directly, so we'll simulate it with UNION
SELECT c.customer_id, c.name, o.order_id, o.amount
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
UNION
SELECT c.customer_id, c.name, o.order_id, o.amount
FROM Orders o
LEFT JOIN Customers c ON o.customer_id = c.customer_id
WHERE c.customer_id IS NULL;

-- 5. CROSS JOIN (Cartesian product of both tables)
SELECT c.customer_id, c.name, o.order_id, o.amount
FROM Customers c
CROSS JOIN Orders o;

-- 6. SELF JOIN (joining a table to itself)
-- Let's find customers who signed up on the same day
SELECT a.customer_id AS id1, a.name AS name1, 
       b.customer_id AS id2, b.name AS name2, 
       a.signup_date
FROM Customers a
JOIN Customers b ON a.signup_date = b.signup_date AND a.customer_id < b.customer_id;
