
CREATE TABLE member (
    username BIGINT AUTO_INCREMENT PRIMARY KEY,
    passwd VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    address VARCHAR(255) NOT NULL
);
insert into member Values (120312, "1234", "10wook@naver.com", "xxx동xxx호");
CREATE TABLE ProductDetail(
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    category VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    price DOUBLE NOT NULL,
    imageUrl VARCHAR(255)
);


Drop table cart;
Drop table customerinfo;
Drop table memberorder;
Drop table goods;
drop table productdetail;
drop table member;

insert into ProductDetail Values ('000001', '인형', '마휘핑인형', '아주 귀여운 마휘핑 인형', 32000 , 'cream.jpg');
insert into goodss Values ('A0001', '인형', '마휘핑인형', '아주 귀여운 마휘핑 인형', 32000 , '');
insert into goodss Values ('A0002', '피규어', '마휘핑피규어', '아주 귀여운 마휘핑 피규어', 32000 , '');
insert into goodss Values ('A0003', '벳지', '마휘핑뱃지', '아주 귀여운 마휘핑 뱃지', 32000 , '');

commit









