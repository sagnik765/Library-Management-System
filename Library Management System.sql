create database library_demo;
use library_demo;

CREATE TABLE readers (
    reader_id VARCHAR(6),
    fname VARCHAR(30),
    mname VARCHAR(30),
    ltname VARCHAR(30),
    city VARCHAR(15),
    mobile_no VARCHAR(10),
    occupation VARCHAR(10),
    dob DATE,
    CONSTRAINT readers_pk PRIMARY KEY (reader_id)
);

insert into readers values('C001','Ramesh','Chandra','Sharma','Delhi','9541376208','Service','1976-10-02');
insert into readers values('C002','Sagnik','Roy','Gupta','Kolkata','9836457283','Student','1978-05-12');
insert into readers values('C003','Rakesh','Chauhan','Gandhi','Bangalore','8627456375','Sales','1972-10-05');
insert into readers values('C004','Ram','Chandra','Sen','Pune','9567840221','Sales','1980-07-23');
insert into readers values('C005','Saksham','Gupta','Agarwal','Delhi','9467234109','Service','1981-07-15');
insert into readers values('C006','Rahul','Kumar','Anand','Mumbai','9983630657','Student','1975-04-16');
insert into readers values('C007','Rohan','Nair','Venkat','Hyderabad','9830790708','Service','1982-09-20');
insert into readers values('C008','Sagar','Sharda','Ghosh','Kochi','9830768452','Service','1968-08-21');
insert into readers values('C009','Shaswat','Lahiri','Dey','Jaipur','7693546721','Sales','1971-08-10');
insert into readers values('C010','Arin','Khatua','Sharma','Jodhpur','9345179069','Sales','1991-29-07');

select * from readers;

drop table book;

create table book
(
bid varchar(6),
bname varchar(40),
bdomain varchar(30),
constraint book_bid_pk primary key(bid)
);

insert into book values('C00001','Around the world in 80 days','Story');
insert into book values('C00002','The Three Musketeers','Story');
insert into book values('C00003','Oliver Twist','Story');

create table active_readers
(
account_id varchar(6),
reader_id varchar(6),
bid varchar(6),
atype varchar(10),
astatus varchar(10),
constraint activereaders_acnumer_pk primary key (account_id),
constraint account_readerid_fk foreign key (reader_id) references readers(reader_id), 
constraint account_bid_fk foreign key (bid) references book(bid)
);

insert into active_readers values('A00001','C00001','B00001','Premium','Active');
insert into active_readers values('A00002','C00002','B00002','Regular','Active');
insert into active_readers values('A00003','C00003','B00002','Premium','Active');
insert into active_readers values('A00004','C00004','B00003','Premium','Active');
insert into active_readers values('A00005','C00005','B00002','Premium','Active');
insert into active_readers values('A00006','C00006','B00001','Premium','Suspended');
insert into active_readers values('A00007','C00007','B00001','Premium','Active');
insert into active_readers values('A00008','C00008','B00003','Premium','Terminated');
insert into active_readers values('A00009','C00009','B00002','Premium','Terminated');
insert into active_readers values('A00010','C00010','B00002','Regular','Active');

select * from active_readers;

CREATE TABLE bookissue_details
(
issuenumber varchar(6),
account_id varchar(6),
bid varchar(20),
bookname varchar(50),
number_of_books_issued varchar(7),
constraint trandetails_tnumber_pk primary key(issuenumber),
constraint trandetails_acnumber_fk foreign key(account_id) references active_readers(account_id)
);

insert into bookissue_details values('T00001','A00001','B00002','The Three Musketeers','7');
insert into bookissue_details values('T00002','A00003','B00003','Around the world in 80 days','3');
insert into bookissue_details values('T00003','A00002','B00003','Oliver Twist','4');
insert into bookissue_details values('T00004','A00001','B00001','Oliver Twist','1');

select * from active_readers;

select * from active_readers where astatus = 'Terminated';

select * from active_readers where astatus = 'Active';

select count(account_id) from active_readers where atype = 'Premium';




