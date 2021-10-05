--tao database
create database QuanLySinhVien

drop database sample
--
create table sinhvien(
MSV char(5),
Hoten Nvarchar(50)
)

create table lophoc(
    malop char(5) not null,
    tenlop nvarchar(50)
)

alter table dbo.lophoc
add constraint pk_lop
primary key (malop)


alter table dbo.sinhvien 
add constraint pk_sinhvien
primary key (MSV)
--
create table monhoc(
	Mamon char(5),
	tenmon Nvarchar(50)
	constraint pk_monhoc
	primary key (mamon)
	)
--
create table giaovien(
	MGV char(5),
	hoten Nvarchar(50),
	gioitinh varchar(50) check (gioitinh in ('nam', N'nữ'))
	primary key (MGV)
	)
---
create table giaovien(
	MGV char(5),
	hoten Nvarchar(50),
	gioitinh varchar(50) check (gioitinh in ('nam',N'nữ'))
	primary key (MGV)
	)
---
alter table giaovien
	add constraint ck_gioitinh
	check(gioitinh in (N'nam',N'nữ'))
--
alter table giaovien
add sonamlamviec int
--
alter table giaovien
drop constraint ck_gioitinh
--
alter table giaovien
drop column gioitinh
--
drop table monhoc
--
sp_help sinhvien
--
create table khoa(
	makhoa char(5),
	tenkhoa nvarchar(50),
	primary key (makhoa)
	)
	--
alter table giaovien
add makhoa char(5)
--
alter table giaovien
add constraint fk_gv_khoa
foreign key (makhoa)
references khoa (makhoa)

--
insert into khoa(makhoa,tenkhoa)
values('001','toan tin')
insert into khoa(makhoa,tenkhoa)
values('002','toan2')
insert into khoa(makhoa,tenkhoa)
values('003','toan3')
go
alter table sinhvien
alter column hoten nvarchar(50)
insert into sinhvien(msv,hoten)
values ('001',N'nguyễn văn sơn')

GO

alter table sinhvien
add ngaysinh date

insert into sinhvien(msv,hoten,ngaysinh)
values ('003',N'Nguyễn thị thanh','1/7/1988')

insert into lophoc(malop,tenlop)
values ('001','lop 1')
insert into lophoc(malop,tenlop)
values ('002','null')
GO
select *
from khoa
---
select *
from khoa
where makhoa='003'

select *	
from khoa
where tenkhoa='toan3'
---
select*
from sinhvien
---
update sinhvien
set hoten = N'nguyễn thị thanh'
where year(ngaysinh)=1988

SELECT * FROM dbo.sinhvien

CREATE VIEW sinhviensv AS SELECT MSV,Hoten FROM dbo.sinhvien
GO

ALTER TABLE dbo.sinhvien
ADD diachi char(10)
GO 
insert into sinhvien(msv,hoten,ngaysinh)
values ('004',N'Nguyễn thị Yến','2/7/1998')


SELECT * FROM sinhviensv