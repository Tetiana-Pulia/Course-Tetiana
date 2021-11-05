/* 1. Если в БД указана следующая дата '2021-10-08', что это значит?*/
/* 8 октября 2021 года.*/

/* 2. Напишите запрос, чтобы отсортировать операции от самой последней до самой ранней.*/
SELECT * FROM operation
ORDER BY operation_timestamp DESC;

/*3. Напишите запрос, чтобы показать операции, совершенные после 2021-09-05 19:17:23*/
SELECT * FROM operation
WHERE operation_timestamp > '2021-09-05 19:17:23';

/*4. Вывести текущие дату и время.*/
SELECT current_timestamp();

/* 5. Вывести запрос, который обновит operation_timestamp для операции с id 5 до текущих даты и времени.*/
UPDATE operation
SET operation_timestamp = current_timestamp()
WHERE operation_id = 5;

/* 6. Напишите запрос, который покажет только столбец production_year назовите его 10_years_ago, отсортированные по убыванию, где из каждого значения вычтено по 10 лет.*/
SELECT production_year -10 AS 10_years_ago FROM car_engine
ORDER BY production_year DESC;

/* 7. Напишите запрос, который выведет все операции (все столбцы), открытые после 5 сентября 2021 года и которые не в статусе done.*/
SELECT * FROM operation
WHERE operation_timestamp > '2021-09-05 23:59:59'
AND operation_status <> 'done';

/* 8. Напишите запрос, который отсортирует все незавершенные операции по дате от последних к старым.*/
SELECT * FROM operation
WHERE operation_status <> 'done' AND operation_status <> 'finished'
ORDER BY operation_timestamp DESC;

/* 9.Напишите какой тип данных выставлен в столбце production_year в таблице car_engine.*/
DESC car_engine;
/* тип данных: year*/

/* 10. Напишите запрос, который покажет все операции (все столбцы), совершенные 3 сентября.*/
SELECT * FROM operation
WHERE month(operation_timestamp) = '09'
AND day(operation_timestamp) = '03';

/* 11. Напишите запрос, который покажет все операции за любые даты, которые были созданы после 16:00:00. Нужно вывести все столбцы.*/
SELECT * FROM operation
WHERE time(operation_timestamp) > '16:00:00';

/* 12. Напишите запрос, который покажет все операции за любые даты, которые были созданы между 15:00 и 17:00 часами включительно. Нужно вывести все столбцы.*/
SELECT * FROM operation
WHERE time(operation_timestamp) BETWEEN '15:00:00' AND '17:00:00';

/*13. Напишите запрос, который покажет все операции, которые создавались до 10 сентября 2021 и после 18:00 вечера (вывести все столбцы).*/
SELECT * FROM operation
WHERE date(operation_timestamp) < '2021-09-10'
AND time(operation_timestamp) > '18:00:00';

/*14. Напишите запрос, который выведет два столбца: в одном марка и модель автомобиля написанные через пробел, а во втором номер двигателя, написанный не заглавными, а прописными буквами. Первую колонку назовите Car Вторую колонку назовите Engine*/
SELECT concat(brand, ' ', model) AS Car, lower(engine_number) AS Engine FROM car;

/* 15. Напишите запрос, который выведет только те автомобили (все столбцы), марка которого (brand) содержит в своем названии больше 6 символов.*/
SELECT * FROM car
WHERE length(brand) > 6;

/* 16. Напишите запрос, который выведет все автомобильные двигатели (из таблицы car_engine), у которых количество символов совпадает с количеством символов номера данного двигателя A00000000000000007. Вручную считать символы не нужно :)*/
SELECT * FROM car_engine
WHERE length(engine_number) = length('A00000000000000007');

/* 17. Напишите запрос, который выведет два столбца из таблицы двигатели: номер двигателя и количество символом в этом двигателе.*/
SELECT engine_number, length(engine_number) FROM car_engine;

/* 18. А теперь повторим пройденное ранее: Напишите запрос, который выведет все автомобильные двигатели (все столбцы из таблицы car_engine), у которых количество символов совпадает с количеством символов номера двигателя автомобиля Джорджа.*/
SELECT * FROM car_engine
WHERE length(engine_number) = length((
			SELECT car_engine.engine_number FROM car_engine
            JOIN car
            ON car_engine.engine_number = car.engine_number
            JOIN customer
            ON car.car_owner = customer.passport_number
            WHERE first_name = 'George'));
            
/*19. Cколько каких стран производителей двигателей у нас в базе? Результаты отсортировать по спаданию.*/
SELECT origin, count(*) FROM car_engine
GROUP BY origin
ORDER BY count(*) DESC;

/* 20. Покажите только те страны, которые встречаются больше двух раз.*/
SELECT origin, count(*) FROM car_engine
GROUP BY origin
HAVING count(*) > 2;

/* 21. Какой средний обьем двигателя по каждой из стран?*/
SELECT origin, AVG(volume) FROM car_engine
GROUP BY origin;

/* 22. Напишите запрос, который покажет сколько каких статусов операций у нас есть (operation_status) и выведите только те, которых больше одного. Выведите два столбца - статус операции и их количество (столбец с количеством назовите (amount)).*/
SELECT operation_status, count(*) AS amount FROM operation
GROUP BY operation_status
HAVING count(*) > 1;

/* 23. Продолжение. Напишите запрос, который покажет сколько каких статусов операций у нас есть. Нас интересуют только операции, которые не в статусе done. В запросе используйте слово HAVING. Выведите два столбца - статус операции и их количество (столбец с количеством назовите (amount)).*/
SELECT operation_status, count(*) AS amount FROM operation
GROUP BY operation_status
HAVING operation_status <> 'done';

/* 24. Продолжение. Выполните задание №2 только теперь с использованием слова WHERE.*/
SELECT operation_status, count(*) AS amount FROM operation
WHERE operation_status <> 'done'
GROUP BY operation_status;
            
/* 25. Напишите запрос, который покажет какие сервисы (service_id) сколько раз покупались. Выведите из таблицы операции два столбца:
service_id
их количество; этот столбец назовите amount.*/
SELECT service_id, count(*) AS amount FROM operation
GROUP BY service_id;

/* 26. Продолжение задания 2. А теперь напишите запрос, который выведет одну строку с service_id, который выполнялся наибольшее количество раз. Также оставьте два столбца - service_id и их количество (amount).*/
SELECT service_id, count(*) AS amount FROM operation
GROUP BY service_id
ORDER BY amount DESC
LIMIT 1;

