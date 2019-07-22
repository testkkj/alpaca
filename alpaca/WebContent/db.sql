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