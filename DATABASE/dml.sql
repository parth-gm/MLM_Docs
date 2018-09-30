Insert into reg_user 
(reg_uname,reg_pass,email_id,mobile_no,reg_date,role_id,isvalid) values ('admin','admin','admin@gmail.com',9537872933,CURRENT_TIMESTAMP,1,1 );


insert into reg_user 
(reg_uname,reg_pass,email_id,mobile_no,reg_date,role_id,isvalid) values('user1','user1','user1@gmail.com',9724788995, CURRENT_TIMESTAMP,0,1 );	
Select * from reg_user;


SELECT CAST(SYSTIMESTAMP AS DATE) DT FROM DUAL;

SELECT * FROM reg_user where reg_uname ='user1' ;
DELETE FROM reg_user WHERE reg_id = 2;

SELECT reg_id, reg_uname, email_id, mobile_no, CAST(reg_date AS DATE), isvalid FROM reg_user WHERE isvalid = 0 ORDER BY reg_date; 
--@isvalid=0


UPDATE reg_user SET reg_uname = 'nuser55', email_id ='nuser55@gmail.com', mobile_no =9872158273 WHERE reg_id = 10; 
Select * from reg_user;


SELECT reg_id, reg_uname, email_id, mobile_no, reg_date, isvalid FROM reg_user WHERE (isvalid =1) ORDER BY reg_date DESC;


	select cust_seq.NEXTVAL from dual;

INSERT INTO CUSTOMER (C_ID, C_FNAME, C_MNAME, C_LNAME, ADDRESS, CITY, EMAIL_ID, MOBILE_NO,create_date CPHOTO_PATH, MPHOTO_PATH, INTEREST_RATE, DEBIT_LIMIT) VALUES (2.0,'panchal','Parth','N','bdh','Bhuj','parth.np5@gmail.com',9852256323, TIMESTAMP '2017-11-10 03:02:31','none','none',654.0,6556.76);

INSERT INTO CUSTOMER (C_ID, C_FNAME, C_MNAME, C_LNAME, ADDRESS, CITY, EMAIL_ID, MOBILE_NO, CPHOTO_PATH, MPHOTO_PATH, INTEREST_RATE, DEBIT_LIMIT) VALUES (4.0,'patel','ravi','m','godhra','Godhra','prt@gmail.com',98225855259,'none','none',56.0,5620.0);

UPDATE customer SET  city = 'Junagadh',email_id = 'harsh97@gmail.com', updated_date = sysdate WHERE c_id = 2; 
UPDATE customer SET  email_id = 'ravi98@gmail.com', updated_date = sysdate WHERE c_id = 1;


INSERT INTO CUST_MOR (CUST_MOR_ID, C_ID, ITEM_TYPE, ITEM_NAME, GROSS_WEIGHT, RATE, AMOUNT) VALUES (27.0,11.0,'silver','plate',20.5,39000.0,800000.0);

INSERT INTO CUST_MOR (CUST_MOR_ID, C_ID, ITEM_TYPE, ITEM_NAME, GROSS_WEIGHT, RATE, AMOUNT) VALUES (28.0,11.0,'other','watch',3.0,450.0,1350.0);


SELECT item_type, item_name, gross_weight, rate, amount, cust_mor_id FROM cust_mor WHERE (c_id = 8);

UPDATE cust_mor SET item_type = @item_type,
item_name = @item_name, gross_weight = @gross_weight, 
rate = @rate, amount = @amount  
WHERE (cust_mor_id = @cust_mor_id) ;
update cust_mor set item_name='Brecelet', item_type='gold',gross_weight='55',amount=120000 where cust_mor_id=31;


INSERT INTO TRANSACTION (T_ID, C_ID, T_TYPE, T_AMOUNT, T_REMARK) VALUES (1,2,'d',453.0,'locker1');

select * from transaction where c_id=2;

select * FROM  customer where mobile_no=9785623421 ORDER BY create_date DESC;

SELECT * FROM customer  WHERE( 
           (c_fname LIKE '%tapan%' AND c_mname LIKE '%k%') OR 
           (c_fname LIKE '%k%' AND c_mname LIKE  '%tapan%')OR  
           (c_fname LIKE '%tapan%' AND c_lname LIKE '%parmar%')OR   
           (c_fname LIKE '%tapan%' AND c_lname LIKE '%parmar%')OR   
           (c_mname LIKE '%k%' AND c_lname LIKE '%parmar%')OR 
(c_mname LIKE '%k%' AND c_lname LIKE '%parmar%')) ORDER BY create_date DESC;


SELECT  SUM(t_amount) FROM transaction where (c_id=5 AND t_type='d') GROUP BY c_id ; 
--@t_type=’d’ 
SELECT  SUM(t_amount) FROM transaction where (c_id=5 AND t_type='c') GROUP BY c_id ; 
--@t_type=’c’ 


SELECT * FROM customer WHERE ((create_date <sysdate) AND (create_date > TIMESTAMP '2017-11-05 03:02:31' ));


DELETE FROM cust_mor WHERE (cust_mor_id = 31);	

DELETE FROM customer WHERE c_id = 2;
update customer set updated_date=  sysdate where c_id=7;


UPDATE customer SET isactive = 0, updated_date=sysdate where c_id=2;


select  sum(gross_weight) from cust_mor WHERE (cust_mor.c_id IN (select customer.c_id from customer where customer.isactive=1) AND cust_mor.item_type='gold') GROUP BY cust_mor.item_type;

select  sum(gross_weight) from cust_mor WHERE (cust_mor.c_id IN (select customer.c_id from customer where customer.isactive=1) AND cust_mor.item_type='silver') GROUP BY cust_mor.item_type;

select  sum(gross_weight) from cust_mor WHERE (cust_mor.c_id IN (select customer.c_id from customer where customer.isactive=1) AND cust_mor.item_type='other') GROUP BY cust_mor.item_type;

select  sum(t_amount) from transection where (transection.c_id in (select customer.c_id from customer where customer.isactive=1) AND t_type='d') GROUP BY t_type;

select  sum(t_amount) from transection where (transection.c_id in (select customer.c_id from customer where customer.isactive=1) AND t_type='d') GROUP BY t_type;


	INSERT INTO INVOICE_CUSTOMER (INVOICE_ID, C_ID, I_DATE, C_NAME, ADDRESS, CITY, MOBILE_NO) VALUES (2,5,sysdate,'patel mohan u','godhra','Ankleshwar',9685852859);

INSERT INTO INVOICE_CUSTOMER (INVOICE_ID, C_ID, I_DATE, C_NAME, ADDRESS, CITY, MOBILE_NO) VALUES (3,8,sysdate,'rohit n patel','jyoti society,B-201','Ahmedabad',9855855859);

select * from invoice_customer;


INSERT INTO INVOICE (I_ID, INVOICE_ID, PRODUCT_NAME,QUANTITY, RATE) VALUES (2,2,'Earring',1,25000.0);
INSERT INTO INVOICE (I_ID, INVOICE_ID, PRODUCT_NAME,QUANTITY, RATE) VALUES (3,2,'Ring',1,24000.0);
select * from invoice;
