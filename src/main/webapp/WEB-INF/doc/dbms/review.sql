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

COMMENT ON TABLE review is '�ı� ���̺�';
COMMENT ON COLUMN review.reviewno is '�ı� ��ȣ';
COMMENT ON COLUMN review.memberno is 'ȸ�� ��ȣ';
COMMENT ON COLUMN review.p_no is '��ǰ ��ȣ';
COMMENT ON COLUMN review.title is '�ı� ����';
COMMENT ON COLUMN review.rdate is '�ı� �ۼ� ��¥';
COMMENT ON COLUMN review.content is '����';
COMMENT ON COLUMN review.passwd is '�Խñ� �н�����';

DROP SEQUENCE review_seq;
CREATE SEQUENCE review_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����
  
--���
INSERT INTO  review(reviewno, p_no, memberno, title, rdate, content, passwd, file1, thumb1, size1)
VALUES(review_seq.nextval, 1, 3, '���־��', sysdate,  '���˾',1234, 'cherry.jpg', 'cherry_t.jpg', 12434);

--��ȸ
SELECT reviewno, p_no, memberno, title, rdate, cnt, content, file1, thumb1, size1
FROM review
WHERE reviewno=3;

--��ü ���
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
  