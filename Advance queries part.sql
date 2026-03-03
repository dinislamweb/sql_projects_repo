-- Advance Questions:

SELECT * FROM BOOKS;
SELECT * FROM ORDERS;
SELECT * FROM CUSTOMERS;

-- 1. Retrieve the total number of books sold for each genre.
SELECT b.genre, SUM(o.quantity)
FROM Orders o
JOIN Books b ON o.book_id = b.book_id
GROUP BY genre;

-- 2. Find the average price of books in the "Fantasy" genre.
SELECT AVG(price) AS average_price
FROM Books
WHERE genre = 'Fantasy';

-- 3. List customers who have placed at least 2 orders.
SELECT c.customer_id,c.name,Count(o.order_id)
From Orders o
JOIN Customers c ON o.customer_id = c.customer_id
Group By c.customer_id
Having Count(o.order_id) >= 2;

-- 4. Find the most frequently ordered book.
SELECT o.book_id, b.title, Count(o.order_id) as order_count
FROM Orders o
JOIN Books b ON o.book_id = b.book_id
Group By o.book_id,b.title
Order By order_count DESC
LIMIT 1;

-- 5. Show the top most 3 expensive books of 'Fantasy' Genre.
SELECT title,price
FROM Books
WHERE genre = 'Fantasy'
ORDER BY price DESC
LIMIT 3;

-- 6. Retrieve the total quantity of books sold by eacy author.
SELECT b.author,SUM(o.quantity)
FROM Orders o
JOIN Books b
ON o.book_id = b.book_id
Group BY b.author;


-- 7. List the cities where customers who spent over $30 are located.
SELECT DISTINCT c.city, o.total_amount
From Orders o
JOIN Customers c 
ON o.customer_id = c.customer_id
WHERE o.total_amount > 30;

-- 8. Find the customer who spent the most on orders.
SELECT * FROM BOOKS;
SELECT * FROM Orders;
SELECT * FROM Customers;

SELECT c.customer_id,c.name,SUM(o.total_amount) AS total_spent
From Orders o
JOIN Customers c ON o.customer_id = c.customer_id
Group By c.customer_id,c.name 
ORDER BY total_spent DESC
LIMIT 1;

-- 9. Calculate the stock remaining after fulfilling all orders.
SELECT b.book_id, b.title, b.stock,COALESCE(SUM(o.quantity),0) AS Order_quantity,
		b.stock - COALESCE(SUM(o.quantity),0) as remaining_stock
From Books b
Left JOIN Orders o 
ON b.book_id = o.book_id
Group by b.book_id Order By b.book_id;