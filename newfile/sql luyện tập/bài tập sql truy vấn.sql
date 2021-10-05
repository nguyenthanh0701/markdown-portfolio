--Q1 > Truy vấn tất cả những nhân viên nữ sống ở ‘Texas’ hoặc ‘Philadelphia’,
--kết quả sắp xếp theo Tên và Họ. Có thể tham khảo kết quả dưới đây. 
--Câu truy vấn viết sẵn tên nhân viên vào sẽ không được tính điểm.

SELECT * FROM dbo.Employees WHERE Gender = '0' AND ( Address LIKE '%Texas%' OR Address LIKE '%Philadelphia%')
ORDER BY FirstName,LastName DESC
--Q2 > Tìm tất cả nhân viên có mức lương thấp hơn Lois Lane (Lois là Tên Lane là Họ). Lưu ý: Kết quả phải giống như hình bên dưới.
--Kết quả truy vấn theo tên nhân viên được liệt kê bên dưới không được tính điểm.

SELECT * FROM dbo.Employees
WHERE 
SELECT Salary FROM dbo.Employees WHERE FirstName = 'Lois')

-- Truy vấn mức lương tối đa của nhân viên. Kết quả phải giống như bên dưới.
SELECT MAX(Salary) FROM dbo.Employees

--Q4> Truy vấn tất cả tên đầy đủ của trưởng bộ phận cùng với tên bộ phận tương ứng. Kết quả chỉ bao gồm trưởng bộ phận đương nhiệm. 
--Lưu ý: Kết quả phải giống như sau:
SELECT * FROM dbo.Departments
SELECT * FROM dbo.Dept_Manager

SELECT * FROM dbo.Employees

SELECT CONCAT(E.FirstName,'',E.LastName) AS fullname, D.DepartmentName
FROM dbo.Departments AS D, dbo.Employees AS E,dbo.Dept_Manager AS DM
WHERE E.DepartmentID = D.DepartmentID AND D.DepartmentID = DM.DepartmentID 
AND DM.SSN = E.SSN AND DM.isActive = '1'
GROUP BY CONCAT(E.FirstName,'',E.LastName),D.DepartmentName

---Q5> Truy vấn tên đầy đủ của nhân viên tham gia ít nhất 2 dự án cùng với số dự án người đó tham gia.
---Lưu ý: Kết quả như hình, viết sẵn tên vào câu truy vấn không được tính điểm.
SELECT * FROM dbo.Projects
SELECT * FROM dbo.Project_Employee

SELECT CONCAT (FirstName,'',LastName) AS fullname, COUNT (dbo.Project_Employee.ProjectID) AS 'tổng dự án'
FROM dbo.Employees,dbo.Project_Employee,dbo.Projects
WHERE dbo.Employees.SSN = dbo.Project_Employee.SSN
		AND dbo.Project_Employee.ProjectID = dbo.Projects.ProjectID
		--AND (SELECT COUNT(dbo.Project_Employee.ProjectID) 
		--FROM dbo.Project_Employee 
		--WHERE dbo.Project_Employee.ProjectID = dbo.Projects.ProjectID) >= 2
GROUP BY CONCAT (FirstName,'',LastName)
HAVING COUNT(dbo.Project_Employee.ProjectID) >=2



--- tạo view dự án đang chạy và tên nhân viên tương ứng
--- truy vấn từ khung nhìn đó
ALTER VIEW project_on AS
SELECT Employees.SSN,dbo.Projects.ProjectName,FirstName
FROM dbo.Projects,dbo.Project_Employee,dbo.Employees
WHERE dbo.Employees.SSN = dbo.Project_Employee.SSN 
		AND dbo.Projects.ProjectID = dbo.Project_Employee.ProjectID
		AND dbo.Projects.EndDate IS NULL 
 SELECT * FROM dbo.project_on

---- DÙng hàm if else

declare @tuoi int
set @tuoi = 20
IF @tuoi >=20
print N'người lớn'
else print N' vị thành niên'
----dùng vòng lặp
use highlighschool
go
select * from dbo.gvien
declare @a int = 0
declare @b int = 10
while (@a < @b)
begin
insert dbo.gvien (mgv)
values (@a)
set @a +=1

end

