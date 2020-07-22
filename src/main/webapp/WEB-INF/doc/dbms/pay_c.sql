DROP TABLE pay;
CREATE TABLE pay(
		payno                           NUMBER(10)		        NOT NULL		 PRIMARY KEY,
		memberno                     NUMBER(10)		        NOT NULL,
        productno                     NUMBER(10)		        NOT NULL,
		totalcost                       NUMBER(10)		        NOT NULL,
        quantity                       NUMBER(10)		        NOT NULL,
        rdate                           DATE                        NOT NULL,
        FOREIGN KEY (memberno) REFERENCES member (memberno),
        FOREIGN KEY (productno) REFERENCES product (p_no)
);

COMMENT ON TABLE pay is '결재';
COMMENT ON COLUMN pay.payno is '결제번호';
COMMENT ON COLUMN pay.memberno is '카테고리 그룹 번호';
COMMENT ON COLUMN pay.productno is '상품번호';
COMMENT ON COLUMN pay.totalcost is '금액';
COMMENT ON COLUMN pay.quantity is '수량';
COMMENT ON COLUMN pay.rdate is '결재일';

commit;