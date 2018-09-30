drop table log_user;
drop table reg_user;
drop table cust_mor;
drop table account;
drop table transaction;
drop table customer_invoice;
drop table invoice;
drop table customer;

create table customer( 
                      c_id int primary key, 
                      c_fname varchar(20) NOT NULL, 
                      c_mname VARCHAR(20) NOT NULL, 
                      c_lname VARCHAR(20) NOT NULL, 
                      address varchar(50), 
                      city varchar(15) NOT NULL, 
                      email_id varchar(30) , 
                      mobile_no number(12,0) NOT NULL, 
                      cphoto_path varchar(70) DEFAULT NULL, 
                      mphoto_path varchar(70) DEFAULT NULL, 
                      create_date TIMESTAMP  DEFAULT CURRENT_TIMESTAMP , 
                      created_date timestamp  DEFAULT CURRENT_TIMESTAMP, 
                      updated_date timestamp  DEFAULT CURRENT_TIMESTAMP, 
                      interest_rate NUMBER(5,2) DEFAULT 36.00,
                      debit_limit number(11,2),
                      isactive NUMBER(1) DEFAULT 1 NOT NULL Check (isvalid in(0,1)),
                      CONSTRAINT acc_cust_createdate_check CHECK (create_date<=created_date)
                  ); 

 
create sequence cust_seq;
desc customer;





CREATE TABLE account( 
                      acc_id int NOT NULL   PRIMARY KEY  ,
                      c_id int NOT NULL,
                      acc_no number(20) NOT NULL UNIQUE ,
                      acc_date TIMESTAMP DEFAULT  CURRENT_TIMESTAMP,
                      CONSTRAINT fk_cust_id_fk FOREIGN KEY (c_id)
                      REFERENCES customer(c_id) 
                      
                    );

create sequence acc_seq;
                     
create table cust_mor ( 
                        cust_mor_id int primary key, 
                        c_id int NOT NULL, 
                        item_type varchar(15) check (item_type in('gold','silver','other')) NOT NULL, 
                        item_name varchar(30) NOT NULL, 
                        gross_weight number(11,2)NOT NULL, 
                        rate number(11,2) NOT NULL, 
                        amount number(11,2) NOT NULL ,
                        CONSTRAINT fk_c_id FOREIGN KEY(c_id) REFERENCES customer (c_id) ON DELETE CASCADE
                  ); 
                       
 
 create sequence cust_mor_seq;
 
 
CREATE TABLE transaction( 
                          t_id int NOT NULL PRIMARY KEY ,
                          c_id int NOT NULL,
                          t_date  TIMESTAMP DEFAULT CURRENT_TIMESTAMP  ,
                          t_type char(1) check (t_type in( 'c','d' )) NOT NULL,
                          t_amount number(11,2) NOT NULL,
                          t_remark varchar(50),
                          CONSTRAINT t_id_trans_fk FOREIGN KEY (c_id)
                            REFERENCES customer(c_id) ON DELETE CASCADE
                          
                        );

create sequence trans_seq;
 
create table invoice_customer( 
                              invoice_id int PRIMARY KEY, 
                              c_id int   Default NULL REFERENCES customer(c_id) , 
                              i_date timestamp DEFAULT CURRENT_TIMESTAMP , 
                              c_name varchar(35)NOT NULL, 
                              address varchar(50), 
                              city varchar(20), 
                              mobile_no number(12,0) 
                          ); 
 
create sequence invoice_cust_seq;

create table invoice ( 
                        i_id int PRIMARY key, 
                        invoice_id int REFERENCES invoice_customer(invoice_id), 
                        product_name varchar(50) NOT NULL, 
                        quantity int NOT NULL, 
                        rate int NOT NULL 
); 
create sequence invoice_seq;                      

create table reg_user( 
                      reg_id int PRIMARY KEY, 
                      reg_uname varchar(25) NOT NULL, 
                      reg_pass varchar(20) NOT NULL, 
                      email_id varchar(25), 
                      mobile_no number(10,0)  NOT NULL, 
                      reg_date timestamp DEFAULT CURRENT_TIMESTAMP, 
                      role_id number(1,0) DEFAULT 0, 
                      isvalid number(1) DEFAULT 0 Check (isvalid in(0,1)) 
); 
create sequence reg_seq; 