/**********************************/
/* Table Name: ȸ����� */
/**********************************/
DROP TABLE grade CASCADE CONSTRAINTS;

CREATE TABLE grade (
  gradeno  NUMBER(7)     NOT NULL,   -- ��� ��ȣ
  gname    VARCHAR(20)   NOT NULL,   -- ��� �̸�
  accum    NUMBER(3,3)   NOT NULL,   -- ������
  PRIMARY KEY (gradeno)
);


DROP SEQUENCE grade_seq;

CREATE SEQUENCE grade_seq
    START WITH 1                -- ���۹�ȣ
    INCREMENT BY 1            -- ������
    MAXVALUE 999999999     -- �ִ밪
    CACHE 2                         -- 2���� �޸𸮿����� ���
    NOCYCLE;                       -- �ٽ� 1���� �����Ǵ°��� ����
    
INSERT INTO grade(gradeno, gname, accum)
VALUES(grade_seq.nextval, '���̾�', 0.005);

INSERT INTO grade(gradeno, gname, accum)
VALUES(grade_seq.nextval, '�ǹ�', 0.01);

INSERT INTO grade(gradeno, gname, accum)
VALUES(grade_seq.nextval, '���', 0.03);

INSERT INTO grade(gradeno, gname, accum)
VALUES(grade_seq.nextval, '�÷�', 0.05);

INSERT INTO grade(gradeno, gname, accum)
VALUES(grade_seq.nextval, '���̾�', 0.07);
    
select * from grade;

commit;
/**********************************/
/* Table Name: ȸ�� */
/**********************************/
DROP TABLE members CASCADE CONSTRAINTS;

CREATE TABLE members (
  memberno NUMBER(6)     NOT NULL, -- ȸ�� ��ȣ, ���ڵ带 �����ϴ� �÷�
  gradeno  NUMBER(7)     DEFAULT 1 NOT NULL, -- ��� ��ȣ
  id       VARCHAR(20)   NOT NULL UNIQUE, -- ���̵�, �ߺ� �ȵ�, ���ڵ带 ���� 
  passwd   VARCHAR(60)   NOT NULL, -- �н�����, ������ ����
  mname    VARCHAR(20)   NOT NULL, -- ����, �ѱ� 10�� ���� ����
  nickname VARCHAR(20)   NOT NULL UNIQUE, -- �г���
  email    VARCHAR(60)   NOT NULL UNIQUE, -- �̸��� �ּ�, �ߺ� �Ұ�
  tel      VARCHAR(14)   NOT NULL, -- ��ȭ��ȣ
  zipcode  VARCHAR(5)        NULL, -- �����ȣ, 12345
  address1 VARCHAR(80)       NULL, -- �ּ� 1
  address2 VARCHAR(50)       NULL, -- �ּ� 2
  birth    VARCHAR(14)       NULL, -- �������
  points   NUMBER(7)     DEFAULT 0 NOT NULL, -- ������
  mdate    DATE          NOT NULL, -- ������    
  PRIMARY KEY (memberno),                     -- �ѹ� ��ϵ� ��
  FOREIGN KEY (gradeno) REFERENCES grade (gradeno)
);

UPDATE members
SET gradeno=1
WHERE memberno = 1;

DROP SEQUENCE members_seq;

CREATE SEQUENCE members_seq
    START WITH 1                -- ���۹�ȣ
    INCREMENT BY 1            -- ������
    MAXVALUE 999999999     -- �ִ밪
    CACHE 2                         -- 2���� �޸𸮿����� ���
    NOCYCLE;                       -- �ٽ� 1���� �����Ǵ°��� ����

SELECT * FROM members;

/**********************************/
/* Table Name: ��ǰī�װ� */
/**********************************/

DROP TABLE cate_gory;

CREATE TABLE cate_gory(
    goryno                             NUMBER(10)    NOT NULL    PRIMARY KEY,
    name                                   VARCHAR2(100)     NOT NULL,
    seqno                                NUMBER(10)    DEFAULT 1     NOT NULL,
    printout                             CHAR(1)     DEFAULT 'Y'     NOT NULL,
    rdate                                  DATE    NOT NULL,
    cnt                                    NUMBER(10)    DEFAULT 0     NOT NULL
);

DROP SEQUENCE gory_seq;

CREATE SEQUENCE gory_seq
    START WITH 1                -- ���۹�ȣ
    INCREMENT BY 1            -- ������
    MAXVALUE 999999999     -- �ִ밪
    CACHE 2                         -- 2���� �޸𸮿����� ���
    NOCYCLE;                       -- �ٽ� 1���� �����Ǵ°��� ����

select * from cate_gory;
    
commit;
/**********************************/
/* Table Name: ��ǰ */
/**********************************/

DROP TABLE product CASCADE CONSTRAINTS;

CREATE TABLE product(
    p_no                    NUMBER(10)     NOT NULL    PRIMARY KEY,
    goryno                  NUMBER(10)     NOT NULL,
    p_name                 VARCHAR2(100)     NOT NULL,
    p_printout              CHAR(1)    DEFAULT 'Y'     NULL,
    p_date                   DATE    NULL,
    p_price                  NUMBER(10)    DEFAULT 0    NOT NULL,
    p_unit                    NUMBER(10)     NULL,
    p_capacity               VARCHAR2(100)     NULL,
    p_delivery                VARCHAR2(50)     NULL,
    p_allergy_info           clob                  NULL,
    p_expiration_date      VARCHAR2(100)    NULL,
    p_detailed               clob      NULL,
    p_quantity               NUMBER(10)    NULL,
    hits                        NUMBER(7)    DEFAULT 0     NULL,
    searchword                    VARCHAR2(300)  NULL,
    file1                                   VARCHAR(100)          NULL,
    thumb1                              VARCHAR(100)          NULL,
    size1                                 NUMBER(10)      DEFAULT 0 NULL,         
     FOREIGN KEY (goryno) REFERENCES cate_gory (goryno)
);

