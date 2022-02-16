--1. ������� ���� ���������� ��� �������� ���� � ����, ������ � ����������.
select employee_name, monthly_salary from employees
join employee_salary
on employees.id = employee_salary.employee_id 
where monthly_salary is not null;

--2. ������� ���� ���������� � ������� �� ������ 2000. 

select employee_name, monthly_salary from employees
left join employee_salary 
on employees.id = employee_salary.employee_id
where monthly_salary < 2000;

--3. ������� ��� ���������� �������, �� �������� �� ��� �� ��������. (�� ����, �� �� ������� ��� � ��������.)

select employee_salary.id, monthly_salary from employee_salary
left join employees
on employee_salary.employee_id = employees.id 
where employee_id is null;

--4. ������� ��� ���������� ������� ������ 2000 �� �������� �� ��� �� ��������. (�� ����, �� �� ������� ��� � ��������.) 

select employee_salary.id, monthly_salary from employee_salary
left join employees 
on employee_salary.employee_id = employees.id 
where employee_id is null 
and monthly_salary < 2000;

--5. ����� ���� ���������� ���� �� ��������� ��. 

select employee_name from employees 
left join employee_salary
on employees.id = employee_salary.employee_id 
where monthly_salary is null;

--6.������� ���� ���������� � ���������� �� ���������.

select employee_name, role_name from employees
left join roles_employee 
on employees.id = roles_employee.employee_id 
join roles
on roles_employee.role_id = roles.id;

--7. ������� ����� � ��������� ������ Java �������������.

select employee_name, role_name from employees
left join roles_employee 
on employees.id = roles_employee.employee_id 
join roles
on roles_employee.role_id = roles.id
where role_name like '%Java%';

--8. ������� ����� � ��������� ������ Python �������������.

select employee_name, role_name from employees
left join roles_employee 
on employees.id = roles_employee.employee_id 
join roles
on roles_employee.role_id = roles.id
where role_name like '%Python%';

--9. ������� ����� � ��������� ���� QA ���������.

select employee_name, role_name from employees
left join roles_employee 
on employees.id = roles_employee.employee_id 
join roles
on roles_employee.role_id = roles.id
where role_name like '%QA%';
 
--10. ������� ����� � ��������� ������ QA ���������.
  
select employee_name, role_name from employees
left join roles_employee 
on employees.id = roles_employee.employee_id 
join roles
on roles_employee.role_id = roles.id
where role_name like '%Manual QA%';

--11. ������� ����� � ��������� ��������������� QA

select employee_name, role_name from employees
left join roles_employee 
on employees.id = roles_employee.employee_id 
join roles
on roles_employee.role_id = roles.id
where role_name like '%Automation QA';


--12. ������� ����� � �������� Junior ������������
 
select employee_name, monthly_salary from employees 
full join employee_salary
on employees.id = employee_salary.employee_id 
join roles_employee 
on employee_salary.employee_id = roles_employee.employee_id 
join roles 
on roles_employee.role_id = roles.id
where role_name like '%Junior%';


--13. ������� ����� � �������� Middle ������������

select employee_name, monthly_salary from employees 
full join employee_salary
on employees.id = employee_salary.employee_id 
join roles_employee 
on employee_salary.employee_id = roles_employee.employee_id 
join roles 
on roles_employee.role_id = roles.id
where role_name like '%Middle%';
 

--14. ������� ����� � �������� Senior ������������
 
select employee_name, monthly_salary from employees 
full join employee_salary
on employees.id = employee_salary.employee_id 
join roles_employee 
on employee_salary.employee_id = roles_employee.employee_id 
join roles 
on roles_employee.role_id = roles.id
where role_name like '%Senior%';
 
--15. ������� �������� Java ������������� 

select monthly_salary from employees 
full join employee_salary
on employees.id = employee_salary.employee_id 
join roles_employee 
on employee_salary.employee_id = roles_employee.employee_id 
join roles 
on roles_employee.role_id = roles.id
where role_name like '%Java Developer%';

--16. ������� �������� Python �������������

select monthly_salary from employees 
full join employee_salary
on employees.id = employee_salary.employee_id 
join roles_employee 
on employee_salary.employee_id = roles_employee.employee_id 
join roles 
on roles_employee.role_id = roles.id
where role_name like '%Python Developer%';

 
--17. ������� ����� � �������� Junior Python �������������
 
select employee_name, monthly_salary from employees 
full join employee_salary
on employees.id = employee_salary.employee_id 
join roles_employee 
on employee_salary.employee_id = roles_employee.employee_id 
join roles 
on roles_employee.role_id = roles.id
where role_name like '%Junior Python%';


--18. ������� ����� � �������� Middle JS �������������

select employee_name, monthly_salary from employees 
full join employee_salary
on employees.id = employee_salary.employee_id 
join roles_employee 
on employee_salary.employee_id = roles_employee.employee_id 
join roles 
on roles_employee.role_id = roles.id
where role_name like 'Middle JavaScript%';

--19. ������� ����� � �������� Senior Java �������������
 
select employee_name, monthly_salary from employees 
full join employee_salary
on employees.id = employee_salary.employee_id 
join roles_employee 
on employee_salary.employee_id = roles_employee.employee_id 
join roles 
on roles_employee.role_id = roles.id
where role_name = 'Senior Java developer';

