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