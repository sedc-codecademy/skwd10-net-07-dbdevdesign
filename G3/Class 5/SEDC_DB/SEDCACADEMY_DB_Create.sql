CREATE DATABASE SEDCACADEMY_DB;
GO

USE [SEDCACADEMY_DB]
GO

CREATE TABLE [Student](
[Id] int PRIMARY KEY IDENTITY(1,1) NOT NULL,
[FirstName] nvarchar(50) NOT NULL,
[LastName] nvarchar(50) NOT NULL,
[DateOfBirth] date NOT NULL,
[EnrolledDate] date NOT NULL,
[Gender] nvarchar(20),
[NationalIdNumber] bigint NOT NULL,
[StudentCardNumber] nvarchar(20), 
);

CREATE TABLE [Teacher](
[Id] int PRIMARY KEY IDENTITY(1,1) NOT NULL,
[FirstName] nvarchar(50) NOT NULL,
[LastName] nvarchar(50) NOT NULL,
[DateOfBirth] date NOT NULL,
[AcademicRank] nvarchar(50),
[HireDate] Date 
);

CREATE TABLE [Course](
[Id] int PRIMARY KEY IDENTITY(1,1) NOT NULL,
[Name] nvarchar(50),
[Credit] nvarchar(50),
[AcademyYear] smallint,
[Semester] nvarchar(50), 
);

EXEC sp_rename 'Course.AcademyYear', 'AcademicYear', 'COLUMN';

CREATE TABLE [Grade](
[Id] int  PRIMARY KEY IDENTITY(1,1) NOT NULL,
[StudentId] int NOT NULL,
[CourseId] int NOT NULL,
[TeacherID] int NOT NULL,
[Grade] tinyint,
[Comment] nvarchar(max),
[CreatedDate] Date
);

CREATE TABLE [AchievementType](
[Id] int PRIMARY KEY IDENTITY(1,1) NOT NULL,
[Name] nvarchar(100) NOT NULL,
[Description] nvarchar(max),
[ParticipationRate] decimal(6,4)
);

CREATE TABLE [GradeDetails](
[Id] int PRIMARY KEY IDENTITY(1,1) NOT NULL,
[GradeId] int NOT NULL,
[AchievementTypeId] int NOT NULL,
[AchievementPoints] int,
[AchievementMaxPoints] int,
[AchievementDate] Date
);
GO