/**********************************/
/* Table Name: ��ۺ� */
/**********************************/
DROP TABLE deliverypay;
CREATE TABLE deliverypay(
		deliverypayno                 		NUMBER(10)		 NOT NULL,
		area                          		VARCHAR2(100)		 NOT NULL,
		deliverypay                   		NUMBER(10)		 NOT NULL
);

COMMENT ON TABLE deliverypay is '��ۺ�';
COMMENT ON COLUMN deliverypay.deliverypayno is '��ۺ� ��ȣ';
COMMENT ON COLUMN deliverypay.area is '����';
COMMENT ON COLUMN deliverypay.deliverypay is '��ۺ�';

DROP SEQUENCE deliverypay_seq;

CREATE SEQUENCE deliverypay_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999999 --> NUMBER(10) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����

INSERT INTO deliverypay(deliverypayno, area, deliverypay)
VALUES(deliverypay_seq.nextval, '����', 7000);

INSERT INTO deliverypay(deliverypayno, area, deliverypay)
VALUES(deliverypay_seq.nextval, '����', 7000);

INSERT INTO deliverypay(deliverypayno, area, deliverypay)
VALUES(deliverypay_seq.nextval, '���', 5000);

INSERT INTO deliverypay(deliverypayno, area, deliverypay)
VALUES(deliverypay_seq.nextval, '����', 5000);

INSERT INTO deliverypay(deliverypayno, area, deliverypay)
VALUES(deliverypay_seq.nextval, '����', 3000);

INSERT INTO deliverypay(deliverypayno, area, deliverypay)
VALUES(deliverypay_seq.nextval, '���', 3000);

INSERT INTO deliverypay(deliverypayno, area, deliverypay)
VALUES(deliverypay_seq.nextval, '��õ', 3000);

INSERT INTO deliverypay(deliverypayno, area, deliverypay)
VALUES(deliverypay_seq.nextval, '��û', 3000);

INSERT INTO deliverypay(deliverypayno, area, deliverypay)
VALUES(deliverypay_seq.nextval, '�λ�', 5000);

INSERT INTO deliverypay(deliverypayno, area, deliverypay)
VALUES(deliverypay_seq.nextval, '�뱸', 5000);

INSERT INTO deliverypay(deliverypayno, area, deliverypay)
VALUES(deliverypay_seq.nextval, '����', 5000);

INSERT INTO deliverypay(deliverypayno, area, deliverypay)
VALUES(deliverypay_seq.nextval, '���', 5000);

INSERT INTO deliverypay(deliverypayno, area, deliverypay)
VALUES(deliverypay_seq.nextval, '����', 3000);


SELECT * FROM deliverypay;


SELECT deliverypayno, area, deliverypay
FROM deliverypay
WHERE deliverypayno = 1;

UPDATE deliverypay 
SET area = '����', deliverypay=3000
WHERE deliverypayno=1;

COMMIT;

5. ����
1) ��� ����
DELETE FROM deliverypay;
 
2) Ư�� ���̺� ����
DELETE FROM deliverypay
WHERE deliverypayno=15;

COMMIT;