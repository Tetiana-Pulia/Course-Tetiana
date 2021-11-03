/* 1. Напишите запрос, который выведет на экран всю информацию об автомобиле, на котором ездит клиент по имени Гермиона.*/
SELECT * FROM car
WHERE car_owner IN
        (SELECT passport_number FROM customer
         WHERE first_name = 'Hermione');
         
SELECT plate_number, brand, model, engine_number, car_owner FROM car
JOIN customer
ON car.car_owner = customer.passport_number
WHERE first_name = 'Hermione';

/* 2. Напишите запрос, который выведет на экран всю информацию об автомобиле, на котором ездит клиент, емейл которого ronny88@mail.ru.*/
SELECT * FROM car
WHERE car_owner in
		(SELECT passport_number FROM customer
        WHERE email = 'ronny88@mail.ru');
        
SELECT plate_number, brand, model, engine_number, car_owner FROM car
JOIN customer
ON car.car_owner = customer.passport_number
WHERE email = 'ronny88@mail.ru';
        
/* 3. Напишите запрос, который выведет на экран всю информацию об автомобиле, на котором ездит клиент, возраст которого 17 лет.*/
SELECT * FROM car
WHERE car_owner IN
      (SELECT passport_number FROM customer
      WHERE age = 17);
      
SELECT plate_number, brand, model, engine_number, car_owner FROM car
JOIN customer
ON car.car_owner = customer.passport_number
WHERE age = 17;

/* 4. Напишите запрос, который выведет на экран всю информацию об автомобилях, на которых ездят клиенты, которые живут в Лондоне.*/
SELECT * FROM car
WHERE car_owner IN
      (SELECT passport_number FROM customer
       WHERE city = 'London');

SELECT plate_number, brand, model, engine_number, car_owner FROM car
JOIN customer
ON car.car_owner = customer.passport_number
WHERE city = 'London';

/* 5. Напишите запрос, который выведет на экран всю информацию о клиенте, который ездит на Мерседесе.*/
SELECT * FROM customer
WHERE passport_number IN
	  (SELECT car_owner FROM car
       WHERE brand = 'Mercedes');

SELECT passport_number, first_name, last_name, email, age, city FROM customer
JOIN car
ON customer.passport_number = car.car_owner
WHERE brand = 'Mercedes';

/* 6. Напишите запрос, который выведет на экран всю информацию о самом старшем клиенте, который ездит на Toyota.*/
SELECT * FROM customer
WHERE passport_number in
      (SELECT car_owner FROM car
      WHERE brand = 'Toyota')
ORDER BY age DESC
LIMIT 1;

SELECT passport_number, first_name, last_name, email, age, city FROM customer
JOIN car
ON customer.passport_number = car.car_owner
WHERE brand = 'Toyota'
ORDER BY age desc
LIMIT 1;

/* 7. Вывести страну производства двишателя для автомобиля с номерным знаком a345xa150.*/
SELECT origin FROM car_engine
WHERE engine_number IN
      (SELECT engine_number FROM car
      WHERE plate_number = 'a345xa150');
      
SELECT origin FROM car_engine
JOIN car
ON car_engine.engine_number = car.engine_number
WHERE plate_number = 'a345xa150';

/* 8. Вывести информацию только о тех двигателях, которые установлены в Toyota.*/
SELECT * FROM car_engine
WHERE engine_number IN
      (SELECT engine_number FROM car
      WHERE brand = 'Toyota');
      
/* 9. Напишите запрос, который покажет информацию об автомобилях с двигателем из Японии.*/
SELECT * FROM car
WHERE engine_number in
	  (SELECT engine_number FROM car_engine
      WHERE origin = 'Japan');      

/* 10. Напишите запрос, который покажет все автомобили клиента по имени Harry.*/
SELECT * FROM car
WHERE car_owner in
      (SELECT passport_number FROM customer
      WHERE first_name = 'Harry');
      
SELECT plate_number, brand, model, engine_number, car_owner FROM car
JOIN customer
ON car.car_owner = customer.passport_number
WHERE first_name = 'Harry';

/* 11. Напишите запрос, который покажет информацию об автомобиле, который завершили обслуживать. То есть в таблице operation статус операции = done.*/
SELECT * FROM car
WHERE plate_number in
      (SELECT plate_number FROM operation
      WHERE operation_status = 'done');
      
SELECT brand, model, engine_number, car_owner FROM car
JOIN operation
ON car.plate_number = operation.plate_number
WHERE operation_status = 'done';

/* 12. Напишите запрос, который покажет информацию о клиенте, автомобиль которого завершили обслуживать. То есть в таблице operation статус операции = done.*/
SELECT * FROM customer
WHERE passport_number in
      (SELECT car_owner FROM car
      WHERE plate_number IN
              (SELECT plate_number FROM operation
              WHERE operation_status = 'done'));
              
