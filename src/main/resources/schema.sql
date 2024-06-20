
-- use testdb;
-- show full columns from todo;

drop table if exists member;

create table member
( userid    varchar(255) not null COMMENT '아이디',
  passwd  varchar(255) not null COMMENT '비밀번호',
  username varchar(255) not null COMMENT 'TODO 작성자',
  primary key(userid)
);