/**********************************/
/* Table Name: 공지사항 */
/**********************************/
CREATE TABLE announce(
		announceno NUMERIC(10) NOT NULL PRIMARY KEY,
		adminno NUMERIC(10) NOT NULL,
		atitle VARCHAR2(200) NOT NULL,
		acontent CLOB NOT NULL,
		mp3 VARCHAR2(1000),
		mp4 VARCHAR2(1000),
		isview VARCHAR2(1) DEFAULT 'Y' NOT NULL,
		keyword VARCHAR2(1000),
		adate DATE NOT NULL,
  FOREIGN KEY (adminno) REFERENCES admini (adminno)
);

COMMENT ON TABLE announce is '공지사항';
COMMENT ON COLUMN announce.announceno is '공지사항번호';
COMMENT ON COLUMN announce.adminno is '관리자번호';
COMMENT ON COLUMN announce.atitle is '제목';
COMMENT ON COLUMN announce.acontent is '내용';
COMMENT ON COLUMN announce.mp3 is 'mp3';
COMMENT ON COLUMN announce.mp4 is 'mp4';
COMMENT ON COLUMN announce.isview is '출력';
COMMENT ON COLUMN announce.keyword is '키워드';
COMMENT ON COLUMN announce.adate is '작성날짜';

-- 등록
INSERT INTO announce(announceno, adminno, atitle, acontent, mp3, mp4, isview, keyword, adate)
VALUES((SELECT NVL(MAX(announceno), 0)+1 as announceno FROM announce),
             1, '긴급공지', '구라임', '', '', 'Y', '', sysdate);
             
INSERT INTO announce(announceno, adminno, atitle, acontent, mp3, mp4, isview, keyword, adate)
VALUES((SELECT NVL(MAX(announceno), 0)+1 as announceno FROM announce),
             1, '휴강공지', '구라임', '', '', 'Y', '', sysdate);
             
INSERT INTO announce(announceno, adminno, atitle, acontent, mp3, mp4, isview, keyword, adate)
VALUES((SELECT NVL(MAX(announceno), 0)+1 as announceno FROM announce),
             1, '공지공지', '노잼', '', '', 'Y', '', sysdate);
             
-- 목록
SELECT announceno, adminno, acontent, isview, keyword, adate
FROM announce
ORDER BY announceno;

-- 조회
SELECT announceno, adminno, atitle, acontent, mp3, mp4, isview, keyword, adate
FROM announce
WHERE announceno = 1;

-- 수정
UPDATE announce
SET atitle='검지검지', acontent='엄지척', mp3='none', mp4='none', isview='N', keyword='ㅎㅇ'
WHERE announceno = 1;

-- 삭제
DELETE FROM announce
WHERE announceno = 1;

SELECT announceno, atitle, rn
FROM(
         SELECT announceno, atitle, rownum as rn
         FROM (
                   SELECT announceno, atitle 
                   FROM announce
                   ORDER BY announceno DESC
         )  
)
WHERE r>=1 AND r <=3;