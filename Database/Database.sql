USE MASTER
GO

--DROP DATABASE ASM_JAVA5
--GO

CREATE DATABASE ASM_JAVA5
GO

USE ASM_JAVA5
GO

CREATE TABLE NguoiDung (
	ID_KH int IDENTITY(1,1) PRIMARY KEY,	-- Mã người dùng
	HoTen nvarchar(50), -- Tên người dùng
	NgaySinh date, -- Ngày sinh
	GioiTinh bit, -- Giới tính
	SoDT nchar(15),	-- Số điện thoại
	Email nvarchar(50), -- Email
	Anh nvarchar (100),	-- Ảnh đại diện
	TenTK nvarchar(50), -- Tên tài khoản
	MatKhau nvarchar(50),	-- Mật khẩu
	DiaChi nvarchar(255), -- Địa chỉ
	VaiTro bit	-- Vai trò
)
GO

CREATE TABLE DanhMuc (
	ID_DM int IDENTITY(1,1) PRIMARY KEY,-- Mã danh mục
	TenDM nvarchar(50)	-- Tên danh mục
)
GO

CREATE TABLE SanPham (
	ID_SP int IDENTITY(1,1) PRIMARY KEY, -- Mã sản phẩm
	TenSP nvarchar(250),	-- Tên sản phẩm
	TrangThai bit,	-- Trạng thái còn/hết hàng
	Anh nvarchar(250),	-- Ảnh sản phẩm
	Gia decimal (9,0),	-- Giá
	SLTonKho int,	-- SL tồn kho
	MoTa nvarchar(250),	-- Mô tả
	ID_DM int, -- Mã danh mục
	Is_Delete bit, -- sp đã xóa khỏi danh sách/ chưa
	CONSTRAINT FK_SP_DM FOREIGN KEY (ID_DM) REFERENCES DanhMuc(ID_DM) ON DELETE SET NULL ON UPDATE NO ACTION
)
GO


CREATE TABLE DonDatHang (
	ID_DDH int IDENTITY(1,1) PRIMARY KEY, -- Mã đơn hàng
	NgayDat date, -- Ngày đặt
	GhiChuKH nvarchar(250), -- Ghi chú
	TongTien decimal(9,0), -- Tổng tiền
	TrangThai nvarchar(50), -- Trạng thái
	SoDT nchar(15),	-- SĐT sẽ gửi cho khách nhận hàng
	DiaChi nvarchar(255), -- Địa chỉ nhận hàng
	ID_KH int, -- Mã khách hàng
	CONSTRAINT FK_DDH_KH FOREIGN KEY (ID_KH) REFERENCES NguoiDung(ID_KH) ON DELETE NO ACTION ON UPDATE CASCADE
)
GO

CREATE TABLE DonDatChiTiet (
	ID_DDCT int IDENTITY(1,1) PRIMARY KEY, -- Mã đơn hàng chi tiết
	ID_DDH int, -- Mã đơn hàng
	ID_SP int, -- Mã sản phẩm
	SoLuong int, -- Số lượng sản phẩm
	TongTien decimal (9,0),	-- SL * Giá SP => Tổng tiền
	CONSTRAINT FK_DDCT_SP FOREIGN KEY (ID_SP) REFERENCES SanPham(ID_SP) ON DELETE NO ACTION ON UPDATE CASCADE,
	CONSTRAINT FK_DDCT_DDH FOREIGN KEY (ID_DDH) REFERENCES DonDatHang(ID_DDH) ON DELETE NO ACTION ON UPDATE CASCADE,
)
GO

CREATE TABLE FeedBack (
	ID_FB int IDENTITY(1,1) PRIMARY KEY, -- Mã đánh giá
	ID_KH int, -- Mã khách hàng
	ID_SP int, -- Mã sản phẩm
	DanhGia float, -- Chỉ số đánh giá
	NoiDung nvarchar(250), -- Nội dung
	NgayDang date, -- Ngày đăng
	CONSTRAINT FK_FB_SP FOREIGN KEY (ID_SP) REFERENCES SanPham(ID_SP) ON DELETE NO ACTION ON UPDATE CASCADE,
	CONSTRAINT FK_FB_KH FOREIGN KEY (ID_KH) REFERENCES NguoiDung(ID_KH) ON DELETE NO ACTION ON UPDATE CASCADE
)
GO

