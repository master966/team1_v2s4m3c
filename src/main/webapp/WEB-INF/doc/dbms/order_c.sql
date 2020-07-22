/**********************************/
/* Table Name: 회원등급 */
/**********************************/
DROP TABLE grade CASCADE CONSTRAINTS;

CREATE TABLE grade (
  gradeno  NUMBER(7)     NOT NULL,   -- 등급 번호
  gname    VARCHAR(20)   NOT NULL,   -- 등급 이름
  accum    NUMBER(3,3)   NOT NULL,   -- 적립률
  PRIMARY KEY (gradeno)
);


DROP SEQUENCE grade_seq;

CREATE SEQUENCE grade_seq
    START WITH 1                -- 시작번호
    INCREMENT BY 1            -- 증가값
    MAXVALUE 999999999     -- 최대값
    CACHE 2                         -- 2번은 메모리에서만 계산
    NOCYCLE;                       -- 다시 1부터 생성되는것을 방지
    
INSERT INTO grade(gradeno, gname, accum)
VALUES(grade_seq.nextval, '아이언', 0.005);

INSERT INTO grade(gradeno, gname, accum)
VALUES(grade_seq.nextval, '실버', 0.01);

INSERT INTO grade(gradeno, gname, accum)
VALUES(grade_seq.nextval, '골드', 0.03);

INSERT INTO grade(gradeno, gname, accum)
VALUES(grade_seq.nextval, '플레', 0.05);

INSERT INTO grade(gradeno, gname, accum)
VALUES(grade_seq.nextval, '다이아', 0.07);
    
select * from grade;

commit;
/**********************************/
/* Table Name: 회원 */
/**********************************/
DROP TABLE members CASCADE CONSTRAINTS;

CREATE TABLE members (
  memberno NUMBER(6)     NOT NULL, -- 회원 번호, 레코드를 구분하는 컬럼
  gradeno  NUMBER(7)     DEFAULT 1 NOT NULL, -- 등급 번호
  id       VARCHAR(20)   NOT NULL UNIQUE, -- 아이디, 중복 안됨, 레코드를 구분 
  passwd   VARCHAR(60)   NOT NULL, -- 패스워드, 영숫자 조합
  mname    VARCHAR(20)   NOT NULL, -- 성명, 한글 10자 저장 가능
  nickname VARCHAR(20)   NOT NULL UNIQUE, -- 닉네임
  email    VARCHAR(60)   NOT NULL UNIQUE, -- 이메일 주소, 중복 불가
  tel      VARCHAR(14)   NOT NULL, -- 전화번호
  zipcode  VARCHAR(5)        NULL, -- 우편번호, 12345
  address1 VARCHAR(80)       NULL, -- 주소 1
  address2 VARCHAR(50)       NULL, -- 주소 2
  birth    VARCHAR(14)       NULL, -- 생년월일
  points   NUMBER(7)     DEFAULT 0 NOT NULL, -- 적립금
  mdate    DATE          NOT NULL, -- 가입일    
  PRIMARY KEY (memberno),                     -- 한번 등록된 값
  FOREIGN KEY (gradeno) REFERENCES grade (gradeno)
);

UPDATE members
SET gradeno=1
WHERE memberno = 1;

DROP SEQUENCE members_seq;

CREATE SEQUENCE members_seq
    START WITH 1                -- 시작번호
    INCREMENT BY 1            -- 증가값
    MAXVALUE 999999999     -- 최대값
    CACHE 2                         -- 2번은 메모리에서만 계산
    NOCYCLE;                       -- 다시 1부터 생성되는것을 방지

SELECT * FROM members;

/**********************************/
/* Table Name: 상품카테고리 */
/**********************************/

DROP TABLE cate_gory;

CREATE TABLE cate_gory(
    goryno                             NUMBER(10)    NOT NULL    PRIMARY KEY,
    name                                   VARCHAR2(100)     NOT NULL,
    seqno                                NUMBER(10)    DEFAULT 1     NOT NULL,
    printout                             CHAR(1)     DEFAULT 'Y'     NOT NULL,
    rdate                                  DATE    NOT NULL,
    cnt                                    NUMBER(10)    DEFAULT 0     NOT NULL
);

DROP SEQUENCE gory_seq;

CREATE SEQUENCE gory_seq
    START WITH 1                -- 시작번호
    INCREMENT BY 1            -- 증가값
    MAXVALUE 999999999     -- 최대값
    CACHE 2                         -- 2번은 메모리에서만 계산
    NOCYCLE;                       -- 다시 1부터 생성되는것을 방지

