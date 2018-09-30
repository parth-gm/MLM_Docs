select reg_seq.NEXTVAL from dual;
create or replace trigger reg_increment 
before insert on reg_user
for each row 
begin 
  select reg_seq.NEXTVAL
  into :new.reg_id
  from dual;
end;

-----------

select log_seq.NEXTVAL from dual;
create or replace trigger log_increment 
before insert on log_user
for each row 
begin 
  select log_seq.NEXTVAL
  into :new.log_id
  from dual;
end;
------------------

select invoice_seq.NEXTVAL from dual;
create or replace trigger invoice_increment 
before insert on invoice
for each row 
begin 
  select invoice_seq.NEXTVAL
  into :new.i_id
  from dual;
end;
---------------------

select invoice_cust_seq.NEXTVAL from dual;
create or replace trigger invoice_cust_increment 
before insert on invoice_customer
for each row 
begin 
  select invoice_cust_seq.NEXTVAL
  into :new.invoice_id
  from dual;
end;
 --------------------

select trans_seq.NEXTVAL from dual;
create or replace trigger trans_increment 
before insert on transaction
for each row 
begin 
  select trans_seq.NEXTVAL
  into :new.t_id
  from dual;
end;
 ----------------
select acc_seq.NEXTVAL from dual;
create or replace trigger acc_increment 
before insert on account
for each row 
begin 
  select acc_seq.NEXTVAL
  into :new.acc_id
  from dual;
end;
 --------------------
select cust_mor_seq.NEXTVAL from dual;
create or replace trigger cust_mor_increment 
before insert on cust_mor
for each row 
begin 
  select cust_mor_seq.NEXTVAL
  into :new.cust_mor_id
  from dual;
end;
 -----------------------
select cust_seq.NEXTVAL from dual;
create or replace trigger cust_increment 
before insert on customer
for each row 
begin 
  select cust_seq.NEXTVAL
  into :new.c_id
  from dual;
end;
 ----------------------

--To Create Sequence on Auto-increment  IDs

create sequence reg_seq; 
select reg_seq.NEXTVAL from dual;
create or replace trigger reg_increment 
before insert on reg_user
for each row 
begin 
  select reg_seq.NEXTVAL
  into :new.reg_id
  from dual;
end;
--same for log_id,c_id,cust_mor_id,invoice_id,i_id,t_id

-------------------------------------


--login trigger on update of isvalid user in  reg_user
CREATE OR REPLACE TRIGGER log_Trigger

AFTER
 UPDATE OF isvalid 
ON reg_user

FOR EACH ROW
DECLARE 
regid INT;
v_user VARCHAR2 (25);
v_pass VARCHAR2 (20);
v_valid   NUMBER(1)  ;
BEGIN	
 select  reg_id INTO regid   FROM reg_user ;
 select  reg_uname INTO v_user     FROM reg_user ;
select   reg_pass INTO v_pass     FROM reg_user ;
select  isvalid INTO v_valid     FROM reg_user ;
IF v_valid=0
THEN
         INSERT INTO log_user(reg_id,username,password)
VALUES(regid, v_user,v_pass);
END IF;
END;	
-----------------------------------

--Procedure to Search Customer Account using Name:
CREATE OR REPLACE PROCEDURE searchp 
	(p_scust varchar)
	
	
IS
 c_name varchar(40);
Begin
	
 SELECT
 c_fname ||' ' ||c_mname ||' ' ||c_lname INTO c_name from customer
WHERE(c_fname LIKE '%p_scust%' OR c_mname LIKE '%p_scust%' OR c_lname LIKE '%p_scust%')  or p_scust is null;



END;



----------------------------------------------------




--customer trigger for account entry 
CREATE TRIGGER cust_trg
AFTER  INSERT
 ON customer
FOR EACH ROW
DECLARE
		 cid int;
		 dy int;
		 dm int;
    		dt TIMESTAMP;
  
     BEGIN	
select c_id INTO cid   FROM reg_user ;
  
      	dy:=( EXTRACT(YEAR FROM  SYSTIMESTAMP ) );
    
      	dt:=SYSTIMESTAMP  ;
dm:= SUBSTR('0'+TO_CHAR(EXTRACT(MONTH FROM SYSTIMESTAMP)(2)), GREATEST(-LENGTH('0'+TO_CHAR(EXTRACT(MONTH FROM (SYSTIMESTAMP))),-2))) ;
insert into account  cid ,cast(dy as varchar2(2))+cast(dm as varchar2(2))||'c'||cast(cid as varchar2(7)),dt  ;
END



