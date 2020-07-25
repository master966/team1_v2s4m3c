DROP TABLE answer IF EXISTS;

/**********************************/
/* Table Name: �����ʹ亯 */
/**********************************/
CREATE TABLE answer(
		answerno NUMERIC(10) NOT NULL PRIMARY KEY,
		questionno NUMERIC(10) UNIQUE NOT NULL,
		adminno NUMERIC(10) NOT NULL,
		antitle VARCHAR2(1000) NOT NULL,
		ancontent VARCHAR2(1000) NOT NULL,
		andate DATE NOT NULL,
  FOREIGN KEY (adminno) REFERENCES admini (adminno),
  FOREIGN KEY (questionno) REFERENCES question (questionno)
);

COMMENT ON TABLE answer is '�����ʹ亯';
COMMENT ON COLUMN answer.answerno is '�亯��ȣ';
COMMENT ON COLUMN answer.questionno is '������ȣ';
COMMENT ON COLUMN answer.adminno is '�����ڹ�ȣ';
COMMENT ON COLUMN answer.antitle is '����';
COMMENT ON COLUMN answer.ancontent is '����';
COMMENT ON COLUMN answer.andate is '�����';

-- ���
INSERT INTO answer(answerno, questionno, adminno, antitle, ancontent, andate)
VALUES((SELECT NVL(MAX(answerno), 0)+1 as answerno FROM answer), 1, 1, '�亯', '���������', sysdate);

INSERT INTO answer(answerno, questionno, adminno, antitle, ancontent, andate)
VALUES((SELECT NVL(MAX(answerno), 0)+1 as answerno FROM answer), 2, 1, '�亯�帳�ϴ�', '�˼��մϴ�', sysdate);

INSERT INTO answer(answerno, questionno, adminno, antitle, ancontent, andate)
VALUES((SELECT NVL(MAX(answerno), 0)+1 as answerno FROM answer), 3, 1, '������?', '����', sysdate);

-- ���
SELECT answerno, questionno, adminno, antitle, ancontent, andate
FROM answer


SELECT an.answerno, an.questionno, an.adminno, an.antitle, an.ancontent, an.andate,
            ad.adminno, ad.nickname
FROM answer an, admini ad
WHERE an.adminno = ad.adminno
ORDER BY answerno DESC

-- ȸ���� �亯 ��ȸ
SELECT a.answerno, a.questionno, a.adminno, a.antitle, a.ancontent, a.andate
FROM (
            SELECT q.questionno, q.memberno
            FROM question q
            WHERE q.memberno = 1
            ORDER BY questionno DESC
            ) q, answer a
WHERE q.questionno = a.questionno
ORDER BY answerno DESC

SELECT an.answerno, an.questionno, an.adminno, an.antitle, an.ancontent, an.andate,
           ad.nickname
FROM (
          SELECT a.answerno, a.questionno, a.adminno, a.antitle, a.ancontent, a.andate
          FROM (
                      SELECT q.questionno, q.memberno
                      FROM question q
                      WHERE q.memberno = 1
                      ORDER BY questionno DESC
                      ) q, answer a
          WHERE q.questionno = a.questionno
          ORDER BY answerno DESC
          ) an, admini ad
 WHERE an.adminno = ad.adminno
 ORDER BY answerno DESC