/**********************************/
/* Table Name: ���� ���� */
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


COMMENT ON TABLE rating is '���� ����';
COMMENT ON COLUMN rating.ratingno is '������ȣ';
COMMENT ON COLUMN rating.recipeno is '�����ǹ�ȣ';
COMMENT ON COLUMN rating.memberno is '�����ȣ';
COMMENT ON COLUMN rating.rating is '����';



DROP SEQUENCE rating_seq;
CREATE SEQUENCE rating_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����
  

SELECT COUNT(*) as cnt
FROM rating
WHERE recipeno=27 and memberno=2;


select * from rating;
  

 SELECT ratingno, recipeno, memberno, rating
 FROM rating
 WHERE recipeno=29 and memberno = 2;

  
commit;