select * from cate_gory;
    
commit;
/**********************************/
/* Table Name: 상품 */
/**********************************/

DROP TABLE product CASCADE CONSTRAINTS;

CREATE TABLE product(
    p_no                    NUMBER(10)     NOT NULL    PRIMARY KEY,
    goryno                  NUMBER(10)     NOT NULL,
    p_name                 VARCHAR2(100)     NOT NULL,
    p_printout              CHAR(1)    DEFAULT 'Y'     NULL,
    p_date                   DATE    NULL,
    p_price                  NUMBER(10)    DEFAULT 0    NOT NULL,
    p_unit                    NUMBER(10)     NULL,
    p_capacity               VARCHAR2(100)     NULL,
    p_delivery                VARCHAR2(50)     NULL,
    p_allergy_info           clob                  NULL,
    p_expiration_date      VARCHAR2(100)    NULL,
    p_detailed               clob      NULL,
    p_quantity               NUMBER(10)    NULL,
    hits                        NUMBER(7)    DEFAULT 0     NULL,
    searchword                    VARCHAR2(300)  NULL,
    file1                                   VARCHAR(100)          NULL,
    thumb1                              VARCHAR(100)          NULL,
    size1                                 NUMBER(10)      DEFAULT 0 NULL,         
     FOREIGN KEY (goryno) REFERENCES cate_gory (goryno)
);

DROP SEQUENCE p_seq;

CREATE SEQUENCE p_seq
    START WITH 1                -- 시작번호
    INCREMENT BY 1            -- 증가값
    MAXVALUE 999999999     -- 최대값
    CACHE 2                         -- 2번은 메모리에서만 계산
    NOCYCLE;                       -- 다시 1부터 생성되는것을 방지

INSERT INTO product(p_no)
VALUES(1);
INSERT INTO product(p_no)
VALUES(2);
INSERT INTO product(p_no)
VALUES(3);

select * from product;

SELECT p_no, p_name, p_price, thumb1
  FROM product
  WHERE p_no = 1;

COMMENT ON TABLE product is '상품';
COMMENT ON COLUMN product.p_no is '상품 번호';
COMMENT ON COLUMN product.goryno is '카테고리 번호';
COMMENT ON COLUMN product.p_name is '상품 이름';
COMMENT ON COLUMN product.p_seqno is '출력 순서';
COMMENT ON COLUMN product.p_printout is '출력 모드';
COMMENT ON COLUMN product.p_date is '등록일';
COMMENT ON COLUMN product.p_price is '상품 가격';
COMMENT ON COLUMN product.p_unit is '상품 판매 단위';
COMMENT ON COLUMN product.p_capacity is '상품 용량/중량';
COMMENT ON COLUMN product.p_delivery  is '상품 배송 구분';
COMMENT ON COLUMN product.p_allergy_info is '상품 알레르기 정보';
COMMENT ON COLUMN product.p_expiration_date is '상품 유통기한';
COMMENT ON COLUMN product.p_detailed is '상품 상세 정보';

/**********************************/
/* Table Name: coupon */
/**********************************/
DROP TABLE coupon;

CREATE TABLE coupon(
      couponno                    NUMBER(10)       NOT NULL       PRIMARY KEY,
      coupon_name               VARCHAR2(100)    NOT NULL UNIQUE,           
      coupon_cost                 NUMBER(10)        NOT NULL                             
);

DROP SEQUENCE coupon_seq;

CREATE SEQUENCE coupon_seq
    START WITH 1                -- 시작번호
    INCREMENT BY 1            -- 증가값
    MAXVALUE 999999999     -- 최대값
    CACHE 2                         -- 2번은 메모리에서만 계산
    NOCYCLE;                       -- 다시 1부터 생성되는것을 방지
    
COMMENT ON TABLE coupon is '상품';
COMMENT ON COLUMN coupon.couponno is '쿠폰 번호';
COMMENT ON COLUMN coupon.coupon_name is '쿠폰 이름';
COMMENT ON COLUMN coupon.coupon_cost is '쿠폰 가격';


INSERT INTO coupon(couponno, coupon_name, coupon_cost)
VALUES(coupon_seq.nextval, '1000원 할인', 1000);

INSERT INTO coupon(couponno, coupon_name, coupon_cost)
VALUES(coupon_seq.nextval, '3000원 할인', 3000);

