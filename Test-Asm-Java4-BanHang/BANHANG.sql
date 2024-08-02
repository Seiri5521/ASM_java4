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
-- Tăng độ dài của cột Image
ALTER TABLE Products
ALTER COLUMN Image NVARCHAR(255);

-- Đảm bảo các cột không thể NULL
ALTER TABLE Products
ALTER COLUMN Name NVARCHAR(500) NOT NULL;

ALTER TABLE Products
ALTER COLUMN Price FLOAT NOT NULL;

ALTER TABLE Products
ALTER COLUMN CreateDate DATE NOT NULL;

ALTER TABLE Products
ALTER COLUMN Available BIT NOT NULL;

ALTER TABLE Products
ALTER COLUMN CategoryId CHAR(50) NOT NULL;

-- Nếu cần, thêm khóa ngoại cho CategoryId
-- (Chỉ thực hiện nếu chưa có hoặc cần cập nhật)
-- Lưu ý: Xóa khóa ngoại trước nếu đã tồn tại
-- ALTER TABLE Products
-- DROP CONSTRAINT FK_Products_Categories; -- Sửa tên khóa ngoại theo thực tế

-- Thêm hoặc cập nhật khóa ngoại
ALTER TABLE Products
ADD CONSTRAINT FK_Products_Categories
FOREIGN KEY (CategoryId) REFERENCES Categories(Id);

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
GO

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
GO

-- Chèn dữ liệu vào bảng Accounts
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
GO
UPDATE Accounts
SET
    Password = '123',
    Fullname = 'Ron Pham',
    Email = 'user1new@example.com',
    Photo = 'user1new.jpg',
    Activated = 1,
    Admin = 1
WHERE Username = 'user1';

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
GO

-- Thêm dữ liệu vào bảng Products
INSERT INTO Products (Name, Image, Price, CreateDate, Available, CategoryId) VALUES
('Hat', 'people-1.jpg', 1500000, '2024-07-19', 1, 'C001'),
('Hat', 'people-2.jpg', 500000, '2024-07-19', 1, 'C001'),
('Clothing', 'people-3.jpg', 3500000, '2024-07-19', 1, 'C003'),
('Clothing', 'people-4.jpg', 999000, '2024-07-19', 1, 'C004'),
('Clothing', 'people-1.jpg', 2000000, '2024-07-19', 1, 'C005'),
('Clothing', 'people-2.jpg', 799000, '2024-07-19', 1, 'C006'),
('Shoes', 'people-3.jpg', 2500000, '2024-07-19', 1, 'C007'),
('Shoes', 'people-4.jpg', 4700000, '2024-07-19', 1, 'C008'),
('Bag', 'people-1.jpg', 999000, '2024-07-19', 1, 'C009'),
('Bag', 'people-2.jpg', 899000, '2024-07-19', 1, 'C010');
GO

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
GO

-- Thêm dữ liệu vào bảng OrderDetails
-- Cần thay đổi ID OrderId từ bảng Orders vào các giá trị dưới đây
-- Ví dụ: OrderId là ID của đơn hàng đầu tiên
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
GO

-- Thủ tục lưu trữ để tìm kiếm người dùng đã mua một sản phẩm cụ thể
CREATE PROCEDURE [dbo].[sp_selectUsersBoughtProductById]
    @ProductId INT
AS 
BEGIN 
    SELECT a.Username, a.Password, a.Admin, a.Activated, a.Fullname, a.Email
    FROM Products p
    LEFT JOIN OrderDetails od ON od.ProductId = p.Id
    LEFT JOIN Orders o ON o.Id = od.OrderId
    LEFT JOIN Accounts a ON a.Username = o.Username
    WHERE p.Id = @ProductId AND a.Activated = 1 AND p.Available = 1
END
GO

