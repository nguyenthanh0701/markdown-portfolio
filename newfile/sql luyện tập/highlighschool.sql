create database highlighschool
use highlighschool
Go
CREATE TABLE Major(
	MID char(5),
	mjname varchar(50),
	CONSTRAINT pk_major
	PRIMARY KEY (MID)
	)
ALTER TABLE dbo.major
	ADD DID CHAR(5)

DROP TABLE dbo.major

GO
create table student_detail(
	SDID char(5),
	ave_mark decimal(1,1)
	primary key (SDID)
	)
ALTER TABLE dbo.student_detail
ADD SID CHAR(5)
ALTER TABLE dbo.student_detail
	ADD DID CHAR(5)

ALTER TABLE dbo.student_detail
DROP COLUMN DID

GO

create table professor(
	PID char(5),
	name Nvarchar(50),
	phone int,
	primary key (PID)
	)
GO
create table colleges(
	CID char(5),
	name varchar(50),
	phone int,
	address varchar (50),
	primary key (CID)
	)
GO
create table studen_info(
	SID char(5),
	name varchar (50),
	birthday date,
	primary key (SID)
	)
ALTER TABLE dbo.studen_info
ADD DID CHAR(5)
GO
create table departments(
	DID char(5),
	name varchar(50),
	phone int,
	address varchar (50),
	chairperson varchar(50),
	primary key (DID)
	)
ALTER TABLE dbo.departments
	ADD CID CHAR(5)
GO
---Tạo khóa ngoại
ALTER TABLE dbo.professor
	ADD CONSTRAINT fk_professor
	FOREIGN KEY (DID)
	REFERENCES dbo.departments(DID)
ALTER TABLE dbo.professor
	ADD DID CHAR(5)
GO
ALTER TABLE dbo.major
	ADD CONSTRAINT fk_major
	FOREIGN KEY (DID)
	REFERENCES dbo.departments(DID)
GO
ALTER TABLE dbo.studen_info
	ADD CONSTRAINT fk_studen_info
	FOREIGN KEY (DID)
	REFERENCES dbo.departments(DID)
GO
ALTER TABLE dbo.departments
	ADD CONSTRAINT fk_departments
	FOREIGN KEY (CID)
	REFERENCES dbo.colleges(CID)
GO
ALTER TABLE dbo.student_detail
	ADD CONSTRAINT fk_student_detail
	FOREIGN KEY (SID)
	REFERENCES dbo.studen_info(SID)
