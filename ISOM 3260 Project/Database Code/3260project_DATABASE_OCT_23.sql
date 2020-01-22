/*
Created: 9/26/2019
Modified: 10/15/2019
Model: Oracle 12c Release 2
Database: Oracle 12c Release 2
*/


-- Create tables section -------------------------------------------------

-- Table MEMBER

CREATE TABLE MEMBER(
   Member_ID  Number(10,0) NOT NULL,
   Member_FirstName  Varchar2(30),
   Member_LastName  Varchar2(30),
   Member_Email  Varchar2(30),
   Member_Phone  Number,
   Member_Password  Varchar2(30),
   Member_Address  Varchar2(30),
   Member_Star_accumulated  Number  Default 0,
   Member_Star_redeemed  Number  Default 0,
   Member_Star_remain  Number  Default 0
)
/

-- Add keys for table MEMBER

ALTER TABLE MEMBER ADD CONSTRAINT  PK_MEMBER  PRIMARY KEY ( Member_ID )
/



-- Table ORDER ITEM

CREATE TABLE ORDER_ITEM(
   Order_Item_ID  Number(10,0) NOT NULL,
   Order_ID  Number(10,0) NOT NULL,
   Product_ID  Number(10,0) NOT NULL,
   Sweetness  Varchar2(30),
   Coldness  Varchar2(30),
   Item_Quantity Number NOT NULL
   
)
/
ALTER TABLE ORDER_ITEM ADD CONSTRAINT  PK_ORDER_ITEM  PRIMARY KEY ( Order_Item_ID )
/


-- Table STAFF

CREATE TABLE STAFF(
   Staff_ID  Number(10,0) NOT NULL,
   Staff_FirstName  Varchar2(30 ) NOT NULL,
   Staff_LastName  Varchar2(30 ) NOT NULL,
   Staff_Position  Varchar2(30 ) NOT NULL,
   Staff_Password  Varchar2(30 ) NOT NULL,
   Staff_Phone_Number Number(20,0) NOT NULL
)
/

-- Add keys for table STAFF

ALTER TABLE STAFF ADD CONSTRAINT  PK_STAFF  PRIMARY KEY ( Staff_ID )
/

-- Table PRODUCT

CREATE TABLE PRODUCT(
   Product_ID  Number(10,0) NOT NULL,
   Product_Name  Varchar2(30 ),
   Product_Price  Number,
   Product_InStock  Number
)
/

-- Add keys for table PRODUCT

ALTER TABLE PRODUCT ADD CONSTRAINT  PK_PRODUCT  PRIMARY KEY ( Product_ID )
/




-- Table ORDERS

CREATE TABLE ORDERS(
   Order_ID  Number(10,0) NOT NULL,
   Order_Date  Date Default sysdate,
   Order_Status  Varchar2(30) Default 'In Progress',
   Staff_ID  Number(10,0) NOT NULL,
   Member_ID  Number(10,0)
)
/

-- Create indexes for table ORDERS

CREATE INDEX  IX_Relationship11  ON ORDERS ( Staff_ID )
/

CREATE INDEX  IX_Relationship14  ON ORDERS ( Member_ID )
/

-- Add keys for table ORDERS

ALTER TABLE ORDERS ADD CONSTRAINT  PK_ORDERS  PRIMARY KEY ( Order_ID )
/

-- Table PRODUCT MANAGEMENT

CREATE TABLE PRODUCT_MANAGEMENT(
   Staff_ID  Number(10,0) NOT NULL,
   Product_ID  Number(10,0) NOT NULL
)
/

-- Add keys for table PRODUCT MANAGEMENT

ALTER TABLE PRODUCT_MANAGEMENT ADD CONSTRAINT  PK_PRODUCT_MANAGEMENT  PRIMARY KEY ( Staff_ID , Product_ID )
/

-- Table ORDER MANAGEMENT

CREATE TABLE ORDER_MANAGEMENT(
   Staff_ID  Number(10,0) NOT NULL,
   Order_ID  Number(10,0) NOT NULL
)
/

-- Add keys for table ORDER MANAGEMENT

ALTER TABLE ORDER_MANAGEMENT ADD CONSTRAINT  PK_ORDER_MANAGEMENT  PRIMARY KEY ( Staff_ID , Order_ID )
/


-- Create foreign keys (relationships) section ------------------------------------------------- 

ALTER TABLE ORDER_ITEM ADD CONSTRAINT  HAS  FOREIGN KEY ( Order_ID ) REFERENCES ORDERS(ORDER_ID)
/

ALTER TABLE ORDER_ITEM ADD CONSTRAINT  included  FOREIGN KEY (Product_ID) REFERENCES PRODUCT(PRODUCT_ID)
/


ALTER TABLE ORDERS ADD CONSTRAINT  Places  FOREIGN KEY ( Staff_ID ) REFERENCES STAFF ( Staff_ID )
/





ALTER TABLE ORDERS ADD CONSTRAINT  Places2  FOREIGN KEY ( Member_ID ) REFERENCES MEMBER ( Member_ID )
/





ALTER TABLE PRODUCT_MANAGEMENT ADD CONSTRAINT  Makes2  FOREIGN KEY ( Staff_ID ) REFERENCES STAFF ( Staff_ID )
/



ALTER TABLE PRODUCT_MANAGEMENT ADD CONSTRAINT  Manages  FOREIGN KEY ( Product_ID ) REFERENCES PRODUCT ( Product_ID )
/



ALTER TABLE ORDER_MANAGEMENT ADD CONSTRAINT  Makes3  FOREIGN KEY ( Staff_ID ) REFERENCES STAFF ( Staff_ID )
/



ALTER TABLE ORDER_MANAGEMENT ADD CONSTRAINT  Manages2  FOREIGN KEY ( Order_ID ) REFERENCES ORDERS ( Order_ID )
/










