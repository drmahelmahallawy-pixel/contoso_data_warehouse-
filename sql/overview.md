create database contoso_dw ;
create schema bronze ;
create schema silver ;
create schema gold ; 
create extension if not exists postgres_fdw;
create server contoso_source 
foreign data wrapper postgres_fdw
options (
host 'localhost',
dbname 'contoso',
port '5432');
-----------------------------
create user mapping for CURRENT_USER
server 	CONTOSO_SOURCE 
options (USER'postgres',password 'Aa123456');
create schema source ;
--create sales 
import foreign schema public 
limit to (sales)
from server contoso_source 
into source ;
------------------------------
create table bronze.sales as select * from source.sales 
--------------------------------------------------------
check point 
select count(*)
from source.sales s ;
select count(*)
from bronze.sales 
----result valiated 
select *from bronze.sales limit 3
15500107	0	2016-06-03	2016-06-03	733258	280	2103	6	381.000000	358.140000	194.242500	EUR	0.896540
15500107	1	2016-06-03	2016-06-03	733258	280	983	1	315.040000	315.040000	144.880000	EUR	0.896540
15500108	0	2016-06-03	2016-06-03	1085142	420	1955	2	209.992500	186.893325	107.062500	GBP	0.692890
---------------------------------------------------------------------------------------------------------------
--create product
create schema if not exists source ;
import foreign schema public  limit to (product)
from server contoso_source
into source ;
create table bronze.product as select * from source.product;
----------------------------
check point 
select count(*)
from source.product p ;
select count(*)
from bronze.product;
select *
from bronze.product 
limit 2
--result 
1	101001	Contoso 512MB MP3 Player E51 Silver	Contoso, Ltd	Contoso	Silver	ounces	4.800000	6.620000	12.990000	1	Audio	101	MP4&MP3
2	101002	Contoso 512MB MP3 Player E51 Blue	Contoso, Ltd	Contoso	Blue	ounces	4.100000	6.620000	12.990000	1	Audio	101	MP4&MP3
------------------------------------------------------------------------
--create customer
create schema if not exists source ;
import foreign schema public  limit to (customer)
from server contoso_source
into source ;
create table bronze.customer as select * from source.customer;
----------------------------
check point 
select count(*)
from source.customer p ;
select count(*)
from bronze.customer;
select *
from bronze.customer
limit 2
-----result 
0	6	2005-04-17	2040-06-14	Australia	male	Mr.	Lachlan	S	McCormick	22 South Street	Albion Heights	TAS	Tasmania	7050	AU	Australia	1964-08-17	56	Mine cutting and channeling machine operator	Baltimore Markets	2002 Alfa Romeo GTV	-42.99816900	147.36451700
2	1	1999-04-21	2031-03-15	Australia	female	Mrs.	Makayla	A	Clifton	19 Quayside Vista	Deakin	ACT	Australian Capital Territory	2600	AU	Australia	1945-09-24	75	Meat packer	Good Guys	2004 Cadillac Escalade	-35.36865700	149.22501900
--------------------------------------------------------------
create date
create schema if not exists source ;
import foreign schema public  limit to (date)
from server contoso_source
into source ;
create table bronze.date as select * from source.date;
--check point 
select count(*)
from source.customer p ;
select count(*)
from bronze.customer;
------------------------------------------------------------------
----create store
import foreign schema public  limit to (store)
from server contoso_source
into source ;
create table bronze.store as select * from source.store;
----check point 
select count(*)
from source.store p ;
select count(*)
from bronze.store;
select * from bronze.store s limit 2 
10	1	1	AU	Australia	Australian Capital Territory	2008-01-01		Contoso Store Australian Capital Territory	595	
20	2	3	AU	Australia	Northern Territory	2008-01-12	2016-07-07	Contoso Store Northern Territory	665	Closed
----------------------------------------------------------------------
--create currencyexchange
import foreign schema public  limit to (currencyexchange)
from server contoso_source
into source ;
create table bronze.currencyexchange as select * from source.currencyexchange;
------check point 
select count(*)
from source.currencyexchange p ;
select count(*)
from bronze.currencyexchange;
-----------------------------------------------------------------------
