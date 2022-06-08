USE [master]

DROP DATABASE IF EXISTS MYPIZZA_DB
GO

CREATE DATABASE MYPIZZA_DB
GO

USE [MYPIZZA_DB]
GO


-- Tables 
-- Users, Roles, UserRoles, Pizzas, PizzaSizes, Toppings, PizzaTopings, Orders, OrderDetails

DROP TABLE IF EXISTS [dbo].[Users]
DROP TABLE IF EXISTS [dbo].[Roles]
DROP TABLE IF EXISTS [dbo].[UserRoles]
DROP TABLE IF EXISTS [dbo].[Pizzas]
DROP TABLE IF EXISTS [dbo].[PizzaSizes]
DROP TABLE IF EXISTS [dbo].[Toppings]
DROP TABLE IF EXISTS [dbo].[PizzaToppings]
DROP TABLE IF EXISTS [dbo].[Orders]
DROP TABLE IF EXISTS [dbo].[OrderDetails]
GO


-- Users table

CREATE TABLE Users(
	Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	FirstName NVARCHAR(100) NOT NULL,
	LastName NVARCHAR(100) NOT NULL,
	Address NVARCHAR(255) NOT NULL,
	Phone NVARCHAR(50) NOT NULL
)

-- Roles 
CREATE TABLE Roles(
	Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	Name NVARCHAR (100) NOT NULL,
)

-- UserRoles 
CREATE TABLE UserRoles(
	Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	UserId INT NOT NULL, 
	RoleId INT NOT NULL
)

-- Pizzas
CREATE TABLE Pizzas(
	Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	Name NVARCHAR(100) NOT NULL,
	SizeId SMALLINT NOT NULL,
	Price DECIMAL(5, 2) NOT NULL
)

-- PizzaSizes
CREATE TABLE PizzaSizes(
	Id SMALLINT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	Name NVARCHAR(10) NOT NULL,
)

-- Toppings
CREATE TABLE Toppings(
	Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	Name NVARCHAR(100) NOT NULL,
	Price DECIMAL(5, 2) NOT NULL
)

-- PizzaToppings
CREATE TABLE PizzaToppings(
	Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	PizzaId INT NOT NULL,
	ToppingId INT NOT NULL
)

CREATE TABLE Orders(
	Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	Price DECIMAL(18,2) NOT NULL,
	IsDelivered bit NOT NULL,
	UserId INT NOT NULL, 
	DateCreated DATETIME NOT NULL
)

CREATE TABLE OrderDetails(
	Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	OrderId INT NOT NULL,
	PizzaId INT NOT NULL,
)
GO


/* CREATE RELATIONSHIPS */

ALTER TABLE Orders ADD CONSTRAINT FK_Orders_User FOREIGN KEY (UserId)
REFERENCES Users(Id)
GO

ALTER TABLE Pizzas ADD CONSTRAINT FK_Pizzas_PizzaSize FOREIGN KEY (SizeId)
REFERENCES PizzaSizes(Id)
GO

ALTER TABLE OrderDetails ADD CONSTRAINT FK_OrderDetails_Pizza FOREIGN KEY (PizzaId)
REFERENCES Pizzas(Id)
GO

ALTER TABLE OrderDetails ADD CONSTRAINT FK_OrderDetails_Order FOREIGN KEY (OrderId)
REFERENCES Orders(Id)
GO

ALTER TABLE PizzaToppings ADD CONSTRAINT FK_PizzaToppings_Pizza FOREIGN KEY (PizzaId)
REFERENCES Pizzas(Id)
GO

ALTER TABLE PizzaToppings ADD CONSTRAINT FK_PizzaToppings_Topping FOREIGN KEY (ToppingId)
REFERENCES Toppings(Id)
GO

ALTER TABLE UserRoles ADD CONSTRAINT FK_UserRoles_User FOREIGN KEY (UserId)
REFERENCES Users(Id)
GO

ALTER TABLE UserRoles ADD CONSTRAINT FK_UserRoles_Role FOREIGN KEY (RoleId)
REFERENCES Roles(Id)
GO


/* Data Inserts */

/* ------------------------------------------------------------------------ */

INSERT INTO Users(FirstName, LastName, Address, Phone)
VALUES('Bob', 'Bobsky', 'Bob Street 22', '070111222')

INSERT INTO Users(FirstName, LastName, Address, Phone)
VALUES('Jill', 'Wayne', 'Jill Street 22', '070222333')

INSERT INTO Users(FirstName, LastName, Address, Phone)
VALUES('Greg', 'Gregsky', 'Greg Street 22', '070333444')

GO

/* ------------------------------------------------------------------------ */

INSERT INTO PizzaSizes(Name)
VALUES('Small')

INSERT INTO PizzaSizes(Name)
VALUES('Medium')

INSERT INTO PizzaSizes(Name)
VALUES('Large')

INSERT INTO PizzaSizes(Name)
VALUES('Family')

GO

/* ------------------------------------------------------------------------ */

INSERT INTO Orders(Price, IsDelivered, UserId, DateCreated)
VALUES(120, 1, 1, GETDATE())

INSERT INTO Orders(Price, IsDelivered, UserId, DateCreated)
VALUES(150, 1, 1, GETDATE())

INSERT INTO Orders(Price, IsDelivered, UserId, DateCreated)
VALUES(220, 0, 1, GETDATE())

INSERT INTO Orders(Price, IsDelivered, UserId, DateCreated)
VALUES(420, 0, 2, GETDATE())

INSERT INTO Orders(Price, IsDelivered, UserId, DateCreated)
VALUES(530, 1, 3, GETDATE())

GO

/* ------------------------------------------------------------------------ */

INSERT INTO Pizzas(Name, SizeId, Price)
VALUES('Capricciosa', 1, 100)

INSERT INTO Pizzas(Name, SizeId, Price)
VALUES('Pepperoni', 3, 400)

INSERT INTO Pizzas(Name, SizeId, Price)
VALUES('Margarita', 2, 200)

INSERT INTO Pizzas(Name, SizeId, Price)
VALUES('Seafood', 2, 500)

INSERT INTO Pizzas(Name, SizeId, Price)
VALUES('Hawaiian', 2, 300)

INSERT INTO Pizzas(Name, SizeId, Price)
VALUES('Capricciosa', 2, 420)

INSERT INTO Pizzas(Name, SizeId, Price)
VALUES('Pepperoni', 4, 320)

INSERT INTO Pizzas(Name, SizeId, Price)
VALUES('Capricciosa', 3, 320)

INSERT INTO Pizzas(Name, SizeId, Price)
VALUES('Hawaiian', 4, 450)

INSERT INTO Pizzas(Name, SizeId, Price)
VALUES('Capricciosa', 3, 400)

INSERT INTO Pizzas(Name, SizeId, Price)
VALUES('Margarita', 4, 400)

INSERT INTO Pizzas(Name, SizeId, Price)
VALUES('Seafood', 3, 505)

INSERT INTO Pizzas(Name, SizeId, Price)
VALUES('Pepperoni', 3, 420)

INSERT INTO Pizzas(Name, SizeId, Price)
VALUES('Capricciosa', 4, 300)

GO

/* ------------------------------------------------------------------------ */

INSERT INTO Toppings(Name, Price)
VALUES('Cheese', 40)

INSERT INTO Toppings(Name, Price)
VALUES('Mushrooms', 30)

INSERT INTO Toppings(Name, Price)
VALUES('Bacon', 10)

INSERT INTO Toppings(Name, Price)
VALUES('Onions', 30)

INSERT INTO Toppings(Name, Price)
VALUES('Garlic', 50)

GO
/* ------------------------------------------------------------------------ */

INSERT INTO PizzaToppings(PizzaId, ToppingId)
VALUES(1, 1)

INSERT INTO PizzaToppings(PizzaId, ToppingId)
VALUES(1, 3)

INSERT INTO PizzaToppings(PizzaId, ToppingId)
VALUES(2, 1)

INSERT INTO PizzaToppings(PizzaId, ToppingId)
VALUES(4, 3)

INSERT INTO PizzaToppings(PizzaId, ToppingId)
VALUES(4, 5)

INSERT INTO PizzaToppings(PizzaId, ToppingId)
VALUES(6, 1)

INSERT INTO PizzaToppings(PizzaId, ToppingId)
VALUES(7, 1)

INSERT INTO PizzaToppings(PizzaId, ToppingId)
VALUES(9, 2)

INSERT INTO PizzaToppings(PizzaId, ToppingId)
VALUES(10, 4)

INSERT INTO PizzaToppings(PizzaId, ToppingId)
VALUES(11, 1)

INSERT INTO PizzaToppings(PizzaId, ToppingId)
VALUES(11, 5)

INSERT INTO PizzaToppings(PizzaId, ToppingId)
VALUES(12, 4)

INSERT INTO PizzaToppings(PizzaId, ToppingId)
VALUES(14, 1)

INSERT INTO PizzaToppings(PizzaId, ToppingId)
VALUES(14, 2)

GO
/* ------------------------------------------------------------------------ */

INSERT INTO OrderDetails(OrderId, PizzaId)
VALUES (1, 1), (1, 2), (1, 3), 
	   (2, 1), (2, 4), (2, 6), (2, 14),
	   (3, 1), (3, 3), (3, 10), (3, 14),
	   (4, 1), (4, 4), (4, 6), (4, 14)


INSERT INTO Roles(Name) 
VALUES ('Admin'), ('Manager'), ('Employee')
GO

INSERT INTO UserRoles(UserId, RoleId)
VALUES (1, 1), (2, 3), (3, 2), (1, 2), (1, 3)
GO



-- Create function and name it GetUserFullName, 
-- that will CONCAT the FirstName and the LastName of the users




















