
---1.Truy vấn bao gồm các toán tử AND, OR, LIKE
---Liệt kê thông tin username có tên là Lý hoặc Tâm và có nghề nghiệp kinh doanh
SELECT * FROM dbo.Users	
	WHERE (username LIKE N'%Lý' OR username LIKE N'%Tâm%')
	AND  jobs like '%kinh doanh%'

---2.Truy vấn bao gồm order by và inner join
---Liệt kê tên và tuổi của những người có tổng bạn lớn hơn 2
SELECT DISTINCT dbo.Users.username,YEAR(GETDATE()) - YEAR(birth_of_date) AS N'tuổi'  
	FROM dbo.Users,dbo.Friendlist
WHERE dbo.Users.UserID = dbo.Friendlist.UserID AND 
	(SELECT COUNT(dbo.Friendlist.UserID)
	FROM dbo.Friendlist 
	WHERE dbo.Users.UserID = dbo.Friendlist.UserID)>=2
	ORDER BY tuổi ASC

---3. Truy vấn outer join ( full outer join,left join)
SELECT dbo.Post.*, dbo.Users.* FROM dbo.Post 
		FULL OUTER JOIN dbo.Users 
		ON dbo.Post.USERID = dbo.Users.UserID
		ORDER BY jobs ASC
GO

SELECT dbo.Post.*, dbo.Users.* FROM dbo.Post 
		LEFT OUTER JOIN dbo.Users 
		ON dbo.Post.USERID = dbo.Users.UserID

---4. Truy vấn bao gồm AGGREGATION FUNCTION, GROUP BY và HAVING
------Truy xuất user có tổng bạn lớn hơn 2 và tổng số bạn
SELECT COUNT(dbo.Friendlist.UserID) AS N'tổng số bạn',
			dbo.Users.username
FROM dbo.Friendlist,dbo.Users
WHERE dbo.Users.UserID = dbo.Friendlist.UserID
GROUP BY dbo.Friendlist.UserID,dbo.Users.username
HAVING COUNT(dbo.Friendlist.UserID)>=2

---5.Truy vấn bao gồm subquery ( 2 ví dụ):
--VD1: GIống với câu 4 nhưng dùng subquery để truy vấn
SELECT COUNT(dbo.Friendlist.UserID) AS N'tổng số bạn',dbo.Users.username
FROM dbo.Friendlist,dbo.Users
WHERE dbo.Users.UserID = dbo.Friendlist.UserID AND 
	(SELECT COUNT(dbo.Friendlist.UserID)
	FROM dbo.Friendlist 
	WHERE dbo.Users.UserID = dbo.Friendlist.UserID)>=2
GROUP BY dbo.Users.username,dbo.Friendlist.UserID

GO
---VD2: liệt kê tên và nội dung comment tương ứng khi tổng comment của user đó nhỏ hơn 2
SELECT dbo.Users.username,dbo.comments.content
	,COUNT(dbo.User_comment.CID) AS N'số lượng comment'
FROM dbo.User_comment,dbo.Users,dbo.comments
WHERE dbo.Users.UserID = dbo.User_comment.UserID AND 
	dbo.User_comment.CID  = dbo.comments.CID AND 
	(SELECT  FROM dbo.User_comment
	WHERE dbo.User_comment.CID  = dbo.comments.CID)<2
GROUP BY dbo.Users.username,dbo.comments.content
ORDER BY content DESC

---6. Tạo index
---Tất cả khóa chính của các bảng đã được tự động tạo index rồi. Nên tôi lựa chọn
---tạo index Username. Với bản thiết kế này thì username cũng có tần suất sử dụng khá nhiều
---còn lại nội dung ko phù hợp

GO
CREATE INDEX ID_Username
ON dbo.Users (username)

GO
--- Sử dụng index để tối ưu hóa truy vấn SQL (Sửa tiêu chí 12)

---Trong câu (1.truy vấn bao gồm các toán tử AND, OR, LIKE)
---+ Nên rõ tên cột trong câu select,không nên select *  vì nó 
---sẽ trả về mọi cột trong bảng và còn cản trở việc sử dụng index
---+ Sử dụng Index hint để bắt buộc trình tối ưu hoá truy vấn sử dụng index.

SELECT username,jobs FROM dbo.Users WITH(INDEX = pk_Users)
	WHERE (username LIKE N'%Lý' OR username LIKE N'%Tâm')
	AND  jobs like 'kinh doanh%'
---+Trong câu truy vấn có 1/nhiều OR có thể viết lại bằng cách kết hợp 
---UNION ALL để tăng tốc độ truy vấn.
SELECT username,jobs FROM dbo.Users WITH(INDEX = pk_Users)
	WHERE username LIKE N'%Lý' AND  jobs like 'kinh doanh%'
UNION ALL 
SELECT username,jobs FROM dbo.Users WITH(INDEX = pk_Users)
	WHERE username LIKE N'%Tâm' AND  jobs like 'kinh doanh%'
