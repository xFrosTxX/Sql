-- Use Database
USE database_name;

-- Create Tables
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Address VARCHAR(255)
);

CREATE TABLE Accounts (
    AccountID INT PRIMARY KEY,
    CustomerID INT,
    AccountType VARCHAR(50),
    Balance DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY,
    AccountID INT,
    Amount DECIMAL(10,2),
    Date DATE,
    FOREIGN KEY (AccountID) REFERENCES Accounts(AccountID)
);

CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    UserName VARCHAR(100),
    Password VARCHAR(100)
);

-- Show Tables
SHOW TABLES;

-- Describe Tables
DESCRIBE Accounts;
DESCRIBE Customers;
DESCRIBE Transactions;
DESCRIBE Users;

-- Insert Values into Tables
INSERT INTO Customers (CustomerID, Name, Address) VALUES (1, 'John Doe', '123 Main St');
INSERT INTO Accounts (AccountID, CustomerID, AccountType, Balance) VALUES (101, 1, 'Savings', 5000.00);
INSERT INTO Transactions (TransactionID, AccountID, Amount, Date) VALUES (201, 101, 200.00, '2024-01-01');
INSERT INTO Users (UserID, UserName, Password) VALUES (1, 'johndoe', 'password123');

-- Join Operations
-- Inner Join
SELECT Customers.Name, Accounts.AccountType 
FROM Customers
INNER JOIN Accounts ON Customers.CustomerID = Accounts.CustomerID;

-- Left Join
SELECT Customers.Name, Accounts.AccountType 
FROM Customers
LEFT JOIN Accounts ON Customers.CustomerID = Accounts.CustomerID;

-- Right Join
SELECT Customers.Name, Accounts.AccountType 
FROM Customers
RIGHT JOIN Accounts ON Customers.CustomerID = Accounts.CustomerID;

-- Full Outer Join
SELECT Customers.Name, Accounts.AccountType 
FROM Customers
FULL OUTER JOIN Accounts ON Customers.CustomerID = Accounts.CustomerID;

-- Specific Querying Operations
-- List of all customers and their account details
SELECT Customers.Name, Accounts.AccountType, Accounts.Balance 
FROM Customers
JOIN Accounts ON Customers.CustomerID = Accounts.CustomerID;

-- List of the accounts and their users
SELECT Accounts.AccountID, Users.UserName 
FROM Accounts
JOIN Users ON Accounts.CustomerID = Users.UserID;

-- List of all transactions and accounts
SELECT Transactions.TransactionID, Transactions.Amount, Accounts.AccountID 
FROM Transactions
JOIN Accounts ON Transactions.AccountID = Accounts.AccountID;

-- Cross Product Operation
SELECT * FROM Customers, Accounts;

-- Selection Operation
SELECT * FROM Accounts WHERE Balance > 1000;

-- Projection Operation
SELECT Name, Address FROM Customers;

START TRANSACTION;

-- Step 1: Deduct the transfer amount from the sender's account
UPDATE Accounts
SET Balance = Balance - 150
WHERE AccountID = 1;

-- Step 2: Add the transfer amount to the receiver's account
UPDATE Accounts
SET Balance = Balance + 150
WHERE AccountID = 2;

-- Step 3: Record the transaction for sender (withdrawal)
INSERT INTO Transactions (AccountID, TransactionType, Amount)
VALUES (1, 'Withdrawal', 150);

-- Step 4: Record the transaction for receiver (deposit)
INSERT INTO Transactions (AccountID, TransactionType, Amount)
VALUES (2, 'Deposit', 150);

-- If no error occurs, commit the transaction
COMMIT;
