create database ProductManagementSystem

use ProductManagementSystem

create table tblUser (
	UserID INT NOT NULL,
	UserName NVARCHAR(50)
)

create table tblOrder (
	OrderID INT NOT NULL,
	UserID INT NOT NULL,
	OrderDate DATETIME
)


create table tblProduct (
	ProductID INT NOT NULL,
	ProductName NVARCHAR(50),
	Quantity INT,
	Price MONEY,
	Description NTEXT
)

create table tblOrderDetail (
	OrderID INT NOT NULL,
	ProductID INT NOT NULL,
	Quantity INT,
	Price MONEY
)


create clustered index CI_tblUser_UserID on tblUser (UserID)


alter table tblUser
add BirthDate DATETIME

alter table tblOrder
add constraint DF_tblOrder_OrderDate default getdate() for OrderDate


alter table tblUser
add constraint PK_tblUser primary key (UserID)

alter table tblOrder
add constraint PK_tblOrder primary key (OrderID)

alter table tblProduct
add constraint PK_tblProduct primary key (ProductID)

alter table tblOrderDetail
add constraint PK_tblOrderDetail primary key (OrderID, ProductID)


alter table tblOrder
add constraint FK_tblOrder_tblUser foreign key (UserID) references tblUser (UserID)

alter table tblOrderDetail
add constraint FK_tblOrderDetail_tblOrder foreign key (OrderID) references tblOrder (OrderID)

alter table tblOrderDetail
add constraint FK_tblOrderDetail_tblProduct foreign key (ProductID) references tblProduct (ProductID)


alter table tblOrder
add constraint CK_tblOrder_OrderDate check (OrderDate between '2000-01-01' and getdate())

alter table tblUser
add constraint UN_tblUser_UserName unique (UserName)

insert into tblUser(UserID, UserName, BirthDate)
values
(1 ,'stevejobs', '1996-08-28'),
(2 ,'billgates', '1998-06-18'),
(3 ,'larry', '1997-05-25'),
(4 ,'mark', '1984-03-27'),
(5 ,'dell', '1955-08-15'),
(6 ,'eric', '1955-07-28')


insert into tblOrder (OrderID, UserID, OrderDate)
values
(1, 2, '2002-12-01'),
(2, 3, '2000-03-02'),
(3, 2, '2004-08-03'),
(4, 1, '2001-05-12'),
(5, 4, '2002-10-04'),
(6, 6, '2002-03-08'),
(7, 5, '2002-05-02')


insert into tblProduct (ProductID, ProductName, Quantity, Price, Description)
values
(1, 'Asus Zen', 2, 10, 'See what others can’t see.'),
(2, 'BPhone', 10, 20, 'The first flat-design smartphone in the world.'),
(3, 'iPhone', 13, 300, 'The only thing that’s changed is everything.'),
(4, 'XPeria', 7, 80, 'The world’s first 4K smartphone.'),
(5, 'Galaxy Note', 12, 120, 'Created to reflect your desire.')

insert into tblOrderDetail (OrderID, ProductID, Quantity, Price)
values
(1, 1, 10, 10),
(1, 2, 4, 20),
(2, 3, 5, 50),
(3, 3, 6, 80),
(4, 2, 21, 120),
(5, 2, 122, 300)

update tblProduct set Price = Price * 0.9 where ProductID = 3

select tblUser.UserID, tblUser.UserName, tblOrder.OrderID, tblOrder.OrderDate, tblOrderDetail.Quantity, tblOrderDetail.Price, tblProduct.ProductName
from tblUser, tblOrder, tblOrderDetail, tblProduct
where tblProduct.ProductID = tblOrderDetail.ProductID
and tblOrderDetail.OrderID = tblOrder.OrderID
and tblOrder.UserID = tblUser.UserID
go

create view view_Top2Product
as
select tblProduct.ProductID, tblProduct.ProductName,tblOrderDetail.Price, sum(tblOrderDetail.quantity) as 'Total Quantity'
from tblOrderDetail, tblProduct
where tblOrderDetail.ProductID = tblProduct.ProductID
group by tblProduct.ProductID,ProductName,tblOrderDetail.Price

select top 2 * from view_Top2Product
order by 'Total quantity' desc

create proc sp_timsanpham
@GiaMua MONEY,
@count int output
as
begin
	select * from tblProduct
	where price <= @GiaMua
	begin
	select @count = count(*) from tblProduct
	where Price <= @GiaMua
	end

end

declare @count int 
exec sp_timsanpham 50, @count = @count output
print N'Tim thay ' + convert(nvarchar(10), @count) + 'san pham'



create trigger TG_tblProduct_Update on tblUser
for update
as 
begin 
	if update(username)
	begin 
		print N'You dont update this username column'
		rollback transaction
	end
end

update tblUser set UserName = 'BCD'where UserID = 1