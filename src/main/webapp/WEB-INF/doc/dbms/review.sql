DROP TABLE review;
CREATE TABLE review(
		reviewno                        	NUMBER(10)		 NOT NULL		 PRIMARY KEY,
        p_no                       	        NUMBER(10)		 NOT NULL,
        memberno                         NUMBER(7)         NULL,
		title                              		VARCHAR2(100)		 NOT NULL,
		rdate                           		DATE		 NOT NULL,
        content                       		CLOB         		 NOT NULL,
        passwd                        		NUMBER(7)     NOT NULL,
        file1                                   VARCHAR(100)          NULL,
        thumb1                              VARCHAR(100)          NULL,
        size1                                 NUMBER(10)      DEFAULT 0 NULL, 
        FOREIGN KEY (p_no) REFERENCES product (p_no),
        FOREIGN KEY (memberno) REFERENCES members (memberno)
);

COMMENT ON TABLE review is '후기 테이블';
COMMENT ON COLUMN review.reviewno is '후기 번호';
COMMENT ON COLUMN review.memberno is '회원 번호';
COMMENT ON COLUMN review.p_no is '상품 번호';
COMMENT ON COLUMN review.title is '후기 제목';
COMMENT ON COLUMN review.rdate is '후기 작성 날짜';
COMMENT ON COLUMN review.content is '내용';
COMMENT ON COLUMN review.passwd is '게시글 패스워드';

DROP SEQUENCE review_seq;
CREATE SEQUENCE review_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
  
--등록
INSERT INTO  review(reviewno, p_no, memberno, title, rdate, content, passwd, file1, thumb1, size1)
VALUES(review_seq.nextval, 1, 3, '맛있어요', sysdate,  '마싯어영',1234, 'cherry.jpg', 'cherry_t.jpg', 12434);

--조회
SELECT reviewno, p_no, memberno, title, rdate, cnt, content, file1, thumb1, size1
FROM review
WHERE reviewno=3;

--전체 목록
SELECT reviewno, p_no, memberno, nickname, title, rdate,  content, file1, thumb1, size1
FROM review
ORDER BY reviewno DESC;


SELECT  r.p_no, r.reviewno, r.title, m.nickname as m_nickname, r.rdate
FROM members m, review r
WHERE m.memberno = r.memberno
ORDER BY m.memberno ASC, r.memberno ASC;

    SELECT p.p_no,
               r.reviewno, r.title, r.rdate, m.nickname, r.file1
    FROM product p,  review r, members m
    WHERE (p.p_no = r.p_no) AND r.p_no=1
    ORDER BY r.reviewno DESC
    
    
        SELECT p_no, reviewno, title,  nickname, rdate
    FROM (
            SELECT p_no, reviewno, title,  nickname, rdate, rownum as r
            FROM (
                    SELECT p.p_no,
                           r.reviewno, r.title, r.nickname, r.rdate
                    FROM product p,  review r
                    WHERE (p.p_no = r.p_no) AND AND r.p_no=#{p_no}
                    ORDER BY r.reviewno DESC
            )
    ) WHERE <![CDATA[ r >= #{startNum} AND r <= #{endNum} ]]>
  