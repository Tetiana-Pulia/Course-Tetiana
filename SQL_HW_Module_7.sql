/* 1. Наши клиенты решили устроить заезд и покататься каждый на автомобиле каждого. 
Для этого нам нужно распечатать табличку, где мы будем отмечать, кто на чем уже проехал. 
Напишите запрос который выведет два столбца со всеми возможными вариациями: 
столбец 1: имя и фамилия участника, написанные через пробел; (Назовите его Driver) 
столбец 2: марка и модель автомобиля, написанные через пробел. (Назовите его Car) 
Причем нам будет удобнее всего, если сначала будет имя, а затем перечень автомобилей, например, Car, Driver;*/

SELECT concat(first_name, ' ', last_name) AS Driver, concat(brand, ' ', model) AS Car  FROM customer
CROSS JOIN car;

/*2. Нужно узнать общую сумму, сколько понадобиться для предоставления всех возможных сервисов каждому клиенту.*/
SELECT SUM(service_cost_usd) FROM car
CROSS JOIN service;

/* 3.Напишите запрос (все столбцы), который покажет только те автомобили, с которыми не было совершено ни одной операции.*/
SELECT * FROM car
LEFT JOIN operation
ON car.plate_number = operation.plate_number
WHERE operation.plate_number IS NULL;

/* 4. Напишите запрос (все столбцы), который покажет те двигатели, которым не соответствует ни один автомобиль.*/
SELECT * FROM car_engine
LEFT JOIN car
ON car_engine.engine_number = car.engine_number
WHERE car.engine_number IS NULL;

/* 5. Напишите запрос (все столбцы), который покажет те двигатели, которым не соответствует ни один автомобиль, еще и страна производства двигателей не заполнена.*/
SELECT * FROM car_engine
LEFT JOIN car
ON car_engine.engine_number = car.engine_number
WHERE car.engine_number IS NULL
AND origin IS NULL;

/* 6. Напишите запрос, который найдет имя клиента, автомобиль которого еще не готов, а в статусе 'in progress'. Выведите два столбца - имя клиента и статус операции.*/
SELECT first_name, operation_status FROM customer
JOIN car
ON customer.passport_number = car.car_owner
JOIN operation
ON car.plate_number = operation.plate_number
WHERE operation_status = 'in progress';

/* 7. Мы знаем, что George уже пользовался одной из услуг (то есть она завершена). Напишите запрос, который покажет в одном столбце название данной услуги.*/
SELECT service_name FROM service
JOIN operation 
ON service.service_id = operation.service_id
JOIN car
ON operation.plate_number = car.plate_number
JOIN customer
ON customer.passport_number = car.car_owner
WHERE operation_status = 'done' OR 'finished';

/*8. Найдите клиентов, которые покупали услуги сервисного центра после 3 сентября 2021 года. Выведите: имя, фамилию, название сервиса, и когда услуга предоставлялась.*/
SELECT first_name, last_name, service_name, operation_timestamp FROM customer
JOIN car
ON customer.passport_number = car.car_owner
JOIN operation
ON car.plate_number = operation.plate_number
JOIN service
ON operation.service_id = service.service_id
WHERE operation_timestamp > '2021-09-03 23:59:59';

/* 9. Напишите запрос, который найдет клиента, который потратил больше всего денег. 
Выведите одну строчку и две столбца: столбец 1 названный full_name: 
имя и фамилия написанные через пробел
столбец 2 названный amount, содержащий сумму, который потратил клиент*/

SELECT concat(first_name, ' ', last_name) AS full_name, sum(service.service_cost_usd) AS amount FROM customer
JOIN car
ON customer.passport_number = car.car_owner
JOIN operation
ON car.plate_number = operation.plate_number
JOIN service
ON operation. service_id = service.service_id
GROUP BY full_name
ORDER BY amount DESC
LIMIT 1;

/* 10.Напишите запрос, который найдет тех, клиентов, у которых есть автомобиль, но которые не потратили ни цента в сервисном центре на какой-то из своих автомобилей. Выведите столбцы first_name, last_name, brand, model.*/

SELECT first_name, last_name, brand, model
FROM customer
RIGHT JOIN car
ON customer. passport_number = car.car_owner
LEFT JOIN operation
ON car.plate_number = operation.plate_number
WHERE operation. plate_number IS NULL;

/* 11. Напишите запрос, который найдет всех клиентов, которые не потратили ни цента в сервисном центре, даже если у них нет автомобиля. Выведите столбцы first_name, last_name, brand, model.*/
SELECT first_name, last_name, brand, model
FROM customer
LEFT JOIN car
ON customer. passport_number = car.car_owner
LEFT JOIN operation
ON car.plate_number = operation.plate_number
WHERE operation. plate_number IS NULL;

/* 12. Напишите запрос, который выведет только емейл человека, который воспользовался услугой сервиса 11 сентября 2021 года. Используйте вложенные запросы.*/
SELECT email FROM customer
WHERE passport_number IN (
       SELECT car_owner FROM car
       WHERE plate_number IN
             (SELECT plate_number FROM operation
             WHERE date(operation_timestamp) = '2021-09-11')
	  );
      
/* 12. Вывести страну производителя двигателя автомобиля Гермионы.*/

SELECT origin FROM car_engine
WHERE engine_number IN
         (SELECT engine_number  FROM car
		  WHERE car_owner IN
             (SELECT passport_number FROM customer
		      WHERE first_name = 'Hermione'));
         
         
/* 13. Напишите запрос, который выведет все операции (все столбцы), которые записаны на клиента, у которого емейл red.boy@yahoo.com. Используйте вложенные запросы.*/

SELECT * FROM operation
WHERE plate_number IN (
			SELECT plate_number FROM car
            WHERE car_owner IN (
                                SELECT passport_number FROM customer
                                WHERE email = 'red.boy@yahoo.com')
);

/* 14. Продолжение задания №2. А теперь подсчитайте сколько операций у этого клиента, которые в статусе started. На экран выведите только один столбец под названием operations_number.*/
SELECT count(operation_status) AS operations_number FROM operation
WHERE plate_number IN (
			SELECT plate_number FROM car
            WHERE car_owner IN (
                                SELECT passport_number FROM customer
                                WHERE email = 'red.boy@yahoo.com'))
GROUP BY operation_status
HAVING operation_status = 'started';