------------------------- THÊM DỮ LIỆU --------------------------
-- Insert NguoiDung
INSERT NguoiDung  (HoTen, NgaySinh, GioiTinh, SoDT ,Email, Anh , TenTK, MatKhau, DiaChi ,VaiTro )
	VALUES (N'Đỗ Phi Hùng', '2002-12-01', 1, '0383123456', 'hungdpps19239@fpt.edu.vn', 'anh4.png','hung123','Hung123', N'1234 Quang Trung, Phường 10, Gò Vấp',1)
INSERT NguoiDung  (HoTen, NgaySinh, GioiTinh, SoDT ,Email, Anh , TenTK, MatKhau, DiaChi ,VaiTro )
	VALUES (N'Cao Hoài Bảo Ngọc', '2002-01-01', 0, '0353123456', 'ngocchbps19105@fpt.edu.vn', 'anh1.jpg','ngoc123','Ngoc123', N'106 Lưu Chí Hiếu, Phường Tây Thạnh, Tân Phú',1)
INSERT NguoiDung  (HoTen, NgaySinh, GioiTinh, SoDT ,Email, Anh , TenTK, MatKhau, DiaChi ,VaiTro )
	VALUES (N'Bùi Nhật Trường', '1999-01-01', 1, '0363123456', 'truongbnps19317@fpt.edu.vn', 'anh2.jpg','truong123','Truong123', N'1234 Quang Trung, Phường 10, Gò Vấp',1)
INSERT NguoiDung  (HoTen, NgaySinh, GioiTinh, SoDT ,Email, Anh , TenTK, MatKhau, DiaChi ,VaiTro )
	VALUES (N'Nguyễn Hoàng Quốc Anh', '2002-08-16', 1, '0373123456', 'anhnhqps17999@fpt.edu.vn', 'anh3.jpg','anh123','Anh123', N'336/5 Phan Văn Trị, Phường 11, Bình Thạnh',1)
INSERT NguoiDung  (HoTen, NgaySinh, GioiTinh, SoDT ,Email, Anh , TenTK, MatKhau, DiaChi ,VaiTro )
	VALUES (N'Đặng Hoàng Thái', '1992-03-11', 1, '0383123456', 'thai@gmail.com', 'user2.png','thai123','Thai123', N'3/2 , Phường 10, Bình Tân',0)
INSERT NguoiDung  (HoTen, NgaySinh, GioiTinh, SoDT ,Email, Anh , TenTK, MatKhau, DiaChi ,VaiTro )
	VALUES (N'Liễu Hà Thu', '1989-05-18', 0, '0357947279', 'thu@gmail.com', 'user3.png','thu123','Thu123', N'56A Nguyễn Huệ, Phường 10, Quận 7',0)
INSERT NguoiDung  (HoTen, NgaySinh, GioiTinh, SoDT ,Email, Anh , TenTK, MatKhau, DiaChi ,VaiTro )
	VALUES (N'Bùi Tuấn Dũng', '1997-11-21', 1, '0957378426', 'dung@gmail.com', 'user14.png','dung123','Dung123', N'567 Cách Mạng Tháng Tám, Phường 5, Tân Phú',0)
INSERT NguoiDung  (HoTen, NgaySinh, GioiTinh, SoDT ,Email, Anh , TenTK, MatKhau, DiaChi ,VaiTro )
	VALUES (N'Nguyễn Bảo Như An', '1889-08-22', 0, '0759365860', 'an@gmail.com', 'user5.png','an123','An123', N'56 Nguyễn Hữu Cảnh, Tây Thạnh, Tân Phú',0)
