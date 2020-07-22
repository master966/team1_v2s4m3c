/**********************************/
/* Table Name: 배송 상태 */
/**********************************/
DROP TABLE deliverystate CASCADE CONSTRAINTS;
CREATE TABLE deliverystate(
        stateno                              NUMBER(20)           NOT NULL  PRIMARY KEY,
		state                                 VARCHAR2(50)		 NOT NULL
        
);

COMMENT ON TABLE deliverystate is '배송 상태';
COMMENT ON COLUMN deliverystate.stateno is '배송 상태 번호';
COMMENT ON COLUMN deliverystate.state is '배송 상태';



DROP SEQUENCE deliverystate_seq;

CREATE SEQUENCE deliverystate_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
  
  
-- 등록  
INSERT INTO deliverystate(stateno, state)
VALUES(deliverystate_seq.nextval,  '결제 완료');

INSERT INTO deliverystate(stateno, state)
VALUES(deliverystate_seq.nextval,  '배송 준비 중');

INSERT INTO deliverystate(stateno, state)
VALUES(deliverystate_seq.nextval,  '배송 중');

INSERT INTO deliverystate(stateno, state)
VALUES(deliverystate_seq.nextval,  '배송 완료');

INSERT INTO deliverystate(stateno, state)
VALUES(deliverystate_seq.nextval,  '구매 완료');

-- 목록
SELECT stateno, state
FROM deliverystate
ORDER BY stateno DESC;

-- 조회

SELECT stateno, state
FROM deliverystate
WHERE stateno = 1;

-- 수정

UPDATE deliverystate
SET state = '배송 중'
WHERE stateno = 1;

SELECT stateno, state
FROM deliverystate
ORDER BY stateno ASC;

commit;
--삭제 

-- 모두 삭제

DELETE FROM deliverystate;

 -- 특정 배송 상세 목록 삭제
 
DELETE FROM deliverystate
WHERE stateno=3;

commit;