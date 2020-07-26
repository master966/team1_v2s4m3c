
/**********************************/
/* Table Name: ������ī�װ� */
/**********************************/
DROP TABLE recipecate;
DROP TABLE recipecate CASCADE CONSTRAINTS;
CREATE TABLE recipecate(
		recipecateno                  		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		recipecategrpno               		NUMBER(10)		 NULL ,
		name                          		VARCHAR2(100)		 NOT NULL,
		seqno                         		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		visible                       		CHAR(1)		 DEFAULT 'Y'		 NOT NULL,
        cnt                                NUMBER(10)            DEFAULT 0      NOT NULL,
		rdate                         		DATE		 NOT NULL,
  Constraint fk_recipecategrpno_recipecate FOREIGN KEY (recipecategrpno) REFERENCES recipecategrp (recipecategrpno) on delete cascade
);

COMMENT ON TABLE recipecate is '������ī�װ�';
COMMENT ON COLUMN recipecate.recipecateno is '������ī�װ���ȣ';
COMMENT ON COLUMN recipecate.recipecategrpno is '������ī�װ��׷��ȣ';
COMMENT ON COLUMN recipecate.name is '�̸�';
COMMENT ON COLUMN recipecate.seqno is '��¼���';
COMMENT ON COLUMN recipecate.visible is '��¼���';
COMMENT ON COLUMN recipecate.rdate is '�����';

DROP SEQUENCE recipecate_seq;
CREATE SEQUENCE recipecate_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����

--1. ������
INSERT INTO recipecate(recipecateno, recipecategrpno, name, seqno, visible, cnt, rdate)
VALUES(recipecate_seq.nextval, 1, '�ع���', 1, 'Y', 0, sysdate);

INSERT INTO recipecate(recipecateno, recipecategrpno, name, seqno, visible, cnt, rdate)
VALUES(recipecate_seq.nextval, 1, '���ι���', 1, 'Y', 0, sysdate);

INSERT INTO recipecate(recipecateno, recipecategrpno, name, seqno, visible, cnt, rdate)
VALUES(recipecate_seq.nextval, 1, '��/��', 1, 'Y', 0, sysdate);

INSERT INTO recipecate(recipecateno, recipecategrpno, name, seqno, visible, cnt, rdate)
VALUES(recipecate_seq.nextval, 1, '�', 1, 'Y', 0, sysdate);

INSERT INTO recipecate(recipecateno, recipecategrpno, name, seqno, visible, cnt, rdate)
VALUES(recipecate_seq.nextval, 1, '����Ʈ', 1, 'Y', 0, sysdate);

INSERT INTO recipecate(recipecateno, recipecategrpno, name, seqno, visible, cnt, rdate)
VALUES(recipecate_seq.nextval, 1, '��/����', 1, 'Y', 0, sysdate);

INSERT INTO recipecate(recipecateno, recipecategrpno, name, seqno, visible, cnt, rdate)
VALUES(recipecate_seq.nextval, 1, '��/��/��', 1, 'Y', 0, sysdate);

INSERT INTO recipecate(recipecateno, recipecategrpno, name, seqno, visible, cnt, rdate)
VALUES(recipecate_seq.nextval, 1, '��Ÿ', 1, 'Y', 0, sysdate);

--2. ��Ȳ��
INSERT INTO recipecate(recipecateno, recipecategrpno, name, seqno, visible, cnt, rdate)
VALUES(recipecate_seq.nextval, 2, '�ϻ�', 1, 'Y', 0, sysdate);

INSERT INTO recipecate(recipecateno, recipecategrpno, name, seqno, visible, cnt, rdate)
VALUES(recipecate_seq.nextval, 2, '�ʽ��ǵ�', 1, 'Y', 0, sysdate);

INSERT INTO recipecate(recipecateno, recipecategrpno, name, seqno, visible, cnt, rdate)
VALUES(recipecate_seq.nextval, 2, '�մ�����', 1, 'Y', 0, sysdate);

INSERT INTO recipecate(recipecateno, recipecategrpno, name, seqno, visible, cnt, rdate)
VALUES(recipecate_seq.nextval, 2, '������', 1, 'Y', 0, sysdate);

INSERT INTO recipecate(recipecateno, recipecategrpno, name, seqno, visible, cnt, rdate)
VALUES(recipecate_seq.nextval, 2, '���̾�Ʈ', 1, 'Y', 0, sysdate);

INSERT INTO recipecate(recipecateno, recipecategrpno, name, seqno, visible, cnt, rdate)
VALUES(recipecate_seq.nextval, 2, '���ö�', 1, 'Y', 0, sysdate);

INSERT INTO recipecate(recipecateno, recipecategrpno, name, seqno, visible, cnt, rdate)
VALUES(recipecate_seq.nextval, 2, '����', 1, 'Y', 0, sysdate);

INSERT INTO recipecate(recipecateno, recipecategrpno, name, seqno, visible, cnt, rdate)
VALUES(recipecate_seq.nextval, 2, '�߽�', 1, 'Y', 0, sysdate);

