--Пусть в таблице users поля created_at и updated_at оказались незаполненными. Заполните их текущими датой и временем.--

update users 
	set created_at = now() and updated_at = NOW()
;


--Таблица users была неудачно спроектирована. Записи created_at и updated_at были заданы типом VARCHAR и в них долгое время 
помещались значения в формате "20.10.2017 8:10". Необходимо преобразовать поля к типу DATETIME, сохранив введеные ранее значения.--

alter table users modify column created_at varchar(150);
alter table users modify column updated_at varchar(150);

update users	
	set created_at = STR_TO_DATE(created_at, '%d.%m.%Y %k:%i'),
	updated_at = STR_TO_DATE(updated_at, '%d.%m.%Y %k:%i')
;


alter table users 
	modify column created_at DATETIME,
	modify column updated_at DATETIME
;

update users 
	set created_at = date_format(created_at, '%d.%m.%Y %H:%i'),
	updated_at = date_format(updated_at, '%d.%m.%Y %H:%i')
;



--В таблице складских запасов storehouses_products в поле value могут встречаться самые разные цифры: 0, 
если товар закончился и выше нуля, если на складе имеются запасы. Необходимо отсортировать записи таким образом,
чтобы они выводились в порядке увеличения значения value. Однако, нулевые запасы должны выводиться в конце, после всех записей.---

select * from storehouses_products;

insert into storehouses_products
	(storehouse_id, product_id, value, created_at, updated_at) values
	(1, 1, 2, now(), now()),
	(2, 2, 1, now(), now()),
	(3, 3, 5, now(), now()),
	(4, 4, 0, now(), now()),
	(5, 5, 4, now(), now()),
	(6, 6, 3, now(), now()),
;

select * from storehouses_products order by case when value = 0 then 99999999999999999 else value end;

--Из таблицы users необходимо извлечь пользователей, родившихся в августе и мае. Месяцы заданы в виде списка английских названий ('may', 'august')---

select * from users where birthday_at rlike '^[0-9]{4}-(05|08)-[0-9]{2}';


--Из таблицы catalogs извлекаются записи при помощи запроса. SELECT * FROM catalogs WHERE id IN (5, 1, 2); 
Отсортируйте записи в порядке, заданном в списке IN.--

select round(exp(sum(log(id))), 10) from users; 
