/*1. Создайте базу из представленной картинки.
      - У каждой таблицы должно быть поле id
      - id автоинкрементальный и является первичным ключом*/

create table employees (
id serial primary key,
employee_name varchar(100)
);

create table roles (
id serial primary key,
role_title varchar(100)
);

create table employees_roles (
       id serial primary key,
       id_role int not null,
       id_employee int not null,
       foreign key (id_role) references roles (id),
       foreign key (id_employee) references employees (id)
);

create table salary (
       id serial primary key,
       monthly_salary int
);

create table roles_salary (
       id serial primary key,
       id_role int,
       id_salary int,
       foreign key (id_role) references roles (id),
       foreign key (id_salary) references salary (id)
);


create table service (
       id serial primary key,
       service_title varchar(100) not null unique,
       price int not null
 );

create table materials (
       id serial primary key,
       material_title varchar not null,
       amount int not null,
       price int not null
);


create table claim (
       id serial primary key,
       service_id int,
       employee_id int,
       material_id int,
       claim_date date,
       sales_manager int,
       foreign key (service_id) references service (id),
       foreign key (employee_id) references employees (id),
       foreign key (material_id) references materials (id)
);


/*2. Заполните таблицы данными. Не менее 10 строк в каждой таблице*/

insert into employees (employee_name)
values ('Alex'),
       ('Aleksei'),
       ('Oleg'),
       ('Vadym'),
       ('Artem'),
       ('Svitlana'),
       ('Olena'),
       ('Tetiana'),
       ('Olga'), 
       ('Ruslana');


insert into roles (id, role_title)
values ('Junior QA Manual'),
       ('Middle QA Manual'),
       ('Senior QA Manual'),
       ('Junior Front-end Developer'),
       ('Middle Front-end Developer'),
       ('Senior Front-end Developer'),
       ('Junior Business Analyst'),
       ('Junior QA Automation'),
       ('Middle QA Automation'), 
       ('Senior QA Automation');

insert into employees_roles ( id_role, id_employee)
values (10, 7),
       (9, 8),
       (8 , 6),
       (7 , 5),
       (4 , 3),
       (3 , 2),
       (2 , 1),
       (5 , 4),
       (6 , 9),
       (7 , 10);

insert into salary (monthly_salary)
values (1000),
       (1500),
       (2000),
       (3000),
       (700),
       (500),
       (1200),
       (1400),
       (600),
       (4000),

insert into roles_salary (id_role, id_salary)
values (5, 5),
       (6, 6),
       (7, 5),
       (2, 4),
       (1, 9),
       (8, 10),
       (9, 8),
       (10, 7),
       (3, 2),
       (4, 3),

insert into service (service_title, price)
values ('acccounting', 1000),
       ('consulting', 1500),
       ('marketing', 1300),
       ('web-design', 1800),
       ('grahic design', 2000),
       ('audit', 2200),
       ('legal services', 3000),
       ('business analysis', 1200),
       ('reporting', 1400),
       ('taxation', 1900),
       ('chiffon', 10, 1300),
       ('crepe', 8, 1700);
      
      
insert into materials (material_title, amount, price)
values ('denim', 50, 700),
       ('lace', 3, 2000),
       ('leather', 20, 2500),
       ('linen', 17, 3500),
       ('satin', 7, 2100),
       ('silk', 33, 4000),
       ('synthetics', 40, 500),
       ('velvet', 10, 2400);

insert into claim (service_id, employee_id, material_id, claim_date, sales_manager)
values (3, 5, 10, '2021-11-08', 17),
       (3, 5, 10, '2021-11-06', 13),
       (2, 10, 1, '2021-10-25', 10),
       (1, 4, 9, '2021-10-30', 2),
       (4, 9, 2, '2021-11-03',17),
       (5, 3, 8, '2021-11-10', 31),
       (6, 8, 3, '2021-10-18', 23),
       (7, 2, 7, '2021-10-27', 32),
       (10, 7, 2, '2021-11-03', 25),
       (9, 1, 6, '2021-11-29', 9),
       (8, 6, 1, '2021-10-29', 10);

/*3. Добавить таблицу Suppliers с полями id, name*/
      
create table suppliers (
      id serial primary key,
      name not null unique varchar(50)
);


/*4. Добавить 10 строк поставщиков в таблицу Suppliers*/

insert into suppliers (name)
values ('Ivan'),
       ('Petro'),
       ('Valentyn'),
       ('Sergiy'),
       ('Artem'),
       ('Vlad'),
       ('Stepan'), 
       ('Ivanna'),
       ('Tetiana'),
       ('Lilia');

/*5. Обновить таблицу Materials. Добавить поле suplier_id которое связано с полем id в таблице Suppliers*/
      
alter table materials
add supplier_id int;

alter table materials
add
foreign key (supplier_id) references suppliers (id);

/*6. Обновить таблицу Employees. Добавить varchar поле surname на 50 символов.*/
alter table employees
add surname varchar(50);

/*7. Обновить таблицу Salary. Добавить varchar поле currency на 7 символов.*/
alter table salary
add currency varchar(7);