DROP SEQUENCE p_seq;

CREATE SEQUENCE p_seq
    START WITH 1                -- ���۹�ȣ
    INCREMENT BY 1            -- ������
    MAXVALUE 999999999     -- �ִ밪
    CACHE 2                         -- 2���� �޸𸮿����� ���
    NOCYCLE;                       -- �ٽ� 1���� �����Ǵ°��� ����

select * from product;


SELECT p_no, p_name, p_price, thumb1
  FROM product
  WHERE p_no = 1;

COMMENT ON TABLE product is '��ǰ';
COMMENT ON COLUMN product.p_no is '��ǰ ��ȣ';
COMMENT ON COLUMN product.goryno is 'ī�װ� ��ȣ';
COMMENT ON COLUMN product.p_name is '��ǰ �̸�';
COMMENT ON COLUMN product.p_seqno is '��� ����';
COMMENT ON COLUMN product.p_printout is '��� ���';
COMMENT ON COLUMN product.p_date is '�����';
COMMENT ON COLUMN product.p_price is '��ǰ ����';
COMMENT ON COLUMN product.p_unit is '��ǰ �Ǹ� ����';
COMMENT ON COLUMN product.p_capacity is '��ǰ �뷮/�߷�';
COMMENT ON COLUMN product.p_delivery  is '��ǰ ��� ����';
COMMENT ON COLUMN product.p_allergy_info is '��ǰ �˷����� ����';
COMMENT ON COLUMN product.p_expiration_date is '��ǰ �������';
COMMENT ON COLUMN product.p_detailed is '��ǰ �� ����';


/**********************************/
/* Table Name: �ֹ� */
/**********************************/
DROP TABLE orders CASCADE CONSTRAINTS;

CREATE TABLE orders(
    ordersno               NUMBER(10)            NOT NULL  PRIMARY KEY,
    memberno             NUMBER(10)            NOT NULL,
    p_no                     VARCHAR(100)         NOT NULL,
    total_cost               NUMBER(10)           NOT NULL,
    pay_how                 VARCHAR2(20)        NOT NULL,
    coupon_name        VARCHAR2(100)         NULL,
    coupon_cost          NUMBER(10)             NULL,
    point_use               NUMBER(10)            NULL,
    deli_cost               NUMBER(10)             NULL,
    total_pay               NUMBER(10)            NOT NULL,
    point_acc               NUMBER(10)            NULL,
    name_post              VARCHAR2(10)          NOT NULL ,
    phon_post               VARCHAR2(15)         NOT NULL,
    zipcode                  VARCHAR(5)            NOT NULL, -- �����ȣ, 12345
    address1                VARCHAR(80)            NOT NULL, -- �ּ�
    address2                 VARCHAR(80)           NOT NULL, -- �� �ּ�
    name_get               VARCHAR2(10)           NOT NULL,
    phon_get                VARCHAR2(15)          NOT NULL ,
    request                  VARCHAR2(100)         NOT NULL,
    pay_date                 DATE                      NOT NULL,
    FOREIGN KEY (memberno) REFERENCES members (memberno)
);

DROP SEQUENCE orders_seq;

commit;
CREATE SEQUENCE orders_seq
    START WITH 1                -- ���۹�ȣ
    INCREMENT BY 1            -- ������
    MAXVALUE 999999999     -- �ִ밪
    CACHE 2                         -- 2���� �޸𸮿����� ���
    NOCYCLE;                       -- �ٽ� 1���� �����Ǵ°��� ����


COMMENT ON TABLE orders is '�ֹ� ����';
COMMENT ON COLUMN orders.ordersno is '������ȣ';
COMMENT ON COLUMN orders.memberno is 'ȸ����ȣ';
COMMENT ON COLUMN orders.p_no is '��ǰ��ȣ';
COMMENT ON COLUMN orders.total_cost is '�� �ݾ�';
COMMENT ON COLUMN orders.pay_how is '���� ����';
COMMENT ON COLUMN orders.coupon_name is '���� �̸�';
COMMENT ON COLUMN orders.coupon_cost is '���� ����';
COMMENT ON COLUMN orders.point_use is '����Ʈ ���';
COMMENT ON COLUMN orders.deli_cost is '��ۺ�';
COMMENT ON COLUMN orders.total_pay is '���� ���� �ݾ�';
COMMENT ON COLUMN orders.point_acc is '����Ʈ ����';
COMMENT ON COLUMN orders.name_post is '����� �̸�';
COMMENT ON COLUMN orders.phon_post is '����� ��ȣ';
COMMENT ON COLUMN orders.zipcode is '�����ȣ';
COMMENT ON COLUMN orders.address1 is '�ּ�';
COMMENT ON COLUMN orders.address2 is '�� �ּ�';
COMMENT ON COLUMN orders.name_get is '������ �̸�';
COMMENT ON COLUMN orders.phon_get is '������ ��ȣ';
COMMENT ON COLUMN orders.request is '��۽� ��û ����';
COMMENT ON COLUMN orders.pay_date is '������';



SELECT * FROM orders;
DELETE FROM orders;
commit;