INSERT NguoiDung  (HoTen, NgaySinh, GioiTinh, SoDT ,Email, Anh , TenTK, MatKhau, DiaChi ,VaiTro )
	VALUES (N'Trần Đặng Anh Thư', '1984-09-15', 0, '0383123456', 'thu@gmail.com', 'user6.png','thu123','Thu123', N'Đường CN1, Phường Tây Thạnh, Tân Phú',0)
INSERT NguoiDung  (HoTen, NgaySinh, GioiTinh, SoDT ,Email, Anh , TenTK, MatKhau, DiaChi ,VaiTro )
	VALUES (N'Lâm Anh Tuấn', '1999-11-28', 1, '0923748593', 'tuan@gmail.com', 'user7.png','tuan123','Tuan123', N'77 Lý Cảnh Chân, Phường 6, Quận 1',0)
INSERT NguoiDung  (HoTen, NgaySinh, GioiTinh, SoDT ,Email, Anh , TenTK, MatKhau, DiaChi ,VaiTro )
	VALUES (N'Trần Anh Quốc', '1992-08-03', 1, '0363123456', 'quoc@gmail.com', 'user8.png','quoc123','Quoc123', N'123 Hai Bà Trưng, Phường 7, Quận 2',0)
INSERT NguoiDung  (HoTen, NgaySinh, GioiTinh, SoDT ,Email, Anh , TenTK, MatKhau, DiaChi ,VaiTro )
	VALUES (N'Nguyễn Thái Thiên Ân', '2002-07-17', 0, '05739572462', 'annguyen@gmail.com', 'user9.png','thienan123','Thienan123', N'88/2 Bà Hạt, Phường 10, Quận 10',0)
INSERT NguoiDung  (HoTen, NgaySinh, GioiTinh, SoDT ,Email, Anh , TenTK, MatKhau, DiaChi ,VaiTro )
	VALUES (N'Trịnh Minh Trí', '2001-09-30', 1, '0375839530', 'tri@gmail.com', 'user10.png','tri123','Tri123', N'123 Phan Xích Long, Phường 8, Bình Tân',0)
INSERT NguoiDung  (HoTen, NgaySinh, GioiTinh, SoDT ,Email, Anh , TenTK, MatKhau, DiaChi ,VaiTro )
	VALUES (N'Cao Thái Hà', '1998-12-13', 1, '0374852956', 'ha@gmail.com', 'user11.png','ha123','Ha123', N'1123 Nguyễn Chí Thắng, Phường 5, Quận 3',0)
INSERT NguoiDung  (HoTen, NgaySinh, GioiTinh, SoDT ,Email, Anh , TenTK, MatKhau, DiaChi ,VaiTro )
	VALUES (N'Thái Lý Luận', '1990-05-07', 1, '0357284957', 'luan@gmail.com', 'user12.png','luan123','Luan123', N'56 Quang Trung, Phường 10, Gò Vấp',0)
INSERT NguoiDung  (HoTen, NgaySinh, GioiTinh, SoDT ,Email, Anh , TenTK, MatKhau, DiaChi ,VaiTro )
	VALUES (N'Nguyễn Trần Thiên Bảo', '1995-04-01', 1, '0357836579', 'bao@gmail.com', 'user13.png','bao123','Bao123', N'1234 Phan Huy Ích, Phường 10, Thủ Đức',0)
INSERT NguoiDung  (HoTen, NgaySinh, GioiTinh, SoDT ,Email, Anh , TenTK, MatKhau, DiaChi ,VaiTro )
	VALUES (N'Đỗ Ánh Tuyết', '1989-08-22', 0, '0383123456', 'tuyet@gmail.com', 'user14.png','tuyet123','Tuyet123', N'81068 Âu Cơ, Phường 2, Tân Bình',0)
