CREATE database  QuanLyNhanSu;
CREATE TABLE PhongBan (
    id INT PRIMARY KEY auto_increment,      -- Mã tự động tăng, là khóa chính
    ten_phong_ban VARCHAR(100) NOT NULL     -- Tên phòng không được để trống
);


CREATE TABLE NhanVien (
    id_nv INT AUTO_INCREMENT PRIMARY KEY,     
    ho_ten VARCHAR(100) NOT NULL,           
    email VARCHAR(100) UNIQUE,              
    ngay_vao_lam DATE,
    id INT,                       
    FOREIGN KEY (id) REFERENCES PhongBan(id)
);

INSERT INTO PhongBan (ten_phong_ban) VALUES 
('Tài chính'), 
('Marketing'), 
('Kỹ thuật');

UPDATE PhongBan
SET ten_phong_ban = 'Nhân sự'
WHERE ten_phong_ban = 'Tài chính';


INSERT INTO NhanVien (id_nv,ho_ten, email, ngay_vao_lam,id) VALUES 
(1,'Nguyễn Văn A', 'a@company.com', '2023-01-15', 1), 
(2,'Trần Thị B', 'b@company.com', '2023-03-20', 2),   
(3,'Lê Văn C', 'c@company.com', '2023-05-10', 1),     
(4,'Phạm Văn D', 'd@company.com', '2023-06-01', 3);   

INSERT INTO NhanVien  (id_nv,ho_ten, email, ngay_vao_lam,id) VALUES 
(5,"Trần Văn An","an.tv@email.com","2023-10-25",3),
(6,"Lê Thị Bích","bich.lt@email.com","2023-11-15",2);  

SELECT NhanVien.id_nv, NhanVien.ho_ten, NhanVien.email, PhongBan.ten_phong_ban
FROM NhanVien
JOIN PhongBan ON NhanVien.id = PhongBan.id -- Nối cột 'id' (FK) bảng NV với cột 'id' (PK) bảng PB
WHERE PhongBan.ten_phong_ban = 'Kỹ Thuật';

SET SQL_SAFE_UPDATES = 0;

UPDATE NhanVien
SET id = (SELECT id FROM PhongBan WHERE ten_phong_ban = 'tài chính')
WHERE ho_ten = 'Trần Văn An';

DELETE FROM NhanVien 
WHERE ho_ten = 'Lê Thị Bích';