INSERT INTO recipecate(recipecateno, recipecategrpno, name, seqno, visible, cnt, rdate)
VALUES(recipecate_seq.nextval, 2, '��Ÿ', 1, 'Y', 0, sysdate);

--3. ��Ằ
INSERT INTO recipecate(recipecateno, recipecategrpno, name, seqno, visible, cnt, rdate)
VALUES(recipecate_seq.nextval, 3, '�Ұ��', 1, 'Y', 0, sysdate);

INSERT INTO recipecate(recipecateno, recipecategrpno, name, seqno, visible, cnt, rdate)
VALUES(recipecate_seq.nextval, 3, '�������', 1, 'Y', 0, sysdate);

INSERT INTO recipecate(recipecateno, recipecategrpno, name, seqno, visible, cnt, rdate)
VALUES(recipecate_seq.nextval, 3, '�߰��', 1, 'Y', 0, sysdate);

INSERT INTO recipecate(recipecateno, recipecategrpno, name, seqno, visible, cnt, rdate)
VALUES(recipecate_seq.nextval, 3, '����', 1, 'Y', 0, sysdate);

INSERT INTO recipecate(recipecateno, recipecategrpno, name, seqno, visible, cnt, rdate)
VALUES(recipecate_seq.nextval, 3, 'ä�ҷ�', 1, 'Y', 0, sysdate);

INSERT INTO recipecate(recipecateno, recipecategrpno, name, seqno, visible, cnt, rdate)
VALUES(recipecate_seq.nextval, 3, '�ع���', 1, 'Y', 0, sysdate);

INSERT INTO recipecate(recipecateno, recipecategrpno, name, seqno, visible, cnt, rdate)
VALUES(recipecate_seq.nextval, 3, '�ް�/����ǰ', 1, 'Y', 0, sysdate);

INSERT INTO recipecate(recipecateno, recipecategrpno, name, seqno, visible, cnt, rdate)
VALUES(recipecate_seq.nextval, 3, '��', 1, 'Y', 0, sysdate);

INSERT INTO recipecate(recipecateno, recipecategrpno, name, seqno, visible, cnt, rdate)
VALUES(recipecate_seq.nextval, 3, '�а���', 1, 'Y', 0, sysdate);

INSERT INTO recipecate(recipecateno, recipecategrpno, name, seqno, visible, cnt, rdate)
VALUES(recipecate_seq.nextval, 3, '��Ÿ', 1, 'Y', 0, sysdate);


--4. �����
INSERT INTO recipecate(recipecateno, recipecategrpno, name, seqno, visible, cnt, rdate)
VALUES(recipecate_seq.nextval, 4, '����', 1, 'Y', 0, sysdate);

INSERT INTO recipecate(recipecateno, recipecategrpno, name, seqno, visible, cnt, rdate)
VALUES(recipecate_seq.nextval, 4, '���̱�', 1, 'Y', 0, sysdate);

INSERT INTO recipecate(recipecateno, recipecategrpno, name, seqno, visible, cnt, rdate)
VALUES(recipecate_seq.nextval, 4, '��ħ', 1, 'Y', 0, sysdate);

INSERT INTO recipecate(recipecateno, recipecategrpno, name, seqno, visible, cnt, rdate)
VALUES(recipecate_seq.nextval, 4, '����', 1, 'Y', 0, sysdate);

INSERT INTO recipecate(recipecateno, recipecategrpno, name, seqno, visible, cnt, rdate)
VALUES(recipecate_seq.nextval, 4, '��ħ', 1, 'Y', 0, sysdate);

INSERT INTO recipecate(recipecateno, recipecategrpno, name, seqno, visible, cnt, rdate)
VALUES(recipecate_seq.nextval, 4, '���', 1, 'Y', 0, sysdate);

INSERT INTO recipecate(recipecateno, recipecategrpno, name, seqno, visible, cnt, rdate)
VALUES(recipecate_seq.nextval, 4, '��', 1, 'Y', 0, sysdate);

INSERT INTO recipecate(recipecateno, recipecategrpno, name, seqno, visible, cnt, rdate)
VALUES(recipecate_seq.nextval, 4, 'Ƣ��', 1, 'Y', 0, sysdate);

INSERT INTO recipecate(recipecateno, recipecategrpno, name, seqno, visible, cnt, rdate)
VALUES(recipecate_seq.nextval, 4, '���', 1, 'Y', 0, sysdate);

INSERT INTO recipecate(recipecateno, recipecategrpno, name, seqno, visible, cnt, rdate)
VALUES(recipecate_seq.nextval, 4, '����', 1, 'Y', 0, sysdate);

INSERT INTO recipecate(recipecateno, recipecategrpno, name, seqno, visible, cnt, rdate)
VALUES(recipecate_seq.nextval, 4, '��Ÿ', 1, 'Y', 0, sysdate);

commit;
  
SELECT * FROM recipecate;
  