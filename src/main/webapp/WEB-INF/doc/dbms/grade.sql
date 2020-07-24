/**********************************/
/* Table Name: 회원 등급 */
/**********************************/
DROP TABLE grade;
CREATE TABLE grade(
  gradeno  NUMBER(7)     NOT NULL,   -- 등급 번호
  gname    VARCHAR(20)   NOT NULL,   -- 등급 이름
  accum    NUMBER(3,2)   NOT NULL,   -- 적립률
  PRIMARY KEY (gradeno)
);

COMMENT ON TABLE grade is '회원 등급';
COMMENT ON COLUMN grade.gradeno is '등급 번호';
COMMENT ON COLUMN grade.gname is '등급 이름';
COMMENT ON COLUMN grade.accum is '적립률';

INSERT INTO grade(gradeno, gname, accum)
VALUES(1, '브론즈', 0.05);

INSERT INTO grade(gradeno, gname, accum)
VALUES(2, '실버', 0.06);

INSERT INTO grade(gradeno, gname, accum)
VALUES(3, '골드', 0.07);

INSERT INTO grade(gradeno, gname, accum)
VALUES(4, '플레티넘', 0.08);

INSERT INTO grade(gradeno, gname, accum)
VALUES(5, '다이아', 0.1);

SELECT gradeno, gname, accum
FROM grade
ORDER BY gradeno ASC;

commit;