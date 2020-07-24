/**********************************/
/* Table Name: 개인 평점 */
/**********************************/
DROP TABLE rating;
CREATE TABLE rating(
		ratingno               		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		recipeno                     NUMBER(10)		 NULL ,
		memberno                  NUMBER(10)		 NULL ,
        rating                         NUMBER(3,2)     NULL,
  Constraint fk_recipeno_rating FOREIGN KEY (recipeno) REFERENCES recipe (recipeno) on delete cascade,
  Constraint fk_memberno_rating FOREIGN KEY (memberno) REFERENCES members (memberno)  on delete cascade
);


COMMENT ON TABLE rating is '개인 평점';
COMMENT ON COLUMN rating.ratingno is '평점번호';
COMMENT ON COLUMN rating.recipeno is '레시피번호';
COMMENT ON COLUMN rating.memberno is '멤버번호';
COMMENT ON COLUMN rating.rating is '평점';



DROP SEQUENCE rating_seq;
CREATE SEQUENCE rating_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
  

SELECT COUNT(*) as cnt
FROM rating
WHERE recipeno=27 and memberno=2;


select * from rating;
  

 SELECT ratingno, recipeno, memberno, rating
 FROM rating
 WHERE recipeno=29 and memberno = 2;

  
commit;