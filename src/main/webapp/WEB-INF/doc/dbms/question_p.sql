DROP TABLE question;
/**********************************/
/* Table Name: 고객센터질문 */
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

COMMENT ON TABLE question is '고객센터질문';
COMMENT ON COLUMN question.questionno is '질문번호';
COMMENT ON COLUMN question.memberno is '회원번호';
COMMENT ON COLUMN question.categorization is '분류';
COMMENT ON COLUMN question.asktitle is '제목';
COMMENT ON COLUMN question.askcont is '내용';
COMMENT ON COLUMN question.state is '처리상태';
COMMENT ON COLUMN question.askdate is '등록일';

-- 등록
INSERT INTO question(questionno, memberno, categorization, asktitle, askcont, state, askdate)
VALUES((SELECT NVL(MAX(questionno), 0)+1 as questionno FROM question), 1, '교환 및 환불 관련', '교환중 제품 누락 문의', '내 택배 어디갔나요..', 'N', sysdate);

INSERT INTO question(questionno, memberno, categorization, asktitle, askcont, state, askdate)
VALUES((SELECT NVL(MAX(questionno), 0)+1 as questionno FROM question), 1, '버그 리포트', '메뉴가 안눌립니다', '상품을 보는 페이지로 가면 메뉴가 안눌려요', 'N', sysdate);

INSERT INTO question(questionno, memberno, categorization, asktitle, askcont, state, askdate)
VALUES((SELECT NVL(MAX(questionno), 0)+1 as questionno FROM question), 2, '기타', 'ㅁㄴㅇㄹ', '내 택배 어디갔나요..', 'N', sysdate);

-- 전체 목록
SELECT q.questionno, q.memberno, q.categorization, q.asktitle, q.askcont, q.state, q.askdate,
           m.mname
  FROM question q,  members m
  WHERE q.memberno = m.memberno
  ORDER BY questionno DESC

-- 회원별 목록
SELECT questionno, memberno, categorization, asktitle, askcont, state, askdate
FROM question
WHERE memberno=1;

-- 전체 질문 개수
SELECT MAX(questionno) as maxno
FROM question;

-- 질문 & 답변 삭제
DELETE FROM answer
WHERE questionno = 4;
DELETE FROM question
WHERE questionno = 4;

commit;