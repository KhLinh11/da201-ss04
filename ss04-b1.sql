SELECT * FROM qtkd2_ss05.companyDB;
drop database companydb
drop table companydb
create database companydb;
create table companydb (
employee_id int primary key auto_increment,
first_name varchar(50),
last_name varchar(50)
);