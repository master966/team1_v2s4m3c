DROP TABLE answer IF EXISTS;

/**********************************/
/* Table Name: 고객센터답변 */
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

-- 등록
INSERT INTO answer(answerno, questionno, adminno, antitle, ancontent, andate)
VALUES((SELECT NVL(MAX(answerno), 0)+1 as answerno FROM answer), 1, 1, '답변', '나도몰라요', sysdate)

INSERT INTO answer(answerno, questionno, adminno, antitle, ancontent, andate)
VALUES((SELECT NVL(MAX(answerno), 0)+1 as answerno FROM answer), 2, 1, '답변드립니다', '죄송합니다', sysdate)

INSERT INTO answer(answerno, questionno, adminno, antitle, ancontent, andate)
VALUES((SELECT NVL(MAX(answerno), 0)+1 as answerno FROM answer), 3, 1, 'ㅇㅅㅇ?', '뀨우우', sysdate)

-- 목록
SELECT answerno, questionno, adminno, antitle, ancontent, andate
FROM answer


SELECT an.answerno, an.questionno, an.adminno, an.antitle, an.ancontent, an.andate,
            ad.adminno, ad.nickname
FROM answer an, admini ad
WHERE an.adminno = ad.adminno
ORDER BY answerno DESC

-- 회원별 답변 조회
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