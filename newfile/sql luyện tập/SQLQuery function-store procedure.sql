--- store procedur
---
ALTER PROC spnhanvien 
@name NVARCHAR(20)
AS 
BEGIN 
SELECT CONCAT(FirstName,LastName )AS fullname ,SSN FROM dbo.Employees 
WHERE CONCAT(FirstName,LastName ) = @name
END 
GO

EXEC dbo.spnhanvien @name =  'cindychou'

SELECT * FROM dbo.Employees



---function (Định nghĩa một hàm người dùng tự định nghĩa để nhận bất kỳ đoạn 
---text nào rồi viết hoa chữ cái đầu và cuối của nó
---1. trả về giá trị table bằng câu lệnh đơn
ALTER FUNCTION uf_projectname (@ProjectID int)
RETURNS TABLE
AS
RETURN SELECT UPPER(ProjectName ) AS text FROM dbo.Projects 
					WHERE @ProjectID = ProjectID
SELECT * FROM dbo.uf_projectname (2)

---2. trả về gia trị vô hướng
CREATE  FUNCTION uf_projectname1 (@ProjectID int)
RETURNS nvarchar
AS
BEGIN 
DECLARE @pj NVARCHAR(50)
SELECT @pj = UPPER(ProjectName ) FROM dbo.Projects 
					WHERE @ProjectID = ProjectID
RETURN @pj
END 
USE master
GO



---viết hàm tham số truyền vào là ssn, trả về bảng ttin ssn,firstname,lastname,...)
--- hàm nội tuyến
ALTER FUNCTION f_employ (@ssn NCHAR (10))
RETURNS TABLE 
AS 
RETURN ( SELECT SSN,FirstName,LastName FROM dbo.Employees WHERE @ssn = SSN)
SELECT * FROM dbo.f_employ (IS006)


====







CREATE FUNCTION f_tinhtong(@a int,@B int)
RETURNS int 
AS 
BEGIN
DECLARE @result INT
SET @result = @a + @B
RETURN @result
END 
SELECT dbo.f_tinhtong (6,9)



SELECT * FROM dbo.Users

---