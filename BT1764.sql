create table sinhvien(
	rollno nvarchar(20) primary key,
	fullname nvarchar(20),
	age int,
	address nvarchar(50),
	email nvarchar(50),
	phoneNumber int,
	gender nvarchar(10)

)
go


create table monhoc(
	mamonhoc nvarchar (20) primary key,
	tenmonhoc nvarchar (20)

)

go
create table marks(
	mark int,
	rollno nvarchar (20) references sinhvien(rollno),
	mamonhoc nvarchar (20) references monhoc(mamonhoc),
	constraint pk_marks primary key ( mamonhoc, rollno)


)
go
create table class(
	malophoc nvarchar (20) primary key,
	tenlophoc nvarchar (20),

)
go
create table classmanage(
	malophoc nvarchar (20) references class(malophoc),
	rollno nvarchar (20) references sinhvien(rollno),
	constraint pk_classmanage primary key (malophoc, rollno)
)
go
create table phonghoc(
	tenphonghoc nvarchar (20),
	maphonghoc nvarchar (20)primary key,
	sobanhoc int,
	soghehoc int,
	diachi nvarchar(20),
	check(sobanhoc > 1),
	check(soghehoc > 1),
)
go
create table gioday(
	mamonhoc nvarchar (20) references monhoc(mamonhoc),
	malophoc nvarchar (20)references class(malophoc),
	giobatdau  datetime,
	giotralop datetime,
	maphonghoc nvarchar(20) references phonghoc(maphonghoc),
)
go
insert into sinhvien(rollno, fullname, age,address,email,phoneNumber,gender) values
	('R001','Tran Van A',20,'Nam Dinh','A@gmail.com','0921063488','nam'),
	('R002','Nguyen Van B',20,'30 thanh xuan,Ha noi','B@gmail.com','0921063488','nam'),
	('R003','Nguyen Van C',20,'30 thanh xuan,Ha noi','C@gmail.com','0921063488','nu'),
	('R004','Nguyen Van D',20,'30 thanh xuan,Ha noi','D@gmail.com','0921063488','nam'),
	('R005','Nguyen Van E',20,'30 thanh xuan,Ha noi','E@gmail.com','0921063488','nu')

insert into monhoc(mamonhoc, tenmonhoc) values
	('C201','CNTT'),
	('C202','QTKD'),
	('C203','KTCT'),
	('C204','NNA'),
	('C205','TRIET')
insert into marks(mark, rollno, mamonhoc) values
	(10,'R001','C201'),
	(9,'R002','C202'),
	(8,'R003','C203'),
	(7,'R004','C204'),
	(6,'R005','C205')

insert into class(malophoc, tenlophoc) values
	('A8','C2307LA8'),
	('C2011L','QTKD'),
	('C2012L','KTCT'),
	('C2013L','NNA'),
	('C2014L','TRIET')

insert into classmanage(malophoc, rollno) values
	('C2010L', 'R001'),
	('C2011L', 'R002'),
	('C2012L', 'R003'),
	('C2013L', 'R004'),
	('C2014L', 'R005')

insert into phonghoc(tenphonghoc, maphonghoc, sobanhoc, soghehoc, diachi) values
	('P-CNTT','1',5,20,'tang 5'),
	('P-QTKD','2',5,20,'tang 6'),
	('P-KTCT','3',5,20,'tang 7'),
	('P-NNA','4',5,20,'tang 8'),
	('P-TRIET','5',5,20,'tang 9')

insert into gioday(malophoc, giobatdau, giotralop, mamonhoc, maphonghoc) values
	('C2010L',6,8,'cntt', '1'),
	('C2011L',6,8,'qtkd', '2'),
	('C2012L',6,8,'ktct', '3'),
	('C2013L',6,8,'nna', '4'),
	('C2014L',6,8,'triet', '5')

select * from sinhvien
select * from monhoc
select * from marks
select * from class
select * from classmanage
select * from phonghoc
select * from gioday

select * from sinhvien
where sinhvien.address = 'Nam Dinh'

select * from class
where tenlophoc like '%A8%'

select sinhvien.rollno, sinhvien.fullname, monhoc.tenmonhoc, marks.mark from sinhvien, monhoc, marks
where sinhvien.rollno = marks.rollno
and monhoc.mamonhoc = marks.mamonhoc 
and sinhvien.fullname = 'Tran Van A'

select sinhvien.rollno, sinhvien.fullname, monhoc.tenmonhoc, marks.mark from sinhvien, monhoc, marks
where sinhvien.rollno = marks.rollno and monhoc.mamonhoc = marks.mamonhoc

select sinhvien.rollno, sinhvien.fullname, monhoc.tenmonhoc, marks.mark
from sinhvien left join marks on sinhvien.rollno = marks.rollno
	left join monhoc on monhoc.mamonhoc = marks.mamonhoc
