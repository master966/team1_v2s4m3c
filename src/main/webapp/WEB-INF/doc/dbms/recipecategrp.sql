/**********************************/
/* Table Name: ������ī�װ��׷� */
/**********************************/
DROP TABLE recipecate;
DROP TABLE recipecategrp;
DROP TABLE recipecategrp CASCADE CONSTRAINTS;
CREATE TABLE recipecategrp(
		recipecategrpno               		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		name                          		VARCHAR2(100)		 NOT NULL,
		seqno                         		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		visible                       		CHAR(1)		 DEFAULT 'Y'		 NOT NULL,
		rdate                         		DATE		 NOT NULL
);

COMMENT ON TABLE recipecategrp is '������ī�װ��׷�';
COMMENT ON COLUMN recipecategrp.recipecategrpno is '������ī�װ��׷��ȣ';
COMMENT ON COLUMN recipecategrp.name is '�̸�';
COMMENT ON COLUMN recipecategrp.seqno is '��¼���';
COMMENT ON COLUMN recipecategrp.visible is '��¸��';
COMMENT ON COLUMN recipecategrp.rdate is '�����';


DROP SEQUENCE recipecategrp_seq;
CREATE SEQUENCE recipecategrp_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����
  
  
INSERT INTO recipecategrp(recipecategrpno, name, seqno, visible, rdate)
VALUES(recipecategrp_seq.nextval, '������', 1, 'Y', sysdate);

INSERT INTO recipecategrp(recipecategrpno, name, seqno, visible, rdate)
VALUES(recipecategrp_seq.nextval, '��Ȳ��', 2, 'Y', sysdate);

INSERT INTO recipecategrp(recipecategrpno, name, seqno, visible, rdate)
VALUES(recipecategrp_seq.nextval, '��Ằ', 3, 'Y', sysdate);

INSERT INTO recipecategrp(recipecategrpno, name, seqno, visible, rdate)
VALUES(recipecategrp_seq.nextval, '�����', 4, 'Y', sysdate);

delete from recipecategrp
where recipecategrpno = 1;
  
SELECT * FROM recipecategrp;
commit;  
  