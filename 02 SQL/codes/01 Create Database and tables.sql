-- Create the database
CREATE DATABASE Bookstore;

-- Select the database
USE Bookstore;

-- Create tables in the selected database
-- Table 1: Books
CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(100),
    Genre VARCHAR(50),
    Price DECIMAL(6, 2),
    PublishedDate DATE,
    Stock INT
);

-- Insert sample data
INSERT INTO Books VALUES 
(1, 'To Kill a Mockingbird', 'Harper Lee', 'Fiction', 10.99, '1960-07-11', 50),
(2, '1984', 'George Orwell', 'Dystopian', 8.99, '1949-06-08', 30),
(3, 'The Great Gatsby', 'F. Scott Fitzgerald', 'Classic', 12.99, '1925-04-10', 40),
(4, 'The Catcher in the Rye', 'J.D. Salinger', 'Fiction', 9.99, '1951-07-16', 20),
(5, 'Moby Dick', 'Herman Melville', 'Adventure', 15.99, '1851-10-18', 10);

-- Verify the data
SELECT * FROM Books;

-- Table 2: Customers
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    JoinDate DATE
);

INSERT INTO Customers VALUES 
(1, 'Alice', 'Smith', 'alice.smith@example.com', '1234567890', '2020-01-15'),
(2, 'Bob', 'Johnson', 'bob.johnson@example.com', '2345678901', '2021-03-22'),
(3, 'Charlie', 'Brown', 'charlie.brown@example.com', '3456789012', '2022-06-10'),
(4, 'David', 'Williams', 'david.williams@example.com', '4567890123', '2023-09-05'),
(5, 'Eva', 'Davis', 'eva.davis@example.com', '5678901234', '2021-11-29');

-- Table 3: Orders
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(8, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Orders VALUES 
(1, 1, '2023-11-01', 25.98),
(2, 2, '2023-11-02', 8.99),
(3, 3, '2023-11-03', 22.98),
(4, 4, '2023-11-04', 15.99),
(5, 5, '2023-11-05', 10.99);

-- Table 4: OrderDetails
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    BookID INT,
    Quantity INT,
    Subtotal DECIMAL(8, 2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

INSERT INTO OrderDetails VALUES 
(1, 1, 1, 2, 21.98),
(2, 1, 3, 1, 12.99),
(3, 2, 2, 1, 8.99),
(4, 3, 4, 2, 19.98),
(5, 4, 5, 1, 15.99);
