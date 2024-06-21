CREATE TABLE cart (
    userid VARCHAR(10),
    product_id INT,
    product_amount INT,
    product_price INT,
    totalcost INT,
    FOREIGN KEY (userid) references member(userid), 
    FOREIGN KEY (product_id, product_price) REFERENCES goods(product_id, product_price)
);
CREATE TABLE memberorder (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    userid VARCHAR(10),
    product_id INT,
    order_date DATE,
    order_amount INT,
    product_price INT,
    FOREIGN KEY (userid) REFERENCES cart(userid),
    FOREIGN KEY (product_id, product_price) REFERENCES goods(product_id, product_price)
);
CREATE TABLE Member (
    userid VARCHAR(20) PRIMARY KEY,
    email VARCHAR(50) NOT NULL UNIQUE,
    passwd VARCHAR(50) NOT NULL,
    username VARCHAR(50) NOT NULL,
    birth DATE NOT NULL,
    address VARCHAR(100)
);
CREATE TABLE goods (
    product_id INT,
    product_price INT,
    product_kind VARCHAR(10),
    product_name VARCHAR(10),
    product_stock INT,
    product_image CHAR(1),
    PRIMARY KEY (product_id, product_price)
);
CREATE TABLE goodss (
    gCode VARCHAR(50) PRIMARY KEY,
    gCategory VARCHAR(100),
    gName VARCHAR(255),
    gContent TEXT,
    gPrice INT,
    gImage VARCHAR(255)
);
CREATE TABLE ProductDetail(
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    category VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    price DOUBLE NOT NULL,
    imageUrl VARCHAR(255)
);
CREATE TABLE users (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(255) NOT NULL
);

Drop table cart;
Drop table customerinfo;
Drop table customerorder;
Drop table goods;
drop table productdetail;


insert into ProductDetail Values ('000001', '인형', '마휘핑인형', '아주 귀여운 마휘핑 인형', 32000 , 'cbum.jpg');
insert into ProductDetail Values ('000002', '배지', '피카츄배지', '금색의 피카츄 뒷모습 배지', 8000 , 'Pikachu_badge.jpg');
insert into ProductDetail Values ('000003', '피규어', '피카츄피규어', '캡틴 아메리카 분장을 한 피카츄 피규어', 87000 , 'Pikachu_fig.jpg');
insert into ProductDetail Values ('000004', '인형', '피카츄인형', '편히 쉬고있는 귀여운 피카츄', 8000 , 'Pikachu_doll.jpg');
insert into ProductDetail Values ('000005', '인형', '파이리인형', '1세대 인기 절정의 파이리', 12000 , 'Charmander_doll.jpg');
insert into ProductDetail Values ('000006', '피규어', '꼬지모피규어', '나무를 흉내내는 흉내 포켓몬 꼬지모', 19000 , 'Sudowoodo_fig.jpg');
insert into ProductDetail Values ('000007', '인형', '꼬부기인형', '아주 귀여운 꼬부기 인형', 7000 , 'Squirtle_doll.jpg');
insert into ProductDetail Values ('000008', '배지', '레쿠쟈배지', '3세대 전설의 포켓몬 레쿠쟈가 울부짖는 배지', 17000 , 'Rayquaza_badge.jpg');
insert into ProductDetail Values ('000009', '피규어', '뮤츠피규어', '포스가 남다른 1세대 전설의 포켓몬 피규어', 82000 , 'mewtwo_fig.jpg');
insert into ProductDetail Values ('000010', '배지', '뮤배지', '포켓몬의 세계화를 이끈 포켓몬 뮤 배지', 52000 , 'mew_badge.jpg');
insert into ProductDetail Values ('000011', '피규어', '리자몽피규어', '게임프리크의 사랑을 독차지하는 리자몽의 피규어', 72000 , 'Charizard_fig.jpg');
insert into ProductDetail Values ('000012', '피규어', '마휘핑피규어', '아주 귀여운 마휘핑 피규어', 32000 , 'Alcremie_fig.jpg');
insert into ProductDetail Values ('000013', '인형', '이상해씨인형', '1세대 스토리의 강자 이상해씨 인형', 7000 , 'Bulbasaur_doll.jpg');
insert into ProductDetail Values ('000014', '피규어', '개굴닌자피규어', '포켓몬 인기 투표 1등 개굴닌자의 피규어', 112000 , 'Greninja_fig.jpg');
insert into ProductDetail Values ('000015', '배지', '잠만보배지', '푸근한 인상의 길 막이 포켓몬 잠만보 배지', 12000 , 'Snorlax_badge.jpg');


insert into goodss Values ('A0001', '인형', '마휘핑인형', '아주 귀여운 마휘핑 인형', 32000 , '');
insert into goodss Values ('A0002', '피규어', '마휘핑피규어', '아주 귀여운 마휘핑 피규어', 32000 , '');
insert into goodss Values ('A0003', '벳지', '마휘핑뱃지', '아주 귀여운 마휘핑 뱃지', 32000 , '');

commit









