-- Basic Query to solve
SELECT * FROM Books;
SELECT * FROM Customers;
SELECT * FROM Orders;
-- 1. Retrieve all book in the 'Fiction' genre.

SELECT * FROM Books
WHERE genre = 'Fiction';

-- 2. Find books published after the year 1950:
SELECT * FROM Books
WHERE published_year > 1950;

-- 3. List all the customers from the Canada.
SELECT * FROM Customers
WHERE Country = 'Canada';


-- 4. Show orders placed in November 2023.
SELECT * FROM Orders
WHERE order_date BETWEEN '2023-11-01' AND '2023-11-30';

-- 5. Retrieve the total stock of books available.
SELECT SUM(stock) 
FROM Books;

-- 6. Find the details of the most expensive book.
SELECT * FROM Books
WHERE price = (SELECT MAX(price)
FROM Books);

-- Another solution of find the details of the most expensive book.
SELECT * 
FROM Books 
ORDER BY price DESC
Limit 1;

-- 7. Show all customers who ordered more than 1 quantity of a book.
SELECT *
FROM Orders
WHERE quantity > 1;

-- Another solution if customers details info needed
SELECT c.customer_id, c.name, c.email, c.city, c.country,o.book_id,o.quantity
FROM Customers c
JOIN Orders o
ON c.customer_id = o.customer_id
WHERE o.quantity > 1;

-- 8. Retrieve all orders where the total amount exceeds 250.
SELECT * FROM Orders
WHERE total_amount > 250;

-- 9. List all genres available in the Books table.
SELECT DISTINCT(genre)
FROM Books;

-- 10. Find the book with the lowest stock.
SELECT * FROM Books
ORDER BY stock
LIMIT 1;

-- 11. Calculate the total revenue generated from all orders.
SELECT SUM(total_amount) AS Revenue
FROM Orders;