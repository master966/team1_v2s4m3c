/**********************************/
/* Table Name: 레시피댓글 */
/**********************************/
DROP TABLE reciperepl;
CREATE TABLE reciperepl(
		recipereplno                  		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		memberno                      		NUMBER(10)		 NULL ,
		recipeno                      		NUMBER(10)		 NULL ,
		contents                      		VARCHAR2(1000)		 NOT NULL,
		rdate                         		   DATE	 NOT NULL,
  Constraint fk_contentsno_reciperepl  FOREIGN KEY (recipeno) REFERENCES recipe (recipeno) on delete cascade,
  Constraint fk_memberno_reciperepl  FOREIGN KEY (memberno) REFERENCES members (memberno) on delete cascade
);

COMMENT ON TABLE reciperepl is '레시피댓글';
COMMENT ON COLUMN reciperepl.recipereplno is '레시피번호';
COMMENT ON COLUMN reciperepl.memberno is '회원번호';
COMMENT ON COLUMN reciperepl.recipeno is '레시피번호';
COMMENT ON COLUMN reciperepl.contents is '내용';
COMMENT ON COLUMN reciperepl.rdate is '등록일';


DROP SEQUENCE reciperepl_seq;
CREATE SEQUENCE reciperepl_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
  
  
INSERT INTO reciperepl(recipereplno, memberno, recipeno, contents, rdate)
VALUES(reciperepl_seq.nextval, 1, 1, '댓글1', sysdate);
INSERT INTO reciperepl(recipereplno, memberno, recipeno, contents, rdate)
VALUES(reciperepl_seq.nextval, 1, 1, '댓글2', sysdate);
INSERT INTO reciperepl(recipereplno, memberno, recipeno, contents, rdate)
VALUES(reciperepl_seq.nextval, 1, 1, '댓글3', sysdate);

DELETE FROM reciperepl
WHERE recipereplno >= 4 AND recipereplno <= 6;


2) 전체 목록
SELECT recipereplno, memberno, recipeno, contents, rdate
FROM reciperepl
ORDER BY recipereplno DESC;



3) recipeno 별 목록
SELECT recipereplno, memberno, recipeno, contents, rdate
FROM reciperepl
WHERE recipeno=1
ORDER BY recipereplno DESC;

RECIPEREPLNO   MEMBERNO   RECIPENO CONTENTS                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 RDATE              
------------ ---------- ---------- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -------------------
           3          1          1 댓글3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    2020-07-09 10:21:41
           2          1          1 댓글2                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    2020-07-09 10:21:41
           1          1          1 댓글1     


4) 삭제
-- 회원번호 검사
--SELECT count(passwd) as cnt
--FROM reply
--WHERE replyno=1 AND passwd='1234';

 CNT
 ---
   1
   
-- 삭제
--DELETE FROM reply
--WHERE replyno=1;

5) recipeno에 해당하는 댓글 수 확인 및 삭제
SELECT COUNT(*) as cnt
FROM reciperepl
WHERE recipeno=1;

 CNT
 ---
   1

DELETE FROM reply
WHERE contentsno=1;

6) memberno에 해당하는 댓글 수 확인 및 삭제
SELECT COUNT(*) as cnt
FROM reply
WHERE memberno=1;

 CNT
 ---
   1

DELETE FROM reply
WHERE memberno=1;

7) 회원 ID의 출력
SELECT m.id,
           r.replyno, r.contentsno, r.memberno, r.content, r.passwd, r.rdate
FROM member m,  reply r
WHERE (m.memberno = r.memberno) AND r.contentsno=1
ORDER BY r.replyno DESC;

 ID    REPLYNO CONTENTSNO MEMBERNO CONTENT                                                                                                                                                                         PASSWD RDATE
 ----- ------- ---------- -------- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ------ ---------------------
 user1       3          1        1 댓글 3                                                                                                                                                                            123    2019-12-18 16:46:43.0
 user1       2          1        1 댓글 2                                                                                                                                                                            123    2019-12-18 16:46:39.0
 user1       1          1        1 댓글 1                                                                                                                                                                            123    2019-12-18 16:46:35.0
 
 
8) 삭제용 패스워드 검사
SELECT COUNT(*) as cnt
FROM reply
WHERE replyno=1 AND passwd='1234';

 CNT
 ---
   0

9) 삭제
DELETE FROM reply
WHERE replyno=1;


 
-------------------------------------------------------------------------------------

* 추가 커럼
  - visible('Y', 'N'): 댓글 출력 여부, 악성 댓글의 차단
 


commit;

SELECT * FROM reciperepl;
  