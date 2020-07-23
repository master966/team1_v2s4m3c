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
COMMENT ON COLUMN m_coupon.coupon_name is '회원 번호';
COMMENT ON COLUMN m_coupon.coupon_cost is '쿠폰 번호';

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
