create database quanly_baidoxe
use quanly_baidoxe
create table BaiDoXe(
	tenbai nvarchar(20),
	baidoxe_id int primary key,
	diachi nvarchar(20)
)


create table ThongTinGui(
	tenxe nvarchar(20),
	biensoxe nvarchar(50) primary key,
	baidoxe_id int,
	ngayguixe datetime,
	ngaylayxe datetime,
	chiphi money,
	id_chusohuu int
)



create table chusohuu(
	id_chusohuu int primary key,
	ten nvarchar(20),
	cmtnd nvarchar(20) unique,
	diachi nvarchar(20)
)


alter table ThongTinGui
add foreign key(baidoxe_id) references BaiDoXe(baidoxe_id)

alter table ThongTinGui
add foreign key(id_chusohuu) references chusohuu(id_chusohuu)
insert into BaiDoXe(baidoxe_id, tenbai,diachi) values
(1, 'Vin1','Thanh Xuan'),
(2, 'Vin2','Bach Mai'),
(3, 'Vin3','Giai Phong')


insert into ThongTinGui(tenxe,biensoxe,baidoxe_id,ngayguixe,ngaylayxe,chiphi,id_chusohuu)values
('Vinfast', 'AB1123868', 3, '2021-03-03', '2021-03-10', 70000, 2),
('Toyota', 'AB1123989', 1, '2021-03-06', '2021-03-10', 40000, 1),
('Toyota', 'AB1123999', 1, '2021-03-05', '2021-03-10', 50000, 1),
('Vinfast', 'AB1123888', 3, '2021-03-06', '2021-03-10', 40000, 2),
('Toyota', 'AB1123777', 2, '2021-03-01', '2021-03-10', 90000, 3)

insert into chusohuu(id_chusohuu,ten,cmtnd,diachi)values
(1, 'Nam', '202631526', 'Thanh Xuan'),
(2, 'Long', '212631524', 'Giai Phong'),
(3, 'Nhan', '222631525', 'Bach Mai')

select chusohuu.cmtnd, chusohuu.ten, BaiDoXe.tenbai,ThongTinGui.biensoxe 
from chusohuu,BaiDoXe,ThongTinGui
where ThongTinGui.id_chusohuu = chusohuu.id_chusohuu 
and ThongTinGui.baidoxe_id = BaiDoXe.baidoxe_id

create proc proc_DemSoLuotGui
	@IDchusohuu int
as
begin
	select chusohuu.ten, count(ThongTinGui.id_chusohuu) as SoLanGui
	from chusohuu,ThongTinGui
	where ThongTinGui.id_chusohuu = chusohuu.id_chusohuu 
	and chusohuu.id_chusohuu = @IDchusohuu
	group by  chusohuu.ten

end

exec proc_DemSoLuotGui 1
drop proc proc_DemSoLuotGui

create proc proc_Chiphi
@IDchusohuu int
as
begin
	select chusohuu.id_chusohuu, chusohuu.ten,COUNT(ThongTinGui.id_chusohuu) as SoLanGui, Sum(ThongTinGui.chiphi) as TongChiPhi
	from chusohuu, ThongTinGui
	where chusohuu.id_chusohuu = ThongTinGui.id_chusohuu and chusohuu.id_chusohuu = @IDchusohuu
	group by chusohuu.id_chusohuu, chusohuu.ten
end 

exec proc_Chiphi 1

drop proc proc_Chiphi

create proc proc_check
	@IDchusohuu int 

as
begin
	select chusohuu.cmtnd, chusohuu.ten, BaiDoXe.tenbai, ThongTinGui.biensoxe
	from chusohuu, BaiDoXe,ThongTinGui
	where ThongTinGui.id_chusohuu = chusohuu.id_chusohuu and ThongTinGui.id_chusohuu = @IDchusohuu
end

exec proc_check 1

create proc proc_history
@IDchusohuu int
as
begin
	select chusohuu.ten, chusohuu.id_chusohuu, BaiDoXe.tenbai, ThongTinGui.biensoxe
	from chusohuu, BaiDoXe, ThongTinGui
	where ThongTinGui.id_chusohuu = chusohuu.id_chusohuu and ThongTinGui.baidoxe_id = BaiDoXe.baidoxe_id and chusohuu.id_chusohuu = @IDchusohuu
end

exec proc_history 1
