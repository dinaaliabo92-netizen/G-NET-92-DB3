CREATE DATABASE OnlineStore;

CREATE TABLE Products(
Proudact_Id int primary key,
StokeQuntity int not null,
Name varchar(50),
AddDate DATETIME,
Discription varchar(200),
UintPrice decimal,

)
go
CREATE TABLE Suppliers(
SupId int primary key Identity,
Name varchar(100) not null,
Country varchar (20),
Email varchar (50) not null,
Address varchar (50) not null,
Phone varchar (20) not null,
)
go
CREATE TABLE Products_Supplier(
SupId int unique not null references Suppliers(SupId),
Proudact_Id int unique not null references  Products(Proudact_Id),
Fk_Products_Supplier int primary key(SupId ,Proudact_Id)
)
go
CREATE TABLE StokeTransactions(
TranId int primary key identity ,
QuntityChange int ,
type varchar (20) not null,
Referance varchar(20),
Proudact_Id int unique not null references Products(Proudact_Id),

)
go
CREATE TABLE Customers(
CustId int primary key ,
FullName varchar (50)not null,
PhoneNumber Varchar(20) not null,
Email varchar(20) not null,
ShippingAddress varchar(50),
RegestrationDate Date,
)
go 
Create table Orders(
OrderId int primary key identity,
status varchar (10) not null,
TotalAmount decimal ,
OrderDate Date,
CustId int unique not null references Customers(CustId)
)
go
Create table Shipments(
ShipmentId int primary key identity,
ShipmentDate Date,
Status varchar (20) ,
DelivaryDate Date ,
TrakingNumber int not null,
CurrentName varchar(20),
OrderId int unique not null references Orders(OrderId)
)
go
Create table Payments(
PayId int primary key identity,
Method varchar(20) not null,
Amount int not null ,
PaymentDate Date,
Status Varchar(10),
)
Go
Create table Orders_Payments(
OrderId int unique not null references Orders(OrderId),
PayId int unique not null references  Payments(PayId),
 Fk_Orders_Payments int primary key(OrderId,PayId)
)
Go
Create Table Reviews(
ReviewId int primary key ,
Rating int,
Date1 Date,
Comment varchar(20),
Proudact_Id int unique not null references  Products(Proudact_Id),
CustId int unique not null references Customers(CustId)
)
Create Table OrderItems(
OrderItemsId int primary Key,
Quntity int not null,
uintPric decimal not null,
Proudact_Id int unique not null references  Products(Proudact_Id),
OrderId int unique not null references Orders(OrderId)
)
Go
Create table Categories(
CatId int primary Key,
Name varchar (20) not null,
Description varchar(200),
MainCategory int,
foreign key(MainCategory) references Categories(CatId ),
)
Go
ALTER TABLE Products
ADD CatId INT
go
Alter table Products Add CONSTRAINT Fk_Product_Category
foreign key(CatId)references Categories(CatId)
