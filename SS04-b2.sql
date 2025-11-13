create database CompanyDB;
create table companyDB(
employee_id int primary key auto_increment,
first_name varchar(50),
last_name varchar(50)
);
alter table companyDB
add hiredate date,
add salary int;

 