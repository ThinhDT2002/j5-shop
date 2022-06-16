use master
drop database ASM_JAVA5
create database ASM_JAVA5
use ASM_JAVA5
create table Categories(
	Category_Id varchar(5) not null,
	Name nvarchar(30) not null,
	primary key (Category_Id)
)

create table Products(
	Product_Id int identity(1,1) not null,
	Name nvarchar(60) not null,
	Image1 varchar(65),
	Image2 varchar(65),
	Image3 varchar(65),
	Image4 varchar(65),
	Color nvarchar(20),
	Price decimal(12,2) not null,
	Quantity int not null,
	Manufactor nvarchar(40),
	Description nvarchar(2000),
	Discount int not null,
	Category_Id varchar(5) not null,
	primary key (Product_Id),
	constraint fk_products_category_id
	foreign key (Category_Id) references Categories(Category_Id)
)

create table Accounts(
	Username varchar(30) not null,
	Password varchar(30) not null,
	Fullname nvarchar(40),
	Phonenumber varchar(10),
	Email varchar(30) not null,
	Photo varchar(30),
	Admin bit,
	Activated bit,
	primary key (Username)
)

create table Orders(
	Order_Id int identity(1,1),
	Username varchar(30) not null,
	Create_Date date not null,
	Address nvarchar(200) not null,
	Phonenumber varchar(10),
	Order_Note nvarchar(100),
	Order_Status int,
	Price decimal(12,2),
	primary key (Order_Id),
	constraint fk_orders_username
	foreign key (Username) references Accounts(Username)
)

create table Orders_Detail(
	Orders_Detail_Id int identity(1,1),
	Order_Id int,
	Product_Id int,
	Quantity int,
	primary key (Orders_Detail_Id),
	constraint fk_orders_detail_order_id
	foreign key (Order_Id) references Orders (Order_Id),
	constraint fk_orders_detail_product_id
	foreign key (Product_Id) references Products (Product_Id)
)

create table Verify_Accounts(
	Username varchar(30) unique,
	Verify_Code varchar(30),
	primary key (Username),
	constraint fk_Verify_Accounts_Accounts
	foreign key (Username) references Accounts (Username)
)

insert into Categories
values('LAP','Laptop'),
	  ('PC',N'Máy tính để bàn'),
	  ('PHONE','Smartphone'),
	  ('GEAR',N'Linh kiện máy tính'),
	  ('MOUSE',N'Chuột + lót chuột'),
	  ('KEYB',N'Bàn phím'),
	  ('HP','Tai nghe'),
	  ('SPKER','Loa'),
	  ('CHGER',N'Bộ sạc'),
	  ('OTHER',N'Phụ kiện khác')

insert into Accounts
values('thinhdt15048','123456',N'Đỗ Tiến Thịnh','0797157720','thinhdtps15048@fpt.edu.vn','avatar1.png',1,1),
	  ('vannd15047','123456',N'Nguyễn Đạt Văn','0123456789','vanndtps15048@fpt.edu.vn','avatar2.png',1,1),
	  ('anndd14885','123456',N'Nguyễn Đỗ Duy An','0321574889','annddps14885@fpt.edu.vn','avatar3.png',1,1),
	  ('khangtg15054','123456',N'Trần Gia Khang','0154789632','khangtgps15054@fpt.edu.vn','avatar4.png',1,1),
	  ('antht15011','123456',N'Trịnh Hữu Thiện Ân','0521478965','anthtps15011@fpt.edu.vn','avatar5.png',1,1)

