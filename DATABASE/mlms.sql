CREATE TABLE customer
( c_id int NOT NULL  PRIMARY KEY ,
  c_fname varchar2(20) NOT NULL,
  c_mname varchar2(20) NOT NULL,
  c_lname varchar2(20) NOT NULL,
  address  varchar2(50) NOT NULL,
  city varchar2(15) NOT NULL,
  email_id varchar(30),
  mobile_no number(12,0) NOT NULL,
  cphoto_path varchar(30),
  mphoto_path varchar(30)
);
drop  table customer;
commit;
CREATE TABLE account
( 
  acc_id int NOT NULL   PRIMARY KEY  ,
  c_id int NOT NULL,
  acc_no number(20) NOT NULL UNIQUE ,
  create_date TIMESTAMP  DEFAULT CURRENT_TIMESTAMP ,
  created_date TIMESTAMP  DEFAULT CURRENT_TIMESTAMP ,
  updated_date TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
  interest_rate NUMBER(5,2) DEFAULT 36.00,
  debit_limit NUMBER(11,2),
  isactive  NUMBER(1) DEFAULT 1,
  CONSTRAINT acc_cust_id_fk FOREIGN KEY (c_id)
  REFERENCES customer(c_id) ,
  CONSTRAINT acc_cust_createdate_check CHECK (create_date<=created_date)
);
drop table account;
rollback;


create table mor_type
(
  mt_id int PRIMARY Key,
  mt_name varchar(30) Not Null
);

CREATE TABLE transection
( 
  trans_id int NOT NULL PRIMARY KEY ,
  acc_id int NOT NULL,
  trans_no number(30) NOT NULL UNIQUE,
  trans_date  TIMESTAMP(6) WITH TIME ZONE NOT NULL,
  trans_type char(1) check (trans_type in( 'C','D' )),
  CONSTRAINT acc_id_trans_fk FOREIGN KEY (acc_id)
    REFERENCES account(acc_id)
  
);
drop table transection;
CREATE TABLE  cash
( 
  trans_id int NOT NULL,
  chash_amount number(11,2) NOT NULL,
  pay_from  varchar(30) NOT NULL,
  CONSTRAINT cash_trans_id_fk FOREIGN KEY (trans_id)
   REFERENCES transection(trans_id)

);
commit;
drop table cash;
CREATE TABLE  cheque
( 
  trans_id int NOT NULL ,
  cheque_no number(10) NOT NULL,
  cheque_amount number(6) NOT NULL,
  pay_from  varchar(50) NOT NULL,
 CONSTRAINT cheque_trans_id_fk FOREIGN KEY (trans_id)
    REFERENCES transection(trans_id)

);
drop table cheque;

drop table account_transection;
commit;

create table reference 
(
  ref_id int NOT NULL PRIMARY KEY,
  acc_id int NOT NULL,
  reference_place varchar(50) ,
  CONSTRAINT ref_trans_id_fk FOREIGN KEY (acc_id)
    REFERENCES account(acc_id)

);





  create table acc_mor
  (
    acc_mor_id int Primary Key,
     acc_id  int NOT NULL,
     mt_id int Not Null,
     mt_name VARCHAR(30) NOT NULL,
     weight NUMBER(11,2) NOT NULL,
     rate NUMBER(11,2) NOT NULL,
     amount NUMBER(11,2) NOT NULL,
    CONSTRAINT acc_id_mor_fk FOREIGN KEY (acc_id)
    REFERENCES account(acc_id) ,
    CONSTRAINT acc_mt_id_fk FOREIGN KEY (mt_id)
    REFERENCES mor_type(mt_id)
      );

  commit;
  
  
create table reg_user
(
   reg_id    INT          PRIMARY KEY NOT NULL,
    reg_uname VARCHAR (25) NOT NULL,
    reg_pass  VARCHAR (20) NOT NULL,
    email_id  VARCHAR (25) NOT NULL,
    mobile_no NUMERIC (10) NOT NULL,
    reg_date  TIMESTAMP    NULL,
    role_id   NUMERIC(1)  DEFAULT (0) NOT NULL,
    isvalid  NUMERIC(1)    DEFAULT (0) NOT NULL
);
  
create table log_user
(
    log_id   INT    PRIMARY KEY NOT NULL,
    reg_id   INT     NOT NULL,
    username VARCHAR(20) NOT NULL,
    password VARCHAR(25)  NOT NULL,
    CONSTRAINT log_reg_id_fk FOREIGN KEY (reg_id)
    REFERENCES reg_user(reg_id)
);
  
create table cust_invoice
(
  invoice_id int  PRIMARY KEY NOT NULL,
  c_id int NOT NULL , 
  CONSTRAINT invoice_c_id_fk FOREIGN KEY (c_id)
    REFERENCES customer(c_id)
);
  
create table invoice
(
  i_id int PRIMARY KEY NOT NULL,
  invoice_id int NOT NULL,
   description VARCHAR(30) NOT NULL,
  quantity int NOT NULL,
  rate  NUMBER(11,2) NOT NULL,
  CONSTRAINT invoice_id_fk FOREIGN KEY (invoice_id)
  REFERENCES cust_invoice(invoice_id)
);
  
  
  
  
  
  
  