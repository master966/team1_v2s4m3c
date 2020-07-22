/**********************************/
/* Table Name: 교환 및 환불 내역 */
/**********************************/
DROP TABLE change;
CREATE TABLE change(
		changeno                      		NUMBER(20)		 NOT NULL,
		ordersno                         		NUMBER(20)		 NOT NULL,
		memberno                      		NUMBER(20)		 NOT NULL,
        producename                      VARCHAR2(100)         NOT NULL,
		pricecode                     		VARCHAR2(100)		 NOT NULL,
		changecnt                           NUMBER(20)		 NOT NULL,
		process                       		VARCHAR2(100)		 DEFAULT 'F'		 NOT NULL,
		rdate                         		DATE		 NOT NULL
);

COMMENT ON TABLE change is '교환 및 환불 내역';
COMMENT ON COLUMN change.changeno is '내역번호';
COMMENT ON COLUMN change.ordersno is '결제번호';
COMMENT ON COLUMN change.memberno is '회원번호';
COMMENT ON COLUMN change.producename is '상품 이름';
COMMENT ON COLUMN change.pricecode is '상품 주문 코드';
COMMENT ON COLUMN change.changecnt is '교환 및 환불 수량';
COMMENT ON COLUMN change.process is '처리 여부';
COMMENT ON COLUMN change.rdate is '등록일';



DROP SEQUENCE change_seq;

CREATE SEQUENCE change_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
  
 
-- 1. 등록
INSERT INTO change(changeno, ordersno, memberno, producename, pricecode, changecnt, process, rdate)
VALUES(change_seq.nextval, 1, 327,  '삼다수', '2FTX-3F1', 6, 'Y', sysdate);

INSERT INTO change(changeno, ordersno, memberno, producename, pricecode, changecnt, process, rdate)
VALUES(change_seq.nextval, 2, 129,  '코카콜라', '2FF3X-3F1', 1, 'F', sysdate);

INSERT INTO change(changeno, ordersno, memberno, producename, pricecode, changecnt, process, rdate)
VALUES(change_seq.nextval, 3, 132,  '백산수', '2F324DX-3F1', 2, 'F', sysdate);

-- 2. 목록

SELECT changeno, ordersno, memberno, producename, pricecode, changecnt, process, rdate
FROM change
ORDER BY changeno DESC;



-- 3. 조회

SELECT changeno, ordersno, memberno, producename, pricecode, changecnt, process, rdate
FROM change
WHERE changeno = 1;

-- 4. 수정 

UPDATE change
SET changecnt =3 , PROCESS ='Y'
WHERE changeno = 1;

-- 5. 삭제

-- 모두 삭제

DELETE FROM change;

 -- 특정 배송 삭제
 
DELETE FROM change
WHERE changeno=1; 

commit;