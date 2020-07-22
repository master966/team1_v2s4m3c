DROP TABLE product;
CREATE TABLE product(
		p_no              	    NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		goryno                  NUMBER(10)		 NOT NULL,
        adminno                NUMBER(10)       NOT NULL,
		p_name                 VARCHAR2(100)		 NOT NULL,
		p_printout              CHAR(1)		 DEFAULT 'Y'		 NULL,
		p_date                   DATE		 NULL,
        p_price                  NUMBER(10)		 DEFAULT 0		NOT NULL,
        p_unit                    NUMBER(10)		 NULL,
        p_capacity               VARCHAR2(100)		 NULL,
        p_delivery                VARCHAR2(50)		 NULL,
        p_allergy_info           clob                  NULL,
        p_expiration_date      VARCHAR2(100)		NULL,
        p_detailed               clob      NULL,
        p_quantity               NUMBER(10)		DEFAULT 1  NOT NULL,
        hits                        NUMBER(7)    DEFAULT 0     NULL,
        searchword                    VARCHAR2(300)  NULL,
        file1                                   VARCHAR(100)          NULL,
        thumb1                              VARCHAR(100)          NULL,
        size1                                 NUMBER(10)      DEFAULT 0 NULL, 
     FOREIGN KEY (adminno) REFERENCES admini (adminno),
     FOREIGN KEY (goryno) REFERENCES cate_gory (goryno)
);

COMMENT ON TABLE product is '상품';
COMMENT ON COLUMN product.p_no is '상품 번호';
COMMENT ON COLUMN product.goryno is '카테고리 번호';
COMMENT ON COLUMN product.adminno is '카테고리 번호';
COMMENT ON COLUMN product.p_name is '상품 이름';
COMMENT ON COLUMN product.p_printout is '출력 모드';
COMMENT ON COLUMN product.p_date is '등록일';
COMMENT ON COLUMN product.p_price is '상품 가격';
COMMENT ON COLUMN product.p_unit is '상품 판매 단위';
COMMENT ON COLUMN product.p_capacity is '상품 용량/중량';
COMMENT ON COLUMN product.p_delivery  is '상품 배송 구분';
COMMENT ON COLUMN product.p_allergy_info is '상품 알레르기 정보';
COMMENT ON COLUMN product.p_expiration_date is '유통기한 및 안내사항';
COMMENT ON COLUMN product.p_detailed is '상품 상세 정보';
COMMENT ON COLUMN product.p_quantity is '상품 재고 수량';
COMMENT ON COLUMN product.hits is '조회수';
COMMENT ON COLUMN product.searchword is '검색어';
COMMENT ON COLUMN product.file1 is '메인 이미지';
COMMENT ON COLUMN product.thumb1 is '섬네일 이미지';
COMMENT ON COLUMN product.size1 is '메인 이미지 크기';

DROP SEQUENCE p_seq;
CREATE SEQUENCE p_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
 
 
 --상품 등록 
INSERT INTO product(p_no,  goryno, adminno, p_name, p_printout, p_date, p_price, p_unit,
                    p_capacity, p_delivery, p_allergy_info, p_expiration_date, p_detailed, p_quantity,
                    searchword,file1, thumb1, size1)
VALUES(p_seq.nextval, 1, 1, '[더 건강한]샌드위치 햄', 'Y', sysdate, 1980, 1,
                    '새벽배송 ONLY', '샐러드174g/소스30g',
                    '*샐러드 -대두, 밀, 우유, 토마토, 닭고기 함유 /*소스 -대두, 밀 함유',
                    '수령일 포함 3일 이상 남은 상품을 보내드립니다.',
                    '바질의 햐을 그대로 담은 페스토를 곁들이면 어떤 음식이든 풍미가 웅앵 확 살아', 1,
                    '햄', 'product.jpg', 'product_t.jpg',23657);               

--전체 목록
SELECT p_no, goryno, p_name, p_printout, p_date, p_price, p_unit,
       p_capacity, p_delivery, p_allergy_info, p_expiration_date, p_detailed, p_quantity,searchword,file1, thumb1, size1
FROM product
ORDER BY p_no DESC;

-- 현재 sequence의 확인
SELECT p_seq.nextval FROM dual;
SELECT p_seq.currval FROM dual;

-- 조회
SELECT p_no, goryno, p_name, p_printout, p_date, p_price, p_unit,
       p_capacity, p_delivery, p_allergy_info, p_expiration_date, p_detailed, p_quantity
FROM product
WHERE p_no=1;

--카테고리 별 상품 목록
-- cate_gory 별 product 목록: cate_gory + product inner join,  1 : 다, 통합 VO -->
SELECT c.goryno as c_goryno, c.name as c_name,
       p.p_no, p.p_name, p.p_date, p.p_printout
FROM cate_gory c, product p
WHERE c.goryno = p.goryno
ORDER BY c.goryno ASC, p.p_no ASC;

--상품 /  리뷰 조인
SELECT p.p_no as p_p_no, 
           r.reviewno as r_reviewno, r.title as r_title, 
           r.memberno as r__memberno, r.nickname as r_nickname, r.rdate as r_rdate
FROM product p, review r
WHERE p.p_no = r.p_no
ORDER BY r.reviewno DESC;
      



SELECT COUNT(*) as cnt
FROM product
WHERE goryno=1;



commit;
