--����� � ������� users ���� created_at � updated_at ��������� ��������������. ��������� �� �������� ����� � ��������.--

update users 
	set created_at = now() and updated_at = NOW()
;


--������� users ���� �������� ��������������. ������ created_at � updated_at ���� ������ ����� VARCHAR � � ��� ������ ����� 
���������� �������� � ������� "20.10.2017 8:10". ���������� ������������� ���� � ���� DATETIME, �������� �������� ����� ��������.--

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



--� ������� ��������� ������� storehouses_products � ���� value ����� ����������� ����� ������ �����: 0, 
���� ����� ���������� � ���� ����, ���� �� ������ ������� ������. ���������� ������������� ������ ����� �������,
����� ��� ���������� � ������� ���������� �������� value. ������, ������� ������ ������ ���������� � �����, ����� ���� �������.---

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

--�� ������� users ���������� ������� �������������, ���������� � ������� � ���. ������ ������ � ���� ������ ���������� �������� ('may', 'august')---

select * from users where birthday_at rlike '^[0-9]{4}-(05|08)-[0-9]{2}';


--�� ������� catalogs ����������� ������ ��� ������ �������. SELECT * FROM catalogs WHERE id IN (5, 1, 2); 
������������ ������ � �������, �������� � ������ IN.--

select round(exp(sum(log(id))), 10) from users; 
