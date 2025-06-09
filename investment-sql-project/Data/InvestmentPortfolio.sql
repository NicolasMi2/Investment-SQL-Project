
-- Create database
CREATE DATABASE InvestmentPortfolio;
GO

USE InvestmentPortfolio;
GO

-- Customer table
CREATE TABLE Clients (
    ClientID INT PRIMARY KEY,
    Name VARCHAR(100),
    Country VARCHAR(50),
    AUM DECIMAL(15,2)
);

-- Stocks Table
CREATE TABLE Stocks (
    StockID INT PRIMARY KEY,
    Ticker VARCHAR(10),
    Company VARCHAR(100),
    Sector VARCHAR(50),
    Price DECIMAL(10,2)
);

-- Transaction Table
CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY,
    ClientID INT,
    StockID INT,
    Quantity INT,
    Price_at_Buy DECIMAL(10,2),
    Date DATE,
    FOREIGN KEY (ClientID) REFERENCES Clients(ClientID),
    FOREIGN KEY (StockID) REFERENCES Stocks(StockID)
);

-- Insert data into the Clients table
INSERT INTO Clients (ClientID, Name, Country, AUM) VALUES
(1, 'Lucas Silva', 'Brazil', 2500000),
(2, 'Anna Costa', 'USA', 4200000),
(3, 'Pedro Lima', 'Brazil', 1800000);

-- Inserir dados na tabela Stocks
Insert data into the Stocks table
INSERT INTO Stocks (StockID, Ticker, Company, Sector, Price) VALUES
(1, 'AAPL', 'Apple Inc.', 'Technology', 180),
(2, 'MSFT', 'Microsoft Corp.', 'Technology', 310),
(3, 'JPM', 'JPMorgan Chase', 'Financials', 140),
(4, 'TSLA', 'Tesla Inc.', 'Automotive', 250),
(5, 'AMZN', 'Amazon.com Inc.', 'Consumer Discretionary', 120);

-- Insert data into the Transactions table
INSERT INTO Transactions (TransactionID, ClientID, StockID, Quantity, Price_at_Buy, Date) VALUES
(101, 1, 1, 100, 150, '2024-01-15'),
(102, 2, 3, 50, 130, '2024-01-17'),
(103, 1, 2, 70, 280, '2024-02-10'),
(104, 3, 4, 40, 230, '2024-03-01'),
(105, 1, 5, 60, 100, '2024-04-05'),
(106, 2, 2, 30, 300, '2024-05-01'),
(107, 3, 3, 80, 125, '2024-05-10');
