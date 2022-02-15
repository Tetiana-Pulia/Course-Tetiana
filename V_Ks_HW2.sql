/*1. Создать таблицу employees
 id. serial,  primary key,
- employee_name. Varchar(50), not null*/

create table employees (
	id serial primary key,
    employee_name varchar(50) not null
);

/*2.Наполнить таблицу employee 70 строками.*/

insert into employees (employee_name)
values ('James'),
       ('Robert'),
       ('John'),
       ('Michael'),
       ('William'),
       ('David'),
       ('Richard'),
       ('Joseph'),
       ('Thomas'),
       ('Charles'),
       ('Christopher'),
       ('Daniel'),
       ('Matthew'),
       ('Anthony'),
       ('Mark'),
       ('Donald'),
       ('Steven'),
       ('Paul'),
       ('Andrew'),
       ('Joshua'),
       ('Kenneth'),
       ('Kevin'),
       ('Brian'),
       ('George'),
       ('Edward'),
       ('Ronald'),
       ('Timothy'),
       ('Jason'),
       ('Jeffrey'),
       ('Ryan'),
       ('Jacob'),
       ('Gary'),
       ('Nicholas'),
       ('Eric'),
       ('Jonathan'),
       ('Stephen'),
       ('Larry'),
       ('Justin'),
       ('Scott'),
       ('Brandon'),
       ('Benjamin'),
       ('Samuel'),
       ('Gregory'),
       ('Frank'),
       ('Alexander'),
       ('Raymond'),
       ('Patrick'),
       ('Jack'),
       ('Dennis'),
       ('Mary'),
       ('Patricia'),
       ('Jennifer'),
       ('Linda'),
       ('Elizabeth'),
       ('Barbara'),
       ('Susan'),
       ('Jessica'),
       ('Sarah'),
       ('Karen'),
       ('Nancy'),
       ('Lisa'),
       ('Betty'),
       ('Margaret'),
       ('Sandra'),
       ('Ashley'),
       ('Kimberly'),
       ('Emily'),
       ('Donna'),
       ('Michelle'),
       ('Dorothy'),
       ('Carol'),
       ('Amanda'),
       ('Melissa'),
       ('Deborah'),
       ('Stephanie'),
       ('Rebecca'),
       ('Sharon'),
       ('Laura');
       
/*3.Создать таблицу salary
- id. Serial  primary key,
- monthly_salary. Int, not null*/

create table salary (
	id serial primary key,
	monthly_salary int not null
);

/*4.Наполнить таблицу salary 15 строками:  1000, 1100, 1200, 1300, 1400, 1500, 1600, 1700, 1800, 1900, 2000, 2100, 2200, 2300, 2400, 2500*/
insert into salary(monthly_salary)
values  (1000),
	    (1100),
		(1200),
		(1300),
		(1400),
		(1500),
		(1600),
		(1700),
		(1800),
		(1900),
		(2000),
		(2100),
		(2200),
		(2300),
		(2400),
		(2500);
		
/*5.Создать таблицу employee_salary
- id. Serial  primary key,
- employee_id. Int, not null, unique
- salary_id. Int, not null*/
	
create table employee_salary (
id serial primary key,
employee_id int not null unique,
salary_id int not null
);

/*6.Наполнить таблицу employee_salary 40 строками:
- в 10 строк из 40 вставить несуществующие employee_id*/
insert into employee_salary (employee_id, salary_id)
values (3,7),
	   (1,4),
	   (5,9),
	   (40,13),
	   (23,4),
	   (11,2),
	   (52,10),
	   (15,13),
	   (26,4),
	   (16,1),
	   (33,7),
	   (80,3),
	   (82,15),
	   (84,16),
	   (86,6),
	   (88,8),
	   (87,10),
	   (85,9),
	   (90,8),
	   (95,7),
	   (96,6),
	   (2,14),
	   (4,13),
	   (6,5),
	   (7,6),
	   (8,15),
	   (9,16),
	   (10,2),
	   (13,5),
	   (14,7),
	   (18,9),
	   (19,3),
	   (20,12),
	   (21,7),
	   (22,5),
	   (25,9),
	   (45,7),
	   (28,14),
	   (29,15),
	   (30,16),
	   (31,12),
	   (32,13);
	   
/*7.Создать таблицу roles
- id. Serial  primary key,
- role_name. int, not null, unique*/
	  
create table roles (
	id serial primary key,
	role_name int not null unique
);

/*8.Поменять тип столба role_name с int на varchar(30)*/
alter table roles
alter role_name type varchar(30);

/*Наполнить таблицу roles 20 строками*/
insert into roles (role_name)
values ('Junior Python developer'),
       ('Middle Python developer'),
       ('Senior Python developer'),
       ('Junior Java developer'),
       ('Middle Java developer'),
       ('Senior Java developer'),
       ('Junior JavaScript developer'),
       ('Middle JavaScript developer'),
       ('Senior JavaScript developer'),
       ('Junior Manual QA engineer'),
       ('Middle Manual QA engineer'),
       ('Senior Manual QA engineer'),
       ('Project Manager'),
       ('Designer'),
       ('HR'),
       ('CEO'),
       ('Sales Manager'),
       ('Junior Automation QA engineer'),
       ('Middle Automation QA engineer'),
       ('Senior Automation QA engineer');
      
 /*10.Создать таблицу roles_employee
- id. Serial  primary key,
- employee_id. Int, not null, unique (внешний ключ для таблицы employees, поле id)
- role_id. Int, not null (внешний ключ для таблицы roles, поле id)*/
      
 create table roles_employee(
 	id serial primary key,
 	employee_id int not null unique,
 	role_id int not null,
 		foreign key (employee_id) references employees(id),
 		foreign key (role_id) references roles(id)
 );
       

/*11.Наполнить таблицу roles_employee 40 строками*/
insert into roles_employee (employee_id, role_id)
values (7,2),
       (20,4),
       (3,9),
       (5,13),
       (23,4),
       (11,2),
       (10,9),
       (22,13),
       (21,3),
       (34,4),
       (6,7),
       (1,1),
       (70,2),
       (69,3),
       (68,4),
       (67,5),
       (66,6),
       (65,7),
       (64,8),
       (63,9),
       (62,10),
       (61,11),
       (60,12),
       (51,13),
       (52,14),
       (53,15),
       (54,16),
       (55,17),
       (56,18),
       (57,19),
       (58,20),
       (59,1),
       (41,2),
       (42,3),
       (43,4),
       (44,5),
       (45,6),
       (46,7),
       (47,8),
       (48,9),
       (49,10),
       (35,11),
       (36,12),
       (37,13),
       (38,14);