INSERT NguoiDung  (HoTen, NgaySinh, GioiTinh, SoDT ,Email, Anh , TenTK, MatKhau, DiaChi ,VaiTro )
	VALUES (N'Nguyễn Bảo Kha', '2002-02-05', 1, '0752748942', 'kha@gmail.com', 'user15.png','kha123','Kha123', N'1050 Âu Cơ, Phường 10, Tân Bình',0)
INSERT NguoiDung  (HoTen, NgaySinh, GioiTinh, SoDT ,Email, Anh , TenTK, MatKhau, DiaChi ,VaiTro )
	VALUES (N'Bùi Nhật Minh', '1998-03-24', 1, '03475829557', 'minh@gmail.com', 'user16.png','minh123','Minh123', N'12 Tân Trị, Phường 9, Quận 5',0)
INSERT NguoiDung  (HoTen, NgaySinh, GioiTinh, SoDT ,Email, Anh , TenTK, MatKhau, DiaChi ,VaiTro )
	VALUES (N'Nguyễn Hoàng Bảo Như', '2001-10-05', 0, '0358951246', 'nhu@gmail.com', 'user17.png','nhu123','Nhu123', N'235 Bà Triệu , Phường Phú Khương, Thủ Đức',0)

	

-- Insert DanhMuc
INSERT INTO DanhMuc VALUES 
	(N'Hoa cưới'),
	(N'Hoa khai trương'),
	(N'Hoa lễ'),
	(N'Hoa viếng'),
	(N'Hoa bó'),
	(N'Hoa kiểng'),
	(N'Cây dây leo'),
	(N'Cây phong thủy'),
	(N'Cây ăn quả'),
	(N'Cây kiểng'),
	(N'Bonsai')
GO

-- Insert SanPham
INSERT SanPham (TenSP ,TrangThai ,Anh ,Gia ,SLTonKho ,MoTa ,Id_DM, Is_Delete)
	VALUES (N'Hoa Sắc Đỏ', 1, 'Sac-Do.jpg', 1000, 20, N'Loại hoa phù hợp cho tiệc cưới, đám lễ', 1, 0)
INSERT SanPham (TenSP ,TrangThai ,Anh ,Gia ,SLTonKho ,MoTa ,Id_DM, Is_Delete)
	VALUES (N'Hoa Tươi Đẹp', 1, 'Tuoi-Dep.jpg', 2100, 20, N'Loại hoa phù hợp cho tiệc cưới, đám lễ', 1, 0)
INSERT SanPham (TenSP ,TrangThai ,Anh ,Gia ,SLTonKho ,MoTa ,Id_DM, Is_Delete)
	VALUES (N'Hoa Tốt Lành', 1, 'The-Best-Day.jpg', 950, 20, N'Loại hoa phù hợp cho tiệc cưới, đám lễ', 1, 0)
INSERT SanPham (TenSP ,TrangThai ,Anh ,Gia ,SLTonKho ,MoTa ,Id_DM, Is_Delete)
	VALUES (N'Hoa Khai Trương', 1, 'Khai-Truong-Hong.jpg', 750, 20, N'Loại hoa phù hợp cho việc khai trương', 2, 0)
INSERT SanPham (TenSP ,TrangThai ,Anh ,Gia ,SLTonKho ,MoTa ,Id_DM, Is_Delete)
	VALUES (N'Cây Tài Lộc', 1, 'Vung-Tien.jpg', 1500, 20, N'Loại hoa phù hợp cho việc khai trương', 2, 0)
INSERT SanPham (TenSP ,TrangThai ,Anh ,Gia ,SLTonKho ,MoTa ,Id_DM, Is_Delete)
	VALUES (N'Hoa Lắng Đọng', 1, 'Lang-Dong.jpg', 500, 20, N'Loại hoa phù hợp cho việc đám, tiệc chia buồn', 2, 0)
INSERT SanPham (TenSP ,TrangThai ,Anh ,Gia ,SLTonKho ,MoTa ,Id_DM, Is_Delete)
	VALUES (N'Hoa hồng', 1, 'Loi-Cuon.jpg', 450, 20, N'Loại hoa phù hợp cho việc đám, tiệc chia buồn', 3, 0)
