
/**********************************/
/* Table Name: 레시피카테고리 */
/**********************************/
DROP TABLE recipecate;
DROP TABLE recipecate CASCADE CONSTRAINTS;
CREATE TABLE recipecate(
		recipecateno                  		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		recipecategrpno               		NUMBER(10)		 NULL ,
		name                          		VARCHAR2(100)		 NOT NULL,
		seqno                         		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		visible                       		CHAR(1)		 DEFAULT 'Y'		 NOT NULL,
        cnt                                NUMBER(10)            DEFAULT 0      NOT NULL,
		rdate                         		DATE		 NOT NULL,
  Constraint fk_recipecategrpno_recipecate FOREIGN KEY (recipecategrpno) REFERENCES recipecategrp (recipecategrpno) on delete cascade
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

--1. 종류별
INSERT INTO recipecate(recipecateno, recipecategrpno, name, seqno, visible, cnt, rdate)
VALUES(recipecate_seq.nextval, 1, '밑반찬', 1, 'Y', 0, sysdate);

INSERT INTO recipecate(recipecateno, recipecategrpno, name, seqno, visible, cnt, rdate)
VALUES(recipecate_seq.nextval, 1, '메인반찬', 1, 'Y', 0, sysdate);

INSERT INTO recipecate(recipecateno, recipecategrpno, name, seqno, visible, cnt, rdate)
VALUES(recipecate_seq.nextval, 1, '국/탕', 1, 'Y', 0, sysdate);

INSERT INTO recipecate(recipecateno, recipecategrpno, name, seqno, visible, cnt, rdate)
VALUES(recipecate_seq.nextval, 1, '찌개', 1, 'Y', 0, sysdate);

INSERT INTO recipecate(recipecateno, recipecategrpno, name, seqno, visible, cnt, rdate)
VALUES(recipecate_seq.nextval, 1, '디저트', 1, 'Y', 0, sysdate);

INSERT INTO recipecate(recipecateno, recipecategrpno, name, seqno, visible, cnt, rdate)
VALUES(recipecate_seq.nextval, 1, '면/만두', 1, 'Y', 0, sysdate);

INSERT INTO recipecate(recipecateno, recipecategrpno, name, seqno, visible, cnt, rdate)
VALUES(recipecate_seq.nextval, 1, '밥/죽/떡', 1, 'Y', 0, sysdate);

INSERT INTO recipecate(recipecateno, recipecategrpno, name, seqno, visible, cnt, rdate)
VALUES(recipecate_seq.nextval, 1, '기타', 1, 'Y', 0, sysdate);

--2. 상황별
INSERT INTO recipecate(recipecateno, recipecategrpno, name, seqno, visible, cnt, rdate)
VALUES(recipecate_seq.nextval, 2, '일상', 1, 'Y', 0, sysdate);

INSERT INTO recipecate(recipecateno, recipecategrpno, name, seqno, visible, cnt, rdate)
VALUES(recipecate_seq.nextval, 2, '초스피드', 1, 'Y', 0, sysdate);

INSERT INTO recipecate(recipecateno, recipecategrpno, name, seqno, visible, cnt, rdate)
VALUES(recipecate_seq.nextval, 2, '손님접대', 1, 'Y', 0, sysdate);

INSERT INTO recipecate(recipecateno, recipecategrpno, name, seqno, visible, cnt, rdate)
VALUES(recipecate_seq.nextval, 2, '술안주', 1, 'Y', 0, sysdate);

INSERT INTO recipecate(recipecateno, recipecategrpno, name, seqno, visible, cnt, rdate)
VALUES(recipecate_seq.nextval, 2, '다이어트', 1, 'Y', 0, sysdate);

INSERT INTO recipecate(recipecateno, recipecategrpno, name, seqno, visible, cnt, rdate)
VALUES(recipecate_seq.nextval, 2, '도시락', 1, 'Y', 0, sysdate);

INSERT INTO recipecate(recipecateno, recipecategrpno, name, seqno, visible, cnt, rdate)
VALUES(recipecate_seq.nextval, 2, '간식', 1, 'Y', 0, sysdate);

INSERT INTO recipecate(recipecateno, recipecategrpno, name, seqno, visible, cnt, rdate)
VALUES(recipecate_seq.nextval, 2, '야식', 1, 'Y', 0, sysdate);

INSERT INTO recipecate(recipecateno, recipecategrpno, name, seqno, visible, cnt, rdate)
VALUES(recipecate_seq.nextval, 2, '기타', 1, 'Y', 0, sysdate);

--3. 재료별
INSERT INTO recipecate(recipecateno, recipecategrpno, name, seqno, visible, cnt, rdate)
VALUES(recipecate_seq.nextval, 3, '소고기', 1, 'Y', 0, sysdate);

INSERT INTO recipecate(recipecateno, recipecategrpno, name, seqno, visible, cnt, rdate)
VALUES(recipecate_seq.nextval, 3, '돼지고기', 1, 'Y', 0, sysdate);

INSERT INTO recipecate(recipecateno, recipecategrpno, name, seqno, visible, cnt, rdate)
VALUES(recipecate_seq.nextval, 3, '닭고기', 1, 'Y', 0, sysdate);

INSERT INTO recipecate(recipecateno, recipecategrpno, name, seqno, visible, cnt, rdate)
VALUES(recipecate_seq.nextval, 3, '육류', 1, 'Y', 0, sysdate);

INSERT INTO recipecate(recipecateno, recipecategrpno, name, seqno, visible, cnt, rdate)
VALUES(recipecate_seq.nextval, 3, '채소류', 1, 'Y', 0, sysdate);

INSERT INTO recipecate(recipecateno, recipecategrpno, name, seqno, visible, cnt, rdate)
VALUES(recipecate_seq.nextval, 3, '해물류', 1, 'Y', 0, sysdate);

INSERT INTO recipecate(recipecateno, recipecategrpno, name, seqno, visible, cnt, rdate)
VALUES(recipecate_seq.nextval, 3, '달걀/유제품', 1, 'Y', 0, sysdate);

INSERT INTO recipecate(recipecateno, recipecategrpno, name, seqno, visible, cnt, rdate)
VALUES(recipecate_seq.nextval, 3, '쌀', 1, 'Y', 0, sysdate);

INSERT INTO recipecate(recipecateno, recipecategrpno, name, seqno, visible, cnt, rdate)
VALUES(recipecate_seq.nextval, 3, '밀가루', 1, 'Y', 0, sysdate);

INSERT INTO recipecate(recipecateno, recipecategrpno, name, seqno, visible, cnt, rdate)
VALUES(recipecate_seq.nextval, 3, '기타', 1, 'Y', 0, sysdate);


--4. 방법별
INSERT INTO recipecate(recipecateno, recipecategrpno, name, seqno, visible, cnt, rdate)
VALUES(recipecate_seq.nextval, 4, '볶음', 1, 'Y', 0, sysdate);

INSERT INTO recipecate(recipecateno, recipecategrpno, name, seqno, visible, cnt, rdate)
VALUES(recipecate_seq.nextval, 4, '끓이기', 1, 'Y', 0, sysdate);

INSERT INTO recipecate(recipecateno, recipecategrpno, name, seqno, visible, cnt, rdate)
VALUES(recipecate_seq.nextval, 4, '부침', 1, 'Y', 0, sysdate);

INSERT INTO recipecate(recipecateno, recipecategrpno, name, seqno, visible, cnt, rdate)
VALUES(recipecate_seq.nextval, 4, '조림', 1, 'Y', 0, sysdate);

INSERT INTO recipecate(recipecateno, recipecategrpno, name, seqno, visible, cnt, rdate)
VALUES(recipecate_seq.nextval, 4, '무침', 1, 'Y', 0, sysdate);

INSERT INTO recipecate(recipecateno, recipecategrpno, name, seqno, visible, cnt, rdate)
VALUES(recipecate_seq.nextval, 4, '비빔', 1, 'Y', 0, sysdate);

INSERT INTO recipecate(recipecateno, recipecategrpno, name, seqno, visible, cnt, rdate)
VALUES(recipecate_seq.nextval, 4, '찜', 1, 'Y', 0, sysdate);

INSERT INTO recipecate(recipecateno, recipecategrpno, name, seqno, visible, cnt, rdate)
VALUES(recipecate_seq.nextval, 4, '튀김', 1, 'Y', 0, sysdate);

INSERT INTO recipecate(recipecateno, recipecategrpno, name, seqno, visible, cnt, rdate)
VALUES(recipecate_seq.nextval, 4, '삶기', 1, 'Y', 0, sysdate);

INSERT INTO recipecate(recipecateno, recipecategrpno, name, seqno, visible, cnt, rdate)
VALUES(recipecate_seq.nextval, 4, '굽기', 1, 'Y', 0, sysdate);

INSERT INTO recipecate(recipecateno, recipecategrpno, name, seqno, visible, cnt, rdate)
VALUES(recipecate_seq.nextval, 4, '기타', 1, 'Y', 0, sysdate);

commit;
  
SELECT * FROM recipecate;
  