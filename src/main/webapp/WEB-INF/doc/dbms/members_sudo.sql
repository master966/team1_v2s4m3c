/**********************************/
/* Table Name: 회원 */
/**********************************/
DROP TABLE members;
CREATE TABLE members (
  memberno NUMBER(7)     NOT NULL, -- 회원번호, 레코드를 구분하는 컬럼
  gradeno  NUMBER(7)     NOT NULL, -- 등급 번호
  id       VARCHAR(20)   NOT NULL UNIQUE, -- 아이디, 4자 이상, 중복 불가
  mname    VARCHAR(20)   NOT NULL, -- 회원 이름, 한글 10자 저장 가능
  nickname VARCHAR(20)   NOT NULL UNIQUE, -- 닉네임
  tel      VARCHAR(14)   NOT NULL, -- 전화번호, 중복 불가
  mdate    DATE          NOT NULL, -- 가입일
  PRIMARY KEY (memberno)
);

COMMENT ON TABLE members is '회원';
COMMENT ON COLUMN members.memberno is '회원 번호';
COMMENT ON COLUMN members.id is '아이디';
COMMENT ON COLUMN members.mname is '회원 이름';
COMMENT ON COLUMN members.nickname is '닉네임';
COMMENT ON COLUMN members.gradeno is '회원 등급';
COMMENT ON COLUMN members.tel is '전화 번호';
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
INSERT INTO members(memberno, gradeno, id, mname, nickname, tel, mdate)
VALUES (members_seq.nextval, 1, 'user1', '김김김', '일빠', '000-0000-0000', sysdate);

INSERT INTO members(memberno, gradeno, id, mname, nickname, tel, mdate)
VALUES (members_seq.nextval, 2, 'user2', '이이이', '이빠', '000-0000-0000', sysdate);

INSERT INTO members(memberno, gradeno, id, mname, nickname, tel, mdate)
VALUES (members_seq.nextval, 3, 'user3', '박박박', '삼빠', '000-0000-0000', sysdate);

INSERT INTO members(memberno, gradeno, id, mname, nickname, tel, mdate)
VALUES (members_seq.nextval, 3, 'user4', '김삼묵', '사빠', '000-0000-0000', sysdate);

-- 조회
SELECT memberno, id, mname, nickname, tel
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
