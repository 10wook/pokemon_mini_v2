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
insert into goodss Values ('A0001', '인형', '마휘핑인형', '아주 귀여운 마휘핑 인형', 32000 , '');
insert into goodss Values ('A0002', '피규어', '마휘핑피규어', '아주 귀여운 마휘핑 피규어', 32000 , '');
insert into goodss Values ('A0003', '벳지', '마휘핑뱃지', '아주 귀여운 마휘핑 뱃지', 32000 , '');

commit









