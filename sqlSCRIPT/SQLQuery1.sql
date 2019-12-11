USE master  
CREATE DATABASE SarathlalDb;  
  
GO  
  
USE SarathlalDb  
  
CREATE TABLE [dbo].[City] (  
    [Id]    INT           IDENTITY (1, 1) NOT NULL,  
    [Name]  NVARCHAR (250) NULL,  
    [State] NVARCHAR (250) NULL,  
    PRIMARY KEY CLUSTERED ([Id] ASC)  
);  
  
GO  
  
CREATE TABLE [dbo].[Employees] (  
    [Id]          INT            IDENTITY (1, 1) NOT NULL,  
    [Name]        NVARCHAR (250) NULL,  
    [Department]  NVARCHAR (250) NULL,  
    [Designation] NVARCHAR (250) NULL,  
    [Company]     NVARCHAR (250) NULL,  
    [CityId]      INT            NULL,  
    CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED ([Id] ASC)  
);  
  
GO  
  
CREATE PROCEDURE [dbo].Add_Employee  
    @Name NVARCHAR(250),  
    @Department NVARCHAR(250),  
    @Designation NVARCHAR(250),  
    @Company NVARCHAR(250),  
    @CityId INT  
AS  
    INSERT INTO dbo.Employees (Name,Department,Designation,Company,CityId)  
    VALUES (@Name,@Department,@Designation,@Company,@CityId)         
  
GO  
  
CREATE PROCEDURE [dbo].Delete_Employee  
    @Id INT  
AS  
    DELETE FROM dbo.Employees WHERE Id = @Id   
  
GO  
  
CREATE PROCEDURE [dbo].[Get_AllEmployees]  
AS  
    SELECT emp.*,c.Name CityName FROM dbo.Employees emp LEFT JOIN dbo.City c ON emp.CityId = c.Id ORDER BY emp.Name    
  
GO  
  
CREATE PROCEDURE [dbo].Get_SingleEmployee  
    @Id INT  
AS  
    SELECT emp.*,c.Name CityName from dbo.Employees emp LEFT JOIN dbo.City c ON emp.CityId = c.Id WHERE emp.Id = @Id   
  
GO  
  
CREATE PROCEDURE [dbo].Update_Employee  
    @Id INT,  
    @Name VARCHAR(250),  
    @Department VARCHAR(250),  
    @Designation VARCHAR(250),  
    @Company VARCHAR(250),  
    @CityId INT  
AS  
    UPDATE dbo.Employees SET Name = @Name, Department = @Department, Designation = @Designation, Company = @Company, CityId = @CityId Where Id = @Id   
  
GO  