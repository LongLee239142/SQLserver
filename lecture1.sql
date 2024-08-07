USE [demo_db_19]
GO

INSERT INTO [dbo].[my_homework]
           ([user_id]
           ,[username]
           ,[password]
           ,[email]
           ,[full_name]
           ,[birth_date]
           ,[address]
           ,[phone_number]
           ,[registration_date]
           ,[last_login])
     VALUES
           (<user_id, int,>
           ,<username, varchar(50),>
           ,<password, varchar(50),>
           ,<email, varchar(50),>
           ,<full_name, varchar(50),>
           ,<birth_date, date,>
           ,<address, varchar(100),>
           ,<phone_number, int,>
           ,<registration_date, datetime,>
           ,<last_login, datetime,>)
GO

