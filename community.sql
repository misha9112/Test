create table users (
id varchar2(50) primary key,
password varchar2(100) not null,
name varchar2(30) not null,
phoneNum varchar2(50) not null,
addr varchar2(100) not null,
email varchar2(50) not null
);
select * from users; 

delete from users where id = 123;

create sequence seq_users_id;

create table visit(
id number primary key,
u_id varchar2(50) references users(id) on delete cascade,
content varchar2(300) not null, 
regdate timestamp
);


create sequence seq_visit_id;

create table photo(
id number primary key,
u_id varchar2(50) references users(id) on delete cascade,
content varchar2(300) not null, 
uri varchar2(500) not null,
regdate timestamp
);
create sequence seq_photo_id;
drop sequence seq_photo_id;
drop table photo;
select * from photo;