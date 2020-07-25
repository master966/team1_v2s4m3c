DROP TABLE question;
/**********************************/
/* Table Name: ���������� */
/**********************************/
CREATE TABLE question(
		questionno NUMERIC(10) NOT NULL PRIMARY KEY,
		memberno NUMERIC(10) NOT NULL,
		categorization VARCHAR(1000) NOT NULL,
		asktitle VARCHAR(1000) NOT NULL,
		askcont CLOB NOT NULL,
		state VARCHAR(1) DEFAULT 'N' NOT NULL,
		askdate DATE NOT NULL,
  FOREIGN KEY (memberno) REFERENCES members (memberno)
);

COMMENT ON TABLE question is '����������';
COMMENT ON COLUMN question.questionno is '������ȣ';
COMMENT ON COLUMN question.memberno is 'ȸ����ȣ';
COMMENT ON COLUMN question.categorization is '�з�';
COMMENT ON COLUMN question.asktitle is '����';
COMMENT ON COLUMN question.askcont is '����';
COMMENT ON COLUMN question.state is 'ó������';
COMMENT ON COLUMN question.askdate is '�����';

-- ���
INSERT INTO question(questionno, memberno, categorization, asktitle, askcont, state, askdate)
VALUES((SELECT NVL(MAX(questionno), 0)+1 as questionno FROM question), 1, '��ȯ �� ȯ�� ����', '��ȯ�� ��ǰ ���� ����', '�� �ù� ��𰬳���..', 'N', sysdate);

INSERT INTO question(questionno, memberno, categorization, asktitle, askcont, state, askdate)
VALUES((SELECT NVL(MAX(questionno), 0)+1 as questionno FROM question), 1, '���� ����Ʈ', '�޴��� �ȴ����ϴ�', '��ǰ�� ���� �������� ���� �޴��� �ȴ�����', 'N', sysdate);

INSERT INTO question(questionno, memberno, categorization, asktitle, askcont, state, askdate)
VALUES((SELECT NVL(MAX(questionno), 0)+1 as questionno FROM question), 2, '��Ÿ', '��������', '�� �ù� ��𰬳���..', 'N', sysdate);

-- ��ü ���
SELECT q.questionno, q.memberno, q.categorization, q.asktitle, q.askcont, q.state, q.askdate,
           m.mname
  FROM question q,  members m
  WHERE q.memberno = m.memberno
  ORDER BY questionno DESC

-- ȸ���� ���
SELECT questionno, memberno, categorization, asktitle, askcont, state, askdate
FROM question
WHERE memberno=1;

-- ��ü ���� ����
SELECT MAX(questionno) as maxno
FROM question;

-- ���� & �亯 ����
DELETE FROM answer
WHERE questionno = 4;
DELETE FROM question
WHERE questionno = 4;

commit;