/**********************************/
/* Table Name: 레시피순서 */
/**********************************/
DROP TABLE recipeseq;
CREATE TABLE recipeseq(
		recipeseqno                   		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		recipeno                      		NUMBER(10)		 NULL ,
		memberno                      		NUMBER(10)		 NULL ,
        contents                            VARCHAR2(1000)      NULL,
		file_seq                		VARCHAR2(100)		 NULL,
		thumb_seq               		VARCHAR2(100)		 NULL,
		size_seq                		NUMBER(10)		 NULL,
        step                           NUMBER(10)       DEFAULT 1     NULL,
		recipeseqseqno                		NUMBER(10)		 DEFAULT 1		 NOT NULL,
  FOREIGN KEY (recipeno) REFERENCES recipe (recipeno),
  FOREIGN KEY (memberno) REFERENCES members (memberno)
);

COMMENT ON TABLE recipeseq is '레시피순서';
COMMENT ON COLUMN recipeseq.recipeseqno is '레시피순서번호';
COMMENT ON COLUMN recipeseq.recipeno is '레시피번호';
COMMENT ON COLUMN recipeseq.memberno is '회원번호';
COMMENT ON COLUMN recipeseq.contents is '내용';
COMMENT ON COLUMN recipeseq.file_seq is '레시피순서파일명';
COMMENT ON COLUMN recipeseq.thumb_seq is '레시피순서파일썸네일';
COMMENT ON COLUMN recipeseq.size_seq is '레시피순서파일크기';
COMMENT ON COLUMN recipeseq.step is '레시피스텝번호';
COMMENT ON COLUMN recipeseq.recipeseqseqno is '레시피순서정렬번호';

DROP SEQUENCE recipeseq_seq;
CREATE SEQUENCE recipeseq_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지

SELECT * FROM recipe;
SELECT * FROM member;
SELECT * FROM recipeseq;

INSERT INTO recipeseq(recipeseqno, recipeno, memberno, contents, file3, thumb3, size3, recipeseqseqno)
VALUES(recipeseq_seq.nextval, 1, 1, '내용1', '1.jpg', '1_t.jpg', 10, 1);

SELECT recipeseqno, recipeno, memberno, contents, file_seq, thumb_seq, size_seq, step, recipeseqseqno
FROM recipeseq
WHERE recipeno = 1;

commit;