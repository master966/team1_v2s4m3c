/**********************************/
/* Table Name: 배송비 */
/**********************************/
DROP TABLE deliverypay;
CREATE TABLE deliverypay(
		deliverypayno                 		NUMBER(10)		 NOT NULL,
		area                          		VARCHAR2(100)		 NOT NULL,
		deliverypay                   		NUMBER(10)		 NOT NULL
);

COMMENT ON TABLE deliverypay is '배송비';
COMMENT ON COLUMN deliverypay.deliverypayno is '배송비 번호';
COMMENT ON COLUMN deliverypay.area is '지역';
COMMENT ON COLUMN deliverypay.deliverypay is '배송비';

DROP SEQUENCE deliverypay_seq;

CREATE SEQUENCE deliverypay_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지

INSERT INTO deliverypay(deliverypayno, area, deliverypay)
VALUES(deliverypay_seq.nextval, '서울', 2500);

INSERT INTO deliverypay(deliverypayno, area, deliverypay)
VALUES(deliverypay_seq.nextval, '제주', 4000);

INSERT INTO deliverypay(deliverypayno, area, deliverypay)
VALUES(deliverypay_seq.nextval, '기타지역', 10000);


SELECT * FROM deliverypay;


SELECT deliverypayno, area, deliverypay
FROM deliverypay
WHERE deliverypayno = 1;

UPDATE deliverypay 
SET area = '강원', deliverypay=3000
WHERE deliverypayno=1;

COMMIT;

5. 삭제
1) 모두 삭제
DELETE FROM deliverypay;
 
2) 특정 테이블 삭제
DELETE FROM deliverypay
WHERE deliverypayno=15;

COMMIT;