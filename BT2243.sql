create database BT2243
go
use BT2243
go
create table trongtai(
	trongtaiID int primary key identity(1,1),
	fullname nvarchar(50) not null,
	address nvarchar(200) not null,
	level float, 
	exp date
)
go
create table lichsu(
	lichsuID int primary key identity(1,1),
	trongtaiID int,
	giaidau nvarchar(100) not null,
	ngaybat date,
	rate float,
	id_club_1 int,
	id_club_2 int,
	note nvarchar(500)
)
go
create table doibong(
	doibongid int primary key identity(1,1),
	tendoibong nvarchar(50),
	sanchunha nvarchar(100),
	huanluyenvien nvarchar(50)
)
go
create table cauthu(
	cauthuid int primary key identity(1,1),
	fullname nvarchar(50),
	birthday date,
	salary money,
	ngaybatdauda date

)
go
create table grouptable(
	id_club int,
	id_player int,
	ngaythamgiadoibong date
)
go

alter table lichsu
add constraint FK_idtrongtai foreign key (trongtaiID) references trongtai(trongtaiID)
go

alter table lichsu
add constraint FK_id_club_1 foreign key (id_club_1) references doibong(doibongid)
go

alter table lichsu
add constraint FK_id_club_2 foreign key (id_club_2) references doibong(doibongid)
go

alter table grouptable
add constraint FK_id_club foreign key (id_club) references doibong(doibongid)
go

alter table grouptable
add constraint FK_id_player foreign key (id_player) references cauthu(cauthuid)
go

insert into trongtai(fullname, address,level,exp)values
('Referee A', 'Adress A', 2, '2019-10-10'),
('Referee B', 'Adress B', 1, '2018-12-05'),
('Referee C', 'Adress C', 3, '2017-07-15'),
('Referee D', 'Adress D', 3, '2018-06-20'),
('Referee E', 'Adress E', 2, '2019-04-25')
go

insert into doibong(tendoibong,sanchunha,huanluyenvien)values
('Team 1', 'Country 1', 'Coach 1'),
('Team 2', 'Country 2', 'Coach 2'),
('Team 3', 'Country 3', 'Coach 3'),
('Team 4', 'Country 4', 'Coach 4'),
('Team 5', 'Country 5', 'Coach 5'),
('Team 6', 'Country 6', 'Coach 6')
go

insert into cauthu(fullname,birthday,salary,ngaybatdauda)values
('Player 1A', '1995-10-10', 3000.65, '2018-10-10'),
('Player 1B', '1995-10-10', 3000.65, '2018-10-10'),
('Player 1C', '1995-10-10', 3000.65, '2018-10-10'),
('Player 1D', '1995-10-10', 3000.65, '2018-10-10'),
('Player 1E', '1995-10-10', 3000.65, '2018-10-10'),
('Player 1F', '1995-10-10', 3000.65, '2018-10-10'),
('Player 2A', '1995-10-10', 3000.65, '2018-10-10'),
('Player 2B', '1995-10-10', 3000.65, '2018-10-10'),
('Player 2C', '1995-10-10', 3000.65, '2018-10-10'),
('Player 2D', '1995-10-10', 3000.65, '2018-10-10'),
('Player 2E', '1995-10-10', 3000.65, '2018-10-10'),
('Player 2F', '1995-10-10', 3000.65, '2018-10-10'),
('Player 3A', '1995-10-10', 3000.65, '2018-10-10'),
('Player 3B', '1995-10-10', 3000.65, '2018-10-10'),
('Player 3C', '1995-10-10', 3000.65, '2018-10-10'),
('Player 3D', '1995-10-10', 3000.65, '2018-10-10'),
('Player 3E', '1995-10-10', 3000.65, '2018-10-10'),
('Player 3F', '1995-10-10', 3000.65, '2018-10-10'),
('Player 4A', '1995-10-10', 3000.65, '2018-10-10'),
('Player 4B', '1995-10-10', 3000.65, '2018-10-10'),
('Player 4C', '1995-10-10', 3000.65, '2018-10-10'),
('Player 4D', '1995-10-10', 3000.65, '2018-10-10'),
('Player 4E', '1995-10-10', 3000.65, '2018-10-10'),
('Player 4F', '1995-10-10', 3000.65, '2018-10-10'),
('Player 5A', '1995-10-10', 3000.65, '2018-10-10'),
('Player 5B', '1995-10-10', 3000.65, '2018-10-10'),
('Player 5C', '1995-10-10', 3000.65, '2018-10-10'),
('Player 5D', '1995-10-10', 3000.65, '2018-10-10'),
('Player 5E', '1995-10-10', 3000.65, '2018-10-10'),
('Player 5F', '1995-10-10', 3000.65, '2018-10-10'),
('Player 6A', '1995-10-10', 3000.65, '2018-10-10'),
('Player 6B', '1995-10-10', 3000.65, '2018-10-10'),
('Player 6C', '1995-10-10', 3000.65, '2018-10-10'),
('Player 6D', '1995-10-10', 3000.65, '2018-10-10'),
('Player 6E', '1995-10-10', 3000.65, '2018-10-10'),
('Player 6F', '1995-10-10', 3000.65, '2018-10-10')
go

