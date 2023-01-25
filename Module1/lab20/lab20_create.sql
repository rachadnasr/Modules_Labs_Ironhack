-- Challenge 2

-- 1. Create a MySQL database for this lab. You can do so in the command line like this:

-- $ mysql -u your_username -p
CREATE DATABASE IF NOT EXISTS lab20_mysql;
-- Query OK, 1 row affected (0.02 sec)
USE lab20_mysql;

CREATE TABLE IF NOT EXISTS Cars (
	id int,
    VIN_car varchar(255),
	Manufacturer varchar(255),
	Model  varchar(255),
    Year int, 
    Color varchar(255),
	PRIMARY KEY(VIN_car)
);

CREATE TABLE IF NOT EXISTS Customers (
	id int,
    CustomerID int,
	Name varchar(255),
	PhoneNumber varchar(255),
    Email varchar(255),
    Adress varchar(255),
    City varchar(255),
    State_Province varchar(255),
    Country varchar(255),
    Zip_Postal varchar(255),
	PRIMARY KEY(CustomerID)
);

CREATE TABLE IF NOT EXISTS Sales_Person (
	id int,
    StaffID varchar(255),
	Name varchar(255),
	Store  varchar(255),
    PRIMARY KEY(StaffID)
);	

CREATE TABLE IF NOT EXISTS Invoices (
	id int,
    InvoiceID int,
	Date_Invoice varchar(255),
	VIN_car varchar(255),
    CustomerID int, 
    StaffID varchar(255),
	PRIMARY KEY(InvoiceID),
    FOREIGN KEY (VIN_car) REFERENCES Cars(VIN_car),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (StaffID) REFERENCES Sales_Person(StaffID)
);	