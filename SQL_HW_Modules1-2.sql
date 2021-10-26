/* 1. Напишите запрос, который выводит на экран всю таблицу car_engine.*/
SELECT * FROM car_engine;

/*2. Вывести название сервиса, у которого service_id 88.*/
SELECT service_name FROM service
WHERE service_id = 88;

/*3. Вывести operation_id, у которого operation_status done.*/
SELECT operation_id
FROM operation
WHERE operation_status = 'done';

/*4. Напишите название колонки, которая хранит в себе первичные ключи для таблицы car_engine.*/
/* Нажимаю в навигаторе на таблицу car_engine, нажимаю Indexes, потом Primary, вижу, что primary key для этой таблицы engine_number.*/
SHOW KEYS FROM car_engine WHERE key_name = 'Primary';

/*5. Напишите запрос, который выведет на экран две колонки engine_number и origin из таблицы car_engine.*/
SELECT engine_number, origin FROM car_engine;

/*6. Напишите запрос, который выведет колонку engine_number из таблицы car, и ее название будет отображаться как “car_engine_number”.*/
SELECT engine_number AS car_engine_number FROM car;

/*7. Выведите на экран колонку с моделями автомобилей.*/
SELECT model FROM car;

/*8. Напишите запрос (используя имеющиеся знания), который выводит на экран колонки таблицы service в обратном порядке, при этом последняя колонка должна называться просто id.*/
SELECT service_cost_usd, service_name, service_id AS id FROM service;

/*9. Напишите запрос, который выведет всю строку из таблицы car_engine, где у двигателя номер 52WVC10338.*/
SELECT * FROM car_engine
WHERE engine_number = '52WVC10338';

/*10. Напишите запрос, который выведет название страны производства двигателя (один столбец) для двигателя с номером 312REN763009.*/
SELECT origin FROM car_engine
WHERE engine_number = '312REN763009';

/*11. Напишите запрос (все столбцы), который выведет все операции из таблицы operation, где номер услуги равен 77.*/
SELECT * from operation
WHERE service_id = 77;

/*12. Напишите запрос, который выведет только название сервиса, у которого service_id = 88.*/
SELECT service_name FROM service
WHERE service_id = 88;

/*13. Выведите из таблицы car_engine все двигатели (все столбцы), произведенные в Германии и Японии.*/
SELECT * FROM car_engine 
WHERE origin IN ('Germany', 'Japan');

/*14. Напишите запрос, который выведет на экран все автомобили бренда Мерседес и BMW (все столбцы).*/
SELECT * FROM car
WHERE brand IN ('Mercedes', 'BMW');

/*15. *Напишите запрос, который выведет на экран названия моделей автомобилей бренда Мерседес и BMW (один столбец). Колонка должна называться Model с большой буквы.*/
SELECT model AS Model FROM car 
WHERE brand IN ('Mercedes', 'BMW');

/*16. Напишите запрос, который выводит на экран всех клиентов возрастом 12 и 13 лет.*/
SELECT * FROM customer
WHERE age IN (12, 13);

/*17. Напишите запрос, который выведет на экран все двигатели, которые не произведены в Японии.*/
SELECT * FROM car_engine 
WHERE origin <> 'Japan';

/*18. Напишите запрос, который покажет все автомобили, бренд которых будет больше чем буква C.*/
SELECT * FROM car
WHERE brand > 'C';

/* 19. Выведите на экран уникальные модели автомобилей.*/
SELECT DISTINCT model FROM car;

/*20. Выведите только уникальные фамилии всех клиентов.*/
SELECT DISTINCT last_name FROM customer;

/*21. Выведите уникальные фамилии клиентов, которым больше 12 лет.*/
SELECT DISTINCT last_name
FROM customer
WHERE age > 12;

/*22. Выведите уникальные номера паспортов клиентов (в таблице car они отображаются как car_owner), которые не ездят на марке Toyota.*/
SELECT DISTINCT car_owner 
FROM car
WHERE brand <> 'Toyoya';

/*23. Напишите запрос, который найдет все номера автомобильных двигателей из таблицы двигатели, которые содержат букву C (вывести все столбцы).*/
SELECT * FROM car_engine
WHERE engine_number LIKE '%C%';

/*24. Напишите запрос, который найдет номер автомобильного двигателя из таблицы двигатели, который начинается на 52. Выведите все столбцы.*/
SELECT * FROM car_engine
WHERE engine_number LIKE '52%';

/*25. Напишите запрос (все столбцы), который найдет номер двигателя из таблицы двигатели, который заканчивается на 003.*/
SELECT * FROM car_engine
WHERE engine_number LIKE '%003';