INSERT SanPham (TenSP ,TrangThai ,Anh ,Gia ,SLTonKho ,MoTa ,Id_DM, Is_Delete)
	VALUES (N'Hoa Hướng Dương', 1, 'Tuoi-Dep.jpg', 400, 20, N'Loại hoa phù hợp cho tiệc cưới, đám lễ', 3, 0)
INSERT SanPham (TenSP ,TrangThai ,Anh ,Gia ,SLTonKho ,MoTa ,Id_DM, Is_Delete)
	VALUES (N'Cây Tài Lộc', 1, '2.jpg', 200, 20, N'Loại hoa phù hợp cho tiệc cưới, đám lễ', 3, 0)
INSERT SanPham (TenSP ,TrangThai ,Anh ,Gia ,SLTonKho ,MoTa ,Id_DM, Is_Delete)
	VALUES (N'Hoa Cúc Trắng', 1, 'Chia-Xa.jpg', 250, 20, N'Loại hoa phù hợp cho tiệc cưới, đám lễ', 4, 0)
INSERT SanPham (TenSP ,TrangThai ,Anh ,Gia ,SLTonKho ,MoTa ,Id_DM, Is_Delete)
	VALUES (N'Hoa Hồng Trắng', 1, 'Tuoi-Dep.jpg', 2000, 20, N'Loại hoa phù hợp cho tiệc cưới, đám lễ', 4, 0)
INSERT SanPham (TenSP ,TrangThai ,Anh ,Gia ,SLTonKho ,MoTa ,Id_DM, Is_Delete)
	VALUES (N'Hoa Hồng Lai', 1, 'Loi-Cuon.jpg', 2500, 20, N'Loại hoa phù hợp cho tiệc cưới, đám lễ', 4, 0)
INSERT SanPham (TenSP ,TrangThai ,Anh ,Gia ,SLTonKho ,MoTa ,Id_DM, Is_Delete)
	VALUES (N'Hoa Hồng Lai', 1, 'Sac-Do.jpg', 850, 20, N'Loại choa phù hợp tặng dịp lễ', 5, 0)	
INSERT SanPham (TenSP ,TrangThai ,Anh ,Gia ,SLTonKho ,MoTa ,Id_DM, Is_Delete)
	VALUES (N'Hoa Hồng Tím', 1, 'Lang-Dong.jpg', 850, 20, N'Loại choa phù hợp tặng dịp lễ', 5, 0)
INSERT SanPham (TenSP ,TrangThai ,Anh ,Gia ,SLTonKho ,MoTa ,Id_DM, Is_Delete)
	VALUES (N'Hoa Hồng Xanh ', 1, 'The-Best-Day.jpg', 850, 20, N'Loại choa phù hợp tặng dịp lễ', 5, 0)
INSERT SanPham (TenSP ,TrangThai ,Anh ,Gia ,SLTonKho ,MoTa ,Id_DM, Is_Delete)
	VALUES (N'Sen Đá', 1, '5.jpg', 850, 20, N'Loại cây cảnh phù hợp cho việc trang trí trong nhà lẫn ngoài vườn', 6, 0)
INSERT SanPham (TenSP ,TrangThai ,Anh ,Gia ,SLTonKho ,MoTa ,Id_DM, Is_Delete)
	VALUES (N'Cây Thông', 1, '11.jpg', 850, 20, N'Loại cây cảnh phù hợp cho việc trang trí trong nhà lẫn ngoài vườn', 6, 0)
INSERT SanPham (TenSP ,TrangThai ,Anh ,Gia ,SLTonKho ,MoTa ,Id_DM, Is_Delete)
	VALUES (N'Cây Dừa Cạn ', 1, '20.jpg', 850, 20, N'Loại cây cảnh phù hợp cho việc trang trí trong nhà lẫn ngoài vườn', 6, 0)
