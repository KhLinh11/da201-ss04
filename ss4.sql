/* 
các bước thiết kế 1 cơ sở dữ liệu theo yêu cầu 
   1. Thiết kế ERD - Sơ đồ quan hệ thực thể 
   2. Chuyển từ ERD - -> thiết kế CSDL( Diagram) 
   - bước 1: thực thể --> bảng 
   - bước 2: THUỘC TÍNH 
   - bước 3: LIÊN KẾT 
*/
 
/* 
1. Làm việc với cơ sở dữ liệu 
- tạo một co sở dữ liệu mới
  CREATE DATABASES [ database_name] 
- xoá 1 cơ sở dữ liệu 
DROP DATABASE [database_name]
  USE [database_name] 
lưu ý: 
- không phân biệt hoa thường 
- quy định đặt tên theo quy tắc snake 
- kết thúc 1 câu lệnh cần dùng ; 
*/
/* 
1. Tạo cơ sở dữ liệu db_execise04 (CREATE) 
2. Sử dụng dữ liệu db_execise04 (USE)
3. Xoá cơ sở dữ liệu db_execise04 (DROP) 
*/
create database db_execise04;
use db_execise04;
 drop database db_execise04;
 create database db_execise04;
 
 /* 
  TẠO ĐỐI TƯỢNG BẢNG 
    CREATE TABLE [table_name](
     - - khai báo các cột trong 
3 kiểu dữ liệu : thông số ,chuỗi , thời gian 
4 các ràng buộc :
primary key 9 ( thuộc tính chính ) not null + unique 
- not null : không chứa giá trị null 
- unique : duy nhất không trùng lặp 
-default : 

-- 4 tạo bảng department : Mã phòng ( nguyên , khoá chính , tên phòng ,
create table department (
dept_id int primary key auto_increment,
dept_name varchar(100) not null unique
);
*/
create table jobs(
job_id char(5) primary key,
job_name varchar(200) not null,
job_salary float check (job_salary>0),
job_status bit default(1),
dept_id int,
foreign key (dept_id) references department (dept_id)
);
       


/*
1. gạo CSDL tên ecommerce_DB
2. Sử dụng cơ sở dữ liệu Eommerce_DB để tạo các bảng: 
3. Tạo bảng categories có các cột sau:
- catalog_id: số nguyên, khoá chính, tự năng
- catalog_name: chuỗi tối đa 50 ký tự, not full và duy nhất 
- catalog_descriptions: chuỗi không giới hạn ký tự 
- catalog_status: bit (0 - false, 1- true) có giá trị mặc định
4. Tạo bảng products có các cột sau:
- product_id: chuỗi gồm 5 ký tự, khóa chính
- product_name: chuỗi tối đa 150 ký tự, not null và duy nhất
- product_price: số thực có giá trị lớn hơn 0
- product_created: năm-tháng-ngày, not null
- product_status: bit có giá trị mặc định là 1
5. Tạo liên kết Categories 1-N Products (khóa ngoại)
*/
drop table categories

create database Ecommerce_ddb;
create table Categories(
catalog_id int primary key auto_increment,
catalog_name varchar(150) not null unique,
catalog_descriptions longtext,
catalog_status bit default 1
);

create table products(
product_id char(5) primary key,
product_name varchar(150) not null unique ,
product_price float check(product_price>0),
product_created date not null,
prodcut_status bit(1),
catalog_id int,
foreign key (catalog_id) references Categories (catalog_id)
);
*/ 

create database quan_ly_phong_kham;
create table phong_kham(
ma_pk int primary key auto_increment not null,
ten_pk varchar(100) not null,
dia_chi varchar(150) not null,
sđt tinyint check(sđt=10) not null

);

create table bac_si(
ma_bs int primary key auto_increment not null,
ho_ten varchar(150) not null,
chuyen_khoa varchar(150) not null,
kinh_nghiem int not null,
ma_pk int,
foreign key (ma_pk) references phong_kham(ma_pk)
);

create table lich_lam_viec(
gio_bat_dau datetime not null,
gio_ket_thuc datetime not null,
ngay date not null,
ma_lich_lam_viec int primary key auto_increment not null,
ma_bs int,
foreign key(ma_bs) references bac_si(ma_bs)
);

create table benh_nhan(
tai_khoan varchar(50) not null,
mat_khau varchar(50) not null,
ho_ten varchar(150) not null,
sđt int check(sđt=10) not null,
gioi_tinh varchar(20) ,
ma_bn int primary key auto_increment not null

);
create table lich_hen(
ma_lh int primary key auto_increment not null,
trang_thai varchar(40) not null,
ngay_dat date not null,
ma_bn int,
ma_bs int,
foreign key(ma_bn) references benh_nhan(ma_bn),
FOREIGN KEY(ma_bs) REFERENCES bac_si(ma_bs)
);
create table ho_so_benh_nhan(
don_thuoc varchar(200),
ngay_kham time not null,
ma_hs int primary key auto_increment not null,
chuan_doan varchar(250) not null,
ma_lh int,
foreign key (ma_lh) references lich_hen(ma_lh)
);


