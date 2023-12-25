create database hotel_ql
use hotel_ql
create table hotel(
	id int primary key identity (1,1),
	name nvarchar(50) not null,
	address nvarchar(50) not null,
	area float, 
	owner_name nvarchar(50)
)

create table room(
	room_no nvarchar(20) primary key,
	id_hotel int references hotel(id),
	area float,
	type nvarchar(20),
	floor int
)

create table book(
	id int primary key identity(1,1),
	room_no nvarchar(20) references room(room_no),
	checkin datetime,
	checkout datetime,
	amount int
)

insert into hotel (name, address, area, owner_name)
values
('A1', '54 Le Thanh Nghi', '200', 'A'),
('A2', '285 Doi Can', '300', 'A'),
('A3', '12 Tran Duy Hung', '50', 'B')

insert into room(room_no, id_hotel, area, type, floor)
values
('R001', 1, 20, 'NORMAL', 1),
('R002', 1, 15, 'VIP', 2),
('R003', 1, 30, 'VIP', 2),
('K001', 2, 20, 'NORMAL', 1),
('K002', 2, 20, 'VIP', 2)

insert into book (room_no, checkin, checkout, amount)
values
('R001', '2021-01-15 10:00:00', '2021-01-16 18:00:00', 2),
('R001', '2021-03-02 10:00:00', '2021-03-04 18:00:00', 2),
('R002', '2021-02-05 10:00:00', '2021-02-06 18:00:00', 4),
('R002', '2021-01-15 10:00:00', '2021-01-16 18:00:00', 2),
('K001', '2021-02-15 10:00:00', '2021-02-16 18:00:00', 3),
('K002', '2021-02-15 10:00:00', '2021-02-16 18:00:00', 6),
('R003', '2021-02-15 10:00:00', '2021-02-16 18:00:00', 4)

