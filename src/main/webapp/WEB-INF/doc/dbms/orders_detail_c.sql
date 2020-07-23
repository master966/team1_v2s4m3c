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