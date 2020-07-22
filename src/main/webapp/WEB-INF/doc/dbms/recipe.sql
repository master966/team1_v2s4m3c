
/**********************************/
/* Table Name: 레시피 */
/**********************************/
DROP TABLE recipe CASCADE CONSTRAINTS;

CREATE TABLE recipe(
		recipeno                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		memberno                      		NUMBER(10)		 NULL ,
		recipecateno                  		NUMBER(10)		 NULL ,
		title                         	    	VARCHAR2(100)		 NOT NULL,
		introdfood                    		VARCHAR2(1000)		 NOT NULL,
		category                      		VARCHAR2(100)		 NOT NULL,
		infofood                      		VARCHAR2(100)		 NOT NULL,
		ingredfood                    		VARCHAR2(1000)		 NOT NULL,
		seqfood                       		VARCHAR2(1000)		 NOT NULL,
		recom                         		NUMBER(7)		 DEFAULT 0		 NOT NULL,
		hits                          		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		replycnt                      		NUMBER(7)		 DEFAULT 0		 NOT NULL,
		youtube                       		VARCHAR2(100)		 NULL ,
		visible                       		CHAR(1)		 DEFAULT 'Y'		 NOT NULL,
		ip                            		VARCHAR2(15)		 NOT NULL,
		indent                        		NUMBER(2)		 DEFAULT 0		 NOT NULL,
        tip                                     VARCHAR(300)       NULL,
		word                          		VARCHAR(300)		 NULL,
		rdate                         		DATE		 NOT NULL,
        file1                                   VARCHAR(100)          NULL,
        thumb1                              VARCHAR(100)          NULL,
        size1                                 NUMBER(10)         NULL,
        rating                                NUMBER(3,2)      DEFAULT 0   NULL,
        rating_cnt                            NUMBER(10)     DEFAULT 0      NULL,
        rating_sum                          NUMBER(10,2)      DEFAULT 0   NULL,
  FOREIGN KEY (memberno) REFERENCES members (memberno),
  FOREIGN KEY (recipecateno) REFERENCES recipecate (recipecateno)
);

COMMENT ON TABLE recipe is '레시피';
COMMENT ON COLUMN recipe.recipeno is '레시피번호';
COMMENT ON COLUMN recipe.memberno is '회원번호';
COMMENT ON COLUMN recipe.recipecateno is '레시피카테고리번호';
COMMENT ON COLUMN recipe.title is '제목';
COMMENT ON COLUMN recipe.introdfood is '요리소개';
COMMENT ON COLUMN recipe.category is '카테고리';
COMMENT ON COLUMN recipe.infofood is '요리정보';
COMMENT ON COLUMN recipe.ingredfood is '요리재료';
COMMENT ON COLUMN recipe.seqfood is '요리순서';
COMMENT ON COLUMN recipe.recom is '추천';
COMMENT ON COLUMN recipe.hits is '조회수';
COMMENT ON COLUMN recipe.replycnt is '댓글수';
COMMENT ON COLUMN recipe.youtube is '동영상';
COMMENT ON COLUMN recipe.visible is '출력모드';
COMMENT ON COLUMN recipe.ip is '아이피';
COMMENT ON COLUMN recipe.indent is '댓글들여쓰기';
COMMENT ON COLUMN recipe.word is '검색어';
COMMENT ON COLUMN recipe.tip is '팁정보';
COMMENT ON COLUMN recipe.rdate is '등록일';
COMMENT ON COLUMN recipe.file1 is '메인 이미지';
COMMENT ON COLUMN recipe.thumb1 is '메인 이미지 Preview';
COMMENT ON COLUMN recipe.size1 is ' 메인 이미지 크기';
COMMENT ON COLUMN recipe.rating is ' 평점';
COMMENT ON COLUMN recipe.rating_cnt is ' 평점 수';
COMMENT ON COLUMN recipe.rating_sum is '평점 합계';


DROP SEQUENCE recipe_seq;
CREATE SEQUENCE recipe_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
  
  
INSERT INTO recipe(recipeno, memberno, recipecateno, title, introdfood, category, infofood, ingredfood, seqfood, youtube, ip, word, rdate, file1, thumb1, size1)
VALUES(recipe_seq.nextval, 1, 1, '맛동산 탕수육', '아~~~~~~', '소개', '???', '???', '???', 'www.youtube.com', 'ip', 'word', sysdate, 'file1', 'thumb1', 10);

DELETE FROM recipe
WHERE recipeno = 3;

SELECT * FROM recipe;
SELECT * FROM members;
SELECT * FROM recipecate;
SELECT * FROM recipecategrp;

SELECT recipeno, memberno, recipecateno, title, introdfood, category, infofood,
                     ingredfood, seqfood, youtube, ip, tip, word, rdate, file1, thumb1, size1
FROM recipe
WHERE recipeno = 4;


SELECT m.memberno as m_memberno, m.nick as m_nick,
                r.recipeno, r.memberno, r.recipecateno, r.title, r.recom, r.hits, r.replycnt, r.file1, r.thumb1, r.size1
FROM members m, recipe r
WHERE (m.memberno = r.memberno) AND r.recipeno=20
ORDER BY r.recipeno DESC;

SELECT * FROM recipe;

UPDATE recipe 
SET rating_sum = rating_sum + 5
WHERE recipeno=1;

UPDATE recipe 
SET rating_sum = 0, rating=0, rating_cnt=0
WHERE recipeno=1;

ALTER TABLE recipe DROP (rating);
ALTER TABLE recipe ADD rating NUMBER(2,1) DEFAULT 0 NULL;

ALTER TABLE recipe DROP (rating_sum);
ALTER TABLE recipe ADD rating_sum NUMBER(10,1) DEFAULT 0 NULL;

commit;