--20. ������� �������� Junior QA ���������
 
select monthly_salary from employees
full join employee_salary
on employees.id = employee_salary.employee_id 
join roles_employee 
on employee_salary.employee_id = roles_employee.employee_id 
join roles 
on roles_employee.role_id = roles.id
where role_name like '%Junior%' and role_name like '%QA%';
 
--21. ������� ������� �������� ���� Junior ������������

select avg(monthly_salary) from employees
full join employee_salary
on employees.id = employee_salary.employee_id 
join roles_employee 
on employee_salary.employee_id = roles_employee.employee_id 
join roles 
on roles_employee.role_id = roles.id
where role_name like '%Junior%' 

--22. ������� ����� ������� JS �������������

select sum(monthly_salary) from employees
full join employee_salary
on employees.id = employee_salary.employee_id 
join roles_employee 
on employee_salary.employee_id = roles_employee.employee_id 
join roles 
on roles_employee.role_id = roles.id
where role_name like '%JavaS%'
 
--23. ������� ����������� �� QA ���������
 
select min(monthly_salary) from employees
full join employee_salary
on employees.id = employee_salary.employee_id 
join roles_employee 
on employee_salary.employee_id = roles_employee.employee_id 
join roles 
on roles_employee.role_id = roles.id
where role_name like '%QA%'
 
 
select min(monthly_salary)
from employees, employee_salary, roles_employees, roles 
where employees.id = roles_employees.employee_id 
and employees.id = employee_salary.employee_id 
and roles_employees.role_id = roles.id
and role_name like '%QA%';

--24. ������� ������������ �� QA ���������
 
select max(monthly_salary) from employees
full join employee_salary
on employees.id = employee_salary.employee_id 
join roles_employee 
on employee_salary.employee_id = roles_employee.employee_id 
join roles 
on roles_employee.role_id = roles.id
where role_name like '%QA%';
 
select max(monthly_salary) from employees, employee_salary, roles_employees, roles
where employees.id = employee_salary.employee_id
and employees.id = roles_employees.employee_id  
and roles_employees.role_id = roles.id
and role_name like '%QA%';
 
--25. ������� ���������� QA ���������
 
select count(employee_name) from employees
full join employee_salary
on employees.id = employee_salary.employee_id 
join roles_employee 
on employee_salary.employee_id = roles_employee.employee_id 
join roles 
on roles_employee.role_id = roles.id
where role_name like '%QA%';

--26. ������� ���������� Middle ������������.
 
select count(employee_name) from employees
full join employee_salary
on employees.id = employee_salary.employee_id 
join roles_employee 
on employee_salary.employee_id = roles_employee.employee_id 
join roles 
on roles_employee.role_id = roles.id
where role_name like '%Middle%';
 
--27. ������� ���������� �������������
  
select count(employee_name) from employees
full join employees_salary
on employees.id = employee_salary.employee_id 
join roles_employee 
on employee_salary.employee_id = roles_employee.employee_id 
join roles 
on roles_employee.role_id = roles.id
where role_name like '%developer%';


--28.������� ���� (�����) �������� �������������.

select sum(monthly_salary) from employees
full join employees_salary
on employees.id = employee_salary.employee_id 
join roles_employee 
on employee_salary.employee_id = roles_employee.employee_id 
join roles 
on roles_employee.role_id = roles.id
where role_name like '%developer%';

--29. ������� �����, ��������� � �� ���� ������������ �� �����������

select employee_name, role_name, monthly_salary from employees
full join employees_salary
on employees.id = employee_salary.employee_id 
join roles_employee 
on employee_salary.employee_id = roles_employee.employee_id 
join roles 
on roles_employee.role_id = roles.id
order by monthly_salary asc;
 
 
--30. ������� �����, ��������� � �� ���� ������������ �� ����������� � ������������ � ������� �� �� 1700 �� 2300
 
select employee_name, role_name, monthly_salary from employees
full join employees_salary
on employees.id = employee_salary.employee_id 
join roles_employee 
on employee_salary.employee_id = roles_employee.employee_id 
join roles 
on roles_employee.role_id = roles.id
where monthly_salary between 1700 and 2300
 
--31. ������� �����, ��������� � �� ���� ������������ �� ����������� � ������������ � ������� �� ������ 2300
 
select employee_name, role_name, monthly_salary from employees
full join employees_salary
on employees.id = employee_salary.employee_id 
join roles_employee 
on employee_salary.employee_id = roles_employee.employee_id 
join roles 
on roles_employee.role_id = roles.id
where monthly_salary < 2300
order by monthly_salary asc
 
--32. ������� �����, ��������� � �� ���� ������������ �� ����������� � ������������ � ������� �� ����� 1100, 1500, 2000
 
select employee_name, role_name, monthly_salary from employees
full join employees_salary
on employees.id = employee_salary.employee_id 
join roles_employee 
on employee_salary.employee_id = roles_employee.employee_id 
join roles 
on roles_employee.role_id = roles.id
where monthly_salary in (1100, 1500, 2000)
order by monthly_salary asc