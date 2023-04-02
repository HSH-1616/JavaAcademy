--1.
select JOB_NAME from JOB;
 
 --2.
 select * from department;
 
 --3.
 select emp_name,email,phone,hire_date from employee; 

--4.
select hire_date,emp_name,salary from employee;

--5.
select emp_name,sal_level from employee
where salary>2500000;

--6.
select emp_name,phone from employee
where salary>=3500000 and job_code='J3';

--7.
select *from employee;

select emp_name,salary*12,(salary+(salary*bonus))*12,(salary+(salary*bonus))*12-(salary*0.3) from employee;

--8.
select emp_name,trunc(sysdate-hire_date) from  employee ;

--9.
select * from employee
where trunc(sysdate-hire_date)/365>20;

--10.
select * from employee
where hire_date>'90/01/01' and hire_date<'01/01/01';

--11.
select * from employee
where emp_name like '%ÀÌ%';

--12.
select emp_name from employee
where emp_name like '__¿¬';

--13.
select emp_name,phone from employee
where phone not like '010________';

--14.
select * from employee
where email like '____1_%' escape 1 and dept_code in('D9','D6') and hire_date between '90/01/01' and '00/12/01' and salary>3500000 ;

--15.
select * from employee
where dept_code is null and bonus is not null;

--16.
select emp_name from employee
where dept_code is null and manager_id is null;