insert into Products(name,image1,image2,image3,image4,color,price,quantity,manufactor,description,discount,category_id)
values('Acer Aspire 7 A715 42G R4XX','Acer-Aspire-7-A715-42G-R4XX.png','Acer-Aspire-7-A715-42G-R4XX.png','Acer-Aspire-7-A715-42G-R4XX.png','Acer-Aspire-7-A715-42G-R4XX.png',N'Đen',14990000,50,N'NSX X',N'Laptop gaming tốt nhất phân khúc',10,'LAP'),
      ('TUF Gaming F15 FX506LH HN188W','TUF-Gaming-F15-FX506LH-HN188W.png','TUF-Gaming-F15-FX506LH-HN188W.png','TUF-Gaming-F15-FX506LH-HN188W.png','TUF-Gaming-F15-FX506LH-HN188W.png',N'Đen',16990000,40,N'NSX X',N'Hiệu năng cực đỉnh cho mọi tác vụ',15,'LAP'),
	  ('MSI Bravo 15 B5DD 276VN','MSI-Bravo-15-B5DD-276VN.png','MSI-Bravo-15-B5DD-276VN.png','MSI-Bravo-15-B5DD-276VN.png','MSI-Bravo-15-B5DD-276VN.png',N'Đen',15490000,45,N'NSX X',N'Trang bị công nghệ tiên tiết nhất',12,'LAP'),
	  ('Lenovo Legion 5 15ITH6 82JH002VVN','Lenovo-Legion-5-15ITH6-82JH002VVN.jpg','Lenovo-Legion-5-15ITH6-82JH002VVN.jpg','Lenovo-Legion-5-15ITH6-82JH002VVN.jpg','Lenovo-Legion-5-15ITH6-82JH002VVN.jpg',N'Đen',33490000,10,N'NSX X',N'Hiệu năng vượt trội đến từ Lenovo Legion 5 15ITH6 82JH002VVN',0,'LAP'),
	  ('Dell G15 5511 70266676','Dell-G15-5511-70266676.jpg','Dell-G15-5511-70266676.jpg','Dell-G15-5511-70266676.jpg','Dell-G15-5511-70266676.jpg',N'Đen',23190000,15,N'NSX X',N'Hiệu năng mạnh mẽ, vượt trội với RTX 3050',17,'LAP'),
	  ('HP VICTUS 16 e0175AX 4R0U8PA','HP-VICTUS-16-e0175AX-4R0U8PA.png','HP-VICTUS-16-e0175AX-4R0U8PA.png','HP-VICTUS-16-e0175AX-4R0U8PA.png','HP-VICTUS-16-e0175AX-4R0U8PA.png',N'Đen',21990000,24,N'NSX X',N'Hiệu năng mạnh mẽ, vượt trội',10,'LAP'),
	  ('GVN MINION i1030','GVN-MINION-i1030.jpg','GVN-MINION-i1030.jpg','GVN-MINION-i1030.jpg','GVN-MINION-i1030.jpg',N'Đen',8900000,5,N'NSX X',N'CPU Intel Core i3 10100F / 6MB / 4.3GHZ / 4 nhân 8 luồng / LGA 1200',5,'PC'),
	  ('GVN Neon S White Edition','GVN-Neon-S-White-Edition.jpg','GVN-Neon-S-White-Edition.jpg','GVN-Neon-S-White-Edition.jpg','GVN-Neon-S-White-Edition.jpg',N'Đen',32990000,7,N'NSX X','Mainboard GIGABYTE B660M AORUS PRO AX DDR4',7,'PC'),
	  ('GVN Tinker S','GVN-Tinker-S.jpg','GVN-Tinker-S.jpg','GVN-Tinker-S.jpg','GVN-Tinker-S.jpg',N'Đen',32390000,5,N'NSX X',N'Bo mạch chủ GIGABYTE Z690 AORUS ELITE AX DDR4 (rev. 1.0) V2',8,'PC'),
	  ('GVN CYBERPUNK','GVN-CYBERPUNK.jpg','GVN-CYBERPUNK.jpg','GVN-CYBERPUNK.jpg','GVN-CYBERPUNK.jpg',N'Đen',100000000,1,N'NSX X',N'Intel Core i9 12900KS / 3.4GHz Turbo 5.5GHz / 16 Nhân 24 Luồng / 30MB / LGA 1700',10,'PC'),
	  ('GVN Predator Z','GVN-PREDATOR-Z.jpg','GVN-PREDATOR-Z.jpg','GVN-PREDATOR-Z.jpg','GVN-PREDATOR-Z.jpg',N'Đen',59490000,3,N'NSX X','ASUS ROG STRIX Z690-A GAMING WIFI DDR4',5,'PC'),
	  ('GVN Golem WC 1080 Ti','GVN-Golem-WC-1080-Ti.jpg','GVN-Golem-WC-1080-Ti.jpg','GVN-Golem-WC-1080-Ti.jpg','GVN-Golem-WC-1080-Ti.jpg',N'Đen',49610000,8,N'NSX X',N'Cấu hình cực khủng',0,'PC'),
	  ('Samsung Galaxy S22 Ultra 5G 128GB','samsung-galaxy-s22-ultra.jpg','samsung-galaxy-s22-ultra.jpg','samsung-galaxy-s22-ultra.jpg','samsung-galaxy-s22-ultra.jpg',N'Đen',30990000,10,N'NSX X',N'Sở hữu một diện mạo đầy nổi bật',0,'PHONE'),
	  ('iPhone 11 64GB','iphone-11.jpg','iphone-11.jpg','iphone-11.jpg','iphone-11.jpg',N'Đen',14990000,20,N'NSX X',N'Nâng cấp mạnh mẽ về camera',0,'PHONE'),
	  ('OPPO Reno7 Z 5G','oppo-reno7.jpg','oppo-reno7.jpg','oppo-reno7.jpg','oppo-reno7.jpg',N'Đen',10490000,25,N'NSX X',N'Dễ dàng nổi bật giữa đám đông',0,'PHONE'),
	  ('Xiaomi Redmi Note 11 Pro','xiaomi-redmi-note-11-pro-4g.jpg','xiaomi-redmi-note-11-pro-4g.jpg','xiaomi-redmi-note-11-pro-4g.jpg','xiaomi-redmi-note-11-pro-4g.jpg',N'Đen',7190000,14,N'NSX X',N'Thiết kế cứng cáp, cầm nắm rất đầm tay',0,'PHONE'),
	  ('iPhone 13 Pro Max 128GB','iphone-13-pro-max-xanh.jpg','iphone-13-pro-max-xanh.jpg','iphone-13-pro-max-xanh.jpg','iphone-13-pro-max-xanh.jpg',N'Đen',30990000,15,N'NSX X',N'Thiết kế đẳng cấp hàng đầu',7,'PHONE'),
	  ('Samsung Galaxy A52s 5G 128GB','samsung-galaxy-a52s-5g.jpg','samsung-galaxy-a52s-5g.jpg','samsung-galaxy-a52s-5g.jpg','samsung-galaxy-a52s-5g.jpg',N'Đen',8990000,25,N'NSX X',N'Thiết kế đặc trưng Galaxy A',0,'PHONE'),
	  ('ASUS Dual GeForce RTX 3070 8G V2','ASUS-Dual-GeForce-RTX-3070-8G-V2.jpg','ASUS-Dual-GeForce-RTX-3070-8G-V2.jpg','ASUS-Dual-GeForce-RTX-3070-8G-V2.jpg','ASUS-Dual-GeForce-RTX-3070-8G-V2.jpg',N'Đen',19990000,11,N'NSX X',N'Card đồ họa mạnh mẽ  mới nhất đến từ Asus dựa trên kiến trúc NVIDIA Ampere hoàn toàn mới',0,'GEAR'),
	  ('Intel Pentium G6405','Intel-Pentium-G6405.jpg','Intel-Pentium-G6405.jpg','Intel-Pentium-G6405.jpg','Intel-Pentium-G6405.jpg',N'Đen',1900000,30,N'NSX X',N'Với sự cải tiến về xung nhịp, hứa hẹn đây sẽ là một lựa chọn vô cùng hấp dẫn',0,'GEAR'),
	  ('ASUS PRIME H610M-A WIFI D4','ASUS-PRIME-H610M-A-WIFI-D4.jpg','ASUS-PRIME-H610M-A-WIFI-D4.jpg','ASUS-PRIME-H610M-A-WIFI-D4.jpg','ASUS-PRIME-H610M-A-WIFI-D4.jpg',N'Đen',3190000,35,N'NSX X',N'Tăng hiệu suất hỗ trợ cho công việc của bạn đáng kể.',7,'GEAR'),
	  ('ADATA XPG Hunter DDR5 8G Bus 5200','ADATA-XPG-Hunter-DDR5-8G-Bus-5200.jpg','ADATA-XPG-Hunter-DDR5-8G-Bus-5200.jpg','ADATA-XPG-Hunter-DDR5-8G-Bus-5200.jpg','ADATA-XPG-Hunter-DDR5-8G-Bus-5200.jpg',N'Đen',2390000,40,N'NSX X',N'Tăng RAM cho máy tính của bạn',0,'GEAR'),
	  ('Case JETEK EM4','Case-JETEK-EM4.jpg','Case-JETEK-EM4.jpg','Case-JETEK-EM4.jpg','Case-JETEK-EM4.jpg',N'Đen',330000,15,N'NSX X',N'Vỏ máy tính giá rẻ',0,'GEAR'),
	  (N'Tản nhiệt DEEPCOOL GAMMAXX 400 XT','DEEPCOOL-GAMMAXX-400-XT.jpg','DEEPCOOL-GAMMAXX-400-XT.jpg','DEEPCOOL-GAMMAXX-400-XT.jpg','DEEPCOOL-GAMMAXX-400-XT.jpg',N'Đen',690000,12,N'NSX X',N'Quạt tản nhiệt cho máy tính',0,'GEAR'),
	  (N'Chuột Logitech G203 LightSync Blue','Logitech-G203-LightSync-Blue.jpg','Logitech-G203-LightSync-Blue.jpg','Logitech-G203-LightSync-Blue.jpg','Logitech-G203-LightSync-Blue.jpg',N'Đen',400000,21,N'NSX X',N'Sở hữu nhiều nút bấm và độ nhạy cao',0,'MOUSE'),
	  (N'Chuột Razer Pro Click Mini Wireless','Razer-Pro-Click-Mini-Wireless.jpg','Razer-Pro-Click-Mini-Wireless.jpg','Razer-Pro-Click-Mini-Wireless.jpg','Razer-Pro-Click-Mini-Wireless.jpg',N'Đen',1990000,10,N'NSX X',N'Một trong những dòng sản phẩm chuột từ Razer di chuyển hoàn hảo để tăng năng suất khi di chuyển',0,'MOUSE'),
	  (N'Chuột Corsair Katar Pro Ultra Light',N'Corsair-Katar-Pro-Ultra-Light.jpg',N'Corsair-Katar-Pro-Ultra-Light.jpg',N'Corsair-Katar-Pro-Ultra-Light.jpg',N'Corsair-Katar-Pro-Ultra-Light.jpg',N'Đen',390000,100,N'NSX X',N'Một dòng chuột gaming giá rẻ ,Corsair Katar Pro Ultra Light cực kỳ nhẹ và thao tác nhanh nhạy',0,'MOUSE'),
	  (N'Chuột Dare-U LM103','Dare-U-LM103.jpg','Dare-U-LM103.jpg','Dare-U-LM103.jpg','Dare-U-LM103.jpg',N'Đen',100000,200,N'NSX X',N'Chuột siêu rẻ',0,'MOUSE'),
	  (N'Chuột Fuhlen L102 Optical Pink USB','Fuhlen-L102-Optical-Pink-USB.jpg','Fuhlen-L102-Optical-Pink-USB.jpg','Fuhlen-L102-Optical-Pink-USB.jpg','Fuhlen-L102-Optical-Pink-USB.jpg',N'Đen',140000,120,N'NSX X',N'Chuột giá rẻ',0,'MOUSE'),
	  (N'Chuột Asus TUF Gaming M4 Air','Asus-TUF-Gaming-M4-Air.jpg','Asus-TUF-Gaming-M4-Air.jpg','Asus-TUF-Gaming-M4-Air.jpg','Asus-TUF-Gaming-M4-Air.jpg',N'Đen',990000,30,N'NSX X',N'Thiết kế hiện đại',0,'MOUSE'),
	  ('Logitech G413 SE','ban-phim-co-logitech-g413-se-tactile-sw.png','ban-phim-co-logitech-g413-se-tactile-sw.png','ban-phim-co-logitech-g413-se-tactile-sw.png','ban-phim-co-logitech-g413-se-tactile-sw.png',N'Đen',1690000,200,N'NSX X',N'Bàn phím cơ gaming giá rẻ',15,'KEYB'),
	  ('Logitech G Pro X GX BLue Switch','G-PRO-X-1-compressed-1.jpg','G-PRO-X-1-compressed-1.jpg','G-PRO-X-1-compressed-1.jpg','G-PRO-X-1-compressed-1.jpg',N'Đen',2390000,129,N'NXS X',N'Bàn phím cơ logitech blue switch',19,'KEYB'),
	  ('AKKO PC75B Plus Year of Tiger','akko-pc75b-plus-year-of-tiger.jpeg','akko-pc75b-plus-year-of-tiger.jpeg','akko-pc75b-plus-year-of-tiger.jpeg','akko-pc75b-plus-year-of-tiger.jpeg',N'Đen',2790000,300,N'NSX X',N'Bàn phím dựa theo chủ đề tết',10,'KEYB'),
	  ('Logitech Pro X LEAGUE OF LEGENDS','Pro-KB-LOL.jpg','Pro-KB-LOL.jpg','Pro-KB-LOL.jpg','Pro-KB-LOL.jpg',N'Đen',2390000,500,N'NSX X',N'Bàn phím hot nhất hiện nay',12,'KEYB'),
	  ('ASUS ROG Strix Flare II','flare-ii-animate.png','flare-ii-animate.png','flare-ii-animate.png','flare-ii-animate.png',N'Đen',4990000,89,N'NSX X',N'Bàn phím cơ tốt nhất hiện nay',11,'KEYB'),
	  ('Razer Huntsman V2 Analog','huntman-analog-v2.jpg','huntman-analog-v2.jpg','huntman-analog-v2.jpg','huntman-analog-v2.jpg',N'Đen',6190000,28,N'NSX X',N'Bàn phím cao cấp',10,'KEYB'),
	  ('Razer BlackShark V2 X 7.1 Surrround','Razer-BlackShark-V2-Surrround.jpg','Razer-BlackShark-V2-Surrround.jpg','Razer-BlackShark-V2-Surrround.jpg','Razer-BlackShark-V2-Surrround.jpg',N'Đen',1290000,58,N'NSX X',N'Tai Nghe Razer giá rẻ',5,'HP'),
	  ('Logitech G335 Black','G355-black-compressed.jpg','G355-black-compressed.jpg','G355-black-compressed.jpg','G355-black-compressed.jpg',N'Đen',1290000,78,N'NSX X',N'Tai nghe Logitech giá rẻ',8,'HP'),
	  ('Kingston HyperX Cloud Stinger S 7.1','Kingston-HyperX-Cloud-Stinger.jpg','Kingston-HyperX-Cloud-Stinger.jpg','Kingston-HyperX-Cloud-Stinger.jpg','Kingston-HyperX-Cloud-Stinger.jpg',N'Đen',1350000,63,N'NSX X',N'Tai Nghe HyperX giá rẻ',10,'HP'),
	  ('GIGABYTE AORUS H1 GAMING HEADSET','Aorus-H1-compressed.jpg','Aorus-H1-compressed.jpg','Aorus-H1-compressed.jpg','Aorus-H1-compressed.jpg',N'Đen',1990000,72,N'NSX X',N'Tai Nghe GIGABYTE',10,'HP'),
	  ('Asus ROG Cetra True Wireless','cetra-tw-1.png','cetra-tw-1.png','cetra-tw-1.png','cetra-tw-1.png',N'Đen',2190000,39,N'NSX X',N'Tai nghe Asus',5,'HP'),
	  ('Asus ROG Delta S Animate','rog-delta-s-animate.png','rog-delta-s-animate.png','rog-delta-s-animate.png','rog-delta-s-animate.png',N'Đen',5390000,14,N'NSX X',N'Tai nghe tốt nhất hiện nay',15,'HP'),
	  ('Havit SK202 USB 3.5MM 5W','SK202-1.png','SK202-1.png','SK202-1.png','SK202-1.png',N'Đen',390000,98,N'NSX X',N'Loa bán chạy nhất hiện nay',5,'SPKER'),
	  ('Razer Nommo Chroma','razer-nommo-chroma.jpg','razer-nommo-chroma.jpg','razer-nommo-chroma.jpg','razer-nommo-chroma.jpg',N'Đen',3690000,39,N'NSX X',N'Loa Razer',10,'SPKER'),
	  ('Razer Leviathan V2 RGB Bluetooth 5.2','leviathan.png','leviathan.png','leviathan.png','leviathan.png',N'Đen',6990000,12,N'NSX X',N'Loa tốt nhất hiện nay',15,'SPKER'),
	  ('Bluetooth JBL Pulse 4','Bluetooth-JBL-Pulse-4.jpg','Bluetooth-JBL-Pulse-4.jpg','Bluetooth-JBL-Pulse-4.jpg','Bluetooth-JBL-Pulse-4.jpg',N'Đen',4400000,27,N'NSX X',N'Loa hot nhất hiện nay',10,'SPKER'),
	  ('Harman/Kardon Aura Studio 3','Loa-Harman-Kardon-Aura-Studio-3.jpg','Loa-Harman-Kardon-Aura-Studio-3.jpg','Loa-Harman-Kardon-Aura-Studio-3.jpg','Loa-Harman-Kardon-Aura-Studio-3.jpg',N'Đen',5990000,18,N'NSX X',N'Loa Harman/Kardon',18,'SPKER'),
	  ('JBL Quantum DUO','JBL-Quantum-DUO.jpg','JBL-Quantum-DUO.jpg','JBL-Quantum-DUO.jpg','JBL-Quantum-DUO.jpg',N'Đen',3490000,48,N'NSX X',N'Loa JBL giá tầm trung',20,'SPKER'),
	  ('Aukey Bundle On The Go 3 in 1','Aukey-Bundle.jpg','Aukey-Bundle.jpg','Aukey-Bundle.jpg','Aukey-Bundle.jpg',N'Đen',990000,87,N'NSX X',N'Bộ sạc Aukey Bundle On The Go 3 trong 1',5,'CHGER'),
	  ('HyperJuice Magnetic 2 in 1','HyperJuice-Magnetic.jpg','HyperJuice-Magnetic.jpg','HyperJuice-Magnetic.jpg','HyperJuice-Magnetic.jpg',N'Đen',1090000,56,N'NSX X',N'Bộ sạc không dây HyperJuice Magnetic',8,'CHGER'),
	  ('GoPro Hero 9 | Hero 10','GoPro-Hero-9-Hero-10.jpg','GoPro-Hero-9-Hero-10.jpg','GoPro-Hero-9-Hero-10.jpg','GoPro-Hero-9-Hero-10.jpg',N'Đen',1350000,25,N'NSX X',N'Bộ sạc pin cho GoPro Hero 9|10',12,'CHGER'),
	  (N'Bộ sạc IPhone kèm cáp Lighning Genshai','new-project.jpg','new-project.jpg','new-project.jpg','new-project.jpg',N'Đen',150000,89,N'NSX X',N'Bộ sạc cho Iphone',5,'CHGER'),
	  (N'Bộ sạc nhanh cho Iphone kèm cáp','new-iphone.jpg','new-iphone.jpg','new-iphone.jpg','new-iphone.jpg',N'Đen',450000,58,N'NSX X',N'Bộ sạc nhanh cho Iphone',8,'CHGER'),
	  (N'Bộ sạc pin li-ion','Nitecore-New-i2.jpg','Nitecore-New-i2.jpg','Nitecore-New-i2.jpg','Nitecore-New-i2.jpg',N'Đen',320000,12,N'NSX X',N'Bộ sạc cho pin li-ion của Nitecore',12,'CHGER'),
	  ('Cooler Master X150R Spectrum RGB','x150r-spectrum-1.jpg','x150r-spectrum-1.jpg','x150r-spectrum-1.jpg','x150r-spectrum-1.jpg',N'Đen',1050000,28,N'NSX X',N'Đế tản nhiệt laptop Cooler Master',5,'OTHER'),
	  (N'Dây LED Cooler Master LED TUBE SLEEVE','led-tube-sleeve-a1.jpeg','led-tube-sleeve-a1.jpeg','led-tube-sleeve-a1.jpeg','led-tube-sleeve-a1.jpeg',N'Đen',990000,38,N'NSX X',N'Dây LED trang trí cho PC',10,'OTHER'),
	  ('Thermal Grizzly Kryonaut 1G','thermal-grizzly-kryonaut.jpg','thermal-grizzly-kryonaut.jpg','thermal-grizzly-kryonaut.jpg','thermal-grizzly-kryonaut.jpg',N'Đen',150000,78,N'NSX X',N'Kem tản nhiệt Thermal',12,'OTHER'),
	  ('ASUS Zenwifi AX XT8','ZenWiFi-AC-XT8-black.jpg','ZenWiFi-AC-XT8-black.jpg','ZenWiFi-AC-XT8-black.jpg','ZenWiFi-AC-XT8-black.jpg',N'Đen',11690000,23,N'NSX X',N'Bộ Phát Wifi ASUS Zenwifi AX XT8',15,'OTHER'),
	  ('HyperX Cloud Virtual 7.1 Surround','CloudII-controller-compressed.jpg','CloudII-controller-compressed.jpg','CloudII-controller-compressed.jpg','CloudII-controller-compressed.jpg',N'Đen',1050000,8,N'NSX X',N'Card âm thanh HyberX',8,'OTHER'),
	  ('HyperX Pudding PBT Doubleshot','Pudding-keycap-1.jpg','Pudding-keycap-1.jpg','Pudding-keycap-1.jpg','Pudding-keycap-1.jpg',N'Đen',650000,41,N'NSX X',N'Bộ keycap HyperX Pudding PBT Doubleshot',12,'OTHER')


go
create procedure CreateOrder(
@Username varchar(30),
@Create_Date date, 
@Address nvarchar(200),
@Phonenumber varchar(10), 
@Order_Note nvarchar(100), 
@Order_Status int, 
@Price decimal(12,2),
@Output int output)
as
begin
declare @OutputOrderId Table(id int)
insert into Orders(Username,Create_Date,Address, Phonenumber, Order_Note, Order_Status,Price)
output inserted.Order_Id into @OutputOrderId(id)
values(@Username,@Create_Date,@Address,@Phonenumber,@Order_Note,@Order_Status,@Price)
set @Output = (select id from @OutputOrderId)
return @Output
end


declare @o int
exec @o= CreateOrder'thinhdt15048','06-16-2022',N'TPHCM','0123456789','None',1,1000000,null
select @o
