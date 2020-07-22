
/**********************************/
/* Table Name: 레시피카테고리 */
/**********************************/
DROP TABLE recipecate;
CREATE TABLE recipecate(
		recipecateno                  		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		recipecategrpno               		NUMBER(10)		 NULL ,
		name                          		VARCHAR2(100)		 NOT NULL,
		seqno                         		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		visible                       		CHAR(1)		 DEFAULT 'Y'		 NOT NULL,
        cnt                                NUMBER(10)            DEFAULT 0      NOT NULL,
		rdate                         		DATE		 NOT NULL,
  FOREIGN KEY (recipecategrpno) REFERENCES recipecategrp (recipecategrpno)
);

COMMENT ON TABLE recipecate is '레시피카테고리';
COMMENT ON COLUMN recipecate.recipecateno is '레시피카테고리번호';
COMMENT ON COLUMN recipecate.recipecategrpno is '레시피카테고리그룹번호';
COMMENT ON COLUMN recipecate.name is '이름';
COMMENT ON COLUMN recipecate.seqno is '출력순서';
COMMENT ON COLUMN recipecate.visible is '출력순서';
COMMENT ON COLUMN recipecate.rdate is '등록일';

DROP SEQUENCE recipecate_seq;
CREATE SEQUENCE recipecate_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지

INSERT INTO recipecate(recipecateno, recipecategrpno, name, seqno, visible, cnt, rdate)
VALUES(recipecate_seq.nextval, 1, '레시피카테고리', 1, 'Y', 0, sysdate);

commit;
  
SELECT * FROM recipecate;
  