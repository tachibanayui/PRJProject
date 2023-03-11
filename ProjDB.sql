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
    CategoryID INT NOT NULL FOREIGN KEY REFERENCES Categories (CategoryID),
	Description NVARCHAR(1000) NOT NULL,
        
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
VALUES (N'ALL', N'ALL');
INSERT INTO Categories
VALUES (N'Phone', N'Phone');
INSERT INTO Categories
VALUES (N'Laptop', N'Laptop');
INSERT INTO Categories
VALUES ('Tablet', N'Tablet');





INSERT INTO Products
VALUES
(N'iPhone 13 128GB | Chính hãng VN/A', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/1/4/14_1_9_2_9.jpg', 67, 17990000, 2,N'Hiệu năng vượt trội - Chip Apple A15 Bionic mạnh mẽ, hỗ trợ mạng 5G tốc độ cao
Không gian hiển thị sống động - Màn hình 6.1" Super Retina XDR độ sáng cao, sắc nét
Trải nghiệm điện ảnh đỉnh cao - Camera kép 12MP, hỗ trợ ổn định hình ảnh quang học
Tối ưu điện năng - Sạc nhanh 20 W, đầy 50% pin trong khoảng 30 phút');
INSERT INTO Products
VALUES
(N'iPhone 11 64GB I Chính hãng VN/A', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/3/_/3_225.jpg', 62, 10990000, 2,N'Màu sắc phù hợp cá tính - 6 màu sắc bắt mắt để lựa chọn
Hiệu năng mượt mà, ổn định - Chip A13, RAM 4GB
Bắt trọn khung hình - Camera kép hỗ trợ góc rộng, chế độ Night Mode
Yên tâm sử dụng - Kháng nước, kháng bụi IP68, kính cường lực Gorilla');
INSERT INTO Products
VALUES
(N'iPhone 14 Pro 128GB | Chính hãng VN/A', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/t/_/t_m_12.png', 15, 25690000, 2,N'Trải nghiệm thị giác ấn tượng - Màn hình Dynamic Island, sắc nét với công nghệ Super Retina XDR, mượt mà 120 Hz
Tuyệt đỉnh thiết kế, tỉ mỉ từng đường nét - Nâng cấp toàn diện với kiểu dáng mới, nhiều lựa chọn màu sắc trẻ trung
Hiệu năng hàng đầu thế giới - Apple A16 Bionic xử lí nhanh, ổn định mọi tác vụ
Camera chuẩn nhiếp ảnh chuyên nghiệp - Camera sau 48MP trang bị nhiều công nghệ chụp đa dạng');
INSERT INTO Products
VALUES
(N'iPhone 14 Pro Max 256GB | Chính hãng VN/A', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/v/_/v_ng_20.png', 57, 30690000, 2,N'Màn hình Dynamic Island - Sự biến mất của màn hình tai thỏ thay thế bằng thiết kế viên thuốc, OLED 6,7 inch, hỗ trợ always-on display
Cấu hình iPhone 14 Pro Max mạnh mẽ, hiệu năng cực khủng từ chipset A16 Bionic
Làm chủ công nghệ nhiếp ảnh - Camera sau 48MP, cảm biến TOF sống động
Pin liền lithium-ion kết hợp cùng công nghệ sạc nhanh cải tiến');
INSERT INTO Products
VALUES
(N'iPhone 14 Pro Max 256GB | Chính hãng VN/A', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/v/_/v_ng_20.png', 57, 30690000, 2,N'Màn hình Dynamic Island - Sự biến mất của màn hình tai thỏ thay thế bằng thiết kế viên thuốc, OLED 6,7 inch, hỗ trợ always-on display
Cấu hình iPhone 14 Pro Max mạnh mẽ, hiệu năng cực khủng từ chipset A16 Bionic
Làm chủ công nghệ nhiếp ảnh - Camera sau 48MP, cảm biến TOF sống động
Pin liền lithium-ion kết hợp cùng công nghệ sạc nhanh cải tiến');
INSERT INTO Products
VALUES
(N'Samsung Galaxy S23 Ultra 256GB', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/s/2/s23-ultra-tim.png', 15, 26990000, 2,N'Thoả sức chụp ảnh, quay video chuyên nghiệp - Camera đến 200MP, chế độ chụp đêm cải tiến, bộ xử lí ảnh thông minh
Chiến game bùng nổ - chip Snapdragon 8 Gen 2 8 nhân tăng tốc độ xử lí, màn hình 120Hz, pin 5.000mAh
Nâng cao hiệu suất làm việc với Siêu bút S Pen tích hợp, dễ dàng đánh dấu sự kiện từ hình ảnh hoặc video
Thiết kế bền bỉ, thân thiện - Màu sắc lấy cảm hứng từ thiên nhiên, chất liệu kính và lớp phim phủ PET tái chế');
INSERT INTO Products
VALUES
(N'Samsung Galaxy Z Flip4 128GB', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/s/a/samsung_galaxy_z_flip_m_i_2022-1_1.jpg', 37, 19990000, 2,N'Ngoại hình thời trang - cầm nắm cực sang với thiết kế gập vỏ sò độc đáo
Công nghệ màn hình hàng đầu đến từ Samsung - 6.7 inch, tấm nền Dynamic AMOLED 2X
Trang bị camera chất lượng - Bộ đôi camera có cùng độ phân giải 12 MP, chống rung, chụp đêm
Hiệu năng mạnh mẽ đến từ dòng chip cao cấp của Qualcomm - Snapdragon 8+ Gen 1');
INSERT INTO Products
VALUES
(N'Samsung Galaxy S22 Ultra (8GB - 128GB)', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/s/m/sm-s908_galaxys22ultra_front_burgundy_211119.jpg', 51, 25990000, 2,N'Vi xử lý mạnh mẽ nhất Galaxy - Snapdragon 8 Gen 1 (4 nm)
Camera mắt thần bóng đêm Nightography - Chụp đêm cực đỉnh
S Pen đầu tiên trên Galaxy S - Độ trễ thấp, dễ thao tác
Dung lượng pin bất chấp ngày đêm - Viên pin 5000mAh, sạc nhanh 45W');
INSERT INTO Products
VALUES
(N'Samsung Galaxy S23 8GB 256GB', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/_/g/_global-version_-sm-s911_galaxys23_back_cream_221122.jpg', 9, 23990000, 2,N'Dẫn đầu công nghệ chụp đêm - Camera lên đến 50MP, zoom xa rõ nét, vi xử lí AI, công nghệ ảnh siêu chi tiết
Hiệu năng vượt trội - Snapdragon 8 Gen 2 8 nhân mạnh mẽ
Đa nhiệm mượt mà - RAM lớn 8G, dễ dàng chuyển đổi giữa các thiết bị
Thiết kế vì hành tinh - Màu sắc lấy cảm hứng từ thiên nhiên, chất liệu kính và lớp phim phủ PET tái chế');
INSERT INTO Products
VALUES
(N'Samsung Galaxy Z Fold4', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/s/a/samsung_galaxy_z_fold_4-7.jpg', 76, 37990000, 2,N'Camera mắt thần bóng đêm cho trải nghiệm chụp ảnh ấn tượng - Camera chính: 50MP
Khai mở trải nghiệm di động linh hoạt biến hóa - Màn hình ngoài 6.2"" cùng màn hình chính 7.6"" độc đáo
Hiệu năng mạnh mẽ đến từ dòng chip cao cấp của Qualcomm - Snapdragon 8 Plus Gen 1
Viên pin ấn tượng, sạc nhanh tức tốc - Pin 4,400 mAh, sạc nhanh 25 W');
INSERT INTO Products
VALUES
(N'Xiaomi 12T', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/x/i/xiaomi-12t-den_1.jpg', 33, 11990000, 2,N'Kiến tạo khoảnh khắc hoàn hảo - Camera chuyên nghiệp 108MP + 8MP + 2MP, chống rung quang học OIS
Làm chủ tốc độ, bứt phá hiệu năng - MediaTek Dimensity 8100-Ultra, RAM 8GB
Năng lượng bất tận, khám phá cả ngày - Dung lượng pin 5000mAh, sạc siêu nhanh HyperCharge 120W
Trải nghiệm siêu chân thực - Màn hình lớn CrystalRes AMOLED cùng hệ thống âm thanh SOUND BY Harman Kardon');
INSERT INTO Products
VALUES
(N'Xiaomi Redmi Note 11 128GB', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/8/0/800x800-640x640-5.png', 20, 4250000, 2,N'Nâng cao trải nghiệm thị giác - Màn hình AMOLED 6.43" Full HD+, công nghệ DotDisplay
Hiệu năng ấn tượng - Snapdragon 680 8 nhân cùng RAM 4GB, bộ nhớ 128GB
Chinh phục mọi khoảnh khắc - Cụm 4 camera 50MP, nhiều chế độ chụp tiện ích
Thoải mái sử dụng không lắng lo - Viên pin 5000 mAh, sạc nhanh 33 W');
INSERT INTO Products
VALUES
(N'Xiaomi Redmi Note 11 Pro', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/t/_/t_i_xu_ng_2_18.png', 32, 6290000, 2,N'Hiệu năng ấn tượng trong tầm giá - Chip MediaTek Helio G96 mạnh mẽ cùng 8GB RAM
Tận hưởng không gian giải trí sống động - Màn hình AMOLED 6.67", FHD+ sắc nét, chân thực
Ghi lại trọn vẹn mọi khoảng khắc - Cụm 4 camera sau lên đến 108MP, đa dạng chế độ chụp
Năng lượng tràn đầy cho cả ngày dài - Viên pin khủng 5000mAh, sạc nhanh 67W');
INSERT INTO Products
VALUES
(N'POCO X4 GT', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/p/m/pms_1655902420.18254534_1.png', 24,7650000, 2,N'Thiết kế đơn giản nhưng vẫn thanh lịch và trẻ trung, phù hợp với các bạn trẻ cá tính
Xử lý tác vụ nặng, cùng khả năng đa nhiệm ấn tượng - Chip MediaTek Dimensity 8100
Trải nghiệm chạm vuốt mượt mà - Màn hình 6.6 inches, IPS LCD, 144Hz
Thời lượng sử dụng dài với tốc độ sạc ấn tượng - 5080 mAh, sạc nhanh 67W');
INSERT INTO Products
VALUES
(N'POCO X4 GT', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/p/m/pms_1655902420.18254534_1.png', 24,7650000, 2,N'Thiết kế đơn giản nhưng vẫn thanh lịch và trẻ trung, phù hợp với các bạn trẻ cá tính
Xử lý tác vụ nặng, cùng khả năng đa nhiệm ấn tượng - Chip MediaTek Dimensity 8100
Trải nghiệm chạm vuốt mượt mà - Màn hình 6.6 inches, IPS LCD, 144Hz
Thời lượng sử dụng dài với tốc độ sạc ấn tượng - 5080 mAh, sạc nhanh 67W');
INSERT INTO Products
VALUES
(N'Apple Macbook Air M2 2022 8GB 256GB I Chính hãng Apple Việt Nam', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/m/a/macbook_air_m2.png', 65,27390000, 3,N'Thiết kế sang trọng, lịch lãm - siêu mỏng 11.3mm, chỉ 1.24kg
Hiệu năng hàng đầu - Chip Apple m2, 8 nhân GPU, hỗ trợ tốt các phần mềm như Word, Axel, Adoble Premier
Đa nhiệm mượt mà - Ram 8GB, SSD 256GB cho phép vừa làm việc, vừa nghe nhạc
Màn hình sắc nét - Độ phân giải 2560 x 1664 cùng độ sáng 500 nits
Âm thanh sống động - 4 loa tramg bị công nghệ dolby atmos và âm thanh đa chiều');
INSERT INTO Products
VALUES
(N'Apple MacBook Air M1 256GB 2020 I Chính hãng Apple Việt Nam', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/m/a/macbook_air_22.png', 96,19690000, 3,N'Phù hợp cho lập trình viên, thiết kế đồ họa 2D, dân văn phòng
Hiệu năng vượt trội - Cân mọi tác vụ từ word, exel đến chỉnh sửa ảnh trên các phần mềm như AI, PTS
Đa nhiệm mượt mà - Ram 8GB cho phép vừa mở trình duyệt để tra cứu thông tin, vừa làm việc trên phần mềm
Trang bị SSD 256GB - Cho thời gian khởi động nhanh chóng, tối ưu hoá thời gian load ứng dụng
Chất lượng hình ảnh sắc nét - Màn hình Retina cao cấp cùng công nghệ TrueTone cân bằng màu sắc
Thiết kế sang trọng - Nặng chỉ 1.29KG, độ dày 16.1mm. Tiện lợi mang theo mọi nơi');
INSERT INTO Products
VALUES
(N'Apple Macbook Air M2 2022 16GB 256GB I Chính hãng Apple Việt Nam', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/a/i/air_m2_16gb.png', 37,33490000, 3,N'Thiết kế sang trọng, lịch lãm - siêu mỏng 11.3mm, chỉ 1.24kg
Hiệu năng hàng đầu - Chip Apple m2, 8 nhân GPU, hỗ trợ tốt các phần mềm như Word, Axel, Adoble Premier
Đa nhiệm mượt mà - Ram 8GB, SSD 256GB cho phép vừa làm việc, vừa nghe nhạc
Màn hình sắc nét - Độ phân giải 2560 x 1664 cùng độ sáng 500 nits
Âm thanh sống động - 4 loa tramg bị công nghệ dolby atmos và âm thanh đa chiều');
INSERT INTO Products
VALUES
(N'Laptop Lenovo Ideapad Gaming 3 15ARH7', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/1/h/1h47.png', 11,23990000, 3,N'Cấu hình chơi game và đồ họa đỉnh cao, cân mọi tựa game - R7 6800H cùng card rời RTX 3050. Có khả năng chỉnh sửa hình ảnh trên PTS, Render video ngắn mượt mà.
Ram 8GB + 1 khe cắm, ổ cứng SSD 512GB mang đến tốc độ xử lý nhanh cùng đa nhiệm mượt mà.
Màn hình Full HD, tần số quét 120Hz, kích thước chuẩn 15.6 inch, tấm nền IPS, 250nits, chống chói bảo vệ mắt, mang lại chất lượng hiển thị sắc nét.
Tích hợp webcam 720p cho phép đàm thoại thông qua video thoải mái.
Bàn phím được tích hợp đèn - Thỏa sức làm việc trong môi trường thiếu sáng.
Năng lượng bất tận cả ngày với viên pin 3 Cell, 60Wh.
Thiết kế vỏ nhựa cứng cáp, nặng 2.315 kg cầm nặng tay.
Máy đi kèm Windows 11 bản quyền.');
INSERT INTO Products
VALUES
(N'Laptop ASUS TUF Gaming F15 FX506HC-HN144W', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/5/h/5h53.png', 11,19990000, 3,N'"Chip I5-11400H cùng card đồ họa rời GeForce RTX 3050, trải nghiệm các tựa game AAA hàng đầu hay xử lý các tác vụ đồ hoạ nặng nề
Ram 8GB + 1 khe trống, nâng cấp tối đa 32GB cùng ổ cứng SSD có không gian lưu trữ lên tới 512GB. Đa nhiệm tốt, thoải mái mở nhiều ứng dụng cùng lúc
Màn hình 15.6 inches Full HD cùng độ phủ màu SRGB 62.5%, chất lượng hiển thị rõ ràng. Hình ảnh sắc nét.
Tích hợp HD 720p cho phép đàm thoại thông qua video thoải mái
Đa dạng cổng giao tiếp, dễ dàng sử dụng
Bàn phím được tích hợp đèn nền LED RGB giúp thỏa sức làm việc trong môi trường thiếu sáng
Vỏ nhựa cứng cáp, trọng lượng máy 2.30 kg cho cảm giác cầm chắc tay
Máy đi kèm Windows 11 Home bản quyền');
INSERT INTO Products
VALUES
(N'Laptop ASUS Gaming TUF FX506LHB-HN188W', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/5/h/5h03_1.png', 78,16690000, 3,N'"Chip I5-10300H cùng card đồ họa rời GeForce GTX 1650 edit video thoải mái, chiến game hiệu năng hàng đầu
Ram 8GB, nâng cấp tối đa 32GB cùng ổ cứng SSD có không gian lưu trữ lên tới 512GB mang lại thời gian khởi động hay load ứng dụng nhanh chóng
Màn hình 15.6 inches với độ phân giải Full HD, độ phủ màu SRGB 62.5% chất lượng hiển thị rõ ràng
Đa dạng cổng giao tiếp, dễ dàng sử dụng
Bàn phím được tích hợp đèn nền LED RGB - sống động trong từng trận đấu
Vỏ nhựa cứng cáp, trọng lượng máy 2.30 kg cho cảm giác cầm chắc tay
Máy đi kèm Windows 11 Home bản quyền"');
INSERT INTO Products
VALUES
(N'Laptop Gaming MSI Bravo 15 B5DD 276VN', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/8/h/8h42.png', 99,15490000, 3,N'Chip R5-5600H cùng card rời RX5500M cho khả năng chiến các tựa game nặng, chỉnh sửa hình ảnh trên PTS, Render 3D.
Ram 8GB + 1 khe trống cho phép nâng cấp tối đa đến 64GB.
Kích thước màn hình 15.6 inches với độ phân giải Full HD mang lại trải nghiệm tuyệt vời, hình ảnh sắc nét.
Tản nhiệt 6 ống đồng - Giúp đảm bảo hiệu năng ổn định khi chiến game
Trọng lượng 2.35kg cho cảm giác cầm chắc tay .
Máy đi kèm windows 11 bản quyền.');
INSERT INTO Products
VALUES
(N'
Laptop Gaming Acer Nitro 5 Eagle AN515-57-54MV NH.QENSV.003', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/t/e/text_ng_n_7.png', 43,20990000, 3,N'Thiết kế đậm chất gaming cứng cáp, hầm hố và có độ hoàn thiện cao
Màn hình FullHD kích thước chuẩn 15,6 inch, hiển thị sắc nét, màu sắc sống động
Hiệu năng mạnh mẽ, đa nhiệm mượt mà - Intel Core i5-11400H, RAM 8GB
Năng lượng bất tận cả ngày với viên pin 4-cell, 57.5 Wh');
INSERT INTO Products
VALUES
(N'
Laptop Asus Vivobook Flip 14 TP470EA EC346W', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/9/_/9.1.jpg', 27,11490000, 3,N'Intel Core i3-1115G4 xử lý mượt mà các tác vụ văn phòng hay chỉnh sửa ảnh cơ bản trên PTS.
Ổ cứng SSD 512GB mang đến tốc độ xử lý nhanh cùng đa nhiệm mượt mà, mở nhiều trang cùng lúc không bị giật, lag.
Khả năng hiển thị rực rỡ - màn hình 14.0 inch, tấm nền IPS, độ phân giải Full HD.
Tích hợp webcam 720p cho phép đàm thoại thông qua video thoải mái.
Năng lượng bất tận cả ngày với viên pin 3 Cells 42WHrs.
Thiết kế vỏ nhựa cứng cáp, nặng 1.5 kg thuận tiện di chuyển, mang theo.
Máy đi kèm Windows 10 bản quyền.');
INSERT INTO Products
VALUES
(N'Laptop Asus Vivobook 14X M1403QA-LY024W', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/g/a/gaming_5_3.png', 96,14990000, 3,N'Màn hình 14 inch (1920 x 1200) rõ nét mọi chi tiết cùng công nghệ chống chói mang đến trải nghiệm hình ảnh hoàn toàn mới
Bộ vi xử lý AMD Ryzen 7 5800H mạnh mẽ, giúp bạn cân tốt mọi tác vụ từ học tập, làm việc đến giải trí và chơi game nhẹ cơ bản
Ram 8GB và SSD 512GB hỗ trợ đa nhiệm mượt mà, khởi chạy ứng dụng nhanh chóng cùng không gian lưu trữ rộng lớn
Công nghệ tản nhiệt ASUS IceCool duy trì nhiệt độ máy mát mẻ, nhanh hơn và yên tĩnh hơn trong mọi tình huống
Trọng lượng chỉ 1.6 kg giúp bạn mang theo bất cứ đâu và bản lề 180° dễ dàng duỗi thẳng máy để chia sẻ màn hình');
INSERT INTO Products
VALUES
(N'Laptop Dell Inspiron 3511 5829BLK', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/t/e/text_ng_n_3__1_71.png', 56,13490000, 3,N'Thiết kế cứng cáp, sang trọng với màn hình cảm ứng 15.6 inch Full HD
Cân mọi tác vụ học tập, văn phòng với CPU Intel Core i5-1135G7
Card Intel Iris Xe graphics hỗ trợ lướt web, xem phim hay giải trí với các tựa game nhẹ
RAM 8GB đa nhiệm cùng ổ cứng 256GB SSD ccho không gian lưu trữ đủ dùng
Webcam HD 720p giúp hình ảnh thêm sắc nét trong các buổi họp, video call, meet,...');
INSERT INTO Products
VALUES
(N'Samsung Galaxy Tab S8 Ultra 5G', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/t/a/tab_s8_ultra.jpg', 29,27990000, 4,N'Chiếc Samsung Galaxy Tab S lớn nhất, hiển thị sống động - 14.6", Super AMOLED 120Hz
Thế hệ S Pen hoàn toàn mới - Độ nhạy cao, độ trễ thấp 2,8ms, nét bút mảnh
Ghi lại khoảnh khắc đắt giá - Cụm 2 camera trước 12MP
Sử dụng cả ngày dài - Pin khủng 11.200 mAh, sạc nhanh siêu tốc 45W');
INSERT INTO Products
VALUES
(N'Samsung Galaxy Tab S8 5G', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/t/a/tab_s8.jpg', 86,17990000, 4,N'Không gian sáng tạo vô hạn - Màn hình 11", 120Hz, TFT LCD cho hình ảnh sống động
Thoả sức sáng tạo - Bút S Pen quyền năng thế hệ mới
Hiệu năng khủng, cân mọi tác vụ - Snapdragon 8 Gen 1 (4 nm)
Phù hợp làm việc và giải trí - Hỗ trợ chia đôi màn hình, kêt nối bàn phím');
INSERT INTO Products
VALUES
(N'Samsung Galaxy Tab S7 FE (4G)', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/s/a/samsung-galaxy-tab-s7-fe-chinh-hang_1_1_2_1.jpg', 99,11990000, 4,N'Kiểu dáng cao cấp, sang trọng - Thiết kế nguyên khối, chỉ nhẹ 608 g và mỏng 6.3 mm
Trải nghiệm không gian giải trí hoàn hảo - Màn hình lớn 12.4", độ phân giải 2K sắc nét
Hiệu năng mạnh mẽ cân mọi tác vụ - Chip Snapdragon 750G, RAM 4 GB
Thoả sức sáng tạo - Hỗ trọ bút S-Pen và bàn phím rời đáp ứng mọi nhu cầu học tập, làm việc
Thời gian sử dụng lâu dài - Viên pin cực khủng 10.090 mAh, sạc nhanh 45W');
INSERT INTO Products
VALUES
(N'Samsung Galaxy Tab S8 Plus 5G', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/s/e/series_tab_s8001_1.jpg', 28,22990000, 4,N'Mở ra không gian sáng tạo - Màn hình 12.4", Super AMOLED, 120Hz cho hình ảnh sắc nét
Hiệu năng dẫn đầu, đa nhiệm hoàn hảo - Snapdragon 8 Gen 1 (4 nm)
Năng lượng bền bỉ - Viên pin khủng 10.090 mAh, sạc nhanh 45W
Luôn là trung tâm của mọi khung hình - Camera trước 12MP góc siêu rộng');
INSERT INTO Products
VALUES
(N'iPad Pro 11 inch 2022 M2 Wifi 128GB I Chính hãng Apple Việt Nam', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/i/p/ipad-pro-13-select-wifi-spacegray-202210-02.jpg', 33,20790000, 4,N'Thiết kế phẳng mạnh mẽ - Gia công từ kim loại bền bỉ, phong cách hiện đại, sang trọng
Hiệu năng mạnh mẽ với CPU thế hệ mới - chip Apple M2 trong đó có 8 lõi cùng RAM 8 GB
Màn hình sáng hơn, hỗ trợ nội dung HDR tốt hơn - 11 inch LCD, 600 nits
Thoải mái sáng tạo và thiết kế - Nhận diện bút Apple Pencil 2 siêu nhanh và nhạy');
INSERT INTO Products
VALUES
(N'iPad Gen 10 10.9 inch 2022 Wifi 64GB I Chính hãng Apple Việt Nam', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/i/p/ipad-2022-hero-silver-wifi-select.png', 74,10990000, 4,N'Kiểu dáng mỏng nhẹ, phong cách hiện đại - Khung viền và mặt lưng kim loại, mỏng chỉ 7 mm
Hiệu năng đỉnh xử lí mọi tác vụ - Apple A14 Bionic với tốc độ tối đa 3.1 GHz, RAM 4 GB
Mang đến thế giới hình ảnh sắc nét, sống động - Màn hình Retina IPS LCD kích thước 10.9 inch
Đồng hành cùng bạn trong thời gian dài - 7000 mAh, sạc nhanh tối ưu thời gian');
INSERT INTO Products
VALUES
(N'iPad Air 5 (2022) 64GB I Chính hãng Apple Việt Nam', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/1/_/1_253_3.jpg', 93,14490000, 4,N'Thiết kế sang trọng - Thiết kế phẳng ở 4 cạnh, màu sắc tươi trẻ
Màn hình cho trải nghiệm chân thực - Tấm nền Retina IPS LCD 10.9 inches, chân thực và sắc nét
Khả năng kết nối phụ kiện tuyệt vời - Dễ dàng kết nối Magic Keyboard và Apple Pencil biến iPad của bạn thành chiếc Laptop hoàn hảo
Khả năng xử lý tác vụ đáng kinh ngạc - Con chip M1 vô cùng mạnh mẽ');
INSERT INTO Products
VALUES
(N'iPad 10.2 2021 WiFi 64GB | Chính hãng Apple Việt Nam', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/x/_/x_mmas.png', 90,7290000, 4,N'Hiệu năng ổn định - Apple A13 Bionic 6 nhân mạnh mẽ
Trải nghiệm hiển thị chất lượng - Màn hình Retina 10.2 inch, hỗ trợ True Tone
Sử dụng thoải mái suốt cả ngày - Pin 32.4 Wh (~8600 mAh) sử dụng lâu dài
Giữ trọn mọi khoảnh khắc - Camera trước 12MP và sau 8MP sắc nét, chuẩn HDR');
INSERT INTO Products
VALUES
(N'iPad Pro 11 2021 M1 WiFi 128GB I Chính hãng Apple Việt Nam', N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/i/p/ipad-pro-2021-11inch-grey_2.jpg', 85,19490000, 4,N'Đỉnh cao công nghệ màn hình - Màn hình Liquid Retina, tần số quét 120Hz, True- Tone
Hiệu năng như máy tính - Vi xử lý M1, 8GB RAM
Chụp ảnh chất lượng, hỗ trợ AR tiên tiến - Camera kép 12MP, cảm biến LiDAR cao cấp
Kết nối tốc độ cao - Wifi 6.siêu tốc, sạc nhanh Thunderbolt 4');
