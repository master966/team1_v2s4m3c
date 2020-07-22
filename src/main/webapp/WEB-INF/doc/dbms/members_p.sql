/**********************************/
/* Table Name: 회원 */
/**********************************/
DROP TABLE members;
CREATE TABLE members (
  memberno NUMBER(7)     NOT NULL, -- 회원번호, 레코드를 구분하는 컬럼
  gradeno  NUMBER(7)     NOT NULL, -- 등급 번호
  id       VARCHAR(20)   NOT NULL UNIQUE, -- 아이디, 4자 이상, 중복 불가
  passwd   VARCHAR(60)   NOT NULL, -- 비밀번호, 영문/숫자 조합, 중복 불가, 6자 이상
  mname    VARCHAR(20)   NOT NULL, -- 회원 이름, 한글 10자 저장 가능
  nickname VARCHAR(20)   NOT NULL UNIQUE, -- 닉네임
  email    VARCHAR(60)   NOT NULL UNIQUE, -- 이메일 주소, 중복 불가
  tel      VARCHAR(14)   NOT NULL, -- 전화번호, 중복 불가
  zipcode  VARCHAR(5)    NULL, -- 우편번호, 12345
  address1 VARCHAR(80)   NULL, -- 주소
  address2 VARCHAR(80)   NULL, -- 상세 주소
  birth    VARCHAR(14)   NULL, -- 생년월일
  points   NUMBER(7)     NOT NULL, -- 적립금
  mdate    DATE          NOT NULL, -- 가입일
  PRIMARY KEY (memberno),
  FOREIGN KEY (gradeno) REFERENCES grade (gradeno)
);

COMMENT ON TABLE members is '회원';
COMMENT ON COLUMN members.memberno is '회원 번호';
COMMENT ON COLUMN members.id is '아이디';
COMMENT ON COLUMN members.passwd is '비밀 번호';
COMMENT ON COLUMN members.mname is '회원 이름';
COMMENT ON COLUMN members.nickname is '닉네임';
COMMENT ON COLUMN members.email is '이메일';
COMMENT ON COLUMN members.tel is '전화 번호';
COMMENT ON COLUMN members.zipcode is '우편 번호';
COMMENT ON COLUMN members.address1 is '주소';
COMMENT ON COLUMN members.address2 is '상세 주소';
COMMENT ON COLUMN members.birth is '생년월일';
COMMENT ON COLUMN members.gradeno is '회원 등급';
COMMENT ON COLUMN members.points is '적립금';
COMMENT ON COLUMN members.mdate is '가입일';

DROP SEQUENCE members_seq;
CREATE SEQUENCE members_seq
    START WITH 1                -- 시작번호
    INCREMENT BY 1            -- 증가값
    MAXVALUE 999999999     -- 최대값
    CACHE 2                         -- 2번은 메모리에서만 계산
    NOCYCLE;                       -- 다시 1부터 생성되는것을 방지
 
 -- 중복 확인
 1) id 중복 확인
SELECT COUNT(id) as cnt
FROM members
WHERE id='user1';
 
2) e-mail 중복 확인
SELECT COUNT(id) as cnt
FROM members
WHERE email='user1';

-- 등록
INSERT INTO members(memberno, gradeno, id, passwd, mname, nickname, email, tel, zipcode, address1, address2, birth, points, mdate)
VALUES (members_seq.nextval, 1, 'user1', '1234', '김김김', '일빠', 'aaa@email.com', '000-0000-0000', '12345', '경기도 의정부시', '101동', '1995-01-01', 0, sysdate);

INSERT INTO members(memberno, gradeno, id, passwd, mname, nickname, email, tel, zipcode, address1, address2, birth, points, mdate)
VALUES (members_seq.nextval, 2, 'user2', '1234', '이이이', '이빠', 'bbb@email.com', '000-0000-0001', '12345', '경기도 김포시', '102동', '2000-01-01', 0, sysdate);

INSERT INTO members(memberno, gradeno, id, passwd, mname, nickname, email, tel, zipcode, address1, address2, birth, points, mdate)
VALUES (members_seq.nextval, 3, 'user3', '1234', '박박박', '삼빠', 'ccc@email.com', '000-0000-0002', '12345', '경기도 경기도', '103동', '2005-01-01', 0, sysdate);

-- 조회
SELECT memberno, gradeno, id, passwd, mname, nickname, email, tel, zipcode, address1, address2, birth, points, mdate
FROM members
ORDER BY memberno ASC;

-- 수정
UPDATE members
SET passwd='0000', email='111@email.com', tel='111-1111-1111', zipcode='22222', address1='의정부시', address2='반지하'
WHERE memberno = 1;

-- 패스워드 검사
SELECT COUNT(*) as passwd_cnt
FROM members
WHERE memberno = 1 AND passwd = '1234';

-- 삭제
DELETE FROM members
WHERE memberno = 1;

-- 모든 레코드 개수
SELECT COUNT(*) as count
FROM members;

commit;
