/**********************************/
/* Table Name: ȸ�� ��� */
/**********************************/
DROP TABLE grade;
CREATE TABLE grade(
  gradeno  NUMBER(7)     NOT NULL,   -- ��� ��ȣ
  gname    VARCHAR(20)   NOT NULL,   -- ��� �̸�
  accum    NUMBER(3,2)   NOT NULL,   -- ������
  PRIMARY KEY (gradeno)
);

COMMENT ON TABLE grade is 'ȸ�� ���';
COMMENT ON COLUMN grade.gradeno is '��� ��ȣ';
COMMENT ON COLUMN grade.gname is '��� �̸�';
COMMENT ON COLUMN grade.accum is '������';

INSERT INTO grade(gradeno, gname, accum)
VALUES(1, '�����', 0.05);

INSERT INTO grade(gradeno, gname, accum)
VALUES(2, '�ǹ�', 0.06);

INSERT INTO grade(gradeno, gname, accum)
VALUES(3, '���', 0.07);

INSERT INTO grade(gradeno, gname, accum)
VALUES(4, '�÷�Ƽ��', 0.08);

INSERT INTO grade(gradeno, gname, accum)
VALUES(5, '���̾�', 0.1);

SELECT gradeno, gname, accum
FROM grade
ORDER BY gradeno ASC;

commit;