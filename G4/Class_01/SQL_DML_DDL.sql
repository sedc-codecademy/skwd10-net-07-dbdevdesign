
USE [SEDC]


CREATE TABLE [BusinessEntity](
	-- IDENTITY- AUTO INCREMENTS THE ID FOR US TO PREVENT US OF MAKING DUPLICATE IDS FOR DIFFERENT RECORDS
	[Id][int] IDENTITY(1,1) NOT NULL,
	[Name][nvarchar](100)NULL,
	[Region][nvarchar](1000)NULL,
	[ZipCode][nvarchar](10)NULL,
	[Size][nvarchar](10)NULL,
	CONSTRAINT [PK_BusinessEntity] PRIMARY KEY CLUSTERED([Id] ASC)
)

INSERT INTO [BusinessEntity]([Name], [Region], [Size], [ZipCode])
VALUES ('Bojans Entity', 'Skopje', '1000', '100')

SELECT * FROM [BusinessEntity]


UPDATE [BusinessEntity]
SET Name='SEDC', Region='Bitola'
WHERE Id = 1

DELETE FROM [BusinessEntity]
WHERE Name = 'Bojans Entity'