insert into grouptable(id_club,id_player,ngaythamgiadoibong)values
(1, 1, '2017-10-10'),
(1, 2, '2017-10-10'),
(1, 3, '2017-10-10'),
(1, 4, '2017-10-10'),
(1, 5, '2017-10-10'),
(1, 6, '2017-10-10'),
(2, 7, '2017-10-10'),
(2, 8, '2017-10-10'),
(2, 9, '2017-10-10'),
(2, 10, '2017-10-10'),
(2, 11, '2017-10-10'),
(2, 12, '2017-10-10'),
(3, 13, '2017-10-10'),
(3, 14, '2017-10-10'),
(3, 15, '2017-10-10'),
(3, 16, '2017-10-10'),
(3, 17, '2017-10-10'),
(3, 18, '2017-10-10'),
(4, 19, '2017-10-10'),
(4, 20, '2017-10-10'),
(4, 21, '2017-10-10'),
(4, 22, '2017-10-10'),
(4, 23, '2017-10-10'),
(4, 24, '2017-10-10'),
(5, 25, '2017-10-10'),
(5, 26, '2017-10-10'),
(5, 27, '2017-10-10'),
(5, 28, '2017-10-10'),
(5, 29, '2017-10-10'),
(5, 30, '2017-10-10'),
(6, 31, '2017-10-10'),
(6, 32, '2017-10-10'),
(6, 33, '2017-10-10'),
(6, 34, '2017-10-10'),
(6, 35, '2017-10-10'),
(6, 36, '2017-10-10')
go
insert into lichsu(trongtaiID, giaidau, ngaybat,rate,id_club_1,id_club_2)values
(1, 'League X', '2019-10-10', 7.5, 1, 2),
(1, 'League Y', '2019-10-10', 5.5, 2, 3),
(1, 'League Z', '2019-10-10', 9.0, 3, 4),
(2, 'League X', '2019-10-10', 6.5, 4, 5),
(3, 'League X', '2019-10-10', 5.0, 5, 6),
(4, 'League X', '2019-10-10', 7.5, 6, 1),
(4, 'League Y', '2019-10-10', 4.5, 2, 5),
(5, 'League X', '2019-10-10', 9.5, 6, 4),
(5, 'League Y', '2019-10-10', 8.0, 4, 3)
go


--bai 3
create view view_referee_history
as
select trongtai.fullname 'Ten trong tai' , trongtai.level 'Cap do trong tai', trongtai.exp'Ngay bat dau tham gia lam trong tai',lichsu.giaidau'Giai bong', lichsu.id_club_1 'Doi bong 1', lichsu.id_club_2 'Doi bong 2'
from trongtai, lichsu
where trongtai.trongtaiID = lichsu.trongtaiID
go

select * from view_referee_history
go

--bai 4
create view view_cauthu
as
select cauthu.fullname, doibong.tendoibong
from cauthu, doibong, grouptable
where cauthu.cauthuid = grouptable.id_player
and grouptable.id_club = doibong.doibongid
go

select * from view_cauthu 
go

--bai 5

create proc proc_find_referee
	@teamID int
as
begin	
	select trongtai.fullname, trongtai.level, trongtai.exp, lichsu.giaidau, lichsu.id_club_1, lichsu.id_club_2
from trongtai, lichsu
where trongtai.trongtaiID = lichsu.trongtaiID
and lichsu.id_club_1 = @teamID
or lichsu.id_club_2 = @teamID
end
go

exec proc_find_referee 1
go

drop proc proc_find_referee
