/**********************************/
/* Table Name: 레시피카테고리그룹 */
/**********************************/
DROP TABLE recipecate;
DROP TABLE recipecategrp;
CREATE TABLE recipecategrp(
		recipecategrpno               		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		name                          		VARCHAR2(100)		 NOT NULL,
		seqno                         		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		visible                       		CHAR(1)		 DEFAULT 'Y'		 NOT NULL,
		rdate                         		DATE		 NOT NULL
);

COMMENT ON TABLE recipecategrp is '레시피카테고리그룹';
COMMENT ON COLUMN recipecategrp.recipecategrpno is '레시피카테고리그룹번호';
COMMENT ON COLUMN recipecategrp.name is '이름';
COMMENT ON COLUMN recipecategrp.seqno is '출력순서';
COMMENT ON COLUMN recipecategrp.visible is '출력모드';
COMMENT ON COLUMN recipecategrp.rdate is '등록일';


DROP SEQUENCE recipecategrp_seq;
CREATE SEQUENCE recipecategrp_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
  
  
INSERT INTO recipecategrp(recipecategrpno, name, seqno, visible, rdate)
VALUES(recipecategrp_seq.nextval, 'ㅋㅋ', 1, 'Y', sysdate);
  
SELECT * FROM recipecategrp;
commit;  
  