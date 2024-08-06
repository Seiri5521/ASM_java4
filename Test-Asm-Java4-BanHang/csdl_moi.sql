-- Xóa cơ sở dữ liệu nếu tồn tại
DROP DATABASE IF EXISTS JAVA4_BANHANG;
GO

-- Tạo lại cơ sở dữ liệu
CREATE DATABASE JAVA4_BANHANG;
GO

USE JAVA4_BANHANG;
GO

-- Tạo bảng Categories
CREATE TABLE Categories (
    Id CHAR(50) PRIMARY KEY,
    Name NVARCHAR(500)
);

-- Tạo bảng Accounts
CREATE TABLE Accounts (
    Username NVARCHAR(500) PRIMARY KEY,
    Password NVARCHAR(50),
    Fullname NVARCHAR(500),
    Email NVARCHAR(50),
    Photo NVARCHAR(50),
    Activated BIT,
    Admin BIT
);

-- Tạo bảng Products
CREATE TABLE Products (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(500),
    Image NVARCHAR(50),
    Price FLOAT,
    CreateDate DATE,
    Available BIT,
    CategoryId CHAR(50),
    FOREIGN KEY (CategoryId) REFERENCES Categories(Id)
);

-- Tạo bảng Orders
CREATE TABLE Orders (
    Id BIGINT IDENTITY(1,1) PRIMARY KEY,
    Username NVARCHAR(500),
    CreateDate DATETIME,
    Address NVARCHAR(500),
    FOREIGN KEY (Username) REFERENCES Accounts(Username)
);

-- Tạo bảng OrderDetails
CREATE TABLE OrderDetails (
    Id BIGINT IDENTITY(1,1) PRIMARY KEY,
    OrderId BIGINT,
    ProductId INT,
    Price FLOAT,
    Quantity INT,
    FOREIGN KEY (OrderId) REFERENCES Orders(Id),
    FOREIGN KEY (ProductId) REFERENCES Products(Id)
);


-- Thêm dữ liệu vào bảng Categories
INSERT INTO Categories (Id, Name) VALUES
('C001', 'Hat'),
('C002', 'Hat'),
('C003', 'Clothing'),
('C004', 'Clothing'),
('C005', 'Clothing'),
('C006', 'Clothing'),
('C007', 'Shoes'),
('C008', 'Shoes'),
('C009', 'Bag'),
('C010', 'Bag');

select * from Categories

-- Thêm dữ liệu vào bảng Products
INSERT INTO Products (Name, Image, Price, CreateDate, Available, CategoryId) VALUES
('Hat', 'ADIDAS1.jpg', 1500000, '2024-07-19', 1, 'C001'),
('Hat', 'ADIDAS2.jpg', 500000, '2024-07-19', 1, 'C001'),
('Clothing', 'ADIDAS3.jpg', 3500000, '2024-07-19', 1, 'C002'),
('Clothing', 'PUMA1.jpg', 999000, '2024-07-19', 1, 'C002'),
('Clothing', 'PUMA2.jpg', 2000000, '2024-07-19', 1, 'C003'),
('Clothing', 'PUMA3.jpg', 799000, '2024-07-19', 1, 'C003'),
('Shoes', 'NIKE1.jpg', 2500000, '2024-07-19', 1, 'C004'),
('Shoes', 'NIKE2.jpg', 4700000, '2024-07-19', 1, 'C004'),
('Bag', 'NIKE3.jpg', 999000, '2024-07-19', 1, 'C005'),
('Bag', 'NIKE4.jpg', 899000, '2024-07-19', 1, 'C005');

select * from Products

-- Thêm dữ liệu vào bảng Accounts
INSERT INTO Accounts (Username, Password, Fullname, Email, Photo, Activated, Admin) VALUES
('user1', 'pass1', 'Thanh', 'user1@example.com', 'user1.jpg', 1, 0),
('user2', 'pass2', 'Nghia', 'user2@example.com', 'user2.jpg', 1, 0),
('user3', 'pass3', 'Chuong', 'user3@example.com', 'user3.jpg', 1, 0),
('user4', 'pass4', 'Ron', 'user4@example.com', 'user4.jpg', 1, 0),
('user5', 'pass5', 'Khang', 'user5@example.com', 'user5.jpg', 1, 0),
('user6', 'pass6', 'Khanh', 'user6@example.com', 'user6.jpg', 1, 0),
('user7', 'pass7', 'Loi', 'user7@example.com', 'user7.jpg', 1, 0),
('user8', 'pass8', 'Long', 'user8@example.com', 'user8.jpg', 1, 0),
('user9', 'pass9', 'Trieu', 'user9@example.com', 'user9.jpg', 1, 0),
('user10', 'pass10', 'Cuong', 'user10@example.com', 'user10.jpg', 1, 0);

select * from Accounts

-- Thêm dữ liệu vào bảng Orders
INSERT INTO Orders (Username, CreateDate, Address) VALUES
('user1', '2024-07-19', N'123 Tô Ký, P.10, Q.12'),
('user2', '2024-07-19', N'13 Lê Lợi, P.Bến Thành, Q.1'),
('user3', '2024-07-19', N'10 Nguyễn Trãi, P.5, Q.5'),
('user4', '2024-07-19', N'04 Hai Bà Trưng, P.3, Q.3'),
('user5', '2024-07-19', N'12/3 Tô Ký, P.10, Q.12'),
('user6', '2024-07-19', N'15 Trường Chinh, P.10, Q.Tân Bình'),
('user7', '2024-07-19',  N'01 Nam kỳ Khởi Nghĩa, P.4, Q.Phú Nhuận'),
('user8', '2024-07-19', N'33 Phan Đăng Lưu, P.7, Q.Phú Nhuận'),
('user9', '2024-07-19', N'44 Trường Sơn, P.4, Q.Tân Bình'),
('user10', '2024-07-19', N'55/4 Hai Bà Trưng, P.3, Q.3');

select * from Orders
DBCC CHECKIDENT ('Orders', RESEED, 0);

delete Orders

-- Thêm dữ liệu vào bảng OrderDetails
INSERT INTO OrderDetails (OrderId, ProductId, Price, Quantity) VALUES
(1, 1, 1500000, 1),
(1, 2, 500000, 2),
(2, 3, 3500000, 1),
(2, 4, 999000, 1),
(3, 5, 2000000, 2),
(3, 6, 799000, 1),
(4, 7, 2500000, 1),
(4, 8, 4700000, 1),
(5, 9, 999000, 3),
(5, 10, 899000, 2);

select * from OrderDetails


--các sp
create proc sp_selectUsersLikedVideoByHref(@videoHref varchar(50))
as
begin
	SELECT u.id,u.[password], u.isAdmin,u.isActive, u.username, u.email
	from video v 
	LEFT JOIN history h ON h.videoId = v.id 
	LEFT JOIN [user] u ON u.id = h.userId
	WHERE
    v.href = @videoHref AND u.isActive = 1 AND
    v.isActive = 1 AND h.isLiked = 1

	select * from Products p
	left join OrderDetails od on p.Id = od.Id
	left join Orders o on o.Id=od.Id
	left join Accounts a on a.Username = o.Username
end
go