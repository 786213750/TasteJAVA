/*
Created		3/10/2018
Modified		3/14/2018
Project		
Model		
Company		
Author		
Version		
Database		Oracle 10g 
*/



-- Create Types section





-- Create Tables section


Create table "MEMBER" (
	"MEM_ID" Number(20,0) NOT NULL ,
	"MEM_NAME" Varchar2 (50) NOT NULL ,
	"MEM_UNAME" Varchar2 (50) NOT NULL ,
	"MEM_PW" Number(38,0) NOT NULL ,
	"MEM_ADDRESS" Varchar2 (200),
	"MEM_EMAIL" Varchar2 (100),
	"MEM_PHONE" Number(30,0) NOT NULL ,
primary key ("MEM_ID") 
) 
/

Create table "STAFF" (
	"STAFF_ID" Number(20,0) NOT NULL ,
	"STAFF_UNAME" Varchar2 (50) NOT NULL ,
	"STAFF_PW" Number(38,0) NOT NULL ,
	"STAFF_STATUS" Varchar2 (20) NOT NULL ,
	"MEM_ID" Number(20,0) NOT NULL ,
	"STAFF_PHONE" Varchar2 (30),
	"STAFF_EMAIL" Varchar2 (100),
	"STAFF_ADDRESS" Varchar2 (200),
	"STAFF_TYPE" Varchar2 (20),
primary key ("STAFF_ID") 
) 
/

Create table "REWARD" (
	"REWARD_ID" Number(20,0) NOT NULL ,
	"REWARD_ReqStar" Number(10,0) NOT NULL ,
	"REWARD_STOCK" Number(30,0) NOT NULL ,
	"REWARD_NAME" Varchar2 (20),
primary key ("REWARD_ID") 
) 
/

Create table "REDEEM" (
	"REWARD_ID" Number(20,0) NOT NULL ,
	"MEM_ID" Number(20,0) NOT NULL ,
	"REDEEM_ID" Number(20,0) NOT NULL ,
	"REDEEM_DATE" Date NOT NULL ,
	"REDEEM_QUANTITY" Number(10,0) NOT NULL ,
	"STAFF_ID" Number(20,0) NOT NULL ,
primary key ("REWARD_ID","MEM_ID","REDEEM_ID") 
) 
/

Create table "ORDERS" (
	"ORDERS_ID" Number(20,0) NOT NULL ,
	"ORDERS_DATE" Date NOT NULL ,
	"ORDERS_TIME" Timestamp(6) with local time zone NOT NULL ,
	"ORDERS_STATUS" Varchar2 (30) NOT NULL ,
	"STAFF_ID" Number(20,0) NOT NULL ,
primary key ("ORDERS_ID") 
) 
/

Create table "PRODUCT" (
	"PRODUCT_ID" Number(20,0) NOT NULL ,
	"PRODUCT_DESCRIPTION" Varchar2 (100),
	"PRODUCT_STATUS" Varchar2 (20) NOT NULL ,
	"PRODUCT_PRICE" Number(5,0),
	"PRODUCT_NAME" Varchar2 (30) NOT NULL ,
primary key ("PRODUCT_ID") 
) 
/

Create table "INVENTORY" (
	"INVENTORY_ID" Number(20,0) NOT NULL ,
	"INVENTORY_NAME" Varchar2 (30) NOT NULL ,
	"INVENTORY_QUANTITY" Number(20,0) NOT NULL ,
	"INVENTORY_COST" Number(20,0) NOT NULL ,
	"INVENTORY_PURCHASINGDATE" Date NOT NULL ,
	"INVENTORY_EXPIRYDATE" Date NOT NULL ,
	"INVENTORY_STATUS" Varchar2 (20) NOT NULL ,
primary key ("INVENTORY_ID") 
) 
/

Create table "DETAIL" (
	"ORDERS_ID" Number(20,0) NOT NULL ,
	"PRODUCT_ID" Number(20,0) NOT NULL ,
	"DETAIL_ID" Number(20,0) NOT NULL ,
	"DETAIL_QUANTITY" Number(20,0) NOT NULL ,
	"DETAIL_SWEETNESS" Varchar2 (20) NOT NULL  Check (0%, 30%, 50%, 70%, 100% ) ,
	"DETAIL_COLDNESS" Varchar2 (20) NOT NULL  Check (0%, 30%, 50%, 70%, 100% ) ,
	"DETAIL_ADDPARTS" Varchar2 (30) NOT NULL ,
	"DETAIL_STATUS" Varchar2 (30) NOT NULL ,
primary key ("ORDERS_ID","PRODUCT_ID","DETAIL_ID") 
) 
/

Create table "INGREDIENT" (
	"INVENTORY_ID" Number(20,0) NOT NULL ,
	"PRODUCT_ID" Number(20,0) NOT NULL ,
	"ING_ID" Number(20,0) NOT NULL ,
	"ING_NAME" Varchar2 (30) NOT NULL ,
	"ING_QUANTITY" Number(30,0) NOT NULL ,
primary key ("INVENTORY_ID","PRODUCT_ID","ING_ID") 
) 
/


-- Create section for PKs, AKs and Unique constraints, which have to be generated after Indexes


-- Create Foreign keys section

Alter table "STAFF" add  foreign key ("MEM_ID") references "MEMBER" ("MEM_ID") 
/

Alter table "REDEEM" add  foreign key ("MEM_ID") references "MEMBER" ("MEM_ID") 
/

Alter table "REDEEM" add  foreign key ("STAFF_ID") references "STAFF" ("STAFF_ID") 
/

Alter table "ORDERS" add  foreign key ("STAFF_ID") references "STAFF" ("STAFF_ID") 
/

Alter table "REDEEM" add  foreign key ("REWARD_ID") references "REWARD" ("REWARD_ID") 
/

Alter table "DETAIL" add  foreign key ("ORDERS_ID") references "ORDERS" ("ORDERS_ID") 
/

Alter table "DETAIL" add  foreign key ("PRODUCT_ID") references "PRODUCT" ("PRODUCT_ID") 
/

Alter table "INGREDIENT" add  foreign key ("PRODUCT_ID") references "PRODUCT" ("PRODUCT_ID") 
/

Alter table "INGREDIENT" add  foreign key ("INVENTORY_ID") references "INVENTORY" ("INVENTORY_ID") 
/


-- Create Object Tables section



-- Create XMLType Tables section



-- Create Functions section



-- Create Sequences section




-- Create Packages section





-- Create Synonyms section



-- Create Table comments section


-- Create Attribute comments section