INSERT SanPham (TenSP ,TrangThai ,Anh ,Gia ,SLTonKho ,MoTa ,Id_DM, Is_Delete)
	VALUES (N'Cây Nhai Bách', 1, '16.jpg', 850, 20, N'Loại cây cảnh phù hợp cho việc trang trí trong nhà lẫn ngoài vườn', 7, 0)
INSERT SanPham (TenSP ,TrangThai ,Anh ,Gia ,SLTonKho ,MoTa ,Id_DM, Is_Delete)
	VALUES (N'Cây Thược Dược', 1, '17.jpg', 850, 20, N'Loại cây cảnh phù hợp cho việc trang trí trong nhà lẫn ngoài vườn', 7, 0)
INSERT SanPham (TenSP ,TrangThai ,Anh ,Gia ,SLTonKho ,MoTa ,Id_DM, Is_Delete)
	VALUES (N'Cây Trầu Không', 1, '4.jpg', 850, 20, N'Loại cây cảnh phù hợp cho việc trang trí trong nhà lẫn ngoài vườn', 7, 0)
INSERT SanPham (TenSP ,TrangThai ,Anh ,Gia ,SLTonKho ,MoTa ,Id_DM, Is_Delete)
	VALUES (N'Cây Nhai Bách', 1, '13.jpg', 850, 20, N'Loại cây cảnh phù hợp cho việc trang trí trong nhà lẫn ngoài vườn', 8, 0)
INSERT SanPham (TenSP ,TrangThai ,Anh ,Gia ,SLTonKho ,MoTa ,Id_DM, Is_Delete)
	VALUES (N'Cây Đồng Tiền', 1, '8.jpg', 850, 20, N'Loại cây cảnh phù hợp cho việc trang trí trong nhà lẫn ngoài vườn', 8, 0)
INSERT SanPham (TenSP ,TrangThai ,Anh ,Gia ,SLTonKho ,MoTa ,Id_DM, Is_Delete)
	VALUES (N'Cây Vạn Tuế', 1, '12.jpg', 850, 20, N'Loại cây cảnh phù hợp cho việc trang trí trong nhà lẫn ngoài vườn', 8, 0)
INSERT SanPham (TenSP ,TrangThai ,Anh ,Gia ,SLTonKho ,MoTa ,Id_DM, Is_Delete)
	VALUES (N'Cây Bạch Linh', 1, '17.jpg', 850, 20, N'Loại cây cảnh phù hợp cho việc trang trí trong nhà lẫn ngoài vườn', 9, 0)
INSERT SanPham (TenSP ,TrangThai ,Anh ,Gia ,SLTonKho ,MoTa ,Id_DM, Is_Delete)
	VALUES (N'Cây Lưỡi Hổ', 1, '14.jpg', 850, 20, N'Loại cây cảnh phù hợp cho việc trang trí trong nhà lẫn ngoài vườn', 9, 0)
INSERT SanPham (TenSP ,TrangThai ,Anh ,Gia ,SLTonKho ,MoTa ,Id_DM, Is_Delete)
	VALUES (N'Cây Sầu Đâu', 1, '3.jpg', 850, 20, N'Loại cây cảnh phù hợp cho việc trang trí trong nhà lẫn ngoài vườn', 9, 0)
INSERT SanPham (TenSP ,TrangThai ,Anh ,Gia ,SLTonKho ,MoTa ,Id_DM, Is_Delete)
	VALUES (N'Cây Thiên Hoa', 1, '1.jpg', 850, 20, N'Loại cây cảnh phù hợp cho việc trang trí trong nhà lẫn ngoài vườn', 10, 0)
INSERT SanPham (TenSP ,TrangThai ,Anh ,Gia ,SLTonKho ,MoTa ,Id_DM, Is_Delete)
	VALUES (N'Cây Quất', 1, '16.jpg', 850, 20, N'Loại cây cảnh phù hợp cho việc trang trí trong nhà lẫn ngoài vườn', 10, 0)