INSERT INTO coupon(couponno, coupon_name, coupon_cost)
VALUES(coupon_seq.nextval, '5000원 할인', 5000);

INSERT INTO coupon(couponno, coupon_name, coupon_cost)
VALUES(coupon_seq.nextval, '10000원 할인', 10000);

SELECT couponno, coupon_name, coupon_cost, r
FROM (
        SELECT couponno, coupon_name, coupon_cost, rownum as r
        FROM coupon)
WHERE r >= 1 AND r <= 3;

DELETE FROM coupon
WHERE couponno = 1;

UPDATE coupon
SET coupon_name='승우가 쏜다!', coupon_cost=50000
WHERE couponno=6;

SELECT * FROM coupon;

SELECT coupon_name, coupon_cost
FROM coupon
WHERE coupon_name LIKE '%10000원 할인%';

commit;

/**********************************/
/* Table Name: coupon */
/**********************************/
DROP TABLE m_coupon;

CREATE TABLE m_coupon(
      m_couponno    NUMBER(10)       NOT NULL       PRIMARY KEY, 
      memberno       NUMBER(10)       NOT NULL,
      couponno        NUMBER(10)       NOT NULL,
      FOREIGN KEY (memberno) REFERENCES members (memberno),
      FOREIGN KEY (couponno) REFERENCES coupon (couponno) ON DELETE CASCADE
);

DROP SEQUENCE m_coupon_seq;

CREATE SEQUENCE m_coupon_seq
    START WITH 1                -- 시작번호
    INCREMENT BY 1            -- 증가값
    MAXVALUE 999999999     -- 최대값
    CACHE 2                         -- 2번은 메모리에서만 계산
    NOCYCLE;                       -- 다시 1부터 생성되는것을 방지
    
COMMENT ON TABLE m_coupon is '상품';
COMMENT ON COLUMN m_coupon.m_couponno is '회원별 쿠폰 번호';
COMMENT ON COLUMN m_coupon.memberno is '회원 번호';
COMMENT ON COLUMN m_coupon.couponno is '쿠폰 번호';

INSERT INTO m_coupon(m_couponno, memberno, couponno)
VALUES(m_coupon_seq.nextval, 1, 1);

INSERT INTO m_coupon(m_couponno, memberno, couponno)
VALUES(m_coupon_seq.nextval, 1, 2);

INSERT INTO m_coupon(m_couponno, memberno, couponno)
VALUES(m_coupon_seq.nextval, 1, 3);

INSERT INTO m_coupon(m_couponno, memberno, couponno)
VALUES(m_coupon_seq.nextval, 1, 4);

SELECT * FROM m_coupon;
commit;
SELECT couponno, coupon_name, coupon_cost
FROM coupon
WHERE couponno IN (SELECT couponno FROM m_coupon
           WHERE memberno=1);

SELECT couponno FROM m_coupon
WHERE memberno=1;

commit;

/**********************************/
/* Table Name: 장바구니 */
/**********************************/

DROP TABLE basket;

CREATE TABLE basket (
    basketno                NUMBER(10)                      NOT NULL       PRIMARY KEY,
    memberno              NUMBER(10)                      NOT NULL,
    p_no                      NUMBER(10)                     NOT NULL,
    p_name                  VARCHAR2(100)                  NOT NULL,
    cnt                        NUMBER(10)                      NOT NULL,
    p_price                 NUMBER(10)                       NOT NULL,
    pay                       NUMBER(10)      DEFAULT 0   NOT NULL,
    thumb1                VARCHAR2(100)                     NOT NULL,
    p_quantity               NUMBER(10)                       NOT NULL,
    basket_date              DATE                                NOT NULL,
    FOREIGN KEY (p_no) REFERENCES product (p_no),
    FOREIGN KEY (memberno) REFERENCES members (memberno)
);

DROP SEQUENCE basket_seq;

CREATE SEQUENCE basket_seq
    START WITH 1                -- 시작번호
    INCREMENT BY 1            -- 증가값
    MAXVALUE 999999999     -- 최대값
    CACHE 2                         -- 2번은 메모리에서만 계산
    NOCYCLE;                       -- 다시 1부터 생성되는것을 방지
    
