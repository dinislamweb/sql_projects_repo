-- Create Database
CREATE DATABASE OnlineBookStore;

-- Create Books Table
DROP TABLE IF EXISTS Books;

CREATE TABLE Books (
		Book_ID SERIAL PRIMARY KEY,
		Title VARCHAR (100),
		Author VARCHAR (100),
		Genre VARCHAR (50),
		Published_Year INT,
		Price NUMERIC (10,2),
		Stock INT		
);

-- Create Customers Table
DROP TABLE IF EXISTS Customers;

CREATE TABLE Customers(
		Customer_ID SERIAL PRIMARY KEY,
		Name VARCHAR (100),
		Email VARCHAR (100),
		Phone VARCHAR (15),
		City VARCHAR (30),
		Country VARCHAR (100)
);

-- Create Orders Table
DROP TABLE IF EXISTS Orders;

CREATE TABLE Orders(
		Order_ID SERIAL PRIMARY KEY,
		Customer_ID INT REFERENCES Customers(Customer_ID),
		Book_ID INT REFERENCES Books(Book_ID),
		Order_Date DATE,
		Quantity INT,
		Total_Amount NUMERIC (10,2)
);

SELECT * FROM Books;
SELECT * FROM Customers;
SELECT * FROM Orders;

-- Import Data into Books Table
COPY Books (Book_ID, Title, Author, Genre, Published_Year, Price, Stock)
FROM 'D:\SQL Project\OnlineBookStore SQL Project\OnlineBookStoreSQL DataSets\Books.csv'
DELIMITER ','
CSV HEADER;

-- Import Data into Customers Table
COPY Customers (Customer_ID, Name, Email, Phone, City, Country)
FROM 'D:\SQL Project\OnlineBookStore SQL Project\OnlineBookStoreSQL DataSets\Customers.csv'
DELIMITER ','
CSV HEADER;

-- Import Data into Orders Table
COPY Orders (Order_ID, Customer_ID, Book_ID, Order_Date, Quantity, Total_Amount)
FROM 'D:\SQL Project\OnlineBookStore SQL Project\OnlineBookStoreSQL DataSets\Orders.csv'
DELIMITER ','
CSV HEADER;