INSERT SanPham (TenSP ,TrangThai ,Anh ,Gia ,SLTonKho ,MoTa ,Id_DM, Is_Delete)
	VALUES (N'Cây Đinh Lăng', 1, '7.jpg', 850, 20, N'Loại cây cảnh phù hợp cho việc trang trí trong nhà lẫn ngoài vườn', 10, 0)
INSERT SanPham (TenSP ,TrangThai ,Anh ,Gia ,SLTonKho ,MoTa ,Id_DM, Is_Delete)
	VALUES (N'Cây Lô Hội', 1, '9.jpg', 850, 20, N'Loại cây cảnh phù hợp cho việc trang trí trong nhà lẫn ngoài vườn', 11, 0)
INSERT SanPham (TenSP ,TrangThai ,Anh ,Gia ,SLTonKho ,MoTa ,Id_DM, Is_Delete)
	VALUES (N'Cây Anh Túc', 1, '18.jpg', 850, 20, N'Loại cây cảnh phù hợp cho việc trang trí trong nhà lẫn ngoài vườn', 11, 0)
INSERT SanPham (TenSP ,TrangThai ,Anh ,Gia ,SLTonKho ,MoTa ,Id_DM, Is_Delete)
	VALUES (N'Cây Sống Đời', 1, '15.jpg', 850, 20, N'Loại cây cảnh phù hợp cho việc trang trí trong nhà lẫn ngoài vườn', 11, 0)

-- Insert DonDatHang
INSERT DonDatHang(NgayDat ,GhiChuKH ,TongTien, TrangThai, SoDT, DiaChi,ID_KH) 
	VALUES ('2022-10-02', N'Giao buổi chiều',2600, N'Đã giao', '0985645231', N'357 Lê Văn Thọ, Phường 9, Gò Vấp, TPHCM',1)
INSERT DonDatHang(NgayDat ,GhiChuKH ,TongTien, TrangThai, SoDT, DiaChi, ID_KH) 
	VALUES ('2022-10-10', N'Giao sớm nha má',1300, N'Đang giao', '0977485234', N'200 Đường 3/2, Phường 12, Quận 10, TPHCM', 2)
INSERT DonDatHang(NgayDat ,GhiChuKH ,TongTien, TrangThai, SoDT, DiaChi, ID_KH)
	VALUES ('2022-10-14', N'',1300, N'Chờ xác nhận', '0884245251', N'686 Trường Chinh, Phường 15, Tân Bình, TPHCM', 4)
INSERT DonDatHang(NgayDat ,GhiChuKH ,TongTien, TrangThai, SoDT, DiaChi,ID_KH) 
	VALUES ('2022-09-02', N'',3900, N'Đã giao', '0985645231', N'357 Lê Văn Thọ, Phường 9, Gò Vấp, TPHCM',3)
INSERT DonDatHang(NgayDat ,GhiChuKH ,TongTien, TrangThai, SoDT, DiaChi, ID_KH) 
	VALUES ('2022-09-10', N'Giao lẹ nha shop',1300, N'Đang giao', '0977485234', N'200 Đường 3/2, Phường 12, Quận 10, TPHCM', 5)
INSERT DonDatHang(NgayDat ,GhiChuKH ,TongTien, TrangThai, SoDT, DiaChi, ID_KH)
	VALUES ('2022-08-14', N'',2600, N'Chờ xác nhận', '0884245251', N'686 Trường Chinh, Phường 15, Tân Bình, TPHCM', 7)


-- Insert DonDatChiTiet
INSERT DonDatChiTiet(ID_DDH ,ID_SP, SoLuong ,TongTien ) VALUES ( 1, 1, 2, 2600 )
INSERT DonDatChiTiet(ID_DDH ,ID_SP, SoLuong ,TongTien ) VALUES ( 2, 2, 1, 1300 )
INSERT DonDatChiTiet(ID_DDH ,ID_SP, SoLuong ,TongTien ) VALUES ( 3, 3, 1, 1300 )
INSERT DonDatChiTiet(ID_DDH ,ID_SP, SoLuong ,TongTien ) VALUES ( 4, 1, 3, 3900 )
INSERT DonDatChiTiet(ID_DDH ,ID_SP, SoLuong ,TongTien ) VALUES ( 5, 2, 1, 1300 )
INSERT DonDatChiTiet(ID_DDH ,ID_SP, SoLuong ,TongTien ) VALUES ( 6, 3, 2, 2600 )