COMMENT ON TABLE basket is '장바구니';
COMMENT ON COLUMN basket.basketno is '장바구니 번호';
COMMENT ON COLUMN basket.memberno is '회원 번호';
COMMENT ON COLUMN basket.p_no is '상품 번호';
COMMENT ON COLUMN basket.p_name is '상품이름';
COMMENT ON COLUMN basket.cnt is '상품 수량';
COMMENT ON COLUMN basket.p_price is '상품 가격';
COMMENT ON COLUMN basket.pay is '상품 총 가격';
COMMENT ON COLUMN basket.thumb1 is '상품 썸네일';
COMMENT ON COLUMN basket.p_quantity is '상품 재고';
COMMENT ON COLUMN basket.basket_date is '장바구니 등록 일자';

INSERT INTO basket(basketno, memberno, p_no, p_name, cnt, p_price, pay, thumb1, p_quantity, basket_date)
VALUES(basket_seq.nextval, 1, 1, '전승우의 좌절', 3, 15000, 45000, 'tear.jpg', sysdate);

INSERT INTO basket(basketno, memberno, p_no, p_name, cnt, p_price, pay, thumb1, p_quantity, basket_date)
VALUES(basket_seq.nextval, 1, 2, '전승우의 눈치', 2, 6800, 13600, 'nunchi.jpg', sysdate);

INSERT INTO basket(basketno, memberno, p_no, p_name, cnt, p_price, pay, thumb1, p_quantity, basket_date)
VALUES(basket_seq.nextval, 1, 3, '전승우의 웃음', 5, 4600, 23000, 'smile.jpg', sysdate);
commit;


SELECT * FROM basket;

DELETE FROM basket
WHERE memberno = 1;


/**********************************/
/* Table Name: 결제 */
/**********************************/
DROP TABLE orders CASCADE CONSTRAINTS;

CREATE TABLE orders(
    ordersno               NUMBER(10)            NOT NULL  PRIMARY KEY,
    memberno             NUMBER(10)            NOT NULL,
    p_no                     VARCHAR(100)         NOT NULL,
    total_cost               NUMBER(10)           NOT NULL,
    pay_how                 VARCHAR2(20)        NOT NULL,
    coupon_name        VARCHAR2(100)         NULL,
    coupon_cost          NUMBER(10)             NULL,
    point_use               NUMBER(10)            NULL,
    deli_cost               NUMBER(10)             NULL,
    total_pay               NUMBER(10)            NOT NULL,
    point_acc               NUMBER(10)            NULL,
    name_post              VARCHAR2(10)          NOT NULL ,
    phon_post               VARCHAR2(15)         NOT NULL,
    zipcode                  VARCHAR(5)            NOT NULL, -- 우편번호, 12345
    address1                VARCHAR(80)            NOT NULL, -- 주소
    address2                 VARCHAR(80)           NOT NULL, -- 상세 주소
    name_get               VARCHAR2(10)           NOT NULL,
    phon_get                VARCHAR2(15)          NOT NULL ,
    request                  VARCHAR2(100)         NOT NULL,
    pay_date                 DATE                      NOT NULL,
    FOREIGN KEY (memberno) REFERENCES members (memberno)
);

DROP SEQUENCE orders_seq;

commit;
CREATE SEQUENCE orders_seq
    START WITH 1                -- 시작번호
    INCREMENT BY 1            -- 증가값
    MAXVALUE 999999999     -- 최대값
    CACHE 2                         -- 2번은 메모리에서만 계산
    NOCYCLE;                       -- 다시 1부터 생성되는것을 방지


COMMENT ON TABLE orders is '주문 결제';
COMMENT ON COLUMN orders.ordersno is '결제번호';
COMMENT ON COLUMN orders.memberno is '회원번호';
COMMENT ON COLUMN orders.p_no is '상품번호';
COMMENT ON COLUMN orders.total_cost is '총 금액';
COMMENT ON COLUMN orders.pay_how is '결제 수단';
COMMENT ON COLUMN orders.coupon_name is '쿠폰 이름';
COMMENT ON COLUMN orders.coupon_cost is '쿠폰 가격';
COMMENT ON COLUMN orders.point_use is '포인트 사용';
COMMENT ON COLUMN orders.deli_cost is '배송비';
COMMENT ON COLUMN orders.total_pay is '최종 결제 금액';
COMMENT ON COLUMN orders.point_acc is '포인트 적립';
COMMENT ON COLUMN orders.name_post is '배송인 이름';
COMMENT ON COLUMN orders.phon_post is '배송인 번호';
COMMENT ON COLUMN orders.zipcode is '우편번호';
COMMENT ON COLUMN orders.address1 is '주소';
COMMENT ON COLUMN orders.address2 is '상세 주소';
COMMENT ON COLUMN orders.name_get is '수령인 이름';
COMMENT ON COLUMN orders.phon_get is '수령인 번호';
COMMENT ON COLUMN orders.request is '배송시 요청 사항';
COMMENT ON COLUMN orders.pay_date is '결제일';



