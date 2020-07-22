/**********************************/
/* Table Name: 반송 */
/**********************************/
DROP TABLE resend;
CREATE TABLE resend(
		resendno                      		NUMBER(20)		 NOT NULL,
	    ordersno                                NUMBER(20)     NOT NULL,
		state                         		    VARCHAR2(50)		 NOT NULL,
		process                       		VARCHAR2(50)		 DEFAULT 'F'		 NOT NULL,
		rdate                         		    DATE		 NOT NULL 
);

COMMENT ON TABLE resend is '반송';
COMMENT ON COLUMN resend.resendno is '반송번호';
COMMENT ON COLUMN resend.ordersno is '결제번호';
COMMENT ON COLUMN resend.state is '상태';
COMMENT ON COLUMN resend.process is '처리 여부';
COMMENT ON COLUMN resend.rdate is '등록일';


DROP SEQUENCE resend_seq;

CREATE SEQUENCE resend_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지

--  1. 등록

INSERT INTO resend(resendno, ordersno, state, process, rdate)
VALUES(resend_seq.nextval,  1, '반송 처리 중', 'Y', sysdate);

INSERT INTO resend(resendno, ordersno, state, process, rdate)
VALUES(resend_seq.nextval,  2, '반송 처리 완료', 'Y', sysdate);

INSERT INTO resend(resendno, ordersno, state, process, rdate)
VALUES(resend_seq.nextval,  3, '반송 불가', 'F', sysdate);

-- 2. 목록

SELECT resendno, ordersno, state, process, rdate
FROM resend
ORDER BY resendno DESC;

-- 3. 조회

SELECT resendno, ordersno, state, process, rdate
FROM resend
WHERE resendno = 1;

-- 4. 수정

UPDATE resend
SET state ='처리 중 오류 발생', process='F'
WHERE resendno = 1;

SELECT resendno, ordersno, state, process, rdate
FROM resend
ORDER BY resendno ASC;

-- 5. 삭제

-- 모두 삭제

DELETE FROM resend;

 -- 특정 배송 삭제
 
DELETE FROM resend
WHERE resendno=1;


commit;