-- Insert Feedback
INSERT FeedBack (ID_KH , ID_SP ,DanhGia ,NoiDung ,NgayDang ) 
	VALUES (1, 1, 5, N'Chất lượng sản phẩm tốt', '2022-03-31')
INSERT FeedBack (ID_KH , ID_SP ,DanhGia ,NoiDung ,NgayDang ) 
	VALUES (5, 3, 3, N'Giao hàng lâu', '2022-04-15')
INSERT FeedBack (ID_KH , ID_SP ,DanhGia ,NoiDung ,NgayDang ) 
	VALUES (4, 7, 5, N'Chất lượng sản phẩm tốt', '2022-11-25')
INSERT FeedBack (ID_KH , ID_SP ,DanhGia ,NoiDung ,NgayDang ) 
	VALUES (2, 13, 4, N'Hoa không tươi', '2021-05-14')
INSERT FeedBack (ID_KH , ID_SP ,DanhGia ,NoiDung ,NgayDang ) 
	VALUES (10, 11, 5, N'Chất lượng sản phẩm tốt', '2021-10-23')
INSERT FeedBack (ID_KH , ID_SP ,DanhGia ,NoiDung ,NgayDang ) 
	VALUES (8, 9, 5, N'Giao hàng nhanh', '2021-07-13')
INSERT FeedBack (ID_KH , ID_SP ,DanhGia ,NoiDung ,NgayDang ) 
	VALUES (20, 2, 5, N'Giao nhanh, hoa tươi', '2022-02-14')
INSERT FeedBack (ID_KH , ID_SP ,DanhGia ,NoiDung ,NgayDang ) 
	VALUES (11, 4, 4, N'Giao hàng nhanh', '2021-02-13')
INSERT FeedBack (ID_KH , ID_SP ,DanhGia ,NoiDung ,NgayDang ) 
	VALUES (3, 4, 5, N'Chất lượng sản phẩm tốt', '2022-11-14')
INSERT FeedBack (ID_KH , ID_SP ,DanhGia ,NoiDung ,NgayDang ) 
	VALUES (12, 12, 5, N'Giao hàng nhanh', '2021-12-13')


-- Số đơn hàng đã giao
if OBJECT_ID('spsell') is not null
	drop proc spsell
go

create proc spsell
as 
	select COUNT(ct.soluong) as N'Đơn đã giao' from DonDatChiTiet as ct join DonDatHang as dd 
	on ct.ID_DDH = dd.ID_DDH where dd.trangthai like N'Đã giao'
go
--exec spsell

-- tạo pro chưa xác nhận
if OBJECT_ID('sp_xacnhan ') is not null
	drop proc sp_xacnhan 
go
create proc sp_xacnhan
as
	select dh.ID_DDH as Id, HoTen, sum(SoLuong) as SoLuong , sum(dh.TongTien) as TongTien, TrangThai 
	from DonDatHang dh left join DonDatChiTiet ct on dh.ID_DDH = ct.ID_DDH join NguoiDung nd on nd.ID_KH = dh.ID_KH 
	where trangthai like N'Chờ xác nhận' group by dh.ID_DDH,HoTen,NgayDat,TrangThai
go

-- exec sp_xacnhan

-- tạo pro xoá
if OBJECT_ID('del ') is not null
	drop proc sp_xacnhan 
go
create proc del @id int
as
	
					delete from DonDatChiTiet 
						where ID_DDH = @id
					delete from DonDatHang 
						where ID_DDH = @id
			
go

-- exec del 2