SELECT * FROM orders;
DELETE FROM orders;
commit;

/**********************************/
/* Table Name: 결제세부 */
/**********************************/
DROP TABLE orders_detail;

CREATE TABLE orders_detail(
    orders_detailno         NUMBER(10)    NOT NULL  PRIMARY KEY,
    ordersno                 NUMBER(10)    NOT NULL,
    memberno              NUMBER(10)     NOT NULL,
    p_no                      NUMBER(10)      NOT NULL,
    p_name                  VARCHAR2(100)   NOT NULL,
    cnt                        NUMBER(10)       NOT NULL,
    p_price               NUMBER(10)       NOT NULL,
    pay                       NUMBER(10)       NOT NULL,
    thumb1                VARCHAR2(100)    NOT NULL,
    pay_date                DATE                 NOT NULL,
    FOREIGN KEY (ordersno) REFERENCES orders (ordersno),
    FOREIGN KEY (p_no) REFERENCES product (p_no),
    FOREIGN KEY (memberno) REFERENCES members (memberno)
);

COMMENT ON TABLE orders_detail is '결제세부';
COMMENT ON COLUMN orders_detail.orders_detailno is '결제세부번호';
COMMENT ON COLUMN orders_detail.ordersno is '결제 번호';
COMMENT ON COLUMN orders_detail.memberno is '회원 번호';
COMMENT ON COLUMN orders_detail.p_no is '상품 번호';
COMMENT ON COLUMN orders_detail.p_name is '상품 이름';
COMMENT ON COLUMN orders_detail.cnt is '수량';
COMMENT ON COLUMN orders_detail.p_price is '금액';
COMMENT ON COLUMN orders_detail.pay is '결제금액';
COMMENT ON COLUMN orders_detail.thumb1 is '썸네일';
COMMENT ON COLUMN orders_detail.pay_date is '결제일';

DROP SEQUENCE orders_detail_seq;

CREATE SEQUENCE orders_detail_seq
    START WITH 1                -- 시작번호
    INCREMENT BY 1            -- 증가값
    MAXVALUE 999999999     -- 최대값
    CACHE 2                         -- 2번은 메모리에서만 계산
    NOCYCLE;                       -- 다시 1부터 생성되는것을 방지
    
DELETE FROM orders_detail;
SELECT * FROM orders_detail;
commit;
/**********************************/
/* Table Name: 포인트 적립/사용 */
/**********************************/
DROP TABLE points;

CREATE TABLE points(
    pointsno              NUMBER(10)  NOT NULL  PRIMARY KEY,
    memberno            NUMBER(10) NOT NULL,
    ordersno              NUMBER(10) NOT NULL,
    contents              VARCHAR(50) NOT NULL,
    point_change         NUMBER(10)  NOT NULL,
    points_date            DATE           NOT NULL,
    FOREIGN KEY (memberno) REFERENCES members (memberno),
    FOREIGN KEY (ordersno) REFERENCES orders (ordersno)
);

INSERT INTO points(pointsno, memberno, ordersno, contents, point_change, points_date)
VALUES(points_seq.nextval, 1, 1, '전승우의 웃음', 2300, sysdate);

DROP SEQUENCE points_seq;

CREATE SEQUENCE points_seq
    START WITH 1                -- 시작번호
    INCREMENT BY 1            -- 증가값
    MAXVALUE 999999999     -- 최대값
    CACHE 2                         -- 2번은 메모리에서만 계산
    NOCYCLE;                       -- 다시 1부터 생성되는것을 방지


SELECT points_date FROM points;

SELECT pointsno, memberno, ordersno, contents, point_change, points_date, r
    FROM (
        SELECT pointsno, memberno, ordersno, contents, point_change, points_date, rownum as r
        FROM points)
    WHERE r >0 AND r <= 2;

COMMENT ON TABLE points is '포인트';
COMMENT ON COLUMN points.poinstno is '포인트 번호';
COMMENT ON COLUMN points.memberno is '회원번호';
COMMENT ON COLUMN points.ordersno is '결제번호';
COMMENT ON COLUMN points.contents is '내용';
COMMENT ON COLUMN points.point_change is '포인트 적립금액';
COMMENT ON COLUMN points.points_date is '포인트 변경일';

commit;