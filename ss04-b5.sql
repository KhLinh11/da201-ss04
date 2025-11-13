update companydb 
set employee_id = 4800
where employee_id = 2;
SET SQL_SAFE_UPDATES = 0;
update companydb
set hiredate = '2021-08-01'
where First_Name = 'Nguyễn_thị';


delete from companydb
where employee_id =1;

delete from companydb
where salary < 5000;