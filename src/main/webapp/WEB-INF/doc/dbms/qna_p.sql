/**********************************/
/* Table Name: ���ֹ������� */
/**********************************/
DROP TABLE qna;
CREATE TABLE qna(
		qnano NUMERIC(10) NOT NULL PRIMARY KEY,
		adminno NUMERIC(10),
		qtitle VARCHAR(1000) NOT NULL,
		qcontent CLOB NOT NULL,
		qimage VARCHAR(1000),
		qfile VARCHAR(2000),
		isview VARCHAR(1) DEFAULT 'N' NOT NULL,
		qdate DATE NOT NULL,
  FOREIGN KEY (adminno) REFERENCES admini (adminno)
);

COMMENT ON TABLE qna is '���ֹ�������';
COMMENT ON COLUMN qna.qnano is '���������ȣ';
COMMENT ON COLUMN qna.adminno is '�����ڹ�ȣ';
COMMENT ON COLUMN qna.qtitle is '����';
COMMENT ON COLUMN qna.qcontent is '�۳���';
COMMENT ON COLUMN qna.qimage is '�̹���';
COMMENT ON COLUMN qna.qfile is '����';
COMMENT ON COLUMN qna.isview is '���';
COMMENT ON COLUMN qna.qdate is '�����';

-- ���
INSERT INTO qna(qnano, adminno, qtitle, qcontent, qimage, qfile, isview, qdate)
VALUES((SELECT NVL(MAX(qnano), 0)+1 as qnano FROM qna), 1, 'ȭ����� ����ֳ���?', 'ȭ����� �κ� �ֽ��ϴ�.', 'abc.jpg', 'abc.zip', 'N', sysdate);

-- ���
SELECT qnano, adminno, qtitle, qcontent, qimage, qfile, isview, qdate
FROM qna
ORDER BY qnano

-- ��ȸ
SELECT qnano, adminno, qtitle, qcontent, qimage, qfile, isview, qdate
FROM qna
WHERE qnano = 1

-- ����
UPDATE  qna
SET qnano=1, adminno=1, qtitle='���ڲ����� � �ǹ��ΰ���?', qcontent='���ڲ��� ���� ���ڴ� �ǹ��Դϴ�.', qimage='def.jpg', qfile='def.zip', isview='Y'
WHERE qnano = 1

-- ����
DELETE FROM qna
WHERE qnano = 1