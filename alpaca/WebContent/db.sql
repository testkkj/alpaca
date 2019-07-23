use alpaca;

create table member(
id varchar(100) primary key,
password varchar(100) not null,
email varchar(100) not null,
tel varchar(100),
regdate date not null
);

desc member;

select * from member;

create table board(
bnum int auto_increment primary key,
title varchar(100) not null,
writer varchar(100) not null,
content varchar(2000) not null,
count int not null,
wridate date not null
);

desc board;

select * from board;