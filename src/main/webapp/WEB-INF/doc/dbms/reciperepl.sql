/**********************************/
/* Table Name: �����Ǵ�� */
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

COMMENT ON TABLE reciperepl is '�����Ǵ��';
COMMENT ON COLUMN reciperepl.recipereplno is '�����ǹ�ȣ';
COMMENT ON COLUMN reciperepl.memberno is 'ȸ����ȣ';
COMMENT ON COLUMN reciperepl.recipeno is '�����ǹ�ȣ';
COMMENT ON COLUMN reciperepl.contents is '����';
COMMENT ON COLUMN reciperepl.rdate is '�����';


DROP SEQUENCE reciperepl_seq;
CREATE SEQUENCE reciperepl_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����
  
  
INSERT INTO reciperepl(recipereplno, memberno, recipeno, contents, rdate)
VALUES(reciperepl_seq.nextval, 1, 1, '���1', sysdate);
INSERT INTO reciperepl(recipereplno, memberno, recipeno, contents, rdate)
VALUES(reciperepl_seq.nextval, 1, 1, '���2', sysdate);
INSERT INTO reciperepl(recipereplno, memberno, recipeno, contents, rdate)
VALUES(reciperepl_seq.nextval, 1, 1, '���3', sysdate);

DELETE FROM reciperepl
WHERE recipereplno >= 4 AND recipereplno <= 6;


2) ��ü ���
SELECT recipereplno, memberno, recipeno, contents, rdate
FROM reciperepl
ORDER BY recipereplno DESC;



3) recipeno �� ���
SELECT recipereplno, memberno, recipeno, contents, rdate
FROM reciperepl
WHERE recipeno=1
ORDER BY recipereplno DESC;

RECIPEREPLNO   MEMBERNO   RECIPENO CONTENTS                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 RDATE              
------------ ---------- ---------- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -------------------
           3          1          1 ���3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    2020-07-09 10:21:41
           2          1          1 ���2                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    2020-07-09 10:21:41
           1          1          1 ���1     


4) ����
-- ȸ����ȣ �˻�
--SELECT count(passwd) as cnt
--FROM reply
--WHERE replyno=1 AND passwd='1234';

 CNT
 ---
   1
   
-- ����
--DELETE FROM reply
--WHERE replyno=1;

5) recipeno�� �ش��ϴ� ��� �� Ȯ�� �� ����
SELECT COUNT(*) as cnt
FROM reciperepl
WHERE recipeno=1;

 CNT
 ---
   1

DELETE FROM reply
WHERE contentsno=1;

6) memberno�� �ش��ϴ� ��� �� Ȯ�� �� ����
SELECT COUNT(*) as cnt
FROM reply
WHERE memberno=1;

 CNT
 ---
   1

DELETE FROM reply
WHERE memberno=1;

7) ȸ�� ID�� ���
SELECT m.id,
           r.replyno, r.contentsno, r.memberno, r.content, r.passwd, r.rdate
FROM member m,  reply r
WHERE (m.memberno = r.memberno) AND r.contentsno=1
ORDER BY r.replyno DESC;

 ID    REPLYNO CONTENTSNO MEMBERNO CONTENT                                                                                                                                                                         PASSWD RDATE
 ----- ------- ---------- -------- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ------ ---------------------
 user1       3          1        1 ��� 3                                                                                                                                                                            123    2019-12-18 16:46:43.0
 user1       2          1        1 ��� 2                                                                                                                                                                            123    2019-12-18 16:46:39.0
 user1       1          1        1 ��� 1                                                                                                                                                                            123    2019-12-18 16:46:35.0
 
 
8) ������ �н����� �˻�
SELECT COUNT(*) as cnt
FROM reply
WHERE replyno=1 AND passwd='1234';

 CNT
 ---
   0

9) ����
DELETE FROM reply
WHERE replyno=1;


 
-------------------------------------------------------------------------------------

* �߰� Ŀ��
  - visible('Y', 'N'): ��� ��� ����, �Ǽ� ����� ����
 


commit;

SELECT * FROM reciperepl;
  