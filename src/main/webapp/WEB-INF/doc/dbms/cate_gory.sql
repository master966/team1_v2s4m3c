/**********************************/
/* Table Name: 카테고리 */
/**********************************/
drop table cate_gory;
CREATE TABLE cate_gory(
		goryno                        	   NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		name                          	       VARCHAR2(100)		 NOT NULL,
		seqno                         		   NUMBER(10)		 DEFAULT 1		 NOT NULL,
		printout                       		   CHAR(1)		 DEFAULT 'Y'		 NOT NULL,
		rdate                           		   DATE		 NOT NULL,
		cnt                           	       NUMBER(10)		 DEFAULT 0		 NOT NULL
);

COMMENT ON TABLE cate_gory is '카테고리';
COMMENT ON COLUMN cate_gory.goryno is '카테고리 번호';
COMMENT ON COLUMN cate_gory.name is '카테고리 이름';
COMMENT ON COLUMN cate_gory.seqno is '출력 순서';
COMMENT ON COLUMN cate_gory.printout is '출력 모드';
COMMENT ON COLUMN cate_gory.rdate is '등록일';
COMMENT ON COLUMN cate_gory.cnt is '등록된 글 수';

DROP SEQUENCE gory_seq;
CREATE SEQUENCE gory_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
  
--등록
INSERT INTO cate_gory(goryno, name, seqno, printout, rdate, cnt)
VALUES(gory_seq.nextval, '샐러드·도시락', 1 , 'Y', sysdate, 0);

INSERT INTO cate_gory(goryno, name, seqno, printout, rdate, cnt)
VALUES(gory_seq.nextval, '간편식·냉동식품', 1 , 'Y', sysdate, 0);

INSERT INTO cate_gory(goryno, name, seqno, printout, rdate, cnt)
VALUES(gory_seq.nextval, '밥류·면식품·즉석식품', 1 , 'Y', sysdate, 0);

INSERT INTO cate_gory(goryno, name, seqno, printout, rdate, cnt)
VALUES(gory_seq.nextval, '선식·시리얼·그래놀라', 1 , 'Y', sysdate, 0);

INSERT INTO cate_gory(goryno, name, seqno, printout, rdate, cnt)
VALUES(gory_seq.nextval, '만두·튀김·떡볶이', 1 , 'Y', sysdate, 0);

INSERT INTO cate_gory(goryno, name, seqno, printout, rdate, cnt)
VALUES(gory_seq.nextval, '죽·스프', 1 , 'Y', sysdate, 0);

--목록
SELECT goryno, name, seqno, printout, rdate, cnt
FROM cate_gory
ORDER BY goryno ASC;

-- 삭제
DELETE FROM cate_gory
WHERE goryno = 1;
commit;

-- 조회
SELECT goryno, name, seqno, printout, rdate, cnt
FROM cate_gory
WHERE goryno=3;

-- 수정
UPDATE cate_gory
SET name='샐러드'
WHERE goryno = 3;

-- 삭제
DELETE FROM cate_gory
WHERE goryno = 7;

--글 수 증가
UPDATE cate_gory 
SET cnt = cnt + 1 
WHERE goryno=1;

commit;

