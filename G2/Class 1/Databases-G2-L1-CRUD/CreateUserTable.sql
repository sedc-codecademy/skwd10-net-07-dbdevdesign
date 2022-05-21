USE [master];

CREATE TABLE [User] (
[Id]  INT PRIMARY KEY NOT NULL,
[Username] NVARCHAR(100) NOT NULL,
[Password] NVARCHAR(60) NOT NULL,
[FirstName] NVARCHAR(255) NOT NULL,
[LastName] NVARCHAR(255) NOT NULL
);

INSERT INTO [User] VALUES (1, 'mikid', 'mikidd', 'Mihajlo', 'Dimovski');
INSERT INTO [User] VALUES (2, 'dimitar99', 'dime69', 'Dimitar', 'Josifovski');
INSERT INTO [User]([Id], [Password], [FirstName], [LastName], [Username]) VALUES (3, 'bokinajjak', 'Bojan', 'Damcevski', 'boki13');

SELECT [Username], [FirstName], [Id], [Password] FROM [User];

UPDATE [User] SET [Password]='IChangedThePassword';

ALTER TABLE [User] ADD [Age] INT;

SELECT * FROM [User];

UPDATE [User] SET [Age] = 25;

DELETE [User];

DROP TABLE [User]