SELECT * FROM customer
JOIN car
ON customer.passport_number = car_owner
JOIN operation
ON car.plate_number = operation.plate_number
WHERE  operation_status = 'done';

/*13. Выведите на экран только название городов (одну колонку), в которых живут клиенты, которые ездят на автомобиле с двигателем из Японии.*/
SELECT city FROM customer
WHERE passport_number IN
     (SELECT car_owner FROM car
     WHERE engine_number IN
		   (SELECT engine_number FROM car_engine
            WHERE origin = 'Japan'));
            
SELECT city FROM customer
JOIN car
ON customer.passport_number = car.car_owner
JOIN car_engine
ON car.engine_number = car_engine.engine_number
WHERE origin = 'Japan';

/*14. Вывести страну производства двишателя для автомобиля с номерным знаком k505ok24.*/
SELECT origin FROM car_engine
JOIN car
ON car_engine. engine_number = car.engine_number
WHERE plate_number = 'k505ok24';

/* 15. Вывести информацию только о тех двигателях, которые установлены в BMW.*/
SELECT * FROM car_engine
JOIN car
ON car_engine.engine_number = car.engine_number
WHERE brand = 'BMW';

/* 16. Напишите запрос с использованием оператора JOIN, который объединяет две таблицы “клиенты” и “автомобили” и выводит на экран две колонки имя клиента и марку автомобиля.*/
SELECT first_name, brand FROM car
JOIN customer
ON car.car_owner = customer.passport_number;

/* 17. Напишите запрос с использованием оператора JOIN, который выводит на экран три колонки в следующем порядке - имя клиента, возраст и марку (бренд) автомобиля для клиентов в возрасте > 12 лет.*/
SELECT first_name, age, brand FROM customer
JOIN car
ON customer.passport_number = car.car_owner
WHERE age > 12;

/* 18. Напишите запрос с использованием оператора JOIN, который выводит на экран минимальный возраст клиента, у которого есть автомобиль, при условии что ему больше 12 лет и он проживает в городе Девон.*/
SELECT min(age) FROM customer
JOIN car
ON customer.passport_number = car.car_owner
WHERE age > 12 
AND city = 'Devon';

/* 19.Напишите запрос с использованием оператора JOIN, который объединит таблицу автомобильные двигатели с таблицей автомобили.*/
SELECT * FROM car_engine
JOIN car
ON car_engine.engine_number = car.engine_number;

/* 20. Напишите запрос, чтобы посмотреть, какие марки автомобилей (brand) в каких странах производят двигатели. Выведите два столбца - марка, страна.*/
SELECT brand, origin FROM car
JOIN car_engine
ON car.engine_number = car_engine.engine_number;

/* 21. Напишите запрос, чтобы посмотреть, какие марки автомобилей (brand) в каких странах производят двигатели. Выведите два столбца - марка, страна. Только теперь нас не интересует марка Toyota.*/
SELECT brand, origin FROM car
JOIN car_engine
ON car.engine_number = car_engine.engine_number
WHERE brand <> 'Toyota';

/* 22. Напишите запрос (используя какой-то из джойнов), который покажет все существующие номера двигателей и соответствующие им автомобили (вне зависимости есть они или нет). Запрос должен показать вообще все столбцы.*/
SELECT * FROM car_engine
LEFT JOIN car
ON car_engine.engine_number = car.engine_number;

/* 23. Напишите такой же запрос как в предыдущем задании только с использованием другого джойна. То есть по содержанию должен получиться точно такой же результат (здесь недостаточно просто поменять слово left на right и наоборот :).*/
SELECT * FROM car
RIGHT JOIN car_engine
ON car.engine_number = car_engine.engine_number;

/* 24. Напишите запрос при помощи UNION, который в одном запросе:покажет клиентов, у которых емейл, зарегистрирован в Гугле (gmail), а также тех клиентов, у которых возраст равен 17 лет.*/
SELECT * FROM customer
WHERE email LIKE '%gmail%'
UNION
SELECT * FROM customer
WHERE age = 17;

/* 25. А теперь решите предыдущее задание проще, не используя UNION.*/
SELECT * FROM customer
WHERE email like '%gmail%'
OR age = 17;

/* 26. Напишите FULL JOIN для таблицы автомобиль и автомобильный двигатель*/
SELECT * FROM car
LEFT JOIN car_engine
ON car.engine_number = car_engine.engine_number
UNION
SELECT * from car
RIGHT JOIN car_engine
ON car.engine_number = car_engine. engine_number;
