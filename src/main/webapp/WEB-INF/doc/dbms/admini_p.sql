/**********************************/
/* Table Name: 관리자 */
/**********************************/
DROP TABLE admini;
CREATE TABLE admini(
adminno                        NUMBER(10)  NOT NULL  PRIMARY KEY,
name                           VARCHAR2(16)  NOT NULL,
identify                             VARCHAR2(20)  NOT NULL,
passwd                         VARCHAR2(20)  NOT NULL,
nickname                       VARCHAR2(32)  NOT NULL,
acclevel                          NUMBER(1)  NOT NULL,
phone                          VARCHAR2(13)  NOT NULL,
email                          VARCHAR2(30) NULL,
picture                         VARCHAR2(1000) NULL,
signupdate                    DATE NOT NULL,
othersdetail                    VARCHAR2(1000) NULL
);

COMMENT ON TABLE admini is '관리자';
COMMENT ON COLUMN admini.adminno is '관리자번호';
COMMENT ON COLUMN admini.name is '이름';
COMMENT ON COLUMN admini.identify is 'ID';
COMMENT ON COLUMN admini.passwd is '비밀번호';
COMMENT ON COLUMN admini.nickname is '닉네임';
COMMENT ON COLUMN admini.acclevel is '접근 레벨';
COMMENT ON COLUMN admini.phone is '연락처';
COMMENT ON COLUMN admini.email is '이메일';
COMMENT ON COLUMN admini.picture is '사진';
COMMENT ON COLUMN admini.signupdate is '가입일';
COMMENT ON COLUMN admini.othersdetail is '비고';

DROP SEQUENCE admini_seq;
CREATE SEQUENCE admini_seq
    START WITH 1            -- 시작번호
    INCREMENT BY 1        --증가값
    MAXVALUE 9999999    --최대값: 9999999 --> NUMBER(7)
    CACHE 2                     --2번은 메모리에서만 계산
    NOCYCLE;                   --다시 1부터 생성되는 것을 방지

-- 등록
INSERT INTO admini(adminno, name, identify, passwd, nickname, acclevel, phone, email, signupdate)
VALUES(admini_seq.nextval, '최시온', 'cso0001', '1234', 'CSO', '1', '010-5678-9012', 'cso0001@example.net', sysdate);

INSERT INTO admini(adminno, name, identify, passwd, nickname, acclevel, phone, email, signupdate)
VALUES(admini_seq.nextval, '안병렬', 'abl0001', '1234', 'AD_ABL', '1', '010-1234-5678', 'abl0001@example.net', sysdate);

INSERT INTO admini(adminno, name, identify, passwd, nickname, acclevel, phone, signupdate)
VALUES(admini_seq.nextval, '김도윤', 'kdy0001', '1234', 'AD_KDY', '1', '010-3456-7890', sysdate);

-- 목록
SELECT adminno, name, identify, passwd, nickname, acclevel, phone
FROM admini
ORDER BY adminno;

-- 1건 조회
SELECT adminno, name, identify, passwd, nickname, acclevel, phone, email, picture, signupdate
FROM admini
WHERE adminno = 1;

-- adminno 최대값 산출
SELECT MAX(adminno) as MAXNO
FROM admini

-- 수정
UPDATE admini
SET acclevel=2
WHERE adminno = 1;

-- 삭제
DELETE FROM admini
WHERE adminno = 1;

UPDATE admini
  SET acclevel=acclevel-1
  WHERE adminno = 16

commit;