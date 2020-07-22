/**********************************/
/* Table Name: 자주묻는질문 */
/**********************************/
DROP TABLE qna
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

COMMENT ON TABLE qna is '자주묻는질문';
COMMENT ON COLUMN qna.qnano is '질의응답번호';
COMMENT ON COLUMN qna.adminno is '관리자번호';
COMMENT ON COLUMN qna.qtitle is '제목';
COMMENT ON COLUMN qna.qcontent is '글내용';
COMMENT ON COLUMN qna.qimage is '이미지';
COMMENT ON COLUMN qna.qfile is '파일';
COMMENT ON COLUMN qna.isview is '출력';
COMMENT ON COLUMN qna.qdate is '등록일';

-- 등록
INSERT INTO qna(qnano, adminno, qtitle, qcontent, qimage, qfile, isview, qdate)
VALUES((SELECT NVL(MAX(qnano), 0)+1 as qnano FROM qna), 1, '화장실은 어디있나요?', '화장실은 로비에 있습니다.', 'abc.jpg', 'abc.zip', 'N', sysdate);

-- 목록
SELECT qnano, adminno, qtitle, qcontent, qimage, qfile, isview, qdate
FROM qna
ORDER BY qnano

-- 조회
SELECT qnano, adminno, qtitle, qcontent, qimage, qfile, isview, qdate
FROM qna
WHERE qnano = 1

-- 수정
UPDATE  qna
SET qnano=1, adminno=1, qtitle='꼬박꼬밥은 어떤 의미인가요?', qcontent='꼬박꼬박 밥을 먹자는 의미입니다.', qimage='def.jpg', qfile='def.zip', isview='Y'
WHERE qnano = 1

-- 삭제
DELETE FROM qna
WHERE qnano = 1