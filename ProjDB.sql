USE master;

IF EXISTS
(
    SELECT name
    FROM master.dbo.sysdatabases
    WHERE name = N'PRJ301_PROJECT'
)
BEGIN
    ALTER DATABASE [PRJ301_PROJECT] SET OFFLINE WITH ROLLBACK IMMEDIATE;
    ALTER DATABASE [PRJ301_PROJECT] SET ONLINE;
    DROP DATABASE [PRJ301_PROJECT];
END;
GO

CREATE DATABASE PRJ301_PROJECT;
GO

USE PRJ301_PROJECT;
GO

CREATE TABLE Customers
(
    Username VARCHAR(64) PRIMARY KEY,
    Password VARCHAR(64) NOT NULL,
    CustomerName NVARCHAR(100),
    Address NVARCHAR(100),
    PhoneNumber VARCHAR(32)
);
GO

CREATE TABLE Categories
(
    CategoryID INT PRIMARY KEY IDENTITY(1, 1),
    CategoryName NVARCHAR(50) NOT NULL,
    Description TEXT,
);
GO

CREATE TABLE Products
(
    ProductID INT PRIMARY KEY IDENTITY(1, 1),
    ProductName NVARCHAR(69) NOT NULL,
    ImageUrl VARCHAR(420),
    UnitsInStock INT NOT NULL,
    UnitPrice MONEY NOT NULL,
    CategoryID INT NOT NULL
        FOREIGN KEY REFERENCES Categories (CategoryID)
);
GO

CREATE TABLE Orders
(
    OrderID INT PRIMARY KEY IDENTITY(1, 1),
    Username VARCHAR(64) NOT NULL
        FOREIGN KEY REFERENCES Customers (Username),
    OrderDate DATETIME default GETDATE(),
    ShipAddress NVARCHAR(100) null,
	Status int not null default 0
);
GO

CREATE TABLE OrderDetails
(
    OrderID INT
        FOREIGN KEY REFERENCES Orders (OrderID) on delete cascade,
    ProductID INT
        FOREIGN KEY REFERENCES Products (ProductID),
    Quantity INT NOT NULL,
    UnitPrice MONEY NOT NULL,
);
GO

INSERT INTO Categories
VALUES (1, N'Điện thoại');
INSERT INTO Categories
VALUES (2, N'Laptop');
INSERT INTO Categories
VALUES (3, N'Máy tính bảng');

insert into Categories values ('Depression', 'Fuck this course I am so done with this' )
insert into Categories values ('Self hate', 'I swear to god' )
insert into Categories values ('WHY', 'I swear to god' )
insert into Categories values ('IS', 'I swear to god' )
insert into Categories values ('Servlet', 'I swear to god' )
insert into Categories values ('A thing', 'I swear to god' )



INSERT INTO Products
VALUES
(N'iPhone 13 128GB | Chính hãng VN/A', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/1/4/14_1_9_2_9.jpg', 67, 17990000, 1);
INSERT INTO Products
VALUES
(N'iPhone 11 64GB I Chính hãng VN/A', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/3/_/3_225.jpg', 62, 10990000, 1);
INSERT INTO Products
VALUES
(N'iPhone 14 Pro 128GB | Chính hãng VN/A', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/t/_/t_m_12.png', 15, 25690000, 1);
INSERT INTO Products
VALUES
(N'iPhone 14 Pro Max 256GB | Chính hãng VN/A', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/v/_/v_ng_20.png', 57, 30690000, 1);
INSERT INTO Products
VALUES
(N'iPhone 14 Pro Max 256GB | Chính hãng VN/A', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/v/_/v_ng_20.png', 57, 30690000, 1);
INSERT INTO Products
VALUES
(N'Samsung Galaxy S23 Ultra 256GB', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/s/2/s23-ultra-tim.png', 1, 26990000, 1);
INSERT INTO Products
VALUES
(N'Samsung Galaxy Z Flip4 128GB', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/s/a/samsung_galaxy_z_flip_m_i_2022-1_1.jpg', 37, 19990000, 1);
INSERT INTO Products
VALUES
(N'Samsung Galaxy S22 Ultra (8GB - 128GB)', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/s/m/sm-s908_galaxys22ultra_front_burgundy_211119.jpg', 51, 25990000, 1);
INSERT INTO Products
VALUES
(N'Samsung Galaxy S23 8GB 256GB', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/_/g/_global-version_-sm-s911_galaxys23_back_cream_221122.jpg', 9, 23990000, 1);
INSERT INTO Products
VALUES
(N'Samsung Galaxy Z Fold4', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/s/a/samsung_galaxy_z_fold_4-7.jpg', 76, 37990000, 1);
INSERT INTO Products
VALUES
(N'Xiaomi 12T', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/x/i/xiaomi-12t-den_1.jpg', 33, 11990000, 1);
INSERT INTO Products
VALUES
(N'Xiaomi Redmi Note 11 128GB', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/8/0/800x800-640x640-5.png', 20, 4250000, 1);
INSERT INTO Products
VALUES
(N'Xiaomi Redmi Note 11 Pro', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/t/_/t_i_xu_ng_2_18.png', 32, 6290000, 1);
INSERT INTO Products
VALUES
(N'POCO X4 GT', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/p/m/pms_1655902420.18254534_1.png', 24,7650000, 1);
INSERT INTO Products
VALUES
(N'POCO X4 GT', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/p/m/pms_1655902420.18254534_1.png', 24,7650000, 1);
INSERT INTO Products
VALUES
(N'Apple Macbook Air M2 2022 8GB 256GB I Chính hãng Apple Việt Nam', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/m/a/macbook_air_m2.png', 65,27390000, 2);
INSERT INTO Products
VALUES
(N'Apple MacBook Air M1 256GB 2020 I Chính hãng Apple Việt Nam', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/m/a/macbook_air_22.png', 96,19690000, 2);
INSERT INTO Products
VALUES
(N'Apple Macbook Air M2 2022 16GB 256GB I Chính hãng Apple Việt Nam', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/a/i/air_m2_16gb.png', 37,33490000, 2);
INSERT INTO Products
VALUES
(N'Laptop Lenovo Ideapad Gaming 3 15ARH7', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/1/h/1h47.png', 11,23990000, 2);
INSERT INTO Products
VALUES
(N'Laptop ASUS TUF Gaming F15 FX506HC-HN144W', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/5/h/5h53.png', 11,19990000, 2);
INSERT INTO Products
VALUES
(N'Laptop ASUS Gaming TUF FX506LHB-HN188W', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/5/h/5h03_1.png', 78,16690000, 2);
INSERT INTO Products
VALUES
(N'Laptop Gaming MSI Bravo 15 B5DD 276VN', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/8/h/8h42.png', 99,15490000, 2);
INSERT INTO Products
VALUES
(N'
Laptop Gaming Acer Nitro 5 Eagle AN515-57-54MV NH.QENSV.003', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/t/e/text_ng_n_7.png', 43,20990000, 2);
INSERT INTO Products
VALUES
(N'
Laptop Asus Vivobook Flip 14 TP470EA EC346W', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/9/_/9.1.jpg', 27,11490000, 2);
INSERT INTO Products
VALUES
(N'Laptop Asus Vivobook 14X M1403QA-LY024W', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/g/a/gaming_5_3.png', 96,14990000, 2);
INSERT INTO Products
VALUES
(N'Laptop Dell Inspiron 3511 5829BLK', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/t/e/text_ng_n_3__1_71.png', 56,13490000, 2);
INSERT INTO Products
VALUES
(N'Samsung Galaxy Tab S8 Ultra 5G', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/t/a/tab_s8_ultra.jpg', 29,27990000, 3);
INSERT INTO Products
VALUES
(N'Samsung Galaxy Tab S8 5G', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/t/a/tab_s8.jpg', 86,17990000, 3);
INSERT INTO Products
VALUES
(N'Samsung Galaxy Tab S7 FE (4G)', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/s/a/samsung-galaxy-tab-s7-fe-chinh-hang_1_1_2_1.jpg', 99,11990000, 3);
INSERT INTO Products
VALUES
(N'Samsung Galaxy Tab S8 Plus 5G', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/s/e/series_tab_s8001_1.jpg', 28,22990000, 3);
INSERT INTO Products
VALUES
(N'iPad Pro 11 inch 2022 M2 Wifi 128GB I Chính hãng Apple Việt Nam', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/i/p/ipad-pro-13-select-wifi-spacegray-202210-02.jpg', 33,20790000, 3);
INSERT INTO Products
VALUES
(N'iPad Gen 10 10.9 inch 2022 Wifi 64GB I Chính hãng Apple Việt Nam', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/i/p/ipad-2022-hero-silver-wifi-select.png', 74,10990000, 3);
INSERT INTO Products
VALUES
(N'iPad Air 5 (2022) 64GB I Chính hãng Apple Việt Nam', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/1/_/1_253_3.jpg', 93,14490000, 3);
INSERT INTO Products
VALUES
(N'iPad 10.2 2021 WiFi 64GB | Chính hãng Apple Việt Nam', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/x/_/x_mmas.png', 90,7290000, 3);
INSERT INTO Products
VALUES
(N'iPad Pro 11 2021 M1 WiFi 128GB I Chính hãng Apple Việt Nam', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/i/p/ipad-pro-2021-11inch-grey_2.jpg', 85,19490000, 3);
INSERT INTO Categories
VALUES (1, N'Điện thoại');
INSERT INTO Categories
VALUES (2, N'Laptop');
INSERT INTO Categories
VALUES (3, N'